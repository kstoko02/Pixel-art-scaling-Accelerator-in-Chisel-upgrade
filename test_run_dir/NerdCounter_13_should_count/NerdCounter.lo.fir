FIRRTL version 1.2.0
circuit NerdCounter :
  module NerdCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8> @[src/main/scala/Counter.scala 18:14]
    output io_tick : UInt<1> @[src/main/scala/Counter.scala 18:14]

    reg cntReg : SInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Counter.scala 99:23]
    node _cntReg_T = sub(cntReg, asSInt(UInt<2>("h1"))) @[src/main/scala/Counter.scala 102:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Counter.scala 102:20]
    node _cntReg_T_2 = asSInt(_cntReg_T_1) @[src/main/scala/Counter.scala 102:20]
    node _T = bits(cntReg, 7, 7) @[src/main/scala/Counter.scala 103:14]
    node _GEN_0 = mux(_T, asSInt(UInt<8>("hb")), _cntReg_T_2) @[src/main/scala/Counter.scala 102:10 103:19 104:12]
    node _GEN_1 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Counter.scala 100:11 103:19 105:13]
    node _io_cnt_T = asUInt(cntReg) @[src/main/scala/Counter.scala 109:20]
    io_cnt <= _io_cnt_T @[src/main/scala/Counter.scala 109:10]
    io_tick <= _GEN_1
    cntReg <= mux(reset, asSInt(UInt<8>("hb")), _GEN_0) @[src/main/scala/Counter.scala 99:{23,23}]
