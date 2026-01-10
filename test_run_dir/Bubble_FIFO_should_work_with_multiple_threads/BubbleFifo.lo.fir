FIRRTL version 1.2.0
circuit BubbleFifo :
  module FifoRegister :
    input clock : Clock
    input reset : UInt<1>
    input io_enq_write : UInt<1> @[src/main/scala/BubbleFifo.scala 52:14]
    output io_enq_full : UInt<1> @[src/main/scala/BubbleFifo.scala 52:14]
    input io_enq_din : UInt<8> @[src/main/scala/BubbleFifo.scala 52:14]
    input io_deq_read : UInt<1> @[src/main/scala/BubbleFifo.scala 52:14]
    output io_deq_empty : UInt<1> @[src/main/scala/BubbleFifo.scala 52:14]
    output io_deq_dout : UInt<8> @[src/main/scala/BubbleFifo.scala 52:14]

    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[src/main/scala/BubbleFifo.scala 62:25]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/BubbleFifo.scala 63:24]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/BubbleFifo.scala 65:17]
    node _GEN_0 = mux(io_enq_write, UInt<1>("h1"), stateReg) @[src/main/scala/BubbleFifo.scala 66:24 67:16 62:25]
    node _GEN_1 = mux(io_enq_write, io_enq_din, dataReg) @[src/main/scala/BubbleFifo.scala 66:24 68:15 63:24]
    node _T_1 = eq(stateReg, UInt<1>("h1")) @[src/main/scala/BubbleFifo.scala 70:23]
    node _GEN_2 = mux(io_deq_read, UInt<1>("h0"), stateReg) @[src/main/scala/BubbleFifo.scala 71:23 72:16 62:25]
    node _GEN_3 = mux(io_deq_read, UInt<1>("h0"), dataReg) @[src/main/scala/BubbleFifo.scala 71:23 73:15 63:24]
    node _GEN_4 = mux(_T_1, _GEN_2, stateReg) @[src/main/scala/BubbleFifo.scala 62:25 70:33]
    node _GEN_5 = mux(_T_1, _GEN_3, dataReg) @[src/main/scala/BubbleFifo.scala 63:24 70:33]
    node _GEN_6 = mux(_T, _GEN_0, _GEN_4) @[src/main/scala/BubbleFifo.scala 65:28]
    node _GEN_7 = mux(_T, _GEN_1, _GEN_5) @[src/main/scala/BubbleFifo.scala 65:28]
    node _io_enq_full_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/BubbleFifo.scala 79:28]
    node _io_deq_empty_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/BubbleFifo.scala 80:29]
    io_enq_full <= _io_enq_full_T @[src/main/scala/BubbleFifo.scala 79:15]
    io_deq_empty <= _io_deq_empty_T @[src/main/scala/BubbleFifo.scala 80:16]
    io_deq_dout <= dataReg @[src/main/scala/BubbleFifo.scala 81:15]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_6) @[src/main/scala/BubbleFifo.scala 62:{25,25}]
    dataReg <= mux(reset, UInt<8>("h0"), _GEN_7) @[src/main/scala/BubbleFifo.scala 63:{24,24}]

  module BubbleFifo :
    input clock : Clock
    input reset : UInt<1>
    input io_enq_write : UInt<1> @[src/main/scala/BubbleFifo.scala 90:14]
    output io_enq_full : UInt<1> @[src/main/scala/BubbleFifo.scala 90:14]
    input io_enq_din : UInt<8> @[src/main/scala/BubbleFifo.scala 90:14]
    input io_deq_read : UInt<1> @[src/main/scala/BubbleFifo.scala 90:14]
    output io_deq_empty : UInt<1> @[src/main/scala/BubbleFifo.scala 90:14]
    output io_deq_dout : UInt<8> @[src/main/scala/BubbleFifo.scala 90:14]

    inst FifoRegister of FifoRegister @[src/main/scala/BubbleFifo.scala 95:43]
    inst FifoRegister_1 of FifoRegister @[src/main/scala/BubbleFifo.scala 95:43]
    inst FifoRegister_2 of FifoRegister @[src/main/scala/BubbleFifo.scala 95:43]
    inst FifoRegister_3 of FifoRegister @[src/main/scala/BubbleFifo.scala 95:43]
    node _T = not(FifoRegister.io_deq_empty) @[src/main/scala/BubbleFifo.scala 98:36]
    node _T_1 = not(FifoRegister_1.io_enq_full) @[src/main/scala/BubbleFifo.scala 99:31]
    node _T_2 = not(FifoRegister_1.io_deq_empty) @[src/main/scala/BubbleFifo.scala 98:36]
    node _T_3 = not(FifoRegister_2.io_enq_full) @[src/main/scala/BubbleFifo.scala 99:31]
    node _T_4 = not(FifoRegister_2.io_deq_empty) @[src/main/scala/BubbleFifo.scala 98:36]
    node _T_5 = not(FifoRegister_3.io_enq_full) @[src/main/scala/BubbleFifo.scala 99:31]
    io_enq_full <= FifoRegister.io_enq_full @[src/main/scala/BubbleFifo.scala 101:10]
    io_deq_empty <= FifoRegister_3.io_deq_empty @[src/main/scala/BubbleFifo.scala 102:10]
    io_deq_dout <= FifoRegister_3.io_deq_dout @[src/main/scala/BubbleFifo.scala 102:10]
    FifoRegister.clock <= clock
    FifoRegister.reset <= reset
    FifoRegister.io_enq_write <= io_enq_write @[src/main/scala/BubbleFifo.scala 101:10]
    FifoRegister.io_enq_din <= io_enq_din @[src/main/scala/BubbleFifo.scala 101:10]
    FifoRegister.io_deq_read <= _T_1 @[src/main/scala/BubbleFifo.scala 99:28]
    FifoRegister_1.clock <= clock
    FifoRegister_1.reset <= reset
    FifoRegister_1.io_enq_write <= _T @[src/main/scala/BubbleFifo.scala 98:33]
    FifoRegister_1.io_enq_din <= FifoRegister.io_deq_dout @[src/main/scala/BubbleFifo.scala 97:31]
    FifoRegister_1.io_deq_read <= _T_3 @[src/main/scala/BubbleFifo.scala 99:28]
    FifoRegister_2.clock <= clock
    FifoRegister_2.reset <= reset
    FifoRegister_2.io_enq_write <= _T_2 @[src/main/scala/BubbleFifo.scala 98:33]
    FifoRegister_2.io_enq_din <= FifoRegister_1.io_deq_dout @[src/main/scala/BubbleFifo.scala 97:31]
    FifoRegister_2.io_deq_read <= _T_5 @[src/main/scala/BubbleFifo.scala 99:28]
    FifoRegister_3.clock <= clock
    FifoRegister_3.reset <= reset
    FifoRegister_3.io_enq_write <= _T_4 @[src/main/scala/BubbleFifo.scala 98:33]
    FifoRegister_3.io_enq_din <= FifoRegister_2.io_deq_dout @[src/main/scala/BubbleFifo.scala 97:31]
    FifoRegister_3.io_deq_read <= io_deq_read @[src/main/scala/BubbleFifo.scala 102:10]
