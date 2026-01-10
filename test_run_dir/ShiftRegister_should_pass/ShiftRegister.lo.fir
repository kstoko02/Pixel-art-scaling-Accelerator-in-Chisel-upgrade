FIRRTL version 1.2.0
circuit ShiftRegister :
  module ShiftRegister :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<1> @[src/main/scala/ShiftRegister.scala 5:14]
    output io_dout : UInt<1> @[src/main/scala/ShiftRegister.scala 5:14]
    input io_serIn : UInt<1> @[src/main/scala/ShiftRegister.scala 5:14]
    output io_paraOut : UInt<4> @[src/main/scala/ShiftRegister.scala 5:14]
    input io_d : UInt<4> @[src/main/scala/ShiftRegister.scala 5:14]
    input io_load : UInt<1> @[src/main/scala/ShiftRegister.scala 5:14]
    output io_serOut : UInt<1> @[src/main/scala/ShiftRegister.scala 5:14]

    reg shiftReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[src/main/scala/ShiftRegister.scala 18:21]
    node _shiftReg_T = bits(shiftReg, 2, 0) @[src/main/scala/ShiftRegister.scala 19:23]
    node _shiftReg_T_1 = cat(_shiftReg_T, io_din) @[src/main/scala/ShiftRegister.scala 19:30]
    node dout = bits(shiftReg, 3, 3) @[src/main/scala/ShiftRegister.scala 20:22]
    reg outReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), outReg) @[src/main/scala/ShiftRegister.scala 28:23]
    node _outReg_T = bits(outReg, 3, 1) @[src/main/scala/ShiftRegister.scala 29:28]
    node _outReg_T_1 = cat(io_serIn, _outReg_T) @[src/main/scala/ShiftRegister.scala 29:19]
    reg loadReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), loadReg) @[src/main/scala/ShiftRegister.scala 36:24]
    node _loadReg_T = bits(loadReg, 3, 1) @[src/main/scala/ShiftRegister.scala 40:30]
    node _loadReg_T_1 = cat(UInt<1>("h0"), _loadReg_T) @[src/main/scala/ShiftRegister.scala 40:20]
    node _GEN_0 = mux(io_load, io_d, _loadReg_T_1) @[src/main/scala/ShiftRegister.scala 37:15 38:13 40:13]
    node serOut = bits(loadReg, 0, 0) @[src/main/scala/ShiftRegister.scala 42:23]
    io_dout <= dout @[src/main/scala/ShiftRegister.scala 48:11]
    io_paraOut <= outReg @[src/main/scala/ShiftRegister.scala 47:14]
    io_serOut <= serOut @[src/main/scala/ShiftRegister.scala 45:13]
    shiftReg <= _shiftReg_T_1 @[src/main/scala/ShiftRegister.scala 19:12]
    outReg <= mux(reset, UInt<4>("h0"), _outReg_T_1) @[src/main/scala/ShiftRegister.scala 28:{23,23} 29:10]
    loadReg <= mux(reset, UInt<4>("h0"), _GEN_0) @[src/main/scala/ShiftRegister.scala 36:{24,24}]
