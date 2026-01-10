FIRRTL version 1.2.0
circuit FunctionalMin :
  module FunctionalMin :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32> @[src/main/scala/functional.scala 75:14]
    output io_min : UInt<32> @[src/main/scala/functional.scala 75:14]
    output io_resA : UInt<32> @[src/main/scala/functional.scala 75:14]
    output io_idxA : UInt<8> @[src/main/scala/functional.scala 75:14]
    output io_resB : UInt<32> @[src/main/scala/functional.scala 75:14]
    output io_idxB : UInt<8> @[src/main/scala/functional.scala 75:14]
    output io_resC : UInt<32> @[src/main/scala/functional.scala 75:14]
    output io_idxC : UInt<8> @[src/main/scala/functional.scala 75:14]

    node vecTwo_0_v = io_in_0 @[src/main/scala/functional.scala 108:20 110:17]
    node vecTwo_0_idx = UInt<8>("h0") @[src/main/scala/functional.scala 108:20 111:19]
    node scalaVector_0_1 = UInt<8>("h0") @[src/main/scala/chisel3/util/MixedVec.scala 28:26 31:9]
    node scalaVector_0_0 = io_in_0 @[src/main/scala/chisel3/util/MixedVec.scala 28:26 31:9]
    node resFun2_qual1_0_1 = scalaVector_0_1 @[src/main/scala/functional.scala 133:{24,24}]
    node resFun2_qual1_0_0 = scalaVector_0_0 @[src/main/scala/functional.scala 133:{24,24}]
    io_min <= io_in_0 @[src/main/scala/functional.scala 140:10]
    io_resA <= vecTwo_0_v @[src/main/scala/functional.scala 142:11]
    io_idxA <= vecTwo_0_idx @[src/main/scala/functional.scala 143:11]
    io_resB <= io_in_0 @[src/main/scala/functional.scala 145:11]
    io_idxB <= UInt<8>("h0") @[src/main/scala/functional.scala 146:11]
    io_resC <= resFun2_qual1_0_0 @[src/main/scala/functional.scala 148:11]
    io_idxC <= resFun2_qual1_0_1 @[src/main/scala/functional.scala 149:11]
