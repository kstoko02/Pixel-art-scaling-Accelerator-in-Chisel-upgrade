FIRRTL version 1.2.0
circuit CombWhen :
  module CombWhen :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1> @[src/main/scala/Combinational.scala 35:14]
    output io_out : UInt<4> @[src/main/scala/Combinational.scala 35:14]

    node _GEN_0 = mux(io_cond, UInt<2>("h3"), UInt<1>("h0")) @[src/main/scala/Combinational.scala 45:15 44:5 46:7]
    node w = _GEN_0 @[src/main/scala/Combinational.scala 42:15]
    io_out <= pad(w, 4) @[src/main/scala/Combinational.scala 49:10]
