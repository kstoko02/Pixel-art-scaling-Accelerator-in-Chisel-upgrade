FIRRTL version 1.2.0
circuit Combinational :
  module Combinational :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<4> @[src/main/scala/Combinational.scala 4:14]
    input io_b : UInt<4> @[src/main/scala/Combinational.scala 4:14]
    input io_c : UInt<4> @[src/main/scala/Combinational.scala 4:14]
    output io_out : UInt<4> @[src/main/scala/Combinational.scala 4:14]
    output io_out2 : UInt<4> @[src/main/scala/Combinational.scala 4:14]

    node _e_T = and(io_a, io_b) @[src/main/scala/Combinational.scala 17:14]
    node e = or(_e_T, io_c) @[src/main/scala/Combinational.scala 17:19]
    node f = not(e) @[src/main/scala/Combinational.scala 21:11]
    io_out <= e @[src/main/scala/Combinational.scala 30:10]
    io_out2 <= f @[src/main/scala/Combinational.scala 31:11]
