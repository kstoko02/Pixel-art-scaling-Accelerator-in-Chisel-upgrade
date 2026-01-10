FIRRTL version 1.2.0
circuit UpTicker :
  module UpTicker :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1> @[src/main/scala/Ticker.scala 5:14]

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Ticker.scala 16:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/main/scala/Ticker.scala 18:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Ticker.scala 18:20]
    node tick = eq(cntReg, UInt<3>("h4")) @[src/main/scala/Ticker.scala 19:21]
    node _GEN_0 = mux(tick, UInt<1>("h0"), _cntReg_T_1) @[src/main/scala/Ticker.scala 18:10 20:14 21:12]
    io_tick <= tick @[src/main/scala/Ticker.scala 24:11]
    cntReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[src/main/scala/Ticker.scala 16:{23,23}]
