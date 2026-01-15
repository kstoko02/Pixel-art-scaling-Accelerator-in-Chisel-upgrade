package pixelart

import chisel3._
import chisel3.util._

// ==== Basic I/O =====
class PixIn(pixBits: Int) extends Bundle {
  val pix = UInt(pixBits.W)   // 0xRRGGBB
  val yuv = UInt(24.W)        // [23:16]=Y, [15:8]=U, [7:0]=V
  val sof = Bool()
  val eol = Bool()
}

class Block2x2Out(pixBits: Int) extends Bundle {
  val block = Vec(4, UInt(pixBits.W)) // [0]=TL, [1]=TR, [2]=BL, [3]=BR
  val x     = UInt(16.W)              // center x (input coord)
  val y     = UInt(16.W)              // center y (input coord)
  val sof   = Bool()
  val eol   = Bool()
}

// ===== 3x3 windows ====
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

class MetaWin extends Bundle {
  val xc  = UInt(16.W)
  val yc  = UInt(16.W)
  val sof = Bool()
  val eol = Bool()
  val emit= Bool() 
}

class S2OutBundle(pixBits: Int) extends Bundle {
  val winRGB = new Win3x3(pixBits)
  val winYUV = new Win3x3Yuv
  val meta   = new MetaWin
}

class S4aOutBundle(pixBits: Int) extends Bundle {
  val winYUV = new Win3x3Yuv
  val Bp = UInt(pixBits.W); val Dp = UInt(pixBits.W)
  val Fp = UInt(pixBits.W); val Hp = UInt(pixBits.W)
  val Ep = UInt(pixBits.W)
  val dCE = UInt(16.W); val dEG = UInt(16.W); val dFH = UInt(16.W)
  val dBF = UInt(16.W); val dDH = UInt(16.W); val dEI = UInt(16.W)
  val dAE = UInt(16.W); val dCB = UInt(16.W)
  val dAB = UInt(16.W); val dDG = UInt(16.W)
  val eq_FG = Bool(); val eq_CH = Bool()
  val eq_DI = Bool(); val eq_AH = Bool()
  val eq_CD = Bool(); val eq_BG = Bool()
  val eq_AF = Bool(); val eq_BI = Bool()
  val meta = new MetaWin
}

class S5OutBundle(pixBits: Int) extends Bundle {
  val block = Vec(4, UInt(pixBits.W))
  val meta  = new MetaWin
}
