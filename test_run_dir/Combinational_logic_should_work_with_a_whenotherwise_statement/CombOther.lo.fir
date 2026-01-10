FIRRTL version 1.2.0
circuit CombOther :
  module CombOther :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1> @[src/main/scala/Combinational.scala 72:14]
    output io_out : UInt<4> @[src/main/scala/Combinational.scala 72:14]

    node _GEN_0 = mux(io_cond, UInt<1>("h1"), UInt<2>("h2")) @[src/main/scala/Combinational.scala 81:15 82:7 84:7]
    node w = _GEN_0 @[src/main/scala/Combinational.scala 79:15]
    io_out <= pad(w, 4) @[src/main/scala/Combinational.scala 87:10]
