FIRRTL version 1.2.0
circuit RegisterTop :
  extmodule Register :
    input clk : Clock
    input reset : UInt<1>
    input enable : UInt<1>
    input data : UInt<8>
    output out : UInt<8>
    defname = Register

  module ChiselRegister :
    input clock : Clock
    input reset : UInt<1>
    input io_enable : UInt<1> @[src/main/scala/verilog/basic.scala 153:14]
    input io_data : UInt<8> @[src/main/scala/verilog/basic.scala 153:14]
    output io_out : UInt<8> @[src/main/scala/verilog/basic.scala 153:14]

    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[src/main/scala/verilog/basic.scala 162:22]
    node _GEN_0 = mux(io_enable, io_data, reg) @[src/main/scala/verilog/basic.scala 162:{22,22,22}]
    io_out <= reg @[src/main/scala/verilog/basic.scala 164:10]
    reg <= mux(reset, UInt<8>("h0"), _GEN_0) @[src/main/scala/verilog/basic.scala 162:{22,22}]

  module RegisterTop :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<8> @[src/main/scala/verilog/basic.scala 168:14]
    output io_out : UInt<8> @[src/main/scala/verilog/basic.scala 168:14]
    output io_out2 : UInt<8> @[src/main/scala/verilog/basic.scala 168:14]
    input io_en : UInt<1> @[src/main/scala/verilog/basic.scala 168:14]

    inst m of Register @[src/main/scala/verilog/basic.scala 175:17]
    inst cm of ChiselRegister @[src/main/scala/verilog/basic.scala 181:18]
    io_out <= m.out @[src/main/scala/verilog/basic.scala 180:10]
    io_out2 <= cm.io_out @[src/main/scala/verilog/basic.scala 184:11]
    m.clk <= clock @[src/main/scala/verilog/basic.scala 176:12]
    m.reset <= reset @[src/main/scala/verilog/basic.scala 177:14]
    m.enable <= io_en @[src/main/scala/verilog/basic.scala 178:15]
    m.data <= io_in @[src/main/scala/verilog/basic.scala 179:13]
    cm.clock <= clock
    cm.reset <= reset
    cm.io_enable <= io_en @[src/main/scala/verilog/basic.scala 182:16]
    cm.io_data <= io_in @[src/main/scala/verilog/basic.scala 183:14]
