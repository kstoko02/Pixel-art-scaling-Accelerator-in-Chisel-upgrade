FIRRTL version 1.2.0
circuit DeviceUnderTest :
  module DeviceUnderTest :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2> @[src/test/scala/testing.scala 9:14]
    input io_b : UInt<2> @[src/test/scala/testing.scala 9:14]
    output io_out : UInt<2> @[src/test/scala/testing.scala 9:14]
    output io_equ : UInt<1> @[src/test/scala/testing.scala 9:14]

    node _io_out_T = and(io_a, io_b) @[src/test/scala/testing.scala 16:18]
    node _io_equ_T = eq(io_a, io_b) @[src/test/scala/testing.scala 17:18]
    io_out <= _io_out_T @[src/test/scala/testing.scala 16:10]
    io_equ <= _io_equ_T @[src/test/scala/testing.scala 17:10]
