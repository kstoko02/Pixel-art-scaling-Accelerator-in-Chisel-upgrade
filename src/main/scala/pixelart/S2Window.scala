package pixelart

import chisel3._
import chisel3.util._

/** S2：從 S1 的行緩衝/clamp 來建 3×3 視窗；輸出端為 Decoupled，
  * 內含 1-entry skid buffer，支援「同拍 pop & push」→ 無氣泡。
  */
class S2Window(pixBits: Int, imgW: Int) extends Module {
  val io = IO(new Bundle {
    // 來自 S1 的輸入（非 Decoupled）
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
    val v1           = Input(Bool())   // 本拍 S1 有新像素
    val stall        = Input(Bool())   // 全域停滯

    val out          = Decoupled(new S2OutBundle(pixBits))
  })

  // --- Shift registers（3×3） ---
  val sr2  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr1  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr0  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr2y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))
  val sr1y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))
  val sr0y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))

  val winRGB_w = Wire(new Win3x3(pixBits)); winRGB_w := 0.U.asTypeOf(winRGB_w)
  val winYUV_w = Wire(new Win3x3Yuv);       winYUV_w := 0.U.asTypeOf(winYUV_w)
  val meta_w   = Wire(new MetaWin);         meta_w   := 0.U.asTypeOf(meta_w)
  val emit_w   = Wire(Bool());              emit_w   := false.B

  when(!io.stall && io.v1) {
    val firstCol = (io.s1_x === 0.U)

    val next_sr2  = Mux(firstCol, VecInit(io.row_m2_rgb, io.row_m2_rgb, io.row_m2_rgb),
                                  VecInit(sr2(1), sr2(2), io.row_m2_rgb))
    val next_sr1  = Mux(firstCol, VecInit(io.row_m1_rgb, io.row_m1_rgb, io.row_m1_rgb),
                                  VecInit(sr1(1), sr1(2), io.row_m1_rgb))
    val next_sr0  = Mux(firstCol, VecInit(io.in_pix, io.in_pix, io.in_pix),
                                  VecInit(sr0(1), sr0(2), io.in_pix))

    val next_sr2y = Mux(firstCol, VecInit(io.row_m2_yuv, io.row_m2_yuv, io.row_m2_yuv),
                                  VecInit(sr2y(1), sr2y(2), io.row_m2_yuv))
    val next_sr1y = Mux(firstCol, VecInit(io.row_m1_yuv, io.row_m1_yuv, io.row_m1_yuv),
                                  VecInit(sr1y(1), sr1y(2), io.row_m1_yuv))
    val next_sr0y = Mux(firstCol, VecInit(io.in_yuv, io.in_yuv, io.in_yuv),
                                  VecInit(sr0y(1), sr0y(2), io.in_yuv))

    sr2  := next_sr2;  sr1  := next_sr1;  sr0  := next_sr0
    sr2y := next_sr2y; sr1y := next_sr1y; sr0y := next_sr0y

    winRGB_w.A := next_sr2(0); winRGB_w.B := next_sr2(1); winRGB_w.C := next_sr2(2)
    winRGB_w.D := next_sr1(0); winRGB_w.E := next_sr1(1); winRGB_w.F := next_sr1(2)
    winRGB_w.G := next_sr0(0); winRGB_w.H := next_sr0(1); winRGB_w.I := next_sr0(2)

    winYUV_w.A := next_sr2y(0); winYUV_w.B := next_sr2y(1); winYUV_w.C := next_sr2y(2)
    winYUV_w.D := next_sr1y(0); winYUV_w.E := next_sr1y(1); winYUV_w.F := next_sr1y(2)
    winYUV_w.G := next_sr0y(0); winYUV_w.H := next_sr0y(1); winYUV_w.I := next_sr0y(2)

    // emit：非第一列、非第一行（維持你既有合約）
    emit_w      := (io.s1_x =/= 0.U) && (io.s1_y =/= 0.U)
    meta_w.xc   := io.s1_x - 1.U
    meta_w.yc   := io.s1_y - 1.U
    meta_w.sof  := io.s1_sof
    meta_w.eol  := io.s1_eol
    meta_w.emit := emit_w
  }

  // --- 1-entry skid buffer（允許同拍 pop & push） ---
  val rValid = RegInit(false.B)
  val rBits  = Reg(io.out.bits.cloneType)

  val pop  = io.out.ready && rValid
  val push = emit_w

  // 預設輸出
  io.out.valid := rValid
  io.out.bits  := rBits

  when(!io.stall) {
    // 同拍允許覆寫：當前已滿且下游 ready，再塞新資料
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
