package pixelart

import chisel3._
import chisel3.util._
import Utils._


class S5Blend(pixBits: Int) extends Module {
  val io = IO(new Bundle {
    val in   = Flipped(Decoupled(new S4aOutBundle(pixBits)))
    val out  = Decoupled(new S5OutBundle(pixBits))
  })

  val holdValid = RegInit(false.B)
  val holdBits  = Reg(io.out.bits.cloneType)

  io.in.ready  := !holdValid || io.out.ready
  io.out.valid := holdValid
  io.out.bits  := holdBits

  val W_INT1  = 8   // 0.5
  val W_INT2s = 4   // 0.25
  val W_INT2l = 12  // 0.75

  when(io.in.valid && io.in.ready) {
    val b = io.in.bits

    val Ey = b.winYUV.E
    val brNew = closerToE(b.Fp, b.Hp, b.winYUV.F, b.winYUV.H, Ey)
    val blNew = closerToE(b.Dp, b.Hp, b.winYUV.D, b.winYUV.H, Ey)
    val tlNew = closerToE(b.Bp, b.Dp, b.winYUV.B, b.winYUV.D, Ey)
    val trNew = closerToE(b.Bp, b.Fp, b.winYUV.B, b.winYUV.F, Ey)

    val edgeBR = (b.dCE + b.dEG + (b.dFH << 2)) < (b.dBF + b.dDH + (b.dEI << 2))
    val edgeBL = (b.dAE + b.dEI + (b.dDH << 2)) < (b.dBF + b.dFH + (b.dEG << 2))
    val edgeTL = (b.dCE + b.dEG + (b.dCB << 2)) < (b.dAB + b.dDG + (b.dAE << 2))
    val edgeTR = (b.dAE + b.dEI + (b.dBF << 2)) < (b.dCB + b.dFH + (b.dCE << 2))

    val e0_0 = b.Ep; val e1_0 = b.Ep; val e2_0 = b.Ep; val e3_0 = b.Ep

    // BR
    val br_hasInt2 = edgeBR && (b.eq_FG || b.eq_CH)
    val br_hasNone = edgeBR && !(b.eq_FG || b.eq_CH)
    val e0_1 = e0_0
    val e1_1 = Mux(edgeBR && b.eq_CH, mix16Rgb888(e1_0, brNew, W_INT2s), e1_0)
    val e2_1 = Mux(edgeBR && b.eq_FG, mix16Rgb888(e2_0, brNew, W_INT2s), e2_0)
    val e3_1 = Mux(br_hasInt2, mix16Rgb888(e3_0, brNew, W_INT2l),
               Mux(br_hasNone, mix16Rgb888(e3_0, brNew, W_INT1), e3_0))

    // BL
    val bl_hasInt2 = edgeBL && (b.eq_DI || b.eq_AH)
    val bl_hasNone = edgeBL && !(b.eq_DI || b.eq_AH)
    val e0_2 = Mux(edgeBL && b.eq_AH, mix16Rgb888(e0_1, blNew, W_INT2s), e0_1)
    val e1_2 = e1_1
    val e2_2 = Mux(bl_hasInt2, mix16Rgb888(e2_1, blNew, W_INT2l),
               Mux(bl_hasNone, mix16Rgb888(e2_1, blNew, W_INT1), e2_1))
    val e3_2 = Mux(edgeBL && b.eq_DI, mix16Rgb888(e3_1, blNew, W_INT2s), e3_1)

    // TL
    val tl_hasInt2 = edgeTL && (b.eq_CD || b.eq_BG)
    val tl_hasNone = edgeTL && !(b.eq_CD || b.eq_BG)
    val e0_3 = Mux(tl_hasInt2, mix16Rgb888(e0_2, tlNew, W_INT2l),
               Mux(tl_hasNone, mix16Rgb888(e0_2, tlNew, W_INT1), e0_2))
    val e1_3 = Mux(edgeTL && b.eq_CD, mix16Rgb888(e1_2, tlNew, W_INT2s), e1_2)
    val e2_3 = Mux(edgeTL && b.eq_BG, mix16Rgb888(e2_2, tlNew, W_INT2s), e2_2)
    val e3_3 = e3_2

    // TR
    val tr_hasInt2 = edgeTR && (b.eq_AF || b.eq_BI)
    val tr_hasNone = edgeTR && !(b.eq_AF || b.eq_BI)
    val e0_4 = Mux(edgeTR && b.eq_AF, mix16Rgb888(e0_3, trNew, W_INT2s), e0_3)
    val e1_4 = Mux(tr_hasInt2, mix16Rgb888(e1_3, trNew, W_INT2l),
               Mux(tr_hasNone, mix16Rgb888(e1_3, trNew, W_INT1), e1_3))
    val e2_4 = e2_3
    val e3_4 = Mux(edgeTR && b.eq_BI, mix16Rgb888(e3_3, trNew, W_INT2s), e3_3)

    holdBits.block := VecInit(Seq(e0_4, e1_4, e2_4, e3_4))
    holdBits.meta  := b.meta          // 保留 meta.emit 供除錯，但不會 gate valid
    holdValid      := true.B
  }.elsewhen(io.out.ready && holdValid) {
    holdValid := false.B
  }
}
