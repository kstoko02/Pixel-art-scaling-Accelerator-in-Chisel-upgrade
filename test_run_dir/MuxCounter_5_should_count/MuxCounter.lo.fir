FIRRTL version 1.2.0
circuit MuxCounter :
  module MuxCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8> @[src/main/scala/Counter.scala 18:14]
    output io_tick : UInt<1> @[src/main/scala/Counter.scala 18:14]

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Counter.scala 46:23]
    node _cntReg_T = eq(cntReg, UInt<3>("h4")) @[src/main/scala/Counter.scala 48:24]
    node _cntReg_T_1 = add(cntReg, UInt<1>("h1")) @[src/main/scala/Counter.scala 48:43]
    node _cntReg_T_2 = tail(_cntReg_T_1, 1) @[src/main/scala/Counter.scala 48:43]
    node _cntReg_T_3 = mux(_cntReg_T, UInt<1>("h0"), _cntReg_T_2) @[src/main/scala/Counter.scala 48:16]
    node _io_tick_T = eq(cntReg, UInt<3>("h4")) @[src/main/scala/Counter.scala 51:21]
    io_cnt <= cntReg @[src/main/scala/Counter.scala 52:10]
    io_tick <= _io_tick_T @[src/main/scala/Counter.scala 51:11]
    cntReg <= mux(reset, UInt<8>("h0"), _cntReg_T_3) @[src/main/scala/Counter.scala 46:{23,23} 48:10]
