// File: src/main/scala/pixelart/PixelArtScale.scala
package pixelart

import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.RawTester

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.io.File
import scala.io.StdIn


class Xbr2xPixelArtScaler(
  width: Int,
  height: Int,
  pixBits: Int = 8,
  threshold: Int = 0,
  queueDepth: Int = 16
) extends Module {
  require(pixBits >= 8 && pixBits <= 24, "pixBits must be 8, 16, or 24")
  require(width >= 2 && height >= 2, "Image must be at least 2x2")

  val io = IO(new Bundle {
    val inPixel   = Input(UInt(pixBits.W))
    val inYuv     = Input(UInt(24.W))
    val inValid   = Input(Bool())
    val inReady   = Output(Bool())

    val outPixels = Output(Vec(4, UInt(pixBits.W)))
    val outValid  = Output(Bool())
    val outReady  = Input(Bool())
    val outX      = Output(UInt(16.W))
    val outY      = Output(UInt(16.W))
  })

  // Xbr2xPipeline(pixBits, imgW, imgH, thr, outQueueDepth)
  val xbr = Module(new Xbr2xPipeline(
    pixBits = pixBits,
    imgW    = width,   
    imgH    = height,  
    thr     = threshold,
    outQueueDepth = queueDepth
  ))

  xbr.io.in.valid     := io.inValid
  xbr.io.in.bits.pix  := io.inPixel
  xbr.io.in.bits.yuv  := io.inYuv
  io.inReady          := xbr.io.in.ready

  val col        = RegInit(0.U(log2Ceil(width + 1).W))
  val row        = RegInit(0.U(log2Ceil(height + 2).W))
  val firstPixel = RegInit(true.B)

  xbr.io.in.bits.sof := false.B
  xbr.io.in.bits.eol := false.B

  when(io.inValid && io.inReady) {
    when(firstPixel) {
      xbr.io.in.bits.sof := true.B
      xbr.io.in.bits.eol := (width.U === 1.U)
      firstPixel := false.B
      col := 1.U
      row := 0.U
    }.elsewhen(col === (width - 1).U) {
      xbr.io.in.bits.eol := true.B
      col := 0.U
      row := row + 1.U
    }.otherwise {
      col := col + 1.U
    }
  }

  xbr.io.out.ready := io.outReady
  io.outValid      := xbr.io.out.valid
  io.outPixels     := xbr.io.out.bits.block
  io.outX          := xbr.io.out.bits.x
  io.outY          := xbr.io.out.bits.y
}


object PixelArtScale extends App {

  val inputPath = sys.props.getOrElse("in", {
    println("Enter the image path:")
    StdIn.readLine()
  })
  require(inputPath.nonEmpty, "Image path cannot be empty")

  val defaultOutDir = {
    val f = new File(inputPath)
    Option(f.getParent).getOrElse(new File(".").getCanonicalPath)
  }
  val outDir = sys.props.getOrElse("out", defaultOutDir)
  new File(outDir).mkdirs()

  //  2x
  val scaleFactor = 2

  def loadImageToMatrix(path: String): Array[Array[Int]] = {
    val img  = ImageIO.read(new File(path))
    require(img != null, s"Cannot read image: $path")
    val w    = img.getWidth
    val h    = img.getHeight
    val data = Array.ofDim[Int](h, w)
    for (y <- 0 until h; x <- 0 until w) {
      data(y)(x) = img.getRGB(x, y) & 0xFFFFFF
    }
    data
  }

  def clamp8(x: Int): Int = if (x < 0) 0 else if (x > 255) 255 else x

  def rgbToYuvPacked(rgb24: Int): Int = {
    val r = (rgb24 >> 16) & 0xff
    val g = (rgb24 >>  8) & 0xff
    val b = (rgb24 >>  0) & 0xff
    val y  = (77*r + 150*g + 29*b) >> 8
    val u  = ((-43*r - 85*g + 128*b) >> 8) + 128
    val v  = ((128*r - 107*g - 21*b) >> 8) + 128
    (clamp8(y) << 16) | (clamp8(u) << 8) | clamp8(v)
  }

  def saveMatrixToImage(matrix: Array[Array[Int]], outPath: String): Unit = {
    val h = matrix.length
    val w = if (h > 0) matrix(0).length else 0
    val outImg = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB)
    for (y <- 0 until h; x <- 0 until w) {
      outImg.setRGB(x, y, matrix(y)(x) & 0xFFFFFF)
    }
    ImageIO.write(outImg, "png", new File(outPath))
  }


  val inputFile = new File(inputPath)
  require(inputFile.exists(), s"Input file not found: $inputPath")

  val inputName = inputFile.getName
  val dotIndex  = inputName.lastIndexOf(".")
  val baseName  = if (dotIndex != -1) inputName.substring(0, dotIndex) else inputName

  val inputMatrix = loadImageToMatrix(inputPath)
  val inHeight    = inputMatrix.length
  val inWidth     = if (inHeight > 0) inputMatrix(0).length else 0
  require(inWidth >= 2 && inHeight >= 2, s"Image must be at least 2x2, got ${inWidth}x${inHeight}")

  val outHeight = inHeight * scaleFactor
  val outWidth  = inWidth  * scaleFactor

  val outputMatrix = Array.ofDim[Int](outHeight, outWidth)
  val written      = Array.fill(outHeight, outWidth)(false)

  println(s"[Info] Input image size: $inWidth x $inHeight")
  println(s"[Info] Scale factor: 2x")
  println(s"[Info] Output image size: $outWidth x $outHeight")

  RawTester.test(
    new Xbr2xPixelArtScaler(
      width      = inWidth,
      height     = inHeight,
      pixBits    = 24,
      threshold  = 0,
      queueDepth = 16
    )
  ) { dut =>
    val inputPixelCount = inHeight * inWidth
    var blockCount = 0
    var pixelCount = 0

    var ix = 0
    val totalIn = inWidth * inHeight

    dut.io.outReady.poke(true.B)

    // ===== Progress =====
    val t0 = System.nanoTime()
    def fmtPct(n: Int, total: Int): String = {
      val p = if (total == 0) 100.0 else (n.toDouble * 100.0 / total.toDouble)
      f"$p%6.2f%%"
    }
    def fmtSec(): Double = (System.nanoTime() - t0).toDouble / 1e9

    val progressStepIn  = math.max(1, totalIn / 100)           
    val totalExpected   = inWidth * inHeight                   
    val progressStepOut = math.max(1, totalExpected / 100)

    def showProgress(phase: String, inDone: Int, outDone: Int): Unit = {
      val msg =
        f"\r[$phase] in=$inDone/$totalIn ${fmtPct(inDone, totalIn)}  " +
        f"out=$outDone/$totalExpected ${fmtPct(outDone, totalExpected)}  " +
        f"t=${fmtSec()}%.1fs"
      print(msg)
      Console.out.flush()
    }

    showProgress("RUN", inDone = 0, outDone = 0)

    while (ix < totalIn) {
      val y = ix / inWidth
      val x = ix % inWidth

      val rgb24 = inputMatrix(y)(x)
      val yuv24 = rgbToYuvPacked(rgb24)

      dut.io.inPixel.poke(rgb24.U)
      dut.io.inYuv.poke(yuv24.U)
      dut.io.inValid.poke(true.B)

      if (tryPopOne()) blockCount += 1

      val ready = dut.io.inReady.peek().litToBoolean
      dut.clock.step(1)
      if (ready) ix += 1
      // progress (throttle)
      if ((ix % progressStepIn) == 0 || ix == totalIn) {
        showProgress("RUN", inDone = ix, outDone = blockCount)
      }
    }
    dut.io.inValid.poke(false.B)

    def tryPopOne(): Boolean = {
      if (dut.io.outValid.peek().litToBoolean) {
        val cx = dut.io.outX.peek().litValue.toInt
        val cy = dut.io.outY.peek().litValue.toInt
        val block = (0 until 4).map(i => dut.io.outPixels(i).peek().litValue.toInt & 0xFFFFFF)
        val outY0 = cy * 2
        val outX0 = cx * 2
        if (outY0 >= 0 && outY0 + 1 < outHeight && outX0 >= 0 && outX0 + 1 < outWidth) {
          outputMatrix(outY0)(outX0)         = block(0); written(outY0)(outX0)         = true
          outputMatrix(outY0)(outX0 + 1)     = block(1); written(outY0)(outX0 + 1)     = true
          outputMatrix(outY0 + 1)(outX0)     = block(2); written(outY0 + 1)(outX0)     = true
          outputMatrix(outY0 + 1)(outX0 + 1) = block(3); written(outY0 + 1)(outX0 + 1) = true
        }
        true
      } else false
    }

    // Drain pipeline
    var lastSeen = 0

    dut.clock.step(1)
    if (tryPopOne()) blockCount += 1

    dut.io.inValid.poke(false.B)
    dut.io.outReady.poke(true.B)

    var guard = 0
    while (blockCount < totalExpected && guard < totalExpected + 5000) {
      dut.clock.step(1)
      if (tryPopOne()) blockCount += 1
      guard += 1

      if ((blockCount % progressStepOut) == 0 || blockCount == totalExpected) {
        showProgress("DRAIN", inDone = ix, outDone = blockCount)
      }
    }
    println()
    println(s"[Info] Total blocks processed: $blockCount / ${inWidth*inHeight}")
  }

  val outputPath = s"$outDir/${baseName}_xbr2x.png"
  saveMatrixToImage(outputMatrix, outputPath)
  println(s"[Info] Done! Scaled image saved to: $outputPath")
}
