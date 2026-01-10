FIRRTL version 1.2.0
circuit CombElseWhen :
  module CombElseWhen :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1> @[src/main/scala/Combinational.scala 91:14]
    input io_cond2 : UInt<1> @[src/main/scala/Combinational.scala 91:14]
    output io_out : UInt<4> @[src/main/scala/Combinational.scala 91:14]

    node _GEN_0 = mux(io_cond2, UInt<2>("h2"), UInt<2>("h3")) @[src/main/scala/Combinational.scala 105:23 106:7 108:7]
    node _GEN_1 = mux(io_cond, UInt<1>("h1"), _GEN_0) @[src/main/scala/Combinational.scala 103:15 104:7]
    node w = _GEN_1 @[src/main/scala/Combinational.scala 101:15]
    io_out <= pad(w, 4) @[src/main/scala/Combinational.scala 111:10]
