// File: src/main/scala/pixelart/Xbr2xPipeline.scala
package pixelart

import chisel3._
import chisel3.util._

class PixIn(pixBits: Int) extends Bundle {
  val pix = UInt(pixBits.W)   // RGB24: 0xRRGGBB
  val yuv = UInt(24.W)        // packed YUV: [23:16]=Y, [15:8]=U, [7:0]=V
  val sof = Bool()
  val eol = Bool()
}

class Block2x2Out(pixBits: Int) extends Bundle {
  // E0 E1
  // E2 E3
  val block = Vec(4, UInt(pixBits.W))
  val x     = UInt(16.W) // center x (input coord)
  val y     = UInt(16.W) // center y (input coord)
  val sof   = Bool()
  val eol   = Bool()
}

class Win3x3(pixBits: Int) extends Bundle {
  val A = UInt(pixBits.W); val B = UInt(pixBits.W); val C = UInt(pixBits.W)
  val D = UInt(pixBits.W); val E = UInt(pixBits.W); val F = UInt(pixBits.W)
  val G = UInt(pixBits.W); val H = UInt(pixBits.W); val I = UInt(pixBits.W)
}

class Win3x3Yuv extends Bundle {
  val A = UInt(24.W); val B = UInt(24.W); val C = UInt(24.W)
  val D = UInt(24.W); val E = UInt(24.W); val F = UInt(24.W)
  val G = UInt(24.W); val H = UInt(24.W); val I = UInt(24.W)
}

/** Streaming 3x3-window -> xBR-style 2x (accelerated).
  * Contract (baseline, no right/bottom flush):
  * - Emit only when s1_x>=1 && s1_y>=1 (center is (x-1,y-1))
  * - For W×H input, emits (W-1)×(H-1) blocks
  */
class Xbr2xPipeline(
  pixBits: Int,
  imgW: Int,
  thr: Int = 0,
  outQueueDepth: Int = 16
) extends Module {

  require(imgW >= 2, "imgW must be >= 2")

  val io = IO(new Bundle {
    val in  = Flipped(Decoupled(new PixIn(pixBits)))
    val out = Decoupled(new Block2x2Out(pixBits))
  })

  val dbg = IO(new Bundle {
    val valid = Output(Bool())
    val A = Output(UInt(pixBits.W)); val B = Output(UInt(pixBits.W)); val C = Output(UInt(pixBits.W))
    val D = Output(UInt(pixBits.W)); val E = Output(UInt(pixBits.W)); val F = Output(UInt(pixBits.W))
    val G = Output(UInt(pixBits.W)); val H = Output(UInt(pixBits.W)); val I = Output(UInt(pixBits.W))
    val xc = Output(UInt(16.W))
    val yc = Output(UInt(16.W))
  })

  // -------------------------
  // Output queue absorbs backpressure
  // -------------------------
  val outQ = Module(new Queue(new Block2x2Out(pixBits), outQueueDepth))
  io.out <> outQ.io.deq

  // -------------------------
  // Pipeline valids
  // -------------------------
  val v1 = RegInit(false.B)
  val v2 = RegInit(false.B)
  val v3 = RegInit(false.B)
  val v4 = RegInit(false.B) // 對應 S5（最後輸出前一級）

  // Emit flags
  val s2_emit = RegInit(false.B)
  val s3_emit = RegInit(false.B)
  val s5_emit = RegInit(false.B)

  // S5 regs (enqueue 端)
  val s5_block = Reg(Vec(4, UInt(pixBits.W)))
  val s5_xc    = Reg(UInt(16.W))
  val s5_yc    = Reg(UInt(16.W))
  val s5_sof   = Reg(Bool())
  val s5_eol   = Reg(Bool())

  // Stall only when we want to enqueue and queue is full
  val stall = v4 && s5_emit && !outQ.io.enq.ready
  io.in.ready := !stall
  val fireIn = io.in.valid && io.in.ready

  when(!stall) {
    v1 := fireIn
    v2 := v1
    v3 := v2
    v4 := v3
  }

  // -------------------------
  // (S0) x/y counters from sof/eol
  // -------------------------
  val x = RegInit(0.U(16.W))
  val y = RegInit(0.U(16.W))

  val s0_pix = io.in.bits.pix
  val s0_yuv = io.in.bits.yuv
  val s0_sof = io.in.bits.sof
  val s0_eol = io.in.bits.eol
  val s0_x   = x
  val s0_y   = y

  when(fireIn) {
    when(s0_sof) {
      x := Mux(s0_eol, 0.U, 1.U)
      y := 0.U
    }.elsewhen(s0_eol) {
      x := 0.U
      y := y + 1.U
    }.otherwise {
      x := x + 1.U
    }
  }

  // -------------------------
  // Line buffers (3-row ring)
  // -------------------------
  val buf0 = SyncReadMem(imgW, UInt(pixBits.W))
  val buf1 = SyncReadMem(imgW, UInt(pixBits.W))
  val buf2 = SyncReadMem(imgW, UInt(pixBits.W))

  val bufY0 = SyncReadMem(imgW, UInt(24.W))
  val bufY1 = SyncReadMem(imgW, UInt(24.W))
  val bufY2 = SyncReadMem(imgW, UInt(24.W))

  val curIdx   = RegInit(0.U(2.W))
  val prevIdx  = RegInit(1.U(2.W))
  val prev2Idx = RegInit(2.U(2.W))

  when(fireIn && s0_sof) {
    curIdx   := 0.U; prevIdx := 1.U; prev2Idx := 2.U
  }.elsewhen(fireIn && s0_eol) {
    val nPrev2 = prevIdx
    val nPrev  = curIdx
    val nCur   = prev2Idx
    prev2Idx := nPrev2
    prevIdx  := nPrev
    curIdx   := nCur
  }

  // write current pixel
  when(fireIn) {
    when(curIdx === 0.U) {
      buf0.write(s0_x, s0_pix); bufY0.write(s0_x, s0_yuv)
    }.elsewhen(curIdx === 1.U) {
      buf1.write(s0_x, s0_pix); bufY1.write(s0_x, s0_yuv)
    }.otherwise {
      buf2.write(s0_x, s0_pix); bufY2.write(s0_x, s0_yuv)
    }
  }

  // read (disable current buffer read)
  val r0  = buf0.read(s0_x, fireIn && (curIdx =/= 0.U))
  val r1  = buf1.read(s0_x, fireIn && (curIdx =/= 1.U))
  val r2  = buf2.read(s0_x, fireIn && (curIdx =/= 2.U))
  val ry0 = bufY0.read(s0_x, fireIn && (curIdx =/= 0.U))
  val ry1 = bufY1.read(s0_x, fireIn && (curIdx =/= 1.U))
  val ry2 = bufY2.read(s0_x, fireIn && (curIdx =/= 2.U))

  // (S1) latch meta + indices (align SyncReadMem latency)
  val s1_pix = Reg(UInt(pixBits.W))
  val s1_yuv = Reg(UInt(24.W))
  val s1_sof = Reg(Bool())
  val s1_eol = Reg(Bool())
  val s1_x   = Reg(UInt(16.W))
  val s1_y   = Reg(UInt(16.W))
  val s1_prevIdx  = Reg(UInt(2.W))
  val s1_prev2Idx = Reg(UInt(2.W))

  when(!stall && fireIn) {
    s1_pix := s0_pix
    s1_yuv := s0_yuv
    s1_sof := s0_sof
    s1_eol := s0_eol
    s1_x   := s0_x
    s1_y   := s0_y
    s1_prevIdx  := prevIdx
    s1_prev2Idx := prev2Idx
  }

  def selByIdx(idx: UInt, a0: UInt, a1: UInt, a2: UInt): UInt =
    Mux(idx === 0.U, a0, Mux(idx === 1.U, a1, a2))

  val raw_m1  = selByIdx(s1_prevIdx,  r0,  r1,  r2)
  val raw_m2  = selByIdx(s1_prev2Idx, r0,  r1,  r2)
  val rawy_m1 = selByIdx(s1_prevIdx,  ry0, ry1, ry2)
  val rawy_m2 = selByIdx(s1_prev2Idx, ry0, ry1, ry2)

  // top clamp (RGB)
  val s1_row_m1 = Wire(UInt(pixBits.W))
  val s1_row_m2 = Wire(UInt(pixBits.W))
  s1_row_m1 := Mux(s1_y === 0.U, s1_pix, raw_m1)
  s1_row_m2 := Mux(s1_y === 0.U, s1_pix, Mux(s1_y === 1.U, s1_row_m1, raw_m2))

  // top clamp (YUV)
  val s1y_row_m1 = Wire(UInt(24.W))
  val s1y_row_m2 = Wire(UInt(24.W))
  s1y_row_m1 := Mux(s1_y === 0.U, s1_yuv, rawy_m1)
  s1y_row_m2 := Mux(s1_y === 0.U, s1_yuv, Mux(s1_y === 1.U, s1y_row_m1, rawy_m2))

  // -------------------------
  // (S2) shift regs build 3x3 window
  // -------------------------
  val sr2  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr1  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr0  = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr2y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))
  val sr1y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))
  val sr0y = RegInit(VecInit(Seq.fill(3)(0.U(24.W))))

  val s2_win_reg = Reg(new Win3x3(pixBits))
  val s2_win_yuv = Reg(new Win3x3Yuv)
  val s2_xc  = Reg(UInt(16.W))
  val s2_yc  = Reg(UInt(16.W))
  val s2_sof = Reg(Bool())
  val s2_eol = Reg(Bool())

  when(!stall && v1) {
    val firstCol = (s1_x === 0.U)

    val next_sr2 = Mux(firstCol,
      VecInit(s1_row_m2, s1_row_m2, s1_row_m2),
      VecInit(sr2(1), sr2(2), s1_row_m2)
    )
    val next_sr1 = Mux(firstCol,
      VecInit(s1_row_m1, s1_row_m1, s1_row_m1),
      VecInit(sr1(1), sr1(2), s1_row_m1)
    )
    val next_sr0 = Mux(firstCol,
      VecInit(s1_pix, s1_pix, s1_pix),
      VecInit(sr0(1), sr0(2), s1_pix)
    )

    val next_sr2y = Mux(firstCol,
      VecInit(s1y_row_m2, s1y_row_m2, s1y_row_m2),
      VecInit(sr2y(1), sr2y(2), s1y_row_m2)
    )
    val next_sr1y = Mux(firstCol,
      VecInit(s1y_row_m1, s1y_row_m1, s1y_row_m1),
      VecInit(sr1y(1), sr1y(2), s1y_row_m1)
    )
    val next_sr0y = Mux(firstCol,
      VecInit(s1_yuv, s1_yuv, s1_yuv),
      VecInit(sr0y(1), sr0y(2), s1_yuv)
    )

    sr2  := next_sr2;  sr1  := next_sr1;  sr0  := next_sr0
    sr2y := next_sr2y; sr1y := next_sr1y; sr0y := next_sr0y

    s2_win_reg.A := next_sr2(0); s2_win_reg.B := next_sr2(1); s2_win_reg.C := next_sr2(2)
    s2_win_reg.D := next_sr1(0); s2_win_reg.E := next_sr1(1); s2_win_reg.F := next_sr1(2)
    s2_win_reg.G := next_sr0(0); s2_win_reg.H := next_sr0(1); s2_win_reg.I := next_sr0(2)

    s2_win_yuv.A := next_sr2y(0); s2_win_yuv.B := next_sr2y(1); s2_win_yuv.C := next_sr2y(2)
    s2_win_yuv.D := next_sr1y(0); s2_win_yuv.E := next_sr1y(1); s2_win_yuv.F := next_sr1y(2)
    s2_win_yuv.G := next_sr0y(0); s2_win_yuv.H := next_sr0y(1); s2_win_yuv.I := next_sr0y(2)

    val s2_emit_cond = (s1_x =/= 0.U) && (s1_y =/= 0.U)
    s2_emit := s2_emit_cond
    s2_xc  := s1_x - 1.U
    s2_yc  := s1_y - 1.U
    s2_sof := s1_sof
    s2_eol := s1_eol
  }.otherwise {
    s2_emit := false.B
  }

  // -------------------------
  // (S3) register window + meta
  // -------------------------
  val s3_win     = Reg(new Win3x3(pixBits))
  val s3_win_yuv = Reg(new Win3x3Yuv)
  val s3_xc  = Reg(UInt(16.W))
  val s3_yc  = Reg(UInt(16.W))
  val s3_sof = Reg(Bool())
  val s3_eol = Reg(Bool())

  when(!stall && v2) {
    s3_win := s2_win_reg
    s3_win_yuv := s2_win_yuv
    s3_xc  := s2_xc
    s3_yc  := s2_yc
    s3_sof := s2_sof
    s3_eol := s2_eol
    s3_emit := s2_emit
  }.otherwise {
    s3_emit := false.B
  }

  dbg.valid := v2 && s3_emit
  dbg.A := s3_win.A; dbg.B := s3_win.B; dbg.C := s3_win.C
  dbg.D := s3_win.D; dbg.E := s3_win.E; dbg.F := s3_win.F
  dbg.G := s3_win.G; dbg.H := s3_win.H; dbg.I := s3_win.I
  dbg.xc := s3_xc
  dbg.yc := s3_yc

  // ============================================================
  // S4a：預先計算距離/等色 + 暫存必要的 RGB/YUV/座標
  // S5：edge 比較 + 依 C 的插值規則混色（scaleFactor=2 對應 2×2 block）
  // ============================================================

  def absDiffU(a: UInt, b: UInt): UInt = Mux(a >= b, a - b, b - a)

  def yuv_dist_packed(a: UInt, b: UInt): UInt = {
    val ay = a(23,16); val au = a(15,8); val av = a(7,0)
    val by = b(23,16); val bu = b(15,8); val bv = b(7,0)
    val dy = absDiffU(ay, by)
    val du = absDiffU(au, bu)
    val dv = absDiffU(av, bv)
    (dy << 5) + (dy << 4) + (du << 2) + (du << 1) + du + (dv << 2) + (dv << 1)
  }

  // 注意：這仍是「快速近似」；若你要完全貼近 C 的 d()<=600，請把 equals 改成 yuv_dist_packed(a,b) <= 600.U
  def yuv_equals_fast(a: UInt, b: UInt, TY: Int = 20, TC: Int = 70): Bool = {
    val ay = a(23,16); val au = a(15,8); val av = a(7,0)
    val by = b(23,16); val bu = b(15,8); val bv = b(7,0)
    def absU(x: UInt, y: UInt) = Mux(x >= y, x - y, y - x)
    val dy = absU(ay, by)
    val du = absU(au, bu)
    val dv = absU(av, bv)
    (dy <= TY.U) && ((du +& dv) <= TC.U)
  }

  // mix: wB_num/16，含四捨五入 (+8)
  def mix16_rgb888(a: UInt, b: UInt, wB_num: Int): UInt = {
    val wB = wB_num.U(5.W)
    val wA = (16 - wB_num).U(5.W)
    def mix8(a8: UInt, b8: UInt): UInt = {
      val sum = (a8 * wA) + (b8 * wB) + 8.U
      (sum >> 4)(7,0)
    }
    val ar = a(23,16); val ag = a(15,8); val ab = a(7,0)
    val br = b(23,16); val bg = b(15,8); val bb = b(7,0)
    Cat(mix8(ar, br), mix8(ag, bg), mix8(ab, bb))
  }

  def closerToE(c1_rgb: UInt, c2_rgb: UInt, y1: UInt, y2: UInt, Ey: UInt): UInt =
    Mux(yuv_dist_packed(Ey, y1) <= yuv_dist_packed(Ey, y2), c1_rgb, c2_rgb)

  // ---------------- S4a ----------------
  val s4a_valid = RegInit(false.B)
  val s4a_emit  = RegInit(false.B)

  val Ay = Reg(UInt(24.W)); val By = Reg(UInt(24.W)); val Cy = Reg(UInt(24.W))
  val Dy = Reg(UInt(24.W)); val Ey = Reg(UInt(24.W)); val Fy = Reg(UInt(24.W))
  val Gy = Reg(UInt(24.W)); val Hy = Reg(UInt(24.W)); val Iy = Reg(UInt(24.W))

  val Bp = Reg(UInt(pixBits.W)); val Dp = Reg(UInt(pixBits.W))
  val Fp = Reg(UInt(pixBits.W)); val Hp = Reg(UInt(pixBits.W))
  val Ep = Reg(UInt(pixBits.W))

  val dCE = Reg(UInt(16.W)); val dEG = Reg(UInt(16.W)); val dFH = Reg(UInt(16.W))
  val dBF = Reg(UInt(16.W)); val dDH = Reg(UInt(16.W)); val dEI = Reg(UInt(16.W))
  val dAE = Reg(UInt(16.W)); val dCB = Reg(UInt(16.W))
  val dAB = Reg(UInt(16.W)); val dDG = Reg(UInt(16.W))

  val eq_FG = Reg(Bool()); val eq_CH = Reg(Bool())
  val eq_DI = Reg(Bool()); val eq_AH = Reg(Bool())
  val eq_CD = Reg(Bool()); val eq_BG = Reg(Bool())
  val eq_AF = Reg(Bool()); val eq_BI = Reg(Bool())

  val s4a_xc  = Reg(UInt(16.W))
  val s4a_yc  = Reg(UInt(16.W))
  val s4a_sof = Reg(Bool())
  val s4a_eol = Reg(Bool())

  when(!stall && v3) {
    Ay := s3_win_yuv.A; By := s3_win_yuv.B; Cy := s3_win_yuv.C
    Dy := s3_win_yuv.D; Ey := s3_win_yuv.E; Fy := s3_win_yuv.F
    Gy := s3_win_yuv.G; Hy := s3_win_yuv.H; Iy := s3_win_yuv.I

    Bp := s3_win.B; Dp := s3_win.D; Fp := s3_win.F; Hp := s3_win.H; Ep := s3_win.E

    def dist(a: UInt, b: UInt) = yuv_dist_packed(a, b)

    dCE := dist(Cy, Ey); dEG := dist(Ey, Gy); dFH := dist(Fy, Hy)
    dBF := dist(By, Fy); dDH := dist(Dy, Hy); dEI := dist(Ey, Iy)
    dAE := dist(Ay, Ey); dCB := dist(Cy, By)
    dAB := dist(Ay, By); dDG := dist(Dy, Gy)

    eq_FG := yuv_equals_fast(Fy, Gy)
    eq_CH := yuv_equals_fast(Cy, Hy)
    eq_DI := yuv_equals_fast(Dy, Iy)
    eq_AH := yuv_equals_fast(Ay, Hy)
    eq_CD := yuv_equals_fast(Cy, Dy)
    eq_BG := yuv_equals_fast(By, Gy)
    eq_AF := yuv_equals_fast(Ay, Fy)
    eq_BI := yuv_equals_fast(By, Iy)

    s4a_xc  := s3_xc
    s4a_yc  := s3_yc
    s4a_sof := s3_sof
    s4a_eol := s3_eol
    s4a_emit := s3_emit

    s4a_valid := true.B
  }.otherwise {
    s4a_valid := false.B
    s4a_emit  := false.B
  }

  // ---------------- S5（最終邏輯+混色） ----------------
  // 重要：用 Wire/Mux chain，避免 when-scope escape

  val W_INT1  = 8   // 0.5
  val W_INT2s = 4   // 0.25
  val W_INT2l = 12  // 0.75（你原本寫 12 是 0.75，不是 0.8125；0.8125 應該是 13）

  // candidates (wire)
  val brNew = Wire(UInt(pixBits.W))
  val blNew = Wire(UInt(pixBits.W))
  val tlNew = Wire(UInt(pixBits.W))
  val trNew = Wire(UInt(pixBits.W))

  brNew := closerToE(Fp, Hp, Fy, Hy, Ey)
  blNew := closerToE(Dp, Hp, Dy, Hy, Ey)
  tlNew := closerToE(Bp, Dp, By, Dy, Ey)
  trNew := closerToE(Bp, Fp, By, Fy, Ey)

  // edges (wire)
  val edgeBR = Wire(Bool())
  val edgeBL = Wire(Bool())
  val edgeTL = Wire(Bool())
  val edgeTR = Wire(Bool())

  edgeBR := (dCE + dEG + (dFH << 2)) < (dBF + dDH + (dEI << 2))
  edgeBL := (dAE + dEI + (dDH << 2)) < (dBF + dFH + (dEG << 2))
  edgeTL := (dCE + dEG + (dCB << 2)) < (dAB + dDG + (dAE << 2))
  edgeTR := (dAE + dEI + (dBF << 2)) < (dCB + dFH + (dCE << 2))

  // base
  val e0_0 = Ep
  val e1_0 = Ep
  val e2_0 = Ep
  val e3_0 = Ep

  // Stage 1: BR
  val br_hasInt2 = edgeBR && (eq_FG || eq_CH)
  val br_hasNone = edgeBR && !(eq_FG || eq_CH)

  val e0_1 = e0_0
  val e1_1 = Mux(edgeBR && eq_CH, mix16_rgb888(e1_0, brNew, W_INT2s), e1_0)
  val e2_1 = Mux(edgeBR && eq_FG, mix16_rgb888(e2_0, brNew, W_INT2s), e2_0)
  val e3_1 = Mux(br_hasInt2, mix16_rgb888(e3_0, brNew, W_INT2l),
             Mux(br_hasNone, mix16_rgb888(e3_0, brNew, W_INT1), e3_0))

  // Stage 2: BL
  val bl_hasInt2 = edgeBL && (eq_DI || eq_AH)
  val bl_hasNone = edgeBL && !(eq_DI || eq_AH)

  val e0_2 = Mux(edgeBL && eq_AH, mix16_rgb888(e0_1, blNew, W_INT2s), e0_1)
  val e1_2 = e1_1
  val e2_2 = Mux(bl_hasInt2, mix16_rgb888(e2_1, blNew, W_INT2l),
             Mux(bl_hasNone, mix16_rgb888(e2_1, blNew, W_INT1), e2_1))
  val e3_2 = Mux(edgeBL && eq_DI, mix16_rgb888(e3_1, blNew, W_INT2s), e3_1)

  // Stage 3: TL
  val tl_hasInt2 = edgeTL && (eq_CD || eq_BG)
  val tl_hasNone = edgeTL && !(eq_CD || eq_BG)

  val e0_3 = Mux(tl_hasInt2, mix16_rgb888(e0_2, tlNew, W_INT2l),
             Mux(tl_hasNone, mix16_rgb888(e0_2, tlNew, W_INT1), e0_2))
  val e1_3 = Mux(edgeTL && eq_CD, mix16_rgb888(e1_2, tlNew, W_INT2s), e1_2)
  val e2_3 = Mux(edgeTL && eq_BG, mix16_rgb888(e2_2, tlNew, W_INT2s), e2_2)
  val e3_3 = e3_2

  // Stage 4: TR
  val tr_hasInt2 = edgeTR && (eq_AF || eq_BI)
  val tr_hasNone = edgeTR && !(eq_AF || eq_BI)

  val e0_4 = Mux(edgeTR && eq_AF, mix16_rgb888(e0_3, trNew, W_INT2s), e0_3)
  val e1_4 = Mux(tr_hasInt2, mix16_rgb888(e1_3, trNew, W_INT2l),
             Mux(tr_hasNone, mix16_rgb888(e1_3, trNew, W_INT1), e1_3))
  val e2_4 = e2_3
  val e3_4 = Mux(edgeTR && eq_BI, mix16_rgb888(e3_3, trNew, W_INT2s), e3_3)

  // write into S5 regs (gated)
  when(!stall && v4 && s4a_valid) {
    s5_block := VecInit(Seq(e0_4, e1_4, e2_4, e3_4))
    s5_xc    := s4a_xc
    s5_yc    := s4a_yc
    s5_sof   := s4a_sof
    s5_eol   := s4a_eol
    s5_emit  := s4a_emit
  }.otherwise {
    s5_emit := false.B
  }

  // -------------------------
  // ENQUEUE (一定要給 default，避免 FIRRTL VOID / 未初始化)
  // -------------------------
  outQ.io.enq.valid := false.B
  outQ.io.enq.bits  := 0.U.asTypeOf(new Block2x2Out(pixBits))

  when(v4 && s5_emit) {
    outQ.io.enq.valid := true.B
    outQ.io.enq.bits.block := s5_block
    outQ.io.enq.bits.x     := s5_xc
    outQ.io.enq.bits.y     := s5_yc
    outQ.io.enq.bits.sof   := s5_sof
    outQ.io.enq.bits.eol   := s5_eol
  }
}
