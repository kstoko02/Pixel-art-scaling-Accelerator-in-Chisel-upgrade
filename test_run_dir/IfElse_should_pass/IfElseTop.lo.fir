FIRRTL version 1.2.0
circuit IfElseTop :
  module ChiselIfElse :
    input clock : Clock
    input reset : UInt<1>
    input io_c1 : UInt<1> @[src/main/scala/verilog/basic.scala 253:14]
    input io_c2 : UInt<1> @[src/main/scala/verilog/basic.scala 253:14]
    input io_in1 : UInt<8> @[src/main/scala/verilog/basic.scala 253:14]
    input io_in2 : UInt<8> @[src/main/scala/verilog/basic.scala 253:14]
    input io_in3 : UInt<8> @[src/main/scala/verilog/basic.scala 253:14]
    output io_out : UInt<8> @[src/main/scala/verilog/basic.scala 253:14]

    node _GEN_0 = mux(io_c2, io_in2, io_in3) @[src/main/scala/verilog/basic.scala 264:23 265:12 267:12]
    node _GEN_1 = mux(io_c1, io_in1, _GEN_0) @[src/main/scala/verilog/basic.scala 262:16 263:12]
    io_out <= _GEN_1

  extmodule if_else :
    input c1 : UInt<1>
    input c2 : UInt<1>
    input in1 : UInt<8>
    input in2 : UInt<8>
    input in3 : UInt<8>
    output out : UInt<8>
    defname = if_else

  module IfElseTop :
    input clock : Clock
    input reset : UInt<1>
    input io_c1 : UInt<1> @[src/main/scala/verilog/basic.scala 305:14]
    input io_c2 : UInt<1> @[src/main/scala/verilog/basic.scala 305:14]
    input io_in1 : UInt<8> @[src/main/scala/verilog/basic.scala 305:14]
    input io_in2 : UInt<8> @[src/main/scala/verilog/basic.scala 305:14]
    input io_in3 : UInt<8> @[src/main/scala/verilog/basic.scala 305:14]
    output io_out : UInt<8> @[src/main/scala/verilog/basic.scala 305:14]
    output io_out2 : UInt<8> @[src/main/scala/verilog/basic.scala 305:14]

    inst cm of ChiselIfElse @[src/main/scala/verilog/basic.scala 314:18]
    inst m of if_else @[src/main/scala/verilog/basic.scala 322:17]
    io_out <= cm.io_out @[src/main/scala/verilog/basic.scala 320:10]
    io_out2 <= m.out @[src/main/scala/verilog/basic.scala 328:11]
    cm.clock <= clock
    cm.reset <= reset
    cm.io_c1 <= io_c1 @[src/main/scala/verilog/basic.scala 315:12]
    cm.io_c2 <= io_c2 @[src/main/scala/verilog/basic.scala 316:12]
    cm.io_in1 <= io_in1 @[src/main/scala/verilog/basic.scala 317:13]
    cm.io_in2 <= io_in2 @[src/main/scala/verilog/basic.scala 318:13]
    cm.io_in3 <= io_in3 @[src/main/scala/verilog/basic.scala 319:13]
    m.c1 <= io_c1 @[src/main/scala/verilog/basic.scala 323:11]
    m.c2 <= io_c2 @[src/main/scala/verilog/basic.scala 324:11]
    m.in1 <= io_in1 @[src/main/scala/verilog/basic.scala 325:12]
    m.in2 <= io_in2 @[src/main/scala/verilog/basic.scala 326:12]
    m.in3 <= io_in3 @[src/main/scala/verilog/basic.scala 327:12]
