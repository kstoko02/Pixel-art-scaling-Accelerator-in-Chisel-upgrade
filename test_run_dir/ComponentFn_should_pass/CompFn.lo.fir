FIRRTL version 1.2.0
circuit CompFn :
  module CompFn :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<4> @[src/main/scala/components.scala 161:14]
    input io_b : UInt<4> @[src/main/scala/components.scala 161:14]
    output io_out : UInt<4> @[src/main/scala/components.scala 161:14]
    input io_c : UInt<4> @[src/main/scala/components.scala 161:14]
    input io_d : UInt<4> @[src/main/scala/components.scala 161:14]
    output io_out2 : UInt<4> @[src/main/scala/components.scala 161:14]
    input io_del : UInt<4> @[src/main/scala/components.scala 161:14]
    output io_out3 : UInt<4> @[src/main/scala/components.scala 161:14]

    node _x_T = add(io_a, io_b) @[src/main/scala/components.scala 178:7]
    node x = tail(_x_T, 1) @[src/main/scala/components.scala 178:7]
    node _y_T = add(io_c, io_d) @[src/main/scala/components.scala 178:7]
    node y = tail(_y_T, 1) @[src/main/scala/components.scala 178:7]
    node _io_out2_T = sub(y, UInt<1>("h1")) @[src/main/scala/components.scala 189:16]
    node _io_out2_T_1 = tail(_io_out2_T, 1) @[src/main/scala/components.scala 189:16]
    reg delOut_REG : UInt<4>, clock with :
      reset => (UInt<1>("h0"), delOut_REG) @[src/main/scala/components.scala 194:31]
    reg delOut : UInt<4>, clock with :
      reset => (UInt<1>("h0"), delOut) @[src/main/scala/components.scala 194:31]
    io_out <= x @[src/main/scala/components.scala 188:10]
    io_out2 <= _io_out2_T_1 @[src/main/scala/components.scala 189:11]
    io_out3 <= delOut @[src/main/scala/components.scala 201:11]
    delOut_REG <= io_del @[src/main/scala/components.scala 194:31]
    delOut <= delOut_REG @[src/main/scala/components.scala 194:31]
