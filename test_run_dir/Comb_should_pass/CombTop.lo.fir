FIRRTL version 1.2.0
circuit CombTop :
  extmodule comb :
    input sel : UInt<2>
    input in : UInt<4>
    output out : UInt<1>
    defname = comb

  module ChiselComb :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<2> @[src/main/scala/verilog/basic.scala 218:14]
    input io_in : UInt<4> @[src/main/scala/verilog/basic.scala 218:14]
    output io_out : UInt<1> @[src/main/scala/verilog/basic.scala 218:14]

    node _T = eq(UInt<1>("h0"), io_sel) @[src/main/scala/verilog/basic.scala 225:18]
    node _io_out_T = bits(io_in, 0, 0) @[src/main/scala/verilog/basic.scala 226:34]
    node _T_1 = eq(UInt<1>("h1"), io_sel) @[src/main/scala/verilog/basic.scala 225:18]
    node _io_out_T_1 = bits(io_in, 1, 1) @[src/main/scala/verilog/basic.scala 227:34]
    node _T_2 = eq(UInt<2>("h2"), io_sel) @[src/main/scala/verilog/basic.scala 225:18]
    node _io_out_T_2 = bits(io_in, 2, 2) @[src/main/scala/verilog/basic.scala 228:34]
    node _T_3 = eq(UInt<2>("h3"), io_sel) @[src/main/scala/verilog/basic.scala 225:18]
    node _io_out_T_3 = bits(io_in, 3, 3) @[src/main/scala/verilog/basic.scala 229:34]
    node _GEN_0 = mux(_T_3, _io_out_T_3, UInt<1>("h0")) @[src/main/scala/verilog/basic.scala 224:10 225:18 229:26]
    node _GEN_1 = mux(_T_2, _io_out_T_2, _GEN_0) @[src/main/scala/verilog/basic.scala 225:18 228:26]
    node _GEN_2 = mux(_T_1, _io_out_T_1, _GEN_1) @[src/main/scala/verilog/basic.scala 225:18 227:26]
    node _GEN_3 = mux(_T, _io_out_T, _GEN_2) @[src/main/scala/verilog/basic.scala 225:18 226:26]
    io_out <= _GEN_3

  module CombTop :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<2> @[src/main/scala/verilog/basic.scala 235:14]
    input io_in : UInt<4> @[src/main/scala/verilog/basic.scala 235:14]
    output io_out : UInt<1> @[src/main/scala/verilog/basic.scala 235:14]
    output io_out2 : UInt<1> @[src/main/scala/verilog/basic.scala 235:14]

    inst m of comb @[src/main/scala/verilog/basic.scala 242:17]
    inst cm of ChiselComb @[src/main/scala/verilog/basic.scala 246:18]
    io_out <= m.out @[src/main/scala/verilog/basic.scala 245:10]
    io_out2 <= cm.io_out @[src/main/scala/verilog/basic.scala 249:11]
    m.sel <= io_sel @[src/main/scala/verilog/basic.scala 243:12]
    m.in <= io_in @[src/main/scala/verilog/basic.scala 244:11]
    cm.clock <= clock
    cm.reset <= reset
    cm.io_sel <= io_sel @[src/main/scala/verilog/basic.scala 247:13]
    cm.io_in <= io_in @[src/main/scala/verilog/basic.scala 248:12]
