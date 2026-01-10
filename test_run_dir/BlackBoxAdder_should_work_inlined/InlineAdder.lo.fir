FIRRTL version 1.2.0
circuit InlineAdder :
  extmodule InlineBlackBoxAdder :
    input a : UInt<32>
    input b : UInt<32>
    input cin : UInt<1>
    output c : UInt<32>
    output cout : UInt<1>
    defname = InlineBlackBoxAdder

  module InlineAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<32> @[src/test/scala/BlackBoxesTest.scala 12:16]
    input io_b : UInt<32> @[src/test/scala/BlackBoxesTest.scala 12:16]
    input io_cin : UInt<1> @[src/test/scala/BlackBoxesTest.scala 12:16]
    output io_c : UInt<32> @[src/test/scala/BlackBoxesTest.scala 12:16]
    output io_cout : UInt<1> @[src/test/scala/BlackBoxesTest.scala 12:16]

    inst adder of InlineBlackBoxAdder @[src/test/scala/BlackBoxesTest.scala 49:25]
    io_c <= adder.c @[src/test/scala/BlackBoxesTest.scala 50:10]
    io_cout <= adder.cout @[src/test/scala/BlackBoxesTest.scala 50:10]
    adder.a <= io_a @[src/test/scala/BlackBoxesTest.scala 50:10]
    adder.b <= io_b @[src/test/scala/BlackBoxesTest.scala 50:10]
    adder.cin <= io_cin @[src/test/scala/BlackBoxesTest.scala 50:10]
