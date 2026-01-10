FIRRTL version 1.2.0
circuit Count10 :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8> @[src/main/scala/components.scala 9:14]
    input io_b : UInt<8> @[src/main/scala/components.scala 9:14]
    output io_y : UInt<8> @[src/main/scala/components.scala 9:14]

    node _io_y_T = add(io_a, io_b) @[src/main/scala/components.scala 15:16]
    node _io_y_T_1 = tail(_io_y_T, 1) @[src/main/scala/components.scala 15:16]
    io_y <= _io_y_T_1 @[src/main/scala/components.scala 15:8]

  module Register :
    input clock : Clock
    input reset : UInt<1>
    input io_d : UInt<8> @[src/main/scala/components.scala 21:14]
    output io_q : UInt<8> @[src/main/scala/components.scala 21:14]

    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[src/main/scala/components.scala 26:20]
    io_q <= reg @[src/main/scala/components.scala 28:8]
    reg <= mux(reset, UInt<1>("h0"), io_d) @[src/main/scala/components.scala 26:{20,20} 27:7]

  module Count10 :
    input clock : Clock
    input reset : UInt<1>
    output io_dout : UInt<8> @[src/main/scala/components.scala 34:14]

    inst add of Adder @[src/main/scala/components.scala 38:19]
    inst reg of Register @[src/main/scala/components.scala 39:19]
    node _next_T = eq(reg.io_q, UInt<4>("h9")) @[src/main/scala/components.scala 48:24]
    node next = mux(_next_T, UInt<1>("h0"), add.io_y) @[src/main/scala/components.scala 48:17]
    io_dout <= reg.io_q @[src/main/scala/components.scala 50:11]
    add.clock <= clock
    add.reset <= reset
    add.io_a <= UInt<8>("h1") @[src/main/scala/components.scala 44:12]
    add.io_b <= reg.io_q @[src/main/scala/components.scala 45:12]
    reg.clock <= clock
    reg.reset <= reset
    reg.io_d <= next @[src/main/scala/components.scala 49:12]
