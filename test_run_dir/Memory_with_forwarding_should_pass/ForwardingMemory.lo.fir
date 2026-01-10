FIRRTL version 1.2.0
circuit ForwardingMemory :
  module ForwardingMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<10> @[src/main/scala/memory.scala 26:14]
    output io_rdData : UInt<8> @[src/main/scala/memory.scala 26:14]
    input io_wrAddr : UInt<10> @[src/main/scala/memory.scala 26:14]
    input io_wrData : UInt<8> @[src/main/scala/memory.scala 26:14]
    input io_wrEna : UInt<1> @[src/main/scala/memory.scala 26:14]

    mem mem : @[src/main/scala/memory.scala 34:24]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memData
      writer => MPORT
      read-under-write => undefined
    reg wrDataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrDataReg) @[src/main/scala/memory.scala 36:26]
    node _doForwardReg_T = eq(io_wrAddr, io_rdAddr) @[src/main/scala/memory.scala 37:40]
    node _doForwardReg_T_1 = and(_doForwardReg_T, io_wrEna) @[src/main/scala/memory.scala 37:54]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[src/main/scala/memory.scala 37:29]
    node _GEN_0 = validif(UInt<1>("h1"), io_rdAddr) @[src/main/scala/memory.scala 39:{25,25}]
    node _memData_WIRE = _GEN_0 @[src/main/scala/memory.scala 39:25]
    node _memData_T = or(_memData_WIRE, UInt<10>("h0")) @[src/main/scala/memory.scala 39:25]
    node _memData_T_1 = bits(_memData_T, 9, 0) @[src/main/scala/memory.scala 39:25]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/memory.scala 34:24 39:{25,25}]
    node _GEN_2 = validif(UInt<1>("h1"), _memData_T_1) @[src/main/scala/memory.scala 39:{25,25}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[src/main/scala/memory.scala 39:{25,25}]
    node _GEN_4 = validif(io_wrEna, io_wrAddr) @[src/main/scala/memory.scala 41:18]
    node _GEN_5 = validif(io_wrEna, clock) @[src/main/scala/memory.scala 41:18]
    node _GEN_6 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/memory.scala 41:18 34:24]
    node _GEN_7 = validif(io_wrEna, UInt<1>("h1")) @[src/main/scala/memory.scala 41:18]
    node _GEN_8 = validif(io_wrEna, io_wrData) @[src/main/scala/memory.scala 41:18]
    node _io_rdData_T = mux(doForwardReg, wrDataReg, mem.memData.data) @[src/main/scala/memory.scala 45:19]
    io_rdData <= _io_rdData_T @[src/main/scala/memory.scala 45:13]
    mem.memData.addr <= _GEN_2
    mem.memData.en <= _GEN_1
    mem.memData.clk <= _GEN_3
    mem.MPORT.addr <= _GEN_4
    mem.MPORT.en <= _GEN_6
    mem.MPORT.clk <= _GEN_5
    mem.MPORT.data <= _GEN_8
    mem.MPORT.mask <= _GEN_7
    wrDataReg <= io_wrData @[src/main/scala/memory.scala 36:26]
    doForwardReg <= _doForwardReg_T_1 @[src/main/scala/memory.scala 37:29]
