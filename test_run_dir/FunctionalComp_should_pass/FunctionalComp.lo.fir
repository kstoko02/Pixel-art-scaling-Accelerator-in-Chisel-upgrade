FIRRTL version 1.2.0
circuit FunctionalComp :
  module FunctionalComp :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8> @[src/main/scala/functional.scala 36:14]
    input io_b : UInt<8> @[src/main/scala/functional.scala 36:14]
    output io_equ : UInt<8> @[src/main/scala/functional.scala 36:14]
    output io_gt : UInt<8> @[src/main/scala/functional.scala 36:14]

    node equ = eq(io_a, io_b) @[src/main/scala/functional.scala 48:17]
    node gt = gt(io_a, io_b) @[src/main/scala/functional.scala 49:16]
    node equ_1 = eq(io_a, io_b) @[src/main/scala/functional.scala 48:17]
    node gt_1 = gt(io_a, io_b) @[src/main/scala/functional.scala 49:16]
    io_equ <= pad(equ_1, 8) @[src/main/scala/functional.scala 67:10]
    io_gt <= pad(gt_1, 8) @[src/main/scala/functional.scala 68:9]
