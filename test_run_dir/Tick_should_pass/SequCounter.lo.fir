FIRRTL version 1.2.0
circuit SequCounter :
  module SequCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<4> @[src/main/scala/Sequential.scala 81:14]
    input io_event : UInt<1> @[src/main/scala/Sequential.scala 81:14]
    output io_eventCnt : UInt<4> @[src/main/scala/Sequential.scala 81:14]
    output io_tick : UInt<1> @[src/main/scala/Sequential.scala 81:14]
    output io_lowCnt : UInt<4> @[src/main/scala/Sequential.scala 81:14]

    reg cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Sequential.scala 91:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/main/scala/Sequential.scala 93:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/Sequential.scala 93:20]
    reg cntEventsReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntEventsReg) @[src/main/scala/Sequential.scala 99:29]
    node _cntEventsReg_T = add(cntEventsReg, UInt<1>("h1")) @[src/main/scala/Sequential.scala 101:34]
    node _cntEventsReg_T_1 = tail(_cntEventsReg_T, 1) @[src/main/scala/Sequential.scala 101:34]
    node _GEN_0 = mux(io_event, _cntEventsReg_T_1, cntEventsReg) @[src/main/scala/Sequential.scala 100:15 101:18 99:29]
    reg tickCounterReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), tickCounterReg) @[src/main/scala/Sequential.scala 108:31]
    node tick = eq(tickCounterReg, UInt<3>("h4")) @[src/main/scala/Sequential.scala 109:29]
    node _tickCounterReg_T = add(tickCounterReg, UInt<1>("h1")) @[src/main/scala/Sequential.scala 111:36]
    node _tickCounterReg_T_1 = tail(_tickCounterReg_T, 1) @[src/main/scala/Sequential.scala 111:36]
    node _GEN_1 = mux(tick, UInt<1>("h0"), _tickCounterReg_T_1) @[src/main/scala/Sequential.scala 112:15 111:18 113:20]
    reg lowFrequCntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), lowFrequCntReg) @[src/main/scala/Sequential.scala 118:31]
    node _lowFrequCntReg_T = add(lowFrequCntReg, UInt<1>("h1")) @[src/main/scala/Sequential.scala 120:38]
    node _lowFrequCntReg_T_1 = tail(_lowFrequCntReg_T, 1) @[src/main/scala/Sequential.scala 120:38]
    node _GEN_2 = mux(tick, _lowFrequCntReg_T_1, lowFrequCntReg) @[src/main/scala/Sequential.scala 119:15 120:20 118:31]
    io_out <= cntReg @[src/main/scala/Sequential.scala 95:10]
    io_eventCnt <= cntEventsReg @[src/main/scala/Sequential.scala 104:15]
    io_tick <= tick @[src/main/scala/Sequential.scala 124:11]
    io_lowCnt <= lowFrequCntReg @[src/main/scala/Sequential.scala 125:13]
    cntReg <= mux(reset, UInt<4>("h0"), _cntReg_T_1) @[src/main/scala/Sequential.scala 91:{23,23} 93:10]
    cntEventsReg <= mux(reset, UInt<4>("h0"), _GEN_0) @[src/main/scala/Sequential.scala 99:{29,29}]
    tickCounterReg <= mux(reset, UInt<32>("h0"), _GEN_1) @[src/main/scala/Sequential.scala 108:{31,31}]
    lowFrequCntReg <= mux(reset, UInt<4>("h0"), _GEN_2) @[src/main/scala/Sequential.scala 118:{31,31}]
