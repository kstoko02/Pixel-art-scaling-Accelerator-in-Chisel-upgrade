FIRRTL version 1.2.0
circuit AssumeTest :
  module AssumeTest :
    input clock : Clock
    input reset : UInt<1>
    input in : UInt<8> @[src/test/scala/FormalTest.scala 38:14]
    output out : UInt<8> @[src/test/scala/FormalTest.scala 39:15]

    node _out_T = add(in, UInt<1>("h1")) @[src/test/scala/FormalTest.scala 40:13]
    node _out_T_1 = tail(_out_T, 1) @[src/test/scala/FormalTest.scala 40:13]
    node _T = gt(in, UInt<2>("h3")) @[src/test/scala/FormalTest.scala 41:13]
    node _T_1 = lt(in, UInt<8>("hff")) @[src/test/scala/FormalTest.scala 41:25]
    node _T_2 = and(_T, _T_1) @[src/test/scala/FormalTest.scala 41:19]
    node _T_3 = eq(reset, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 41:9]
    node _T_4 = eq(_T_2, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 41:9]
    node _T_5 = gt(out, UInt<3>("h4")) @[src/test/scala/FormalTest.scala 42:14]
    node _T_6 = eq(reset, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 42:9]
    node _T_7 = eq(_T_5, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 42:9]
    node _T_8 = leq(out, UInt<8>("hff")) @[src/test/scala/FormalTest.scala 43:14]
    node _T_9 = eq(reset, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 43:9]
    node _T_10 = eq(_T_8, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 43:9]
    out <= _out_T_1 @[src/test/scala/FormalTest.scala 40:7]
    printf(clock, and(and(and(UInt<1>("h1"), _T_3), _T_4), UInt<1>("h1")), "Assumption failed\n    at FormalTest.scala:41 assume(in > 3.U && in < 255.U)\n") : printf @[src/test/scala/FormalTest.scala 41:9]
    assume(clock, _T_2, and(and(UInt<1>("h1"), _T_3), UInt<1>("h1")), "") : assume @[src/test/scala/FormalTest.scala 41:9]
    printf(clock, and(and(and(UInt<1>("h1"), _T_6), _T_7), UInt<1>("h1")), "Assertion failed\n    at FormalTest.scala:42 assert(out > 4.U)\n") : printf_1 @[src/test/scala/FormalTest.scala 42:9]
    assert(clock, _T_5, and(and(UInt<1>("h1"), _T_6), UInt<1>("h1")), "") : assert @[src/test/scala/FormalTest.scala 42:9]
    printf(clock, and(and(and(UInt<1>("h1"), _T_9), _T_10), UInt<1>("h1")), "Assertion failed\n    at FormalTest.scala:43 assert(out <= 255.U)\n") : printf_2 @[src/test/scala/FormalTest.scala 43:9]
    assert(clock, _T_8, and(and(UInt<1>("h1"), _T_9), UInt<1>("h1")), "") : assert_1 @[src/test/scala/FormalTest.scala 43:9]
