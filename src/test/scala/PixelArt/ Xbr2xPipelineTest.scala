import chisel3._
import chiseltest._
import chiseltest.simulator.TreadleBackendAnnotation
import org.scalatest.freespec.AnyFreeSpec

class Xbr2xPipelineTest extends AnyFreeSpec with ChiselScalatestTester {

  "Xbr2xPipeline should emit (W-1)*(H-1) blocks for centers (x-1,y-1)" in {
    val W = 4
    val H = 3
    val pixBits = 8

    test(new Xbr2xPipeline(pixBits = pixBits, imgW = W, thr = 255, outQueueDepth = 16))
      .withAnnotations(Seq(WriteVcdAnnotation, TreadleBackendAnnotation)) { dut =>

        // pix(x,y) = y*W + x
        val img = Array.tabulate(H, W){ (yy, xx) => yy*W + xx }

        dut.io.out.ready.poke(true.B)
        dut.io.in.valid.poke(false.B)
        dut.io.in.bits.sof.poke(false.B)
        dut.io.in.bits.eol.poke(false.B)
        dut.io.in.bits.pix.poke(0.U)

        var outs = Vector.empty[(Int, Int, Seq[Int])]

        def sampleOut(): Unit = {
          if (dut.io.out.valid.peek().litToBoolean) {
            val ox = dut.io.out.bits.x.peek().litValue.toInt
            val oy = dut.io.out.bits.y.peek().litValue.toInt
            val blk = (0 until 4).map(i => dut.io.out.bits.block(i).peek().litValue.toInt)
            outs = outs :+ (ox, oy, blk)
          }
        }

        def tick(): Unit = {
          sampleOut()
          dut.clock.step(1)
        }

        // Feed whole frame, sampling output every cycle
        var first = true
        for (yy <- 0 until H) {
          for (xx <- 0 until W) {
            val p = img(yy)(xx)
            val sof = first
            val eol = (xx == W-1)
            first = false

            dut.io.in.valid.poke(true.B)
            dut.io.in.bits.pix.poke(p.U)
            dut.io.in.bits.sof.poke(sof.B)
            dut.io.in.bits.eol.poke(eol.B)

            // wait until accepted (should be immediate unless stalled)
            while (!dut.io.in.ready.peek().litToBoolean) {
              tick()
            }
            tick() // consume this pixel

            dut.io.in.valid.poke(false.B)
            dut.io.in.bits.sof.poke(false.B)
            dut.io.in.bits.eol.poke(false.B)
          }
        }

        // drain remaining pipeline cycles
        for (_ <- 0 until 40) tick()

        // Expect (W-1)*(H-1) blocks
        val expectedCount = (W - 1) * (H - 1)
        assert(outs.size == expectedCount, s"Expected $expectedCount blocks, got ${outs.size}. outs=$outs")

        // With thr=255 (8-bit), absDiff>255 never true => always flat => block == center pixel E
        val expected = for {
          oy <- 0 until (H - 1)
          ox <- 0 until (W - 1)
        } yield {
          val center = img(oy)(ox)
          (ox, oy, Seq(center, center, center, center))
        }

        expected.zip(outs).foreach { case ((ex, ey, eblk), (ox, oy, oblk)) =>
          assert(ox == ex && oy == ey, s"Expected (x,y)=($ex,$ey), got ($ox,$oy)")
          assert(oblk == eblk, s"At ($ox,$oy) expected block=$eblk, got $oblk")
        }
      }
  }
}
