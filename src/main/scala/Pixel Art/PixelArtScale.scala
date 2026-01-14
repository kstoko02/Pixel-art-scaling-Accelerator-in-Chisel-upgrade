// File: src/test/scala/pixelart/PixelArtScale.scala
package pixelart

import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.RawTester

import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.io.File
import scala.io.StdIn

/**
  * Xbr2x Pixel Art Scaler Wrapper
  * 使用 Xbr2xPipeline 作為核心處理引擎
  * 只支援 2x（所以不再暴露 scaleFactor 參數）
  */
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

  // Xbr2xPipeline(pixBits, imgW, thr, outQueueDepth)
  val xbr = Module(new Xbr2xPipeline(pixBits, width, threshold, queueDepth))

  xbr.io.in.valid     := io.inValid
  xbr.io.in.bits.pix  := io.inPixel
  xbr.io.in.bits.yuv  := io.inYuv
  io.inReady          := xbr.io.in.ready

  // 產生 sof/eol（以 inValid && inReady 的 handshake 走座標）
  val col        = RegInit(0.U(log2Ceil(width + 1).W))
  val row        = RegInit(0.U(log2Ceil(height + 2).W))
  val firstPixel = RegInit(true.B)

  // defaults（注意：先給 default，再在 when 裡覆蓋）
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

/**
  * Main object to handle image scaling using Xbr2xPipeline
  * - 只支援 2x：不再詢問/讀取 scaleFactor
  * - 支援 -Din / -Dout
  */
object PixelArtScale extends App {

  // === 支援 -Din / -Dout 系統參數（其餘不變） ===
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

  // 固定 2x
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
      width     = inWidth,
      height    = inHeight,
      pixBits   = 24,
      threshold = 0,
      queueDepth = 16
    )
  ) { dut =>
    val inputPixelCount = inHeight * inWidth
    var blockCount = 0
    var pixelCount = 0

    for (y <- 0 until inHeight) {
      for (x <- 0 until inWidth) {
        val rgb24 = inputMatrix(y)(x)
        val yuv24 = rgbToYuvPacked(rgb24)

        dut.io.inPixel.poke(rgb24.U)
        dut.io.inYuv.poke(yuv24.U)
        dut.io.inValid.poke(true.B)
        dut.io.outReady.poke(true.B)

        dut.clock.step(1)
        pixelCount += 1

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
            blockCount += 1
          }
        }

        val stepPrint = math.max(1, inputPixelCount / 100)
        if (pixelCount % stepPrint == 0) {
          val progress = (pixelCount * 100) / inputPixelCount
          print(s"\rProgress: ${progress}%")
        }
      }
    }
    println()

    // Drain pipeline
    var lastSeen = 0
    for (i <- 0 until (inWidth + inHeight + 128)) {
      dut.io.inValid.poke(false.B)
      dut.io.outReady.poke(true.B)
      dut.clock.step(1)

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
          blockCount += 1
        }
        lastSeen = i
      } else {
        // 如果連續很久都沒看到 outValid，可以提前結束（可選）
        // if (i - lastSeen > 32) {}
      }
    }
    println(s"[Info] Total blocks processed: $blockCount")
  }

  // ------------------------------------------------------------
  // Fix border: replicate LAST input row/col into the 2x output
  // ------------------------------------------------------------
  val lastInRow = inHeight - 1
  val lastInCol = inWidth  - 1

  // 右邊 2 欄：複製輸入最後一欄
  for (y <- 0 until outHeight) {
    val srcInY = math.min(lastInRow, y / 2)
    val srcRGB = inputMatrix(srcInY)(lastInCol) & 0xFFFFFF
    outputMatrix(y)(outWidth - 2) = srcRGB
    outputMatrix(y)(outWidth - 1) = srcRGB
    written(y)(outWidth - 2) = true
    written(y)(outWidth - 1) = true
  }

  // 下方 2 列：複製輸入最後一列
  for (x <- 0 until outWidth) {
    val srcInX = math.min(lastInCol, x / 2)
    val srcRGB = inputMatrix(lastInRow)(srcInX) & 0xFFFFFF
    outputMatrix(outHeight - 2)(x) = srcRGB
    outputMatrix(outHeight - 1)(x) = srcRGB
    written(outHeight - 2)(x) = true
    written(outHeight - 1)(x) = true
  }

  // 輸出檔案到 -Dout 指定資料夾
  val outputPath = s"$outDir/${baseName}_xbr2x.png"
  saveMatrixToImage(outputMatrix, outputPath)
  println(s"[Info] Done! Scaled image saved to: $outputPath")
}
