FIRRTL version 1.2.0
circuit Dut :
  module Dut :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1> @[src/test/scala/Snippets.scala 8:16]
    output io_out : UInt<1> @[src/test/scala/Snippets.scala 8:16]

    node _io_out_T = eq(io_in, UInt<1>("h0")) @[src/test/scala/Snippets.scala 12:15]
    io_out <= _io_out_T @[src/test/scala/Snippets.scala 12:12]
