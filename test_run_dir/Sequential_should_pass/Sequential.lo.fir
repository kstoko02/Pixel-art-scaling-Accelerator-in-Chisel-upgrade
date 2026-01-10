FIRRTL version 1.2.0
circuit Sequential :
  module Sequential :
    input clock : Clock
    input reset : UInt<1>
    input io_d : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    output io_q : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    input io_d2 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    output io_q2 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    input io_d3 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    output io_q3 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    input io_ena : UInt<1> @[src/main/scala/Sequential.scala 5:14]
    output io_q4 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    output io_q5 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    output io_q6 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    output io_q7 : UInt<4> @[src/main/scala/Sequential.scala 5:14]
    input io_riseIn : UInt<1> @[src/main/scala/Sequential.scala 5:14]
    output io_riseOut : UInt<1> @[src/main/scala/Sequential.scala 5:14]

    reg q : UInt<4>, clock with :
      reset => (UInt<1>("h0"), q) @[src/main/scala/Sequential.scala 23:18]
    reg delayReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), delayReg) @[src/main/scala/Sequential.scala 29:21]
    reg valReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), valReg) @[src/main/scala/Sequential.scala 37:23]
    reg enableReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), enableReg) @[src/main/scala/Sequential.scala 45:22]
    node _GEN_0 = mux(io_ena, io_d3, enableReg) @[src/main/scala/Sequential.scala 47:17 48:15 45:22]
    reg resetEnableReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), resetEnableReg) @[src/main/scala/Sequential.scala 54:31]
    node _GEN_1 = mux(io_ena, io_d3, resetEnableReg) @[src/main/scala/Sequential.scala 56:17 57:20 54:31]
    reg enableReg2 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), enableReg2) @[src/main/scala/Sequential.scala 63:29]
    node _GEN_2 = mux(io_ena, io_d3, enableReg2) @[src/main/scala/Sequential.scala 63:{29,29,29}]
    reg resetEnableReg2 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), resetEnableReg2) @[src/main/scala/Sequential.scala 68:34]
    node _GEN_3 = mux(io_ena, io_d3, resetEnableReg2) @[src/main/scala/Sequential.scala 68:{34,34,34}]
    reg risingEdge_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), risingEdge_REG) @[src/main/scala/Sequential.scala 74:34]
    node _risingEdge_T = eq(risingEdge_REG, UInt<1>("h0")) @[src/main/scala/Sequential.scala 74:26]
    node risingEdge = and(io_riseIn, _risingEdge_T) @[src/main/scala/Sequential.scala 74:24]
    io_q <= q @[src/main/scala/Sequential.scala 25:8]
    io_q2 <= delayReg @[src/main/scala/Sequential.scala 33:9]
    io_q3 <= valReg @[src/main/scala/Sequential.scala 41:9]
    io_q4 <= enableReg @[src/main/scala/Sequential.scala 51:9]
    io_q5 <= resetEnableReg @[src/main/scala/Sequential.scala 60:9]
    io_q6 <= enableReg2 @[src/main/scala/Sequential.scala 65:9]
    io_q7 <= resetEnableReg2 @[src/main/scala/Sequential.scala 70:9]
    io_riseOut <= risingEdge @[src/main/scala/Sequential.scala 76:14]
    q <= io_d @[src/main/scala/Sequential.scala 23:18]
    delayReg <= io_d2 @[src/main/scala/Sequential.scala 31:12]
    valReg <= mux(reset, UInt<4>("h0"), io_d3) @[src/main/scala/Sequential.scala 37:{23,23} 39:10]
    enableReg <= _GEN_0
    resetEnableReg <= mux(reset, UInt<4>("h0"), _GEN_1) @[src/main/scala/Sequential.scala 54:{31,31}]
    enableReg2 <= _GEN_2
    resetEnableReg2 <= mux(reset, UInt<4>("h0"), _GEN_3) @[src/main/scala/Sequential.scala 68:{34,34}]
    risingEdge_REG <= io_riseIn @[src/main/scala/Sequential.scala 74:34]
