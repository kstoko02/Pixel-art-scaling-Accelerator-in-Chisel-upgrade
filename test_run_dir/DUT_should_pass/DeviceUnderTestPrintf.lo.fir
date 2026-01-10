FIRRTL version 1.2.0
circuit DeviceUnderTestPrintf :
  module DeviceUnderTestPrintf :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2> @[src/test/scala/testing.scala 23:14]
    input io_b : UInt<2> @[src/test/scala/testing.scala 23:14]
    output io_out : UInt<2> @[src/test/scala/testing.scala 23:14]

    node _io_out_T = and(io_a, io_b) @[src/test/scala/testing.scala 29:18]
    node _T = eq(reset, UInt<1>("h0")) @[src/test/scala/testing.scala 30:9]
    io_out <= _io_out_T @[src/test/scala/testing.scala 29:10]
    printf(clock, and(and(UInt<1>("h1"), _T), UInt<1>("h1")), "dut: %d %d %d\n", io_a, io_b, io_out) : printf @[src/test/scala/testing.scala 30:9]
