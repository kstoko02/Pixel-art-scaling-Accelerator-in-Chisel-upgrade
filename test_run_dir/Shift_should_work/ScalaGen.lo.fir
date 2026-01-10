FIRRTL version 1.2.0
circuit ScalaGen :
  module ScalaGen :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<1> @[src/main/scala/ScalaGen.scala 4:14]
    output io_dout : UInt<8> @[src/main/scala/ScalaGen.scala 4:14]

    reg regVec_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_0) @[src/main/scala/ScalaGen.scala 10:19]
    reg regVec_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_1) @[src/main/scala/ScalaGen.scala 10:19]
    reg regVec_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_2) @[src/main/scala/ScalaGen.scala 10:19]
    reg regVec_3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_3) @[src/main/scala/ScalaGen.scala 10:19]
    reg regVec_4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_4) @[src/main/scala/ScalaGen.scala 10:19]
    reg regVec_5 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_5) @[src/main/scala/ScalaGen.scala 10:19]
    reg regVec_6 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_6) @[src/main/scala/ScalaGen.scala 10:19]
    reg regVec_7 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), regVec_7) @[src/main/scala/ScalaGen.scala 10:19]
    node io_dout_lo_lo = cat(regVec_1, regVec_0) @[src/main/scala/ScalaGen.scala 18:21]
    node io_dout_lo_hi = cat(regVec_3, regVec_2) @[src/main/scala/ScalaGen.scala 18:21]
    node io_dout_lo = cat(io_dout_lo_hi, io_dout_lo_lo) @[src/main/scala/ScalaGen.scala 18:21]
    node io_dout_hi_lo = cat(regVec_5, regVec_4) @[src/main/scala/ScalaGen.scala 18:21]
    node io_dout_hi_hi = cat(regVec_7, regVec_6) @[src/main/scala/ScalaGen.scala 18:21]
    node io_dout_hi = cat(io_dout_hi_hi, io_dout_hi_lo) @[src/main/scala/ScalaGen.scala 18:21]
    node _io_dout_T = cat(io_dout_hi, io_dout_lo) @[src/main/scala/ScalaGen.scala 18:21]
    io_dout <= _io_dout_T @[src/main/scala/ScalaGen.scala 18:11]
    regVec_0 <= io_din @[src/main/scala/ScalaGen.scala 12:13]
    regVec_1 <= regVec_0 @[src/main/scala/ScalaGen.scala 14:15]
    regVec_2 <= regVec_1 @[src/main/scala/ScalaGen.scala 14:15]
    regVec_3 <= regVec_2 @[src/main/scala/ScalaGen.scala 14:15]
    regVec_4 <= regVec_3 @[src/main/scala/ScalaGen.scala 14:15]
    regVec_5 <= regVec_4 @[src/main/scala/ScalaGen.scala 14:15]
    regVec_6 <= regVec_5 @[src/main/scala/ScalaGen.scala 14:15]
    regVec_7 <= regVec_6 @[src/main/scala/ScalaGen.scala 14:15]
