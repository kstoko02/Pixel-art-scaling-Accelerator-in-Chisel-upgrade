FIRRTL version 1.2.0
circuit AdderTop :
  extmodule UseAdder :
    input a : UInt<8>
    input b : UInt<8>
    output sum : UInt<8>
    defname = UseAdder

  module ChiselAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8> @[src/main/scala/verilog/basic.scala 8:14]
    input io_b : UInt<8> @[src/main/scala/verilog/basic.scala 8:14]
    output io_sum : UInt<8> @[src/main/scala/verilog/basic.scala 8:14]

    node _io_sum_T = add(io_a, io_b) @[src/main/scala/verilog/basic.scala 12:18]
    node _io_sum_T_1 = tail(_io_sum_T, 1) @[src/main/scala/verilog/basic.scala 12:18]
    io_sum <= _io_sum_T_1 @[src/main/scala/verilog/basic.scala 12:10]

  module UseChiselAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8> @[src/main/scala/verilog/basic.scala 17:14]
    input io_b : UInt<8> @[src/main/scala/verilog/basic.scala 17:14]
    output io_sum : UInt<8> @[src/main/scala/verilog/basic.scala 17:14]

    inst m of ChiselAdder @[src/main/scala/verilog/basic.scala 27:17]
    node in1 = io_a @[src/main/scala/verilog/basic.scala 23:17 33:7]
    node in2 = io_b @[src/main/scala/verilog/basic.scala 24:17 34:7]
    node result = m.io_sum @[src/main/scala/verilog/basic.scala 25:20 30:10]
    io_sum <= result @[src/main/scala/verilog/basic.scala 35:10]
    m.clock <= clock
    m.reset <= reset
    m.io_a <= in1 @[src/main/scala/verilog/basic.scala 28:10]
    m.io_b <= in2 @[src/main/scala/verilog/basic.scala 29:10]

  module AdderTop :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8> @[src/main/scala/verilog/basic.scala 102:14]
    input io_b : UInt<8> @[src/main/scala/verilog/basic.scala 102:14]
    output io_sum : UInt<8> @[src/main/scala/verilog/basic.scala 102:14]
    input io_c : UInt<8> @[src/main/scala/verilog/basic.scala 102:14]
    input io_d : UInt<8> @[src/main/scala/verilog/basic.scala 102:14]
    output io_s : UInt<8> @[src/main/scala/verilog/basic.scala 102:14]

    inst m of UseAdder @[src/main/scala/verilog/basic.scala 109:17]
    inst ch of UseChiselAdder @[src/main/scala/verilog/basic.scala 113:18]
    io_sum <= m.sum @[src/main/scala/verilog/basic.scala 112:10]
    io_s <= ch.io_sum @[src/main/scala/verilog/basic.scala 116:8]
    m.a <= io_a @[src/main/scala/verilog/basic.scala 110:10]
    m.b <= io_b @[src/main/scala/verilog/basic.scala 111:10]
    ch.clock <= clock
    ch.reset <= reset
    ch.io_a <= io_c @[src/main/scala/verilog/basic.scala 114:11]
    ch.io_b <= io_d @[src/main/scala/verilog/basic.scala 115:11]
