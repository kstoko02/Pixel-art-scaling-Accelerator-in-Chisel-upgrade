package pixelart

import chisel3._
import chisel3.util._

class S2Window(pixBits: Int, imgW: Int, imgH: Int) extends Module {
  val io = IO(new Bundle {
    val in_pix       = Input(UInt(pixBits.W))
    val in_yuv       = Input(UInt(24.W))
    val row_m1_rgb   = Input(UInt(pixBits.W))
    val row_m2_rgb   = Input(UInt(pixBits.W))
    val row_m1_yuv   = Input(UInt(24.W))
    val row_m2_yuv   = Input(UInt(24.W))
    val s1_x         = Input(UInt(16.W))
    val s1_y         = Input(UInt(16.W))
    val s1_sof       = Input(Bool())
    val s1_eol       = Input(Bool())
    val v1           = Input(Bool())
    val stall        = Input(Bool())
    val out          = Decoupled(new S2OutBundle(pixBits))
  })

  // 3×3 SR
  val sr2  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr1  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr0  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr2y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))
  val sr1y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))
  val sr0y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))

  val lastRowRGB = RegInit(VecInit(Seq.fill(imgW)(0.U(pixBits.W))))
  val lastRowYUV = RegInit(VecInit(Seq.fill(imgW)(0.U(24.W))))
  val lastRow2RGB = RegInit(VecInit(Seq.fill(imgW)(0.U(pixBits.W))))
  val lastRow2YUV = RegInit(VecInit(Seq.fill(imgW)(0.U(24.W))))
  val winRGB_w = Wire(new Win3x3(pixBits)); winRGB_w := 0.U.asTypeOf(winRGB_w)
  val winYUV_w = Wire(new Win3x3Yuv);       winYUV_w := 0.U.asTypeOf(winYUV_w)
  val meta_w   = Wire(new MetaWin);         meta_w   := 0.U.asTypeOf(meta_w)
  val emit_w   = WireInit(false.B)

  // control
  val lastCol  = io.s1_x === (imgW-1).U
  val lastRow  = io.s1_y === (imgH-1).U
  val padX     = RegInit(false.B)   
  val padY     = RegInit(false.B)   
  val fakeX    = RegInit(0.U(16.W)) 

  val usePadX = padX
  val usePadY = padY
  val step    = !io.stall && (io.v1 || usePadX || usePadY)

  when(step) {
    when(!usePadY) {
      when(!usePadX && lastCol && io.v1) { padX := true.B }
      .elsewhen(usePadX)                 { padX := false.B }
    }
    when(!usePadY && lastRow && lastCol && io.v1 && !padX) {
      padY  := true.B
      fakeX := 0.U
    }.elsewhen(usePadY) {
      fakeX := fakeX + 1.U
      when(fakeX === (imgW).U) { 
        padY  := false.B
        fakeX := 0.U
      }
    }
  }

  val effX = Mux(usePadY, fakeX, Mux(usePadX, imgW.U, io.s1_x))
  val effY = Mux(usePadY, imgH.U, io.s1_y)
  val firstCol = (effX === 0.U) && !usePadX
  val firstRow = (!usePadY) && (io.s1_y === 0.U)

  // ---------------- effective inputs (handle padX / padY differently) ----------------
  val fxClamped = Mux(fakeX >= (imgW-1).U, (imgW-1).U, fakeX)

  // padX: repeat last pixel of the row (sr?(2))
  // padY: use lastRow at current fakeX (so bottom row is NOT all the last pixel)
  val eff_row_m2_rgb = Mux(usePadY, lastRow2RGB(fxClamped),
                       Mux(usePadX, sr2(2), io.row_m2_rgb))
  val eff_row_m1_rgb = Mux(usePadY, lastRowRGB(fxClamped),
                       Mux(usePadX, sr1(2), io.row_m1_rgb))
  val eff_in_pix     = Mux(usePadY, lastRow2RGB(fxClamped),
                       Mux(usePadX, sr0(2), io.in_pix))

  val eff_row_m2_yuv = Mux(usePadY, lastRow2YUV(fxClamped),
                       Mux(usePadX, sr2y(2), io.row_m2_yuv))
  val eff_row_m1_yuv = Mux(usePadY, lastRowYUV(fxClamped),
                       Mux(usePadX, sr1y(2), io.row_m1_yuv))
  val eff_in_yuv     = Mux(usePadY, lastRow2YUV(fxClamped),
                       Mux(usePadX, sr0y(2), io.in_yuv))

  
  // halo
  when(step) {
    // capture the real last row for bottom padding (only when consuming real input)
    when(io.v1 && !usePadY && (io.s1_y === (imgH-1).U) && (io.s1_x < imgW.U)) {
      lastRowRGB(io.s1_x) := io.in_pix
      lastRowYUV(io.s1_x) := io.in_yuv
    }
    when(io.v1 && !usePadY && (io.s1_y === (imgH-2).U) && (io.s1_x < imgW.U)) {
      lastRow2RGB(io.s1_x) := io.in_pix
      lastRow2YUV(io.s1_x) := io.in_yuv
    }
    val next_sr2_raw  = Mux(firstCol, VecInit(eff_row_m2_rgb, eff_row_m2_rgb, eff_row_m2_rgb),
                                      VecInit(sr2(1),        sr2(2),          eff_row_m2_rgb))
    val next_sr1      = Mux(firstCol, VecInit(eff_row_m1_rgb, eff_row_m1_rgb, eff_row_m1_rgb),
                                      VecInit(sr1(1),        sr1(2),          eff_row_m1_rgb))
    val next_sr0      = Mux(firstCol, VecInit(eff_in_pix,     eff_in_pix,     eff_in_pix),
                                      VecInit(sr0(1),        sr0(2),          eff_in_pix))

    val next_sr2y_raw = Mux(firstCol, VecInit(eff_row_m2_yuv, eff_row_m2_yuv, eff_row_m2_yuv),
                                      VecInit(sr2y(1),       sr2y(2),         eff_row_m2_yuv))
    val next_sr1y     = Mux(firstCol, VecInit(eff_row_m1_yuv, eff_row_m1_yuv, eff_row_m1_yuv),
                                      VecInit(sr1y(1),       sr1y(2),         eff_row_m1_yuv))
    val next_sr0y     = Mux(firstCol, VecInit(eff_in_yuv,     eff_in_yuv,     eff_in_yuv),
                                      VecInit(sr0y(1),       sr0y(2),         eff_in_yuv))

    // Complete the top row
    val next_sr2  = Mux(firstRow, next_sr1,  next_sr2_raw)
    val next_sr2y = Mux(firstRow, next_sr1y, next_sr2y_raw)

    // write back
    sr2  := next_sr2 ; sr1  := next_sr1 ; sr0  := next_sr0
    sr2y := next_sr2y; sr1y := next_sr1y; sr0y := next_sr0y

    winRGB_w.A := next_sr2(0); winRGB_w.B := next_sr2(1); winRGB_w.C := next_sr2(2)
    winRGB_w.D := next_sr1(0); winRGB_w.E := next_sr1(1); winRGB_w.F := next_sr1(2)
    winRGB_w.G := next_sr0(0); winRGB_w.H := next_sr0(1); winRGB_w.I := next_sr0(2)
    winYUV_w.A := next_sr2y(0); winYUV_w.B := next_sr2y(1); winYUV_w.C := next_sr2y(2)
    winYUV_w.D := next_sr1y(0); winYUV_w.E := next_sr1y(1); winYUV_w.F := next_sr1y(2)
    winYUV_w.G := next_sr0y(0); winYUV_w.H := next_sr0y(1); winYUV_w.I := next_sr0y(2)

    val canEmitX = effX =/= 0.U
    val canEmitY = (effY =/= 0.U)
    val started = RegInit(false.B)
    when(!io.stall) {
      when(io.v1 && io.s1_sof) { started := true.B }
    }
    emit_w := step && started && (effX =/= 0.U) && canEmitY

    val centerX = Mux(effX === 0.U, 0.U, effX - 1.U)
    val centerY = Mux(effY === 0.U, 0.U, effY - 1.U)

    meta_w.xc := Mux(usePadY,
                    Mux(centerX >= (imgW-1).U, (imgW-1).U, centerX),
                    Mux(usePadX, (imgW-1).U, centerX))

    meta_w.yc := Mux(centerY >= (imgH-1).U, (imgH-1).U, centerY)
    meta_w.sof := io.s1_sof && io.v1 && !usePadX && !usePadY
    val eol_padX = usePadX  
    val eol_padY = usePadY && (fakeX === imgW.U)

    meta_w.eol := (io.s1_eol && io.v1 && !usePadY) || eol_padX || eol_padY
    meta_w.emit := emit_w
  }

  // 1-entry skid buffer
  val rValid = RegInit(false.B)
  val rBits  = Reg(io.out.bits.cloneType)
  val pop  = io.out.ready && rValid
  val push = emit_w

  io.out.valid := rValid
  io.out.bits  := rBits

  when(!io.stall) {
    when(push && (!rValid || io.out.ready)) {
      rBits.winRGB := winRGB_w
      rBits.winYUV := winYUV_w
      rBits.meta   := meta_w
      rValid       := true.B
    }.elsewhen(pop) {
      rValid := false.B
    }
  }
}
