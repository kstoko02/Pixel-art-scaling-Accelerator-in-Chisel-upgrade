package pixelart

import chisel3._
import chisel3.util._

object Utils {
  @inline def absDiffU(a: UInt, b: UInt): UInt = Mux(a >= b, a - b, b - a)
  
  // 
  def yuvDistPacked(a: UInt, b: UInt): UInt = {
    val ay = a(23,16); val au = a(15,8); val av = a(7,0)
    val by = b(23,16); val bu = b(15,8); val bv = b(7,0)
    val dy = absDiffU(ay, by)
    val du = absDiffU(au, bu)
    val dv = absDiffU(av, bv)
    (dy << 5) + (dy << 4) + (du << 2) + (du << 1) + du + (dv << 2) + (dv << 1)
  }

  def yuv_equals(a: UInt, b: UInt, thr: Int = 600): Bool = {
    yuvDistPacked(a, b) <= thr.U
  }

  // Mixed colors
  def mix16Rgb888(a: UInt, b: UInt, wB_num: Int): UInt = {
    val wB = wB_num.U(5.W); val wA = (16 - wB_num).U(5.W)
    def mix8(a8: UInt, b8: UInt): UInt = {
      val sum = (a8 * wA) + (b8 * wB) + 8.U  // rounding
      (sum >> 4)(7,0)
    }
    val ar = a(23,16); val ag = a(15,8); val ab = a(7,0)
    val br = b(23,16); val bg = b(15,8); val bb = b(7,0)
    Cat(mix8(ar, br), mix8(ag, bg), mix8(ab, bb))
  }

  // Pick the color closer to E
  def closerToE(c1_rgb: UInt, c2_rgb: UInt, y1: UInt, y2: UInt, Ey: UInt): UInt =
    Mux(yuvDistPacked(Ey, y1) <= yuvDistPacked(Ey, y2), c1_rgb, c2_rgb)
}