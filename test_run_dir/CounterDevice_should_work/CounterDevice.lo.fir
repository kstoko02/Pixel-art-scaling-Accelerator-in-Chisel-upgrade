FIRRTL version 1.2.0
circuit CounterDevice :
  module CounterDevice :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<2> @[src/main/scala/interconnect.scala 7:14]
    input io_wr : UInt<1> @[src/main/scala/interconnect.scala 7:14]
    input io_rd : UInt<1> @[src/main/scala/interconnect.scala 7:14]
    input io_wrData : UInt<32> @[src/main/scala/interconnect.scala 7:14]
    output io_rdData : UInt<32> @[src/main/scala/interconnect.scala 7:14]
    output io_ack : UInt<1> @[src/main/scala/interconnect.scala 7:14]

    reg ackReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ackReg) @[src/main/scala/interconnect.scala 16:23]
    reg addrReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), addrReg) @[src/main/scala/interconnect.scala 17:24]
    reg cntRegs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntRegs_0) @[src/main/scala/interconnect.scala 18:24]
    reg cntRegs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntRegs_1) @[src/main/scala/interconnect.scala 18:24]
    reg cntRegs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntRegs_2) @[src/main/scala/interconnect.scala 18:24]
    reg cntRegs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntRegs_3) @[src/main/scala/interconnect.scala 18:24]
    node _ackReg_T = or(io_rd, io_wr) @[src/main/scala/interconnect.scala 20:19]
    node _GEN_0 = mux(io_rd, io_addr, addrReg) @[src/main/scala/interconnect.scala 21:15 22:13 17:24]
    node _GEN_1 = validif(eq(UInt<1>("h0"), addrReg), cntRegs_0) @[src/main/scala/interconnect.scala 24:{13,13}]
    node _GEN_2 = mux(eq(UInt<1>("h1"), addrReg), cntRegs_1, _GEN_1) @[src/main/scala/interconnect.scala 24:{13,13}]
    node _GEN_3 = mux(eq(UInt<2>("h2"), addrReg), cntRegs_2, _GEN_2) @[src/main/scala/interconnect.scala 24:{13,13}]
    node _GEN_4 = mux(eq(UInt<2>("h3"), addrReg), cntRegs_3, _GEN_3) @[src/main/scala/interconnect.scala 24:{13,13}]
    node _cntRegs_0_T = add(cntRegs_0, UInt<1>("h1")) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_0_T_1 = tail(_cntRegs_0_T, 1) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_1_T = add(cntRegs_1, UInt<1>("h1")) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_1_T_1 = tail(_cntRegs_1_T, 1) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_2_T = add(cntRegs_2, UInt<1>("h1")) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_2_T_1 = tail(_cntRegs_2_T, 1) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_3_T = add(cntRegs_3, UInt<1>("h1")) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_3_T_1 = tail(_cntRegs_3_T, 1) @[src/main/scala/interconnect.scala 27:30]
    node _cntRegs_io_addr = io_wrData @[src/main/scala/interconnect.scala 30:{22,22}]
    node _GEN_5 = mux(eq(UInt<1>("h0"), io_addr), _cntRegs_io_addr, _cntRegs_0_T_1) @[src/main/scala/interconnect.scala 27:16 30:{22,22}]
    node _GEN_6 = mux(eq(UInt<1>("h1"), io_addr), _cntRegs_io_addr, _cntRegs_1_T_1) @[src/main/scala/interconnect.scala 27:16 30:{22,22}]
    node _GEN_7 = mux(eq(UInt<2>("h2"), io_addr), _cntRegs_io_addr, _cntRegs_2_T_1) @[src/main/scala/interconnect.scala 27:16 30:{22,22}]
    node _GEN_8 = mux(eq(UInt<2>("h3"), io_addr), _cntRegs_io_addr, _cntRegs_3_T_1) @[src/main/scala/interconnect.scala 27:16 30:{22,22}]
    node _GEN_9 = mux(io_wr, _GEN_5, _cntRegs_0_T_1) @[src/main/scala/interconnect.scala 27:16 29:16]
    node _GEN_10 = mux(io_wr, _GEN_6, _cntRegs_1_T_1) @[src/main/scala/interconnect.scala 27:16 29:16]
    node _GEN_11 = mux(io_wr, _GEN_7, _cntRegs_2_T_1) @[src/main/scala/interconnect.scala 27:16 29:16]
    node _GEN_12 = mux(io_wr, _GEN_8, _cntRegs_3_T_1) @[src/main/scala/interconnect.scala 27:16 29:16]
    node _cntRegs_WIRE_0 = UInt<32>("h0") @[src/main/scala/interconnect.scala 18:{32,32}]
    node _cntRegs_WIRE_1 = UInt<32>("h0") @[src/main/scala/interconnect.scala 18:{32,32}]
    node _cntRegs_WIRE_2 = UInt<32>("h0") @[src/main/scala/interconnect.scala 18:{32,32}]
    node _cntRegs_WIRE_3 = UInt<32>("h0") @[src/main/scala/interconnect.scala 18:{32,32}]
    node _cntRegs_addrReg = _GEN_4 @[src/main/scala/interconnect.scala 24:13]
    io_rdData <= _cntRegs_addrReg @[src/main/scala/interconnect.scala 24:13]
    io_ack <= ackReg @[src/main/scala/interconnect.scala 33:10]
    ackReg <= mux(reset, UInt<1>("h0"), _ackReg_T) @[src/main/scala/interconnect.scala 16:{23,23} 20:10]
    addrReg <= mux(reset, UInt<2>("h0"), _GEN_0) @[src/main/scala/interconnect.scala 17:{24,24}]
    cntRegs_0 <= mux(reset, _cntRegs_WIRE_0, _GEN_9) @[src/main/scala/interconnect.scala 18:{24,24}]
    cntRegs_1 <= mux(reset, _cntRegs_WIRE_1, _GEN_10) @[src/main/scala/interconnect.scala 18:{24,24}]
    cntRegs_2 <= mux(reset, _cntRegs_WIRE_2, _GEN_11) @[src/main/scala/interconnect.scala 18:{24,24}]
    cntRegs_3 <= mux(reset, _cntRegs_WIRE_3, _GEN_12) @[src/main/scala/interconnect.scala 18:{24,24}]
