FIRRTL version 1.2.0
circuit DrawMux6 :
  module DrawMux6 :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<3> @[src/main/scala/drawing.scala 31:14]
    output io_dout : UInt<8> @[src/main/scala/drawing.scala 31:14]

    node _T = eq(UInt<1>("h0"), io_sel) @[src/main/scala/drawing.scala 41:15]
    node _T_1 = eq(UInt<1>("h1"), io_sel) @[src/main/scala/drawing.scala 41:15]
    node _T_2 = eq(UInt<2>("h2"), io_sel) @[src/main/scala/drawing.scala 41:15]
    node _T_3 = eq(UInt<2>("h3"), io_sel) @[src/main/scala/drawing.scala 41:15]
    node _T_4 = eq(UInt<3>("h4"), io_sel) @[src/main/scala/drawing.scala 41:15]
    node _T_5 = eq(UInt<3>("h5"), io_sel) @[src/main/scala/drawing.scala 41:15]
    node _GEN_0 = mux(_T_5, UInt<6>("h37"), UInt<1>("h0")) @[src/main/scala/drawing.scala 41:15 47:20 39:25]
    node _GEN_1 = mux(_T_4, UInt<6>("h2c"), _GEN_0) @[src/main/scala/drawing.scala 41:15 46:20]
    node _GEN_2 = mux(_T_3, UInt<6>("h21"), _GEN_1) @[src/main/scala/drawing.scala 41:15 45:20]
    node _GEN_3 = mux(_T_2, UInt<5>("h16"), _GEN_2) @[src/main/scala/drawing.scala 41:15 44:20]
    node _GEN_4 = mux(_T_1, UInt<4>("hb"), _GEN_3) @[src/main/scala/drawing.scala 41:15 43:20]
    node _GEN_5 = mux(_T, UInt<1>("h0"), _GEN_4) @[src/main/scala/drawing.scala 41:15 42:20]
    node dout = _GEN_5 @[src/main/scala/drawing.scala 39:25]
    io_dout <= pad(dout, 8) @[src/main/scala/drawing.scala 51:11]
