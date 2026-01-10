FIRRTL version 1.2.0
circuit ParamFunc :
  module ParamFunc :
    input clock : Clock
    input reset : UInt<1>
    input io_selA : UInt<1> @[src/main/scala/ParamFunc.scala 11:13]
    output io_resA : UInt<5> @[src/main/scala/ParamFunc.scala 11:13]
    input io_selB : UInt<1> @[src/main/scala/ParamFunc.scala 11:13]
    output io_resB_d : UInt<10> @[src/main/scala/ParamFunc.scala 11:13]
    output io_resB_b : UInt<1> @[src/main/scala/ParamFunc.scala 11:13]

    node _GEN_0 = mux(io_selA, UInt<3>("h5"), UInt<4>("ha")) @[src/main/scala/ParamFunc.scala 23:16 24:11 22:26]
    node tVal_d = UInt<10>("h2a") @[src/main/scala/ParamFunc.scala 57:18 59:10]
    node fVal_d = UInt<10>("hd") @[src/main/scala/ParamFunc.scala 60:18 62:10]
    node _GEN_1 = mux(io_selB, tVal_d, fVal_d) @[src/main/scala/ParamFunc.scala 23:16 24:11 22:26]
    node tVal_b = UInt<1>("h1") @[src/main/scala/ParamFunc.scala 57:18 58:10]
    node fVal_b = UInt<1>("h0") @[src/main/scala/ParamFunc.scala 60:18 61:10]
    node _GEN_2 = mux(io_selB, tVal_b, fVal_b) @[src/main/scala/ParamFunc.scala 23:16 24:11 22:26]
    node resA = _GEN_0 @[src/main/scala/ParamFunc.scala 22:26]
    node resB_d = _GEN_1 @[src/main/scala/ParamFunc.scala 22:26]
    node resB_b = _GEN_2 @[src/main/scala/ParamFunc.scala 22:26]
    io_resA <= pad(resA, 5) @[src/main/scala/ParamFunc.scala 69:11]
    io_resB_d <= resB_d @[src/main/scala/ParamFunc.scala 70:11]
    io_resB_b <= resB_b @[src/main/scala/ParamFunc.scala 70:11]
