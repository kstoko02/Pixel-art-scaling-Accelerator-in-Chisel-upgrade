package pixelart

import chisel3._
import chisel3.util._

class S3Latch(pixBits: Int) extends Module {
  val io = IO(new Bundle {
    val in    = Flipped(Decoupled(new S2OutBundle(pixBits)))
    val stall = Input(Bool())
    val out   = Decoupled(new S2OutBundle(pixBits))
  })

  val holdValid = RegInit(false.B)
  val holdBits  = Reg(io.out.bits.cloneType)

  io.in.ready  := !io.stall && (!holdValid || io.out.ready)
  io.out.valid := holdValid
  io.out.bits  := holdBits

  when(!io.stall) {
    when(io.in.valid && io.in.ready) {
      holdBits  := io.in.bits
      holdValid := true.B
    }.elsewhen(io.out.ready && holdValid) {
      holdValid := false.B
    }
  }
}
