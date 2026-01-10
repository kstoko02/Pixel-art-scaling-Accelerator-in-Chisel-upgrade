import chisel3._
import chisel3.util._

class PixIn(pixBits: Int) extends Bundle {
  val pix = UInt(pixBits.W)
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

/** Streaming 3x3-window -> xBR-style 2x (baseline).
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

  // Output queue absorbs backpressure
  val outQ = Module(new Queue(new Block2x2Out(pixBits), outQueueDepth))
  io.out <> outQ.io.deq

  // Pipeline valids
  val v1 = RegInit(false.B)
  val v2 = RegInit(false.B)
  val v3 = RegInit(false.B)
  val v4 = RegInit(false.B)

  // Emit flag aligned to stage4 enqueue
  val s2_emit = RegInit(false.B)
  val s3_emit = RegInit(false.B)
  val s4_emit = RegInit(false.B)

  // Stage4 regs (so we can stall cleanly)
  val s4_block = Reg(Vec(4, UInt(pixBits.W)))
  val s4_xc    = Reg(UInt(16.W))
  val s4_yc    = Reg(UInt(16.W))
  val s4_sof   = Reg(Bool())
  val s4_eol   = Reg(Bool())

  // Stall only when we want to enqueue and queue is full
  val stall = v4 && s4_emit && !outQ.io.enq.ready
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
  // IMPORTANT FIX:
  // - s0_x/s0_y are "current pixel coordinate" (reg before update)
  // - after consuming a pixel, we update x/y for the NEXT pixel
  // - when sof, current pixel is (0,0) but NEXT pixel should be x=1 (unless eol)
  // -------------------------
  val x = RegInit(0.U(16.W))
  val y = RegInit(0.U(16.W))

  val s0_pix = io.in.bits.pix
  val s0_sof = io.in.bits.sof
  val s0_eol = io.in.bits.eol
  val s0_x   = x
  val s0_y   = y

  when(fireIn) {
    when(s0_sof) {
      // current pixel is (0,0); set counters for next pixel
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
    when(curIdx === 0.U) { buf0.write(s0_x, s0_pix) }
      .elsewhen(curIdx === 1.U) { buf1.write(s0_x, s0_pix) }
      .otherwise { buf2.write(s0_x, s0_pix) }
  }

  // read (disable current buffer read)
  val r0 = buf0.read(s0_x, fireIn && (curIdx =/= 0.U))
  val r1 = buf1.read(s0_x, fireIn && (curIdx =/= 1.U))
  val r2 = buf2.read(s0_x, fireIn && (curIdx =/= 2.U))

  // (S1) latch meta + indices (align SyncReadMem latency)
  val s1_pix = Reg(UInt(pixBits.W))
  val s1_sof = Reg(Bool())
  val s1_eol = Reg(Bool())
  val s1_x   = Reg(UInt(16.W))
  val s1_y   = Reg(UInt(16.W))
  val s1_prevIdx  = Reg(UInt(2.W))
  val s1_prev2Idx = Reg(UInt(2.W))

  when(!stall && fireIn) {
    s1_pix := s0_pix
    s1_sof := s0_sof
    s1_eol := s0_eol
    s1_x   := s0_x
    s1_y   := s0_y
    s1_prevIdx  := prevIdx
    s1_prev2Idx := prev2Idx
  }

  def selByIdx(idx: UInt, a0: UInt, a1: UInt, a2: UInt): UInt =
    Mux(idx === 0.U, a0, Mux(idx === 1.U, a1, a2))

  val raw_m1 = selByIdx(s1_prevIdx,  r0, r1, r2)
  val raw_m2 = selByIdx(s1_prev2Idx, r0, r1, r2)

  // top clamp
  val s1_row_m1 = Wire(UInt(pixBits.W))
  val s1_row_m2 = Wire(UInt(pixBits.W))
  s1_row_m1 := Mux(s1_y === 0.U, s1_pix, raw_m1)
  s1_row_m2 := Mux(s1_y === 0.U, s1_pix, Mux(s1_y === 1.U, s1_row_m1, raw_m2))

  // (S2) shift regs build 3x3 window (build from shifted values in same cycle)
  val sr2 = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr1 = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))
  val sr0 = RegInit(VecInit(Seq.fill(3)(0.U(pixBits.W))))

  val s2_win_reg = Reg(new Win3x3(pixBits))
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

    sr2 := next_sr2
    sr1 := next_sr1
    sr0 := next_sr0

    s2_win_reg.A := next_sr2(0); s2_win_reg.B := next_sr2(1); s2_win_reg.C := next_sr2(2)
    s2_win_reg.D := next_sr1(0); s2_win_reg.E := next_sr1(1); s2_win_reg.F := next_sr1(2)
    s2_win_reg.G := next_sr0(0); s2_win_reg.H := next_sr0(1); s2_win_reg.I := next_sr0(2)

    s2_emit := (s1_x =/= 0.U) && (s1_y =/= 0.U)
    s2_xc  := s1_x - 1.U
    s2_yc  := s1_y - 1.U
    s2_sof := s1_sof
    s2_eol := s1_eol
  }

  // (S3) register window + meta
  val s3_win = Reg(new Win3x3(pixBits))
  val s3_xc  = Reg(UInt(16.W))
  val s3_yc  = Reg(UInt(16.W))
  val s3_sof = Reg(Bool())
  val s3_eol = Reg(Bool())

  when(!stall && v2) {
    s3_win := s2_win_reg
    s3_xc  := s2_xc
    s3_yc  := s2_yc
    s3_sof := s2_sof
    s3_eol := s2_eol
    s3_emit := s2_emit
  }

  // (S4) rule -> 2x2 block
  def absDiff(a: UInt, b: UInt): UInt = Mux(a >= b, a - b, b - a)
  val thrU = thr.U(pixBits.W)

  when(!stall && v3) {
    val Bp = s3_win.B
    val Dp = s3_win.D
    val Ep = s3_win.E
    val Fp = s3_win.F
    val Hp = s3_win.H

    val bNeqH = absDiff(Bp, Hp) > thrU
    val dNeqF = absDiff(Dp, Fp) > thrU

    val e0 = Wire(UInt(pixBits.W))
    val e1 = Wire(UInt(pixBits.W))
    val e2 = Wire(UInt(pixBits.W))
    val e3 = Wire(UInt(pixBits.W))

    when(bNeqH && dNeqF) {
      e0 := Mux(absDiff(Dp, Bp) <= thrU, Dp, Ep)
      e1 := Mux(absDiff(Bp, Fp) <= thrU, Fp, Ep)
      e2 := Mux(absDiff(Dp, Hp) <= thrU, Dp, Ep)
      e3 := Mux(absDiff(Hp, Fp) <= thrU, Fp, Ep)
    }.otherwise {
      e0 := Ep; e1 := Ep; e2 := Ep; e3 := Ep
    }

    s4_block := VecInit(Seq(e0, e1, e2, e3))
    s4_xc    := s3_xc
    s4_yc    := s3_yc
    s4_sof   := s3_sof
    s4_eol   := s3_eol
    s4_emit  := s3_emit
  }

  // enqueue (aligned with v4)
  outQ.io.enq.valid := v4 && s4_emit
  outQ.io.enq.bits.block := s4_block
  outQ.io.enq.bits.x := s4_xc
  outQ.io.enq.bits.y := s4_yc
  outQ.io.enq.bits.sof := s4_sof
  outQ.io.enq.bits.eol := s4_eol
}
