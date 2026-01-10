FIRRTL version 1.2.0
circuit Arbiter3Direct :
  module Arbiter3Direct :
    input clock : Clock
    input reset : UInt<1>
    input io_request : UInt<3> @[src/main/scala/arbiter.scala 28:14]
    output io_grant : UInt<3> @[src/main/scala/arbiter.scala 28:14]

    node _T = eq(UInt<1>("h0"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _T_1 = eq(UInt<1>("h1"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _T_2 = eq(UInt<2>("h2"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _T_3 = eq(UInt<2>("h3"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _T_4 = eq(UInt<3>("h4"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _T_5 = eq(UInt<3>("h5"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _T_6 = eq(UInt<3>("h6"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _T_7 = eq(UInt<3>("h7"), io_request) @[src/main/scala/arbiter.scala 37:20]
    node _GEN_0 = mux(_T_7, UInt<1>("h1"), UInt<3>("h0")) @[src/main/scala/arbiter.scala 37:20 36:26 45:27]
    node _GEN_1 = mux(_T_6, UInt<2>("h2"), _GEN_0) @[src/main/scala/arbiter.scala 37:20 44:27]
    node _GEN_2 = mux(_T_5, UInt<1>("h1"), _GEN_1) @[src/main/scala/arbiter.scala 37:20 43:27]
    node _GEN_3 = mux(_T_4, UInt<3>("h4"), _GEN_2) @[src/main/scala/arbiter.scala 37:20 42:27]
    node _GEN_4 = mux(_T_3, UInt<1>("h1"), _GEN_3) @[src/main/scala/arbiter.scala 37:20 41:27]
    node _GEN_5 = mux(_T_2, UInt<2>("h2"), _GEN_4) @[src/main/scala/arbiter.scala 37:20 40:27]
    node _GEN_6 = mux(_T_1, UInt<1>("h1"), _GEN_5) @[src/main/scala/arbiter.scala 37:20 39:27]
    node _GEN_7 = mux(_T, UInt<1>("h0"), _GEN_6) @[src/main/scala/arbiter.scala 37:20 38:27]
    node grant = _GEN_7 @[src/main/scala/arbiter.scala 36:26]
    io_grant <= grant @[src/main/scala/arbiter.scala 48:12]
