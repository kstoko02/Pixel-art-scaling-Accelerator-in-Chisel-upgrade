FIRRTL version 1.2.0
circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<10> @[src/main/scala/memory.scala 6:14]
    output io_rdData : UInt<8> @[src/main/scala/memory.scala 6:14]
    input io_wrAddr : UInt<10> @[src/main/scala/memory.scala 6:14]
    input io_wrData : UInt<8> @[src/main/scala/memory.scala 6:14]
    input io_wrEna : UInt<1> @[src/main/scala/memory.scala 6:14]

    mem mem : @[src/main/scala/memory.scala 14:24]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => io_rdData_MPORT
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(UInt<1>("h1"), io_rdAddr) @[src/main/scala/memory.scala 16:{24,24}]
    node _io_rdData_WIRE = _GEN_0 @[src/main/scala/memory.scala 16:24]
    node _io_rdData_T = or(_io_rdData_WIRE, UInt<10>("h0")) @[src/main/scala/memory.scala 16:24]
    node _io_rdData_T_1 = bits(_io_rdData_T, 9, 0) @[src/main/scala/memory.scala 16:24]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/memory.scala 14:24 16:{24,24}]
    node _GEN_2 = validif(UInt<1>("h1"), _io_rdData_T_1) @[src/main/scala/memory.scala 16:{24,24}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[src/main/scala/memory.scala 16:{24,24}]
    node _GEN_4 = validif(io_wrEna, io_wrAddr) @[src/main/scala/memory.scala 18:18]
    node _GEN_5 = validif(io_wrEna, clock) @[src/main/scala/memory.scala 18:18]
    node _GEN_6 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/memory.scala 18:18 14:24]
    node _GEN_7 = validif(io_wrEna, UInt<1>("h1")) @[src/main/scala/memory.scala 18:18]
    node _GEN_8 = validif(io_wrEna, io_wrData) @[src/main/scala/memory.scala 18:18]
    io_rdData <= mem.io_rdData_MPORT.data @[src/main/scala/memory.scala 16:13]
    mem.io_rdData_MPORT.addr <= _GEN_2
    mem.io_rdData_MPORT.en <= _GEN_1
    mem.io_rdData_MPORT.clk <= _GEN_3
    mem.MPORT.addr <= _GEN_4
    mem.MPORT.en <= _GEN_6
    mem.MPORT.clk <= _GEN_5
    mem.MPORT.data <= _GEN_8
    mem.MPORT.mask <= _GEN_7
