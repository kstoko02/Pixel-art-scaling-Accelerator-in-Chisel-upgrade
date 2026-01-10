FIRRTL version 1.2.0
circuit SimpleFsm :
  module SimpleFsm :
    input clock : Clock
    input reset : UInt<1>
    input io_badEvent : UInt<1> @[src/main/scala/SimpleFsm.scala 6:14]
    input io_clear : UInt<1> @[src/main/scala/SimpleFsm.scala 6:14]
    output io_ringBell : UInt<1> @[src/main/scala/SimpleFsm.scala 6:14]

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/SimpleFsm.scala 18:25]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/SimpleFsm.scala 21:21]
    node _T_1 = asUInt(stateReg) @[src/main/scala/SimpleFsm.scala 21:21]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/SimpleFsm.scala 21:21]
    node _GEN_0 = mux(io_badEvent, UInt<1>("h1"), stateReg) @[src/main/scala/SimpleFsm.scala 23:25 24:18 18:25]
    node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/SimpleFsm.scala 21:21]
    node _T_4 = asUInt(stateReg) @[src/main/scala/SimpleFsm.scala 21:21]
    node _T_5 = eq(_T_3, _T_4) @[src/main/scala/SimpleFsm.scala 21:21]
    node _GEN_1 = mux(io_clear, UInt<1>("h0"), stateReg) @[src/main/scala/SimpleFsm.scala 30:29 31:18 18:25]
    node _GEN_2 = mux(io_badEvent, UInt<2>("h2"), _GEN_1) @[src/main/scala/SimpleFsm.scala 28:25 29:18]
    node _T_6 = asUInt(UInt<2>("h2")) @[src/main/scala/SimpleFsm.scala 21:21]
    node _T_7 = asUInt(stateReg) @[src/main/scala/SimpleFsm.scala 21:21]
    node _T_8 = eq(_T_6, _T_7) @[src/main/scala/SimpleFsm.scala 21:21]
    node _GEN_3 = mux(_T_8, _GEN_1, stateReg) @[src/main/scala/SimpleFsm.scala 21:21 18:25]
    node _GEN_4 = mux(_T_5, _GEN_2, _GEN_3) @[src/main/scala/SimpleFsm.scala 21:21]
    node _GEN_5 = mux(_T_2, _GEN_0, _GEN_4) @[src/main/scala/SimpleFsm.scala 21:21]
    node _io_ringBell_T = eq(stateReg, UInt<2>("h2")) @[src/main/scala/SimpleFsm.scala 41:27]
    io_ringBell <= _io_ringBell_T @[src/main/scala/SimpleFsm.scala 41:15]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_5) @[src/main/scala/SimpleFsm.scala 18:{25,25}]
