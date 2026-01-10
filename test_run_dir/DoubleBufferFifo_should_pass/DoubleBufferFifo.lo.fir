FIRRTL version 1.2.0
circuit DoubleBufferFifo :
  module DoubleBuffer :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 64:16]
    input io_enq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 64:16]
    input io_enq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 64:16]
    input io_deq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 64:16]
    output io_deq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 64:16]
    output io_deq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 64:16]

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/fifo/fifo.scala 71:27]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/fifo/fifo.scala 72:22]
    reg shadowReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[src/main/scala/fifo/fifo.scala 73:24]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 75:22]
    node _T_1 = asUInt(stateReg) @[src/main/scala/fifo/fifo.scala 75:22]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/fifo/fifo.scala 75:22]
    node _GEN_0 = mux(io_enq_valid, UInt<1>("h1"), stateReg) @[src/main/scala/fifo/fifo.scala 77:28 78:20 71:27]
    node _GEN_1 = mux(io_enq_valid, io_enq_bits, dataReg) @[src/main/scala/fifo/fifo.scala 77:28 79:19 72:22]
    node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 75:22]
    node _T_4 = asUInt(stateReg) @[src/main/scala/fifo/fifo.scala 75:22]
    node _T_5 = eq(_T_3, _T_4) @[src/main/scala/fifo/fifo.scala 75:22]
    node _T_6 = eq(io_enq_valid, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 83:30]
    node _T_7 = and(io_deq_ready, _T_6) @[src/main/scala/fifo/fifo.scala 83:27]
    node _GEN_2 = mux(_T_7, UInt<1>("h0"), stateReg) @[src/main/scala/fifo/fifo.scala 83:45 84:20 71:27]
    node _T_8 = and(io_deq_ready, io_enq_valid) @[src/main/scala/fifo/fifo.scala 86:27]
    node _GEN_3 = mux(_T_8, UInt<1>("h1"), _GEN_2) @[src/main/scala/fifo/fifo.scala 86:44 87:20]
    node _GEN_4 = mux(_T_8, io_enq_bits, dataReg) @[src/main/scala/fifo/fifo.scala 86:44 88:19 72:22]
    node _T_9 = eq(io_deq_ready, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 90:14]
    node _T_10 = and(_T_9, io_enq_valid) @[src/main/scala/fifo/fifo.scala 90:28]
    node _GEN_5 = mux(_T_10, UInt<2>("h2"), _GEN_3) @[src/main/scala/fifo/fifo.scala 90:45 91:20]
    node _GEN_6 = mux(_T_10, io_enq_bits, shadowReg) @[src/main/scala/fifo/fifo.scala 90:45 92:21 73:24]
    node _T_11 = asUInt(UInt<2>("h2")) @[src/main/scala/fifo/fifo.scala 75:22]
    node _T_12 = asUInt(stateReg) @[src/main/scala/fifo/fifo.scala 75:22]
    node _T_13 = eq(_T_11, _T_12) @[src/main/scala/fifo/fifo.scala 75:22]
    node _GEN_7 = mux(io_deq_ready, shadowReg, dataReg) @[src/main/scala/fifo/fifo.scala 96:28 97:19 72:22]
    node _GEN_8 = mux(io_deq_ready, UInt<1>("h1"), stateReg) @[src/main/scala/fifo/fifo.scala 96:28 98:20 71:27]
    node _GEN_9 = mux(_T_13, _GEN_7, dataReg) @[src/main/scala/fifo/fifo.scala 72:22 75:22]
    node _GEN_10 = mux(_T_13, _GEN_8, stateReg) @[src/main/scala/fifo/fifo.scala 75:22 71:27]
    node _GEN_11 = mux(_T_5, _GEN_5, _GEN_10) @[src/main/scala/fifo/fifo.scala 75:22]
    node _GEN_12 = mux(_T_5, _GEN_4, _GEN_9) @[src/main/scala/fifo/fifo.scala 75:22]
    node _GEN_13 = mux(_T_5, _GEN_6, shadowReg) @[src/main/scala/fifo/fifo.scala 75:22 73:24]
    node _GEN_14 = mux(_T_2, _GEN_0, _GEN_11) @[src/main/scala/fifo/fifo.scala 75:22]
    node _GEN_15 = mux(_T_2, _GEN_1, _GEN_12) @[src/main/scala/fifo/fifo.scala 75:22]
    node _GEN_16 = mux(_T_2, shadowReg, _GEN_13) @[src/main/scala/fifo/fifo.scala 75:22 73:24]
    node _io_enq_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 103:31]
    node _io_enq_ready_T_1 = eq(stateReg, UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 103:53]
    node _io_enq_ready_T_2 = or(_io_enq_ready_T, _io_enq_ready_T_1) @[src/main/scala/fifo/fifo.scala 103:41]
    node _io_deq_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 104:31]
    node _io_deq_valid_T_1 = eq(stateReg, UInt<2>("h2")) @[src/main/scala/fifo/fifo.scala 104:51]
    node _io_deq_valid_T_2 = or(_io_deq_valid_T, _io_deq_valid_T_1) @[src/main/scala/fifo/fifo.scala 104:39]
    io_enq_ready <= _io_enq_ready_T_2 @[src/main/scala/fifo/fifo.scala 103:18]
    io_deq_valid <= _io_deq_valid_T_2 @[src/main/scala/fifo/fifo.scala 104:18]
    io_deq_bits <= dataReg @[src/main/scala/fifo/fifo.scala 105:17]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_14) @[src/main/scala/fifo/fifo.scala 71:{27,27}]
    dataReg <= _GEN_15
    shadowReg <= _GEN_16

  module DoubleBufferFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_deq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]

    inst DoubleBuffer of DoubleBuffer @[src/main/scala/fifo/fifo.scala 108:61]
    inst DoubleBuffer_1 of DoubleBuffer @[src/main/scala/fifo/fifo.scala 108:61]
    io_enq_ready <= DoubleBuffer.io_enq_ready @[src/main/scala/fifo/fifo.scala 113:10]
    io_deq_valid <= DoubleBuffer_1.io_deq_valid @[src/main/scala/fifo/fifo.scala 114:10]
    io_deq_bits <= DoubleBuffer_1.io_deq_bits @[src/main/scala/fifo/fifo.scala 114:10]
    DoubleBuffer.clock <= clock
    DoubleBuffer.reset <= reset
    DoubleBuffer.io_enq_valid <= io_enq_valid @[src/main/scala/fifo/fifo.scala 113:10]
    DoubleBuffer.io_enq_bits <= io_enq_bits @[src/main/scala/fifo/fifo.scala 113:10]
    DoubleBuffer.io_deq_ready <= DoubleBuffer_1.io_enq_ready @[src/main/scala/fifo/fifo.scala 111:27]
    DoubleBuffer_1.clock <= clock
    DoubleBuffer_1.reset <= reset
    DoubleBuffer_1.io_enq_valid <= DoubleBuffer.io_deq_valid @[src/main/scala/fifo/fifo.scala 111:27]
    DoubleBuffer_1.io_enq_bits <= DoubleBuffer.io_deq_bits @[src/main/scala/fifo/fifo.scala 111:27]
    DoubleBuffer_1.io_deq_ready <= io_deq_ready @[src/main/scala/fifo/fifo.scala 114:10]
