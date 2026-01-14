package pixelart

import chisel3._
import chisel3.util._
import Utils._

/** S4a：預計算距離/等色 + 帶上必要 RGB/YUV 與 meta。
  * 採用 1-entry 通道緩衝（允許同拍 pop & push）。
  */
class S4aPrecompute(pixBits: Int) extends Module {
  val io = IO(new Bundle {
    val in    = Flipped(Decoupled(new S2OutBundle(pixBits)))
    val stall = Input(Bool())
    val out   = Decoupled(new S4aOutBundle(pixBits))
  })

  val holdValid = RegInit(false.B)
  val holdBits  = Reg(io.out.bits.cloneType)

  io.in.ready  := !io.stall && (!holdValid || io.out.ready)
  io.out.valid := holdValid
  io.out.bits  := holdBits

  when(!io.stall) {
    when(io.in.valid && io.in.ready) {
      val b  = io.in.bits

      holdBits.winYUV := b.winYUV
      holdBits.Bp := b.winRGB.B; holdBits.Dp := b.winRGB.D
      holdBits.Fp := b.winRGB.F; holdBits.Hp := b.winRGB.H
      holdBits.Ep := b.winRGB.E

      val Ay=b.winYUV.A; val By=b.winYUV.B; val Cy=b.winYUV.C
      val Dy=b.winYUV.D; val Ey=b.winYUV.E; val Fy=b.winYUV.F
      val Gy=b.winYUV.G; val Hy=b.winYUV.H; val Iy=b.winYUV.I

      holdBits.dCE := yuvDistPacked(Cy, Ey); holdBits.dEG := yuvDistPacked(Ey, Gy); holdBits.dFH := yuvDistPacked(Fy, Hy)
      holdBits.dBF := yuvDistPacked(By, Fy); holdBits.dDH := yuvDistPacked(Dy, Hy); holdBits.dEI := yuvDistPacked(Ey, Iy)
      holdBits.dAE := yuvDistPacked(Ay, Ey); holdBits.dCB := yuvDistPacked(Cy, By)
      holdBits.dAB := yuvDistPacked(Ay, By); holdBits.dDG := yuvDistPacked(Dy, Gy)

      holdBits.eq_FG := yuvEqualsFast(Fy, Gy); holdBits.eq_CH := yuvEqualsFast(Cy, Hy)
      holdBits.eq_DI := yuvEqualsFast(Dy, Iy); holdBits.eq_AH := yuvEqualsFast(Ay, Hy)
      holdBits.eq_CD := yuvEqualsFast(Cy, Dy); holdBits.eq_BG := yuvEqualsFast(By, Gy)
      holdBits.eq_AF := yuvEqualsFast(Ay, Fy); holdBits.eq_BI := yuvEqualsFast(By, Iy)

      holdBits.meta := b.meta
      holdValid     := true.B
    }.elsewhen(io.out.ready && holdValid) {
      holdValid := false.B
    }
  }
}
