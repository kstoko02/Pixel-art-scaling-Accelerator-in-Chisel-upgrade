FIRRTL version 1.2.0
circuit Registers :
  module Registers :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<8> @[src/main/scala/Registers.scala 4:14]
    output io_out : UInt<8> @[src/main/scala/Registers.scala 4:14]

    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[src/main/scala/Registers.scala 10:20]
    reg nextReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), nextReg) @[src/main/scala/Registers.scala 20:24]
    reg bothReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), bothReg) @[src/main/scala/Registers.scala 24:24]
    io_out <= reg @[src/main/scala/Registers.scala 26:10]
    reg <= mux(reset, UInt<8>("h0"), io_in) @[src/main/scala/Registers.scala 10:{20,20} 15:7]
    nextReg <= io_in @[src/main/scala/Registers.scala 20:24]
    bothReg <= mux(reset, UInt<1>("h0"), io_in) @[src/main/scala/Registers.scala 24:{24,24,24}]
