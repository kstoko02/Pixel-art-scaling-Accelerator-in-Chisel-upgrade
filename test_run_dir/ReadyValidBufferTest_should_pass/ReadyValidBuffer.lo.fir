FIRRTL version 1.2.0
circuit ReadyValidBuffer :
  module ReadyValidBuffer :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1> @[src/main/scala/ReadyValidBuffer.scala 6:14]
    input io_in_valid : UInt<1> @[src/main/scala/ReadyValidBuffer.scala 6:14]
    input io_in_bits : UInt<8> @[src/main/scala/ReadyValidBuffer.scala 6:14]
    input io_out_ready : UInt<1> @[src/main/scala/ReadyValidBuffer.scala 6:14]
    output io_out_valid : UInt<1> @[src/main/scala/ReadyValidBuffer.scala 6:14]
    output io_out_bits : UInt<8> @[src/main/scala/ReadyValidBuffer.scala 6:14]

    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[src/main/scala/ReadyValidBuffer.scala 11:20]
    reg emptyReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), emptyReg) @[src/main/scala/ReadyValidBuffer.scala 12:25]
    node _io_out_valid_T = eq(emptyReg, UInt<1>("h0")) @[src/main/scala/ReadyValidBuffer.scala 15:19]
    node _T = and(emptyReg, io_in_valid) @[src/main/scala/ReadyValidBuffer.scala 18:18]
    node _GEN_0 = mux(_T, io_in_bits, dataReg) @[src/main/scala/ReadyValidBuffer.scala 18:33 19:13 11:20]
    node _GEN_1 = mux(_T, UInt<1>("h0"), emptyReg) @[src/main/scala/ReadyValidBuffer.scala 18:33 20:14 12:25]
    node _T_1 = eq(emptyReg, UInt<1>("h0")) @[src/main/scala/ReadyValidBuffer.scala 23:9]
    node _T_2 = and(_T_1, io_out_ready) @[src/main/scala/ReadyValidBuffer.scala 23:19]
    node _GEN_2 = mux(_T_2, UInt<1>("h1"), _GEN_1) @[src/main/scala/ReadyValidBuffer.scala 23:35 24:14]
    io_in_ready <= emptyReg @[src/main/scala/ReadyValidBuffer.scala 14:15]
    io_out_valid <= _io_out_valid_T @[src/main/scala/ReadyValidBuffer.scala 15:16]
    io_out_bits <= dataReg @[src/main/scala/ReadyValidBuffer.scala 16:15]
    dataReg <= _GEN_0
    emptyReg <= mux(reset, UInt<1>("h1"), _GEN_2) @[src/main/scala/ReadyValidBuffer.scala 12:{25,25}]
