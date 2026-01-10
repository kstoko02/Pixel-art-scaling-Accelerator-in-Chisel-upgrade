FIRRTL version 1.2.0
circuit DownTicker :
  module DownTicker :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1> @[src/main/scala/Ticker.scala 5:14]

    reg cntReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Ticker.scala 33:23]
    node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/Ticker.scala 35:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Ticker.scala 35:20]
    node _T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/Ticker.scala 36:15]
    node _GEN_0 = mux(_T, UInt<3>("h6"), _cntReg_T_1) @[src/main/scala/Ticker.scala 35:10 36:24 37:12]
    node _io_tick_T = eq(cntReg, UInt<3>("h6")) @[src/main/scala/Ticker.scala 40:21]
    io_tick <= _io_tick_T @[src/main/scala/Ticker.scala 40:11]
    cntReg <= mux(reset, UInt<3>("h6"), _GEN_0) @[src/main/scala/Ticker.scala 33:{23,23}]
