FIRRTL version 1.2.0
circuit Assert :
  module Assert :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8> @[src/main/scala/Assert.scala 5:14]
    input io_b : UInt<8> @[src/main/scala/Assert.scala 5:14]
    output io_sum : UInt<8> @[src/main/scala/Assert.scala 5:14]

    node _io_sum_T = add(io_a, io_b) @[src/main/scala/Assert.scala 10:18]
    node _io_sum_T_1 = tail(_io_sum_T, 1) @[src/main/scala/Assert.scala 10:18]
    node _T = add(io_a, io_b) @[src/main/scala/Assert.scala 17:26]
    node _T_1 = tail(_T, 1) @[src/main/scala/Assert.scala 17:26]
    node _T_2 = eq(io_sum, _T_1) @[src/main/scala/Assert.scala 17:17]
    node _T_3 = eq(reset, UInt<1>("h0")) @[src/main/scala/Assert.scala 17:9]
    node _T_4 = eq(_T_2, UInt<1>("h0")) @[src/main/scala/Assert.scala 17:9]
    io_sum <= _io_sum_T_1 @[src/main/scala/Assert.scala 10:10]
    printf(clock, and(and(and(UInt<1>("h1"), _T_3), _T_4), UInt<1>("h1")), "Assertion failed\n    at Assert.scala:17 assert(io.sum === io.a + io.b)\n") : printf @[src/main/scala/Assert.scala 17:9]
    assert(clock, _T_2, and(and(UInt<1>("h1"), _T_3), UInt<1>("h1")), "") : assert @[src/main/scala/Assert.scala 17:9]
