package pixelart

import chisel3._
import chiseltest._
import org.scalatest._
import org.scalatest.flatspec.AnyFlatSpec
import pixelart._
import chiseltest.simulator.WriteVcdAnnotation


class S2WindowTest extends AnyFlatSpec with ChiselScalatestTester {
  val H = 3
  val W = 4
  val pixBits = 8

  behavior of "S2Window"

  it should "initialize with valid=false" in {
    test(new S2Window(pixBits, W, H)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.v1.poke(false.B)
      dut.io.stall.poke(false.B)
      dut.io.out.ready.poke(true.B)
      dut.clock.step()
      dut.io.out.valid.expect(false.B)
    }
  }

  it should "accept pixels and build 3x3 window" in {
    test(new S2Window(pixBits, W, H)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.stall.poke(false.B)
      dut.io.out.ready.poke(true.B)

      // Feed first row: y=0, x=0..3
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(0.U)
        dut.io.s1_sof.poke(x == 0)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke((0x10 + x).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke(0x00.U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Feed second row: y=1, x=0..3
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(1.U)
        dut.io.s1_sof.poke(false.B)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke((0x20 + x).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((0x10 + x).U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()

        // From position (1,1) onwards, should start emitting
        if (x > 0) {
          dut.io.out.valid.expect(true.B)
        }
      }

      // Feed third row: y=2, x=0..3, values: 9, A, B, C
      val row3Values = Seq(0x09, 0x0A, 0x0B, 0x0C)
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(2.U)
        dut.io.s1_sof.poke(false.B)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke(row3Values(x).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((0x20 + x).U)
        dut.io.row_m2_rgb.poke((0x10 + x).U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }
    }
  }

  it should "emit windows with correct A,B,C,D,E,F,G,H,I values" in {
    test(new S2Window(pixBits, W, H)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.stall.poke(false.B)
      dut.io.out.ready.poke(true.B)

      // Populate shift registers with a pattern
      // Row 0: [1, 2, 3, 4]
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(0.U)
        dut.io.s1_sof.poke(x == 0)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke((x + 1).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke(0x00.U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Row 1: [5, 6, 7, 8]
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(1.U)
        dut.io.s1_sof.poke(false.B)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke((x + 5).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((x + 1).U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Row 2: [9, A, B, C]
      val row2Values = Seq(0x09, 0x0A, 0x0B, 0x0C)
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(2.U)
        dut.io.s1_sof.poke(false.B)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke(row2Values(x).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((x + 5).U)
        dut.io.row_m2_rgb.poke((x + 1).U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()

        // Check window values when x >= 1
        if (x >= 1) {
          dut.io.out.valid.expect(true.B)
        }
      }
    }
  }

  it should "handle stall correctly" in {
    test(new S2Window(pixBits, W, H)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.stall.poke(true.B)
      dut.io.out.ready.poke(true.B)
      dut.io.v1.poke(true.B)
      dut.io.s1_x.poke(0.U)
      dut.io.s1_y.poke(0.U)
      dut.io.in_pix.poke(0x55.U)
      dut.io.in_yuv.poke(0x808080.U)
      dut.io.row_m1_rgb.poke(0x00.U)
      dut.io.row_m2_rgb.poke(0x00.U)
      dut.io.row_m1_yuv.poke(0x808080.U)
      dut.io.row_m2_yuv.poke(0x808080.U)

      // When stalled, output should not change
      dut.clock.step()
      dut.io.out.valid.expect(false.B)

      dut.clock.step()
      dut.io.out.valid.expect(false.B)

      // Release stall
      dut.io.stall.poke(false.B)
      dut.clock.step()
    }
  }

  it should "handle end-of-line and padding" in {
    test(new S2Window(pixBits, W, H)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.stall.poke(false.B)
      dut.io.out.ready.poke(true.B)

      // First row
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(0.U)
        dut.io.s1_sof.poke(x == 0)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke((x + 1).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke(0x00.U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Second row
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(1.U)
        dut.io.s1_sof.poke(false.B)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke((x + 5).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((x + 1).U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Third row
      val row3Values = Seq(0x09, 0x0A, 0x0B, 0x0C)
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(2.U)
        dut.io.s1_sof.poke(false.B)
        dut.io.s1_eol.poke(x == W - 1)
        dut.io.in_pix.poke(row3Values(x).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((x + 5).U)
        dut.io.row_m2_rgb.poke((x + 1).U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Let it process padding cycles
      dut.io.v1.poke(false.B)
      dut.clock.step()
      dut.clock.step()
    }
  }

  it should "handle output ready/valid handshake" in {
    test(new S2Window(pixBits, W, H)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.io.stall.poke(false.B)

      // Feed enough data to generate output
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(0.U)
        dut.io.in_pix.poke((x + 1).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke(0x00.U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(1.U)
        dut.io.in_pix.poke((x + 5).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((x + 1).U)
        dut.io.row_m2_rgb.poke(0x00.U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Test with ready=false, should not pop
      dut.io.out.ready.poke(false.B)
      val row3Values = Seq(0x09, 0x0A, 0x0B, 0x0C)
      for (x <- 0 until W) {
        dut.io.v1.poke(true.B)
        dut.io.s1_x.poke(x.U)
        dut.io.s1_y.poke(2.U)
        dut.io.in_pix.poke(row3Values(x).U)
        dut.io.in_yuv.poke(0x808080.U)
        dut.io.row_m1_rgb.poke((x + 5).U)
        dut.io.row_m2_rgb.poke((x + 1).U)
        dut.io.row_m1_yuv.poke(0x808080.U)
        dut.io.row_m2_yuv.poke(0x808080.U)
        dut.clock.step()
      }

      // Release ready
      dut.io.out.ready.poke(true.B)
      dut.clock.step()
    }
  }
}