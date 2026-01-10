FIRRTL version 1.2.0
circuit WhenCounter :
  module WhenCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8> @[src/main/scala/Counter.scala 18:14]
    output io_tick : UInt<1> @[src/main/scala/Counter.scala 18:14]

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Counter.scala 29:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/main/scala/Counter.scala 31:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Counter.scala 31:20]
    node _T = eq(cntReg, UInt<3>("h6")) @[src/main/scala/Counter.scala 32:15]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _cntReg_T_1) @[src/main/scala/Counter.scala 31:10 32:22 33:12]
    node _io_tick_T = eq(cntReg, UInt<3>("h6")) @[src/main/scala/Counter.scala 37:21]
    io_cnt <= cntReg @[src/main/scala/Counter.scala 38:10]
    io_tick <= _io_tick_T @[src/main/scala/Counter.scala 37:11]
    cntReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[src/main/scala/Counter.scala 29:{23,23}]
