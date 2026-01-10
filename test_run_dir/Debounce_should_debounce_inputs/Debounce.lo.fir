FIRRTL version 1.2.0
circuit Debounce :
  module Debounce :
    input clock : Clock
    input reset : UInt<1>
    input io_btnU : UInt<1> @[src/main/scala/Debounce.scala 5:14]
    output io_led : UInt<8> @[src/main/scala/Debounce.scala 5:14]

    reg btnSync_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync_REG) @[src/main/scala/Debounce.scala 13:32]
    reg btnSync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync) @[src/main/scala/Debounce.scala 13:24]
    reg btnDebReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnDebReg) @[src/main/scala/Debounce.scala 24:22]
    reg cntReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Debounce.scala 26:23]
    node tick = eq(cntReg, UInt<7>("h63")) @[src/main/scala/Debounce.scala 27:21]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/main/scala/Debounce.scala 29:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Debounce.scala 29:20]
    node _GEN_0 = mux(tick, UInt<1>("h0"), _cntReg_T_1) @[src/main/scala/Debounce.scala 29:10 30:15 31:12]
    node _GEN_1 = mux(tick, btnSync, btnDebReg) @[src/main/scala/Debounce.scala 30:15 32:15 24:22]
    reg shiftReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[src/main/scala/Debounce.scala 37:25]
    node _shiftReg_T = bits(shiftReg, 1, 0) @[src/main/scala/Debounce.scala 40:25]
    node _shiftReg_T_1 = cat(_shiftReg_T, btnDebReg) @[src/main/scala/Debounce.scala 40:32]
    node _GEN_2 = mux(tick, _shiftReg_T_1, shiftReg) @[src/main/scala/Debounce.scala 38:15 40:14 37:25]
    node _btnClean_T = bits(shiftReg, 2, 2) @[src/main/scala/Debounce.scala 43:27]
    node _btnClean_T_1 = bits(shiftReg, 1, 1) @[src/main/scala/Debounce.scala 43:41]
    node _btnClean_T_2 = and(_btnClean_T, _btnClean_T_1) @[src/main/scala/Debounce.scala 43:31]
    node _btnClean_T_3 = bits(shiftReg, 2, 2) @[src/main/scala/Debounce.scala 43:57]
    node _btnClean_T_4 = bits(shiftReg, 0, 0) @[src/main/scala/Debounce.scala 43:71]
    node _btnClean_T_5 = and(_btnClean_T_3, _btnClean_T_4) @[src/main/scala/Debounce.scala 43:61]
    node _btnClean_T_6 = or(_btnClean_T_2, _btnClean_T_5) @[src/main/scala/Debounce.scala 43:46]
    node _btnClean_T_7 = bits(shiftReg, 1, 1) @[src/main/scala/Debounce.scala 43:87]
    node _btnClean_T_8 = bits(shiftReg, 0, 0) @[src/main/scala/Debounce.scala 43:101]
    node _btnClean_T_9 = and(_btnClean_T_7, _btnClean_T_8) @[src/main/scala/Debounce.scala 43:91]
    node btnClean = or(_btnClean_T_6, _btnClean_T_9) @[src/main/scala/Debounce.scala 43:76]
    reg risingEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), risingEdge_REG) @[src/main/scala/Debounce.scala 47:39]
    node _risingEdge_T = eq(risingEdge_REG, UInt<1>("h0")) @[src/main/scala/Debounce.scala 47:31]
    node risingEdge = and(btnClean, _risingEdge_T) @[src/main/scala/Debounce.scala 47:29]
    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[src/main/scala/Debounce.scala 51:20]
    node _reg_T = add(reg, UInt<1>("h1")) @[src/main/scala/Debounce.scala 53:16]
    node _reg_T_1 = tail(_reg_T, 1) @[src/main/scala/Debounce.scala 53:16]
    node _GEN_3 = mux(risingEdge, _reg_T_1, reg) @[src/main/scala/Debounce.scala 51:20 52:21 53:9]
    io_led <= reg @[src/main/scala/Debounce.scala 57:10]
    btnSync_REG <= io_btnU @[src/main/scala/Debounce.scala 13:32]
    btnSync <= btnSync_REG @[src/main/scala/Debounce.scala 13:24]
    btnDebReg <= _GEN_1
    cntReg <= mux(reset, UInt<32>("h0"), _GEN_0) @[src/main/scala/Debounce.scala 26:{23,23}]
    shiftReg <= mux(reset, UInt<3>("h0"), _GEN_2) @[src/main/scala/Debounce.scala 37:{25,25}]
    risingEdge_REG <= btnClean @[src/main/scala/Debounce.scala 47:39]
    reg <= mux(reset, UInt<8>("h0"), _GEN_3) @[src/main/scala/Debounce.scala 51:{20,20}]
