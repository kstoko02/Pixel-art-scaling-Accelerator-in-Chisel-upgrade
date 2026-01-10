FIRRTL version 1.2.0
circuit FunctionalAdd :
  module FunctionalAdd :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<10> @[src/main/scala/functional.scala 5:14]
    input io_in_1 : UInt<10> @[src/main/scala/functional.scala 5:14]
    input io_in_2 : UInt<10> @[src/main/scala/functional.scala 5:14]
    input io_in_3 : UInt<10> @[src/main/scala/functional.scala 5:14]
    input io_in_4 : UInt<10> @[src/main/scala/functional.scala 5:14]
    output io_res : UInt<10> @[src/main/scala/functional.scala 5:14]

    node _sum_T = add(io_in_3, io_in_4) @[src/main/scala/functional.scala 29:30]
    node _sum_T_1 = tail(_sum_T, 1) @[src/main/scala/functional.scala 29:30]
    node _sum_T_2 = add(io_in_0, io_in_1) @[src/main/scala/functional.scala 29:30]
    node _sum_T_3 = tail(_sum_T_2, 1) @[src/main/scala/functional.scala 29:30]
    node _sum_T_4 = add(io_in_2, _sum_T_1) @[src/main/scala/functional.scala 29:30]
    node _sum_T_5 = tail(_sum_T_4, 1) @[src/main/scala/functional.scala 29:30]
    node _sum_T_6 = add(_sum_T_3, _sum_T_5) @[src/main/scala/functional.scala 29:30]
    node sum = tail(_sum_T_6, 1) @[src/main/scala/functional.scala 29:30]
    io_res <= sum @[src/main/scala/functional.scala 32:10]
