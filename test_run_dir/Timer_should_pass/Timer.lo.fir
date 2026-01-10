FIRRTL version 1.2.0
circuit Timer :
  module Timer :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8> @[src/main/scala/Timer.scala 4:14]
    input io_load : UInt<1> @[src/main/scala/Timer.scala 4:14]
    output io_done : UInt<1> @[src/main/scala/Timer.scala 4:14]

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/Timer.scala 13:23]
    node done = eq(cntReg, UInt<1>("h0")) @[src/main/scala/Timer.scala 14:21]
    node _T = eq(done, UInt<1>("h0")) @[src/main/scala/Timer.scala 19:16]
    node _next_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/Timer.scala 20:20]
    node _next_T_1 = tail(_next_T, 1) @[src/main/scala/Timer.scala 20:20]
    node _GEN_0 = mux(_T, _next_T_1, UInt<1>("h0")) @[src/main/scala/Timer.scala 19:23 20:10 16:25]
    node _GEN_1 = mux(io_load, io_din, _GEN_0) @[src/main/scala/Timer.scala 17:15 18:10]
    node next = _GEN_1 @[src/main/scala/Timer.scala 16:25]
    io_done <= done @[src/main/scala/Timer.scala 26:11]
    cntReg <= mux(reset, UInt<8>("h0"), next) @[src/main/scala/Timer.scala 13:{23,23} 22:10]
