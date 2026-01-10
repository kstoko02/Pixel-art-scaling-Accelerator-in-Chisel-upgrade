FIRRTL version 1.2.0
circuit DebounceFunc :
  module DebounceFunc :
    input clock : Clock
    input reset : UInt<1>
    input io_btnU : UInt<1> @[src/main/scala/Debounce.scala 61:14]
    output io_led : UInt<8> @[src/main/scala/Debounce.scala 61:14]

    reg btnSync_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync_REG) @[src/main/scala/Debounce.scala 67:38]
    reg btnSync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync) @[src/main/scala/Debounce.scala 67:30]
    reg tick_reg : UInt<7>, clock with :
      reset => (UInt<1>("h0"), tick_reg) @[src/main/scala/Debounce.scala 72:22]
    node tick = eq(tick_reg, UInt<7>("h63")) @[src/main/scala/Debounce.scala 73:20]
    node _tick_reg_T = add(tick_reg, UInt<1>("h1")) @[src/main/scala/Debounce.scala 74:31]
    node _tick_reg_T_1 = tail(_tick_reg_T, 1) @[src/main/scala/Debounce.scala 74:31]
    node _tick_reg_T_2 = mux(tick, UInt<1>("h0"), _tick_reg_T_1) @[src/main/scala/Debounce.scala 74:15]
    reg btnDeb : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnDeb) @[src/main/scala/Debounce.scala 89:19]
    node _GEN_0 = mux(tick, btnSync, btnDeb) @[src/main/scala/Debounce.scala 90:15 91:12 89:19]
    reg btnClean_reg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), btnClean_reg) @[src/main/scala/Debounce.scala 79:22]
    node _btnClean_reg_T = bits(btnClean_reg, 1, 0) @[src/main/scala/Debounce.scala 81:17]
    node _btnClean_reg_T_1 = cat(_btnClean_reg_T, btnDeb) @[src/main/scala/Debounce.scala 81:24]
    node _GEN_1 = mux(tick, _btnClean_reg_T_1, btnClean_reg) @[src/main/scala/Debounce.scala 80:14 81:11 79:22]
    node _btnClean_T = bits(btnClean_reg, 2, 2) @[src/main/scala/Debounce.scala 83:9]
    node _btnClean_T_1 = bits(btnClean_reg, 1, 1) @[src/main/scala/Debounce.scala 83:18]
    node _btnClean_T_2 = and(_btnClean_T, _btnClean_T_1) @[src/main/scala/Debounce.scala 83:13]
    node _btnClean_T_3 = bits(btnClean_reg, 2, 2) @[src/main/scala/Debounce.scala 83:29]
    node _btnClean_T_4 = bits(btnClean_reg, 0, 0) @[src/main/scala/Debounce.scala 83:38]
    node _btnClean_T_5 = and(_btnClean_T_3, _btnClean_T_4) @[src/main/scala/Debounce.scala 83:33]
    node _btnClean_T_6 = or(_btnClean_T_2, _btnClean_T_5) @[src/main/scala/Debounce.scala 83:23]
    node _btnClean_T_7 = bits(btnClean_reg, 1, 1) @[src/main/scala/Debounce.scala 83:49]
    node _btnClean_T_8 = bits(btnClean_reg, 0, 0) @[src/main/scala/Debounce.scala 83:58]
    node _btnClean_T_9 = and(_btnClean_T_7, _btnClean_T_8) @[src/main/scala/Debounce.scala 83:53]
    node btnClean = or(_btnClean_T_6, _btnClean_T_9) @[src/main/scala/Debounce.scala 83:43]
    reg risingEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), risingEdge_REG) @[src/main/scala/Debounce.scala 69:37]
    node _risingEdge_T = eq(risingEdge_REG, UInt<1>("h0")) @[src/main/scala/Debounce.scala 69:29]
    node risingEdge = and(btnClean, _risingEdge_T) @[src/main/scala/Debounce.scala 69:27]
    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[src/main/scala/Debounce.scala 99:20]
    node _reg_T = add(reg, UInt<1>("h1")) @[src/main/scala/Debounce.scala 101:16]
    node _reg_T_1 = tail(_reg_T, 1) @[src/main/scala/Debounce.scala 101:16]
    node _GEN_2 = mux(risingEdge, _reg_T_1, reg) @[src/main/scala/Debounce.scala 100:21 101:9 99:20]
    io_led <= reg @[src/main/scala/Debounce.scala 104:10]
    btnSync_REG <= io_btnU @[src/main/scala/Debounce.scala 67:38]
    btnSync <= btnSync_REG @[src/main/scala/Debounce.scala 67:30]
    tick_reg <= mux(reset, UInt<7>("h0"), _tick_reg_T_2) @[src/main/scala/Debounce.scala 72:{22,22} 74:9]
    btnDeb <= _GEN_0
    btnClean_reg <= mux(reset, UInt<3>("h0"), _GEN_1) @[src/main/scala/Debounce.scala 79:{22,22}]
    risingEdge_REG <= btnClean @[src/main/scala/Debounce.scala 69:37]
    reg <= mux(reset, UInt<8>("h0"), _GEN_2) @[src/main/scala/Debounce.scala 99:{20,20}]
