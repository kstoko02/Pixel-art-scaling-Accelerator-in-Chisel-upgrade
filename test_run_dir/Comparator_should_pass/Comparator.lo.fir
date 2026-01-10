FIRRTL version 1.2.0
circuit Comparator :
  module Comparator :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8> @[src/main/scala/Comparator.scala 4:14]
    input io_b : UInt<8> @[src/main/scala/Comparator.scala 4:14]
    output io_equ : UInt<1> @[src/main/scala/Comparator.scala 4:14]
    output io_gt : UInt<1> @[src/main/scala/Comparator.scala 4:14]

    node equ = eq(io_a, io_b) @[src/main/scala/Comparator.scala 15:15]
    node gt = gt(io_a, io_b) @[src/main/scala/Comparator.scala 16:14]
    io_equ <= equ @[src/main/scala/Comparator.scala 18:10]
    io_gt <= gt @[src/main/scala/Comparator.scala 19:9]
