FIRRTL version 1.2.0
circuit PastTest :
  module PastTest :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<8> @[src/test/scala/FormalTest.scala 28:14]

    reg _cycles : UInt<2>, clock with :
      reset => (UInt<1>("h0"), _cycles)
    node _cycles_active = lt(_cycles, UInt<2>("h2"))
    _cycles <= mux(reset, UInt<2>("h0"), mux(_cycles_active, bits(add(_cycles, UInt<2>("h1")), 1, 0), _cycles))
    node _after_2 = not(_cycles_active)
    reg reg_REG : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg_REG) @[src/test/scala/FormalTest.scala 33:28]
    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[src/test/scala/FormalTest.scala 33:20]
    reg out : UInt<8>, clock with :
      reset => (UInt<1>("h0"), out) @[src/main/scala/chiseltest/formal/past.scala 47:23]
    reg out_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), out_1) @[src/main/scala/chiseltest/formal/past.scala 47:23]
    node _WIRE_1 = out_1 @[src/main/scala/chiseltest/formal/past.scala 42:{15,15}]
    node _T = eq(reg, _WIRE_1) @[src/test/scala/FormalTest.scala 34:14]
    node _T_1 = eq(reset, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 34:9]
    node _T_2 = eq(_T, UInt<1>("h0")) @[src/test/scala/FormalTest.scala 34:9]
    node _WIRE = out @[src/main/scala/chiseltest/formal/past.scala 42:{15,15}]
    reg_REG <= io_in @[src/test/scala/FormalTest.scala 33:28]
    reg <= reg_REG @[src/test/scala/FormalTest.scala 33:20]
    out <= io_in @[src/main/scala/chiseltest/formal/past.scala 47:23]
    out_1 <= _WIRE @[src/main/scala/chiseltest/formal/past.scala 47:23]
    printf(clock, and(and(and(UInt<1>("h1"), _T_1), _T_2), UInt<1>("h1")), "Assertion failed\n    at FormalTest.scala:34 assert(reg === past((past(io.in))))\n") : printf @[src/test/scala/FormalTest.scala 34:9]
    assert(clock, _T, and(and(and(UInt<1>("h1"), _T_1), UInt<1>("h1")), _after_2), "") : assert @[src/test/scala/FormalTest.scala 34:9]
