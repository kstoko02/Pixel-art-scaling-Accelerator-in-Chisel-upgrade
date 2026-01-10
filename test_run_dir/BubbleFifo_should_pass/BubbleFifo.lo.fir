FIRRTL version 1.2.0
circuit BubbleFifo :
  module Buffer :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 27:16]
    input io_enq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 27:16]
    input io_enq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 27:16]
    input io_deq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 27:16]
    output io_deq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 27:16]
    output io_deq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 27:16]

    reg fullReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), fullReg) @[src/main/scala/fifo/fifo.scala 29:26]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/fifo/fifo.scala 30:22]
    node _GEN_0 = mux(io_deq_ready, UInt<1>("h0"), fullReg) @[src/main/scala/fifo/fifo.scala 33:26 34:17 29:26]
    node _GEN_1 = mux(io_enq_valid, UInt<1>("h1"), fullReg) @[src/main/scala/fifo/fifo.scala 37:26 38:17 29:26]
    node _GEN_2 = mux(io_enq_valid, io_enq_bits, dataReg) @[src/main/scala/fifo/fifo.scala 37:26 39:17 30:22]
    node _GEN_3 = mux(fullReg, _GEN_0, _GEN_1) @[src/main/scala/fifo/fifo.scala 32:19]
    node _GEN_4 = mux(fullReg, dataReg, _GEN_2) @[src/main/scala/fifo/fifo.scala 32:19 30:22]
    node _io_enq_ready_T = eq(fullReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 43:21]
    io_enq_ready <= _io_enq_ready_T @[src/main/scala/fifo/fifo.scala 43:18]
    io_deq_valid <= fullReg @[src/main/scala/fifo/fifo.scala 44:18]
    io_deq_bits <= dataReg @[src/main/scala/fifo/fifo.scala 45:17]
    fullReg <= mux(reset, UInt<1>("h0"), _GEN_3) @[src/main/scala/fifo/fifo.scala 29:{26,26}]
    dataReg <= _GEN_4

  module BubbleFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_deq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]

    inst Buffer of Buffer @[src/main/scala/fifo/fifo.scala 48:51]
    inst Buffer_1 of Buffer @[src/main/scala/fifo/fifo.scala 48:51]
    inst Buffer_2 of Buffer @[src/main/scala/fifo/fifo.scala 48:51]
    inst Buffer_3 of Buffer @[src/main/scala/fifo/fifo.scala 48:51]
    io_enq_ready <= Buffer.io_enq_ready @[src/main/scala/fifo/fifo.scala 53:10]
    io_deq_valid <= Buffer_3.io_deq_valid @[src/main/scala/fifo/fifo.scala 54:10]
    io_deq_bits <= Buffer_3.io_deq_bits @[src/main/scala/fifo/fifo.scala 54:10]
    Buffer.clock <= clock
    Buffer.reset <= reset
    Buffer.io_enq_valid <= io_enq_valid @[src/main/scala/fifo/fifo.scala 53:10]
    Buffer.io_enq_bits <= io_enq_bits @[src/main/scala/fifo/fifo.scala 53:10]
    Buffer.io_deq_ready <= Buffer_1.io_enq_ready @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_1.clock <= clock
    Buffer_1.reset <= reset
    Buffer_1.io_enq_valid <= Buffer.io_deq_valid @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_1.io_enq_bits <= Buffer.io_deq_bits @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_1.io_deq_ready <= Buffer_2.io_enq_ready @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_2.clock <= clock
    Buffer_2.reset <= reset
    Buffer_2.io_enq_valid <= Buffer_1.io_deq_valid @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_2.io_enq_bits <= Buffer_1.io_deq_bits @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_2.io_deq_ready <= Buffer_3.io_enq_ready @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_3.clock <= clock
    Buffer_3.reset <= reset
    Buffer_3.io_enq_valid <= Buffer_2.io_deq_valid @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_3.io_enq_bits <= Buffer_2.io_deq_bits @[src/main/scala/fifo/fifo.scala 50:27]
    Buffer_3.io_deq_ready <= io_deq_ready @[src/main/scala/fifo/fifo.scala 54:10]
