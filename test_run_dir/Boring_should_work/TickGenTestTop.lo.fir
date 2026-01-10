FIRRTL version 1.2.0
circuit TickGenTestTop :
  module TickGen :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1> @[src/test/scala/BoringTest.scala 10:14]
    output cntReg_0 : UInt<8>

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/test/scala/BoringTest.scala 14:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/test/scala/BoringTest.scala 15:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/test/scala/BoringTest.scala 15:20]
    node _io_tick_T = eq(cntReg, UInt<4>("h9")) @[src/test/scala/BoringTest.scala 16:21]
    node _GEN_0 = mux(io_tick, UInt<1>("h0"), _cntReg_T_1) @[src/test/scala/BoringTest.scala 15:10 17:17 18:12]
    io_tick <= _io_tick_T @[src/test/scala/BoringTest.scala 16:11]
    cntReg_0 <= cntReg
    cntReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[src/test/scala/BoringTest.scala 14:{23,23}]

  module TickGenTestTop :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1> @[src/test/scala/BoringTest.scala 25:14]
    output io_counter : UInt<8> @[src/test/scala/BoringTest.scala 25:14]

    inst tickGen of TickGen @[src/test/scala/BoringTest.scala 30:23]
    node cntReg = tickGen.cntReg_0
    io_tick <= tickGen.io_tick @[src/test/scala/BoringTest.scala 31:11]
    io_counter <= cntReg
    tickGen.clock <= clock
    tickGen.reset <= reset
