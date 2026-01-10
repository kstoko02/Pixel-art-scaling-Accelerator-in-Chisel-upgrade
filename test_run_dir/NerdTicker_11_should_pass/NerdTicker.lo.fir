FIRRTL version 1.2.0
circuit NerdTicker :
  module NerdTicker :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1> @[src/main/scala/Ticker.scala 5:14]

    reg cntReg : SInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Ticker.scala 50:23]
    node _cntReg_T = sub(cntReg, asSInt(UInt<2>("h1"))) @[src/main/scala/Ticker.scala 53:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Ticker.scala 53:20]
    node _cntReg_T_2 = asSInt(_cntReg_T_1) @[src/main/scala/Ticker.scala 53:20]
    node _T = bits(cntReg, 7, 7) @[src/main/scala/Ticker.scala 54:14]
    node _GEN_0 = mux(_T, asSInt(UInt<8>("h9")), _cntReg_T_2) @[src/main/scala/Ticker.scala 53:10 54:19 55:12]
    node _GEN_1 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Ticker.scala 51:11 54:19 56:13]
    io_tick <= _GEN_1
    cntReg <= mux(reset, asSInt(UInt<8>("h9")), _GEN_0) @[src/main/scala/Ticker.scala 50:{23,23}]
