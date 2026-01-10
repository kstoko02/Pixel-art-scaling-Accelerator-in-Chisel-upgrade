FIRRTL version 1.2.0
circuit CombWireDefault :
  module CombWireDefault :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1> @[src/main/scala/Combinational.scala 115:14]
    output io_out : UInt<4> @[src/main/scala/Combinational.scala 115:14]

    node _GEN_0 = mux(io_cond, UInt<2>("h3"), UInt<1>("h0")) @[src/main/scala/Combinational.scala 124:15 122:22 125:7]
    node w = _GEN_0 @[src/main/scala/Combinational.scala 122:22]
    io_out <= pad(w, 4) @[src/main/scala/Combinational.scala 129:10]
