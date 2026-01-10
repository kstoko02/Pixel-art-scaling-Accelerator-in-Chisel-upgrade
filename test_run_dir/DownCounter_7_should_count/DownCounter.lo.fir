FIRRTL version 1.2.0
circuit DownCounter :
  module DownCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8> @[src/main/scala/Counter.scala 18:14]
    output io_tick : UInt<1> @[src/main/scala/Counter.scala 18:14]

    reg cntReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Counter.scala 60:23]
    node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/Counter.scala 62:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Counter.scala 62:20]
    node _T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/Counter.scala 63:15]
    node _GEN_0 = mux(_T, UInt<3>("h6"), _cntReg_T_1) @[src/main/scala/Counter.scala 62:10 63:24 64:12]
    node _io_tick_T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/Counter.scala 68:21]
    io_cnt <= pad(cntReg, 8) @[src/main/scala/Counter.scala 69:10]
    io_tick <= _io_tick_T @[src/main/scala/Counter.scala 68:11]
    cntReg <= mux(reset, UInt<3>("h6"), _GEN_0) @[src/main/scala/Counter.scala 60:{23,23}]
