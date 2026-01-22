// File: src/test/scala/pixelart/Xbr2xPipelineTest.scala
package pixelart

import chisel3._
import chiseltest._
import chiseltest.simulator.WriteVcdAnnotation
import org.scalatest.flatspec.AnyFlatSpec

class Xbr2xPipelineTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "Xbr2xPipeline"

  it should "hold S3 debug window stable under backpressure stall" in {
    val W = 4
    val H = 3
    val pixBits = 24

    test(new Xbr2xPipeline(pixBits = pixBits, imgW = W, imgH = H, thr = 0, outQueueDepth = 2))
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

        // ---------------- Helpers ----------------
        case class DbgSnap(
          A: BigInt, B: BigInt, C: BigInt,
          D: BigInt, E: BigInt, F: BigInt,
          G: BigInt, H: BigInt, I: BigInt,
          xc: BigInt, yc: BigInt
        )

        def snapDbg(): DbgSnap = DbgSnap(
          dut.dbg.A.peek().litValue, dut.dbg.B.peek().litValue, dut.dbg.C.peek().litValue,
          dut.dbg.D.peek().litValue, dut.dbg.E.peek().litValue, dut.dbg.F.peek().litValue,
          dut.dbg.G.peek().litValue, dut.dbg.H.peek().litValue, dut.dbg.I.peek().litValue,
          dut.dbg.xc.peek().litValue, dut.dbg.yc.peek().litValue
        )

        def same(a: DbgSnap, b: DbgSnap): Boolean =
          a == b

        def mkPixel(x: Int, y: Int): Int = {
          // 24-bit test pattern (unique-ish per coordinate)
          ((y & 0xFF) << 16) | ((x & 0xFF) << 8) | ((x + 16*y) & 0xFF)
        }

        // Drive defaults
        dut.io.in.valid.poke(false.B)
        dut.io.in.bits.pix.poke(0.U)
        dut.io.in.bits.yuv.poke(0.U)
        dut.io.in.bits.sof.poke(false.B)
        dut.io.in.bits.eol.poke(false.B)
        dut.io.out.ready.poke(true.B)

        dut.clock.step(5)

        // ---------------- Feed pixels until pipeline is active ----------------
        var ix = 0
        val totalIn = W * H

        // We'll also count outputs just to keep things moving / sanity check
        var outCount = 0
        def tryPop(): Unit = {
          if (dut.io.out.valid.peek().litToBoolean && dut.io.out.ready.peek().litToBoolean) {
            outCount += 1
          }
        }

        // Feed for a while with out.ready=1 to fill pipeline
        var guard = 0
        while (ix < totalIn && guard < totalIn + 200) {
          val y = ix / W
          val x = ix % W

          dut.io.in.valid.poke(true.B)
          dut.io.in.bits.pix.poke(mkPixel(x, y).U)
          dut.io.in.bits.yuv.poke(0.U)
          dut.io.in.bits.sof.poke((ix == 0).B)
          dut.io.in.bits.eol.poke((x == W - 1).B)

          tryPop()

          val ready = dut.io.in.ready.peek().litToBoolean
          dut.clock.step(1)
          if (ready) ix += 1

          guard += 1
        }
        dut.io.in.valid.poke(false.B)
        dut.io.in.bits.sof.poke(false.B)
        dut.io.in.bits.eol.poke(false.B)

        // ---------------- Force backpressure ----------------
        // Keep feeding a few more cycles with out.ready = 0 so Queue fills and stall eventually triggers.
        dut.io.out.ready.poke(false.B)

        // Keep in.valid high to see whether in.ready drops (stall)
        // We'll repeatedly present a "dummy" pixel; ix should NOT advance once stalled.
        dut.io.in.valid.poke(true.B)
        dut.io.in.bits.pix.poke("h00AA55".U) // arbitrary
        dut.io.in.bits.yuv.poke(0.U)
        dut.io.in.bits.sof.poke(false.B)
        dut.io.in.bits.eol.poke(false.B)

        // Wait until stall is observed via in.ready == 0
        var sawStall = false
        var stallWait = 0
        while (!sawStall && stallWait < 500) {
          val inReady = dut.io.in.ready.peek().litToBoolean
          val dbgValid = dut.dbg.valid.peek().litToBoolean

          // Once out.ready is low long enough, pipeline should backpressure and deassert in.ready
          if (!inReady && dbgValid) sawStall = true

          dut.clock.step(1)
          stallWait += 1
        }

        assert(sawStall, "Did not observe stall (io.in.ready stayed high); try smaller outQueueDepth or longer backpressure window.")

        // ---------------- Verify "hold" under stall ----------------
        // At this point, out.ready=0 and in.ready should be 0 (stall).
        // Check dbg window/coords stay constant across multiple cycles.
        val base = snapDbg()

        val holdCycles = 8
        var k = 0
        while (k < holdCycles) {
          // Still backpressured
          dut.io.out.ready.poke(false.B)

          val inReady = dut.io.in.ready.peek().litToBoolean
          assert(!inReady, s"Expected io.in.ready=0 under stall, but got ready=1 at hold cycle $k")

          val now = snapDbg()
          assert(same(base, now), s"dbg window/coords changed during stall at hold cycle $k\nbase=$base\nnow =$now")

          dut.clock.step(1)
          k += 1
        }

        // ---------------- Release stall and ensure pipeline moves again ----------------
        dut.io.out.ready.poke(true.B)

        // After releasing, we should eventually see dbg change (pipeline progresses).
        var changed = false
        var rel = 0
        while (!changed && rel < 200) {
          val now = snapDbg()
          if (now != base && dut.dbg.valid.peek().litToBoolean) changed = true
          tryPop()
          dut.clock.step(1)
          rel += 1
        }
        assert(changed, "After releasing backpressure, dbg did not change; pipeline might not be advancing.")

        // Done
        dut.io.in.valid.poke(false.B)
      }
  }
}
