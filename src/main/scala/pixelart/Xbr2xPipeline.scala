package pixelart

import chisel3._
import chisel3.util._

class Xbr2xPipeline(
  pixBits: Int,
  imgW: Int,
  imgH: Int,
  thr: Int = 0,
  outQueueDepth: Int = 16
) extends Module {
 
  require(imgW >= 2, "imgW must be >= 2")
  require(imgH >= 2, "imgH must be >= 2") 

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

  // ---------------- Output Queue ----------------
  val outQ = Module(new Queue(new Block2x2Out(pixBits), outQueueDepth))
  io.out <> outQ.io.deq

  // ---------------- Pipeline valid flags ----------------
  val v1 = RegInit(false.B)
  val v2 = RegInit(false.B)
  val v3 = RegInit(false.B)
  val v4 = RegInit(false.B) // default is 0

  val willEnq = WireDefault(false.B)  // does S5 have any effective output
  val stall   = v4 && willEnq && !outQ.io.enq.ready

  io.in.ready := !stall
  val fireIn  = io.in.valid && io.in.ready  // new data in

  when(!stall) {
    v1 := fireIn; v2 := v1; v3 := v2; v4 := v3
  }

  // ---------------- S0: x/y counter from sof/eol ----------------
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
      x := Mux(s0_eol, 0.U, 1.U); y := 0.U  // Calculate the next coordinate
    }.elsewhen(s0_eol) {
      x := 0.U; y := y + 1.U
    }.otherwise {
      x := x + 1.U
    }
  }

  // ---------------- 3-row ring line buffers ----------------
  val buf0  = SyncReadMem(imgW, UInt(pixBits.W))
  val buf1  = SyncReadMem(imgW, UInt(pixBits.W))
  val buf2  = SyncReadMem(imgW, UInt(pixBits.W))
  val bufY0 = SyncReadMem(imgW, UInt(24.W))
  val bufY1 = SyncReadMem(imgW, UInt(24.W))
  val bufY2 = SyncReadMem(imgW, UInt(24.W))

  val curIdx   = RegInit(0.U(2.W))
  val prevIdx  = RegInit(1.U(2.W))
  val prev2Idx = RegInit(2.U(2.W))

  when(fireIn && s0_sof) {
    curIdx := 0.U; prevIdx := 1.U; prev2Idx := 2.U
  }.elsewhen(fireIn && s0_eol) {
    val nPrev2 = prevIdx; val nPrev = curIdx; val nCur = prev2Idx
    prev2Idx := nPrev2; prevIdx := nPrev; curIdx := nCur
  }

  when(fireIn) {
    switch(curIdx) {
      is(0.U) { buf0.write(s0_x, s0_pix); bufY0.write(s0_x, s0_yuv) }
      is(1.U) { buf1.write(s0_x, s0_pix); bufY1.write(s0_x, s0_yuv) }
      is(2.U) { buf2.write(s0_x, s0_pix); bufY2.write(s0_x, s0_yuv) }
    }
  }

  val r0  = buf0.read(s0_x, fireIn && (curIdx =/= 0.U))
  val r1  = buf1.read(s0_x, fireIn && (curIdx =/= 1.U))
  val r2  = buf2.read(s0_x, fireIn && (curIdx =/= 2.U))
  val ry0 = bufY0.read(s0_x, fireIn && (curIdx =/= 0.U))
  val ry1 = bufY1.read(s0_x, fireIn && (curIdx =/= 1.U))
  val ry2 = bufY2.read(s0_x, fireIn && (curIdx =/= 2.U))

  val s1_pix = Reg(UInt(pixBits.W))
  val s1_yuv = Reg(UInt(24.W))
  val s1_sof = Reg(Bool())
  val s1_eol = Reg(Bool())
  val s1_x   = Reg(UInt(16.W))
  val s1_y   = Reg(UInt(16.W))
  val s1_prevIdx  = Reg(UInt(2.W))
  val s1_prev2Idx = Reg(UInt(2.W))

  when(!stall && fireIn) {
    s1_pix := s0_pix; s1_yuv := s0_yuv
    s1_sof := s0_sof; s1_eol := s0_eol
    s1_x   := s0_x;   s1_y   := s0_y
    s1_prevIdx := prevIdx; s1_prev2Idx := prev2Idx
  }

  def selByIdx(idx: UInt, a0: UInt, a1: UInt, a2: UInt): UInt =
    Mux(idx === 0.U, a0, Mux(idx === 1.U, a1, a2))

  val raw_m1  = selByIdx(s1_prevIdx,  r0,  r1,  r2)
  val raw_m2  = selByIdx(s1_prev2Idx, r0,  r1,  r2)
  val rawy_m1 = selByIdx(s1_prevIdx,  ry0, ry1, ry2)
  val rawy_m2 = selByIdx(s1_prev2Idx, ry0, ry1, ry2)

  val s1_row_m1_rgb = Wire(UInt(pixBits.W))
  val s1_row_m2_rgb = Wire(UInt(pixBits.W))
  s1_row_m1_rgb := Mux(s1_y === 0.U, s1_pix, raw_m1)
  s1_row_m2_rgb := Mux(s1_y === 0.U, s1_pix, Mux(s1_y === 1.U, s1_row_m1_rgb, raw_m2))
  val s1_row_m1_yuv = Wire(UInt(24.W))
  val s1_row_m2_yuv = Wire(UInt(24.W))
  s1_row_m1_yuv := Mux(s1_y === 0.U, s1_yuv, rawy_m1)
  s1_row_m2_yuv := Mux(s1_y === 0.U, s1_yuv, Mux(s1_y === 1.U, s1_row_m1_yuv, rawy_m2))

  // ---------------- S2 / S3 / S4a / S5  ----------------
  val s2 = Module(new S2Window(pixBits, imgW, imgH))
  s2.io.in_pix       := s1_pix
  s2.io.in_yuv       := s1_yuv
  s2.io.row_m1_rgb   := s1_row_m1_rgb
  s2.io.row_m2_rgb   := s1_row_m2_rgb
  s2.io.row_m1_yuv   := s1_row_m1_yuv
  s2.io.row_m2_yuv   := s1_row_m2_yuv
  s2.io.s1_x         := s1_x
  s2.io.s1_y         := s1_y
  s2.io.s1_sof       := s1_sof
  s2.io.s1_eol       := s1_eol
  s2.io.v1           := v1
  s2.io.stall        := stall

  val s3 = Module(new S3Latch(pixBits))
  s3.io.in    <> s2.io.out
  s3.io.stall := stall

  val s4a = Module(new S4aPrecompute(pixBits))
  s4a.io.in    <> s3.io.out
  s4a.io.stall := stall

  val s5  = Module(new S5Blend(pixBits))
  s5.io.in <> s4a.io.out

  dbg.valid := s3.io.out.valid
  dbg.A := s3.io.out.bits.winRGB.A; dbg.B := s3.io.out.bits.winRGB.B; dbg.C := s3.io.out.bits.winRGB.C
  dbg.D := s3.io.out.bits.winRGB.D; dbg.E := s3.io.out.bits.winRGB.E; dbg.F := s3.io.out.bits.winRGB.F
  dbg.G := s3.io.out.bits.winRGB.G; dbg.H := s3.io.out.bits.winRGB.H; dbg.I := s3.io.out.bits.winRGB.I
  dbg.xc := s3.io.out.bits.meta.xc; dbg.yc := s3.io.out.bits.meta.yc


  willEnq := s5.io.out.valid
  s5.io.out.ready := outQ.io.enq.ready

  outQ.io.enq.valid := s5.io.out.valid
  outQ.io.enq.bits  := 0.U.asTypeOf(new Block2x2Out(pixBits))

  when(s5.io.out.valid) {
    outQ.io.enq.bits.block := s5.io.out.bits.block
    outQ.io.enq.bits.x     := s5.io.out.bits.meta.xc
    outQ.io.enq.bits.y     := s5.io.out.bits.meta.yc
    outQ.io.enq.bits.sof   := s5.io.out.bits.meta.sof
    outQ.io.enq.bits.eol   := s5.io.out.bits.meta.eol
  }
}
