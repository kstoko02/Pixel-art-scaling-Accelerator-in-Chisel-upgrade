FIRRTL version 1.2.0
circuit RisingFsm :
  module RisingFsm :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<1> @[src/main/scala/RisingFsm.scala 6:14]
    output io_risingEdge : UInt<1> @[src/main/scala/RisingFsm.scala 6:14]

    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/RisingFsm.scala 18:25]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/RisingFsm.scala 24:21]
    node _T_1 = asUInt(stateReg) @[src/main/scala/RisingFsm.scala 24:21]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/RisingFsm.scala 24:21]
    node _GEN_0 = mux(io_din, UInt<1>("h1"), stateReg) @[src/main/scala/RisingFsm.scala 26:20 27:18 18:25]
    node _GEN_1 = mux(io_din, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/RisingFsm.scala 21:17 26:20 28:23]
    node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/RisingFsm.scala 24:21]
    node _T_4 = asUInt(stateReg) @[src/main/scala/RisingFsm.scala 24:21]
    node _T_5 = eq(_T_3, _T_4) @[src/main/scala/RisingFsm.scala 24:21]
    node _T_6 = eq(io_din, UInt<1>("h0")) @[src/main/scala/RisingFsm.scala 32:12]
    node _GEN_2 = mux(_T_6, UInt<1>("h0"), stateReg) @[src/main/scala/RisingFsm.scala 32:21 33:18 18:25]
    node _GEN_3 = mux(_T_5, _GEN_2, stateReg) @[src/main/scala/RisingFsm.scala 24:21 18:25]
    node _GEN_4 = mux(_T_2, _GEN_0, _GEN_3) @[src/main/scala/RisingFsm.scala 24:21]
    node _GEN_5 = mux(_T_2, _GEN_1, UInt<1>("h0")) @[src/main/scala/RisingFsm.scala 21:17 24:21]
    io_risingEdge <= _GEN_5
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_4) @[src/main/scala/RisingFsm.scala 18:{25,25}]
