FIRRTL version 1.2.0
circuit PopulationCount :
  module PopCountFSM :
    input clock : Clock
    input reset : UInt<1>
    input io_dinValid : UInt<1> @[src/main/scala/PopulationCount.scala 6:14]
    output io_dinReady : UInt<1> @[src/main/scala/PopulationCount.scala 6:14]
    output io_popCntValid : UInt<1> @[src/main/scala/PopulationCount.scala 6:14]
    input io_popCntReady : UInt<1> @[src/main/scala/PopulationCount.scala 6:14]
    output io_load : UInt<1> @[src/main/scala/PopulationCount.scala 6:14]
    input io_done : UInt<1> @[src/main/scala/PopulationCount.scala 6:14]

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/PopulationCount.scala 19:25]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 24:20]
    node _T_1 = asUInt(stateReg) @[src/main/scala/PopulationCount.scala 24:20]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/PopulationCount.scala 24:20]
    node _GEN_0 = mux(io_dinValid, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 20:11 27:25 28:17]
    node _GEN_1 = mux(io_dinValid, UInt<1>("h1"), stateReg) @[src/main/scala/PopulationCount.scala 27:25 29:18 19:25]
    node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/PopulationCount.scala 24:20]
    node _T_4 = asUInt(stateReg) @[src/main/scala/PopulationCount.scala 24:20]
    node _T_5 = eq(_T_3, _T_4) @[src/main/scala/PopulationCount.scala 24:20]
    node _GEN_2 = mux(io_done, UInt<2>("h2"), stateReg) @[src/main/scala/PopulationCount.scala 33:21 34:18 19:25]
    node _T_6 = asUInt(UInt<2>("h2")) @[src/main/scala/PopulationCount.scala 24:20]
    node _T_7 = asUInt(stateReg) @[src/main/scala/PopulationCount.scala 24:20]
    node _T_8 = eq(_T_6, _T_7) @[src/main/scala/PopulationCount.scala 24:20]
    node _GEN_3 = mux(io_popCntReady, UInt<1>("h0"), stateReg) @[src/main/scala/PopulationCount.scala 39:28 40:18 19:25]
    node _GEN_4 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 22:18 24:20 38:22]
    node _GEN_5 = mux(_T_8, _GEN_3, stateReg) @[src/main/scala/PopulationCount.scala 24:20 19:25]
    node _GEN_6 = mux(_T_5, _GEN_2, _GEN_5) @[src/main/scala/PopulationCount.scala 24:20]
    node _GEN_7 = mux(_T_5, UInt<1>("h0"), _GEN_4) @[src/main/scala/PopulationCount.scala 22:18 24:20]
    node _GEN_8 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 21:15 24:20 26:19]
    node _GEN_9 = mux(_T_2, _GEN_0, UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 20:11 24:20]
    node _GEN_10 = mux(_T_2, _GEN_1, _GEN_6) @[src/main/scala/PopulationCount.scala 24:20]
    node _GEN_11 = mux(_T_2, UInt<1>("h0"), _GEN_7) @[src/main/scala/PopulationCount.scala 22:18 24:20]
    io_dinReady <= _GEN_8
    io_popCntValid <= _GEN_11
    io_load <= _GEN_9
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_10) @[src/main/scala/PopulationCount.scala 19:{25,25}]

  module PopCountDataPath :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8> @[src/main/scala/PopulationCount.scala 47:14]
    input io_load : UInt<1> @[src/main/scala/PopulationCount.scala 47:14]
    output io_popCnt : UInt<4> @[src/main/scala/PopulationCount.scala 47:14]
    output io_done : UInt<1> @[src/main/scala/PopulationCount.scala 47:14]

    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/PopulationCount.scala 54:24]
    reg popCntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), popCntReg) @[src/main/scala/PopulationCount.scala 55:26]
    reg counterReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counterReg) @[src/main/scala/PopulationCount.scala 56:26]
    node _dataReg_T = bits(dataReg, 7, 1) @[src/main/scala/PopulationCount.scala 58:28]
    node _dataReg_T_1 = cat(UInt<1>("h0"), _dataReg_T) @[src/main/scala/PopulationCount.scala 58:18]
    node _popCntReg_T = bits(dataReg, 0, 0) @[src/main/scala/PopulationCount.scala 59:35]
    node _popCntReg_T_1 = add(popCntReg, _popCntReg_T) @[src/main/scala/PopulationCount.scala 59:26]
    node _popCntReg_T_2 = tail(_popCntReg_T_1, 1) @[src/main/scala/PopulationCount.scala 59:26]
    node done = eq(counterReg, UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 61:25]
    node _T = eq(done, UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 62:9]
    node _counterReg_T = sub(counterReg, UInt<1>("h1")) @[src/main/scala/PopulationCount.scala 63:30]
    node _counterReg_T_1 = tail(_counterReg_T, 1) @[src/main/scala/PopulationCount.scala 63:30]
    node _GEN_0 = mux(_T, _counterReg_T_1, counterReg) @[src/main/scala/PopulationCount.scala 62:16 63:16 56:26]
    node _GEN_1 = mux(io_load, io_din, _dataReg_T_1) @[src/main/scala/PopulationCount.scala 58:11 66:17 67:13]
    node _GEN_2 = mux(io_load, UInt<1>("h0"), _popCntReg_T_2) @[src/main/scala/PopulationCount.scala 59:13 66:17 68:15]
    node _GEN_3 = mux(io_load, UInt<4>("h8"), _GEN_0) @[src/main/scala/PopulationCount.scala 66:17 69:16]
    node _T_1 = asUInt(reset) @[src/main/scala/PopulationCount.scala 73:9]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[src/main/scala/PopulationCount.scala 73:9]
    io_popCnt <= bits(popCntReg, 3, 0) @[src/main/scala/PopulationCount.scala 75:13]
    io_done <= done @[src/main/scala/PopulationCount.scala 76:11]
    dataReg <= mux(reset, UInt<8>("h0"), _GEN_1) @[src/main/scala/PopulationCount.scala 54:{24,24}]
    popCntReg <= mux(reset, UInt<8>("h0"), _GEN_2) @[src/main/scala/PopulationCount.scala 55:{26,26}]
    counterReg <= mux(reset, UInt<4>("h0"), _GEN_3) @[src/main/scala/PopulationCount.scala 56:{26,26}]
    printf(clock, and(and(UInt<1>("h1"), _T_2), UInt<1>("h1")), "%x %d\n", dataReg, popCntReg) : printf @[src/main/scala/PopulationCount.scala 73:9]

  module PopulationCount :
    input clock : Clock
    input reset : UInt<1>
    input io_dinValid : UInt<1> @[src/main/scala/PopulationCount.scala 82:14]
    output io_dinReady : UInt<1> @[src/main/scala/PopulationCount.scala 82:14]
    input io_din : UInt<8> @[src/main/scala/PopulationCount.scala 82:14]
    output io_popCntValid : UInt<1> @[src/main/scala/PopulationCount.scala 82:14]
    input io_popCntReady : UInt<1> @[src/main/scala/PopulationCount.scala 82:14]
    output io_popCnt : UInt<4> @[src/main/scala/PopulationCount.scala 82:14]

    inst fsm of PopCountFSM @[src/main/scala/PopulationCount.scala 92:19]
    inst data of PopCountDataPath @[src/main/scala/PopulationCount.scala 93:20]
    io_dinReady <= fsm.io_dinReady @[src/main/scala/PopulationCount.scala 96:15]
    io_popCntValid <= fsm.io_popCntValid @[src/main/scala/PopulationCount.scala 97:18]
    io_popCnt <= data.io_popCnt @[src/main/scala/PopulationCount.scala 101:13]
    fsm.clock <= clock
    fsm.reset <= reset
    fsm.io_dinValid <= io_dinValid @[src/main/scala/PopulationCount.scala 95:19]
    fsm.io_popCntReady <= io_popCntReady @[src/main/scala/PopulationCount.scala 98:22]
    fsm.io_done <= data.io_done @[src/main/scala/PopulationCount.scala 103:15]
    data.clock <= clock
    data.reset <= reset
    data.io_din <= io_din @[src/main/scala/PopulationCount.scala 100:15]
    data.io_load <= fsm.io_load @[src/main/scala/PopulationCount.scala 102:16]
