FIRRTL version 1.2.0
circuit MemFifo :
  module MemFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_deq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]

    mem mem : @[src/main/scala/fifo/fifo.scala 206:24]
      data-type => UInt<16>
      depth => 4
      read-latency => 1
      write-latency => 1
      reader => data_MPORT
      writer => MPORT
      read-under-write => new
    reg readPtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), readPtr) @[src/main/scala/fifo/fifo.scala 198:25]
    node _nextVal_T = eq(readPtr, UInt<2>("h3")) @[src/main/scala/fifo/fifo.scala 199:30]
    node _nextVal_T_1 = add(readPtr, UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 199:61]
    node _nextVal_T_2 = tail(_nextVal_T_1, 1) @[src/main/scala/fifo/fifo.scala 199:61]
    node nextRead = mux(_nextVal_T, UInt<1>("h0"), _nextVal_T_2) @[src/main/scala/fifo/fifo.scala 199:22]
    reg outputValidReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputValidReg) @[src/main/scala/fifo/fifo.scala 217:31]
    node _readCond_T = eq(outputValidReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 232:5]
    reg writePtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), writePtr) @[src/main/scala/fifo/fifo.scala 198:25]
    node _readCond_T_1 = neq(readPtr, writePtr) @[src/main/scala/fifo/fifo.scala 232:34]
    reg fullReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), fullReg) @[src/main/scala/fifo/fifo.scala 214:24]
    node _readCond_T_2 = or(_readCond_T_1, fullReg) @[src/main/scala/fifo/fifo.scala 232:48]
    node readCond = and(_readCond_T, _readCond_T_2) @[src/main/scala/fifo/fifo.scala 232:21]
    node _GEN_11 = mux(readCond, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 233:18 234:10 218:25]
    node incrRead = _GEN_11 @[src/main/scala/fifo/fifo.scala 208:29]
    node _GEN_0 = mux(incrRead, nextRead, readPtr) @[src/main/scala/fifo/fifo.scala 200:16 201:14 198:25]
    node _nextVal_T_3 = eq(writePtr, UInt<2>("h3")) @[src/main/scala/fifo/fifo.scala 199:30]
    node _nextVal_T_4 = add(writePtr, UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 199:61]
    node _nextVal_T_5 = tail(_nextVal_T_4, 1) @[src/main/scala/fifo/fifo.scala 199:61]
    node nextWrite = mux(_nextVal_T_3, UInt<1>("h0"), _nextVal_T_5) @[src/main/scala/fifo/fifo.scala 199:22]
    node _T_1 = and(io_enq_ready, io_enq_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_19 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 246:21 249:15 209:30]
    node incrWrite = _GEN_19 @[src/main/scala/fifo/fifo.scala 209:30]
    node _GEN_1 = mux(incrWrite, nextWrite, writePtr) @[src/main/scala/fifo/fifo.scala 200:16 201:14 198:25]
    reg emptyReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), emptyReg) @[src/main/scala/fifo/fifo.scala 213:25]
    reg outputReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), outputReg) @[src/main/scala/fifo/fifo.scala 216:22]
    node _io_enq_ready_T = eq(fullReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 221:19]
    node _GEN_2 = validif(UInt<1>("h1"), readPtr) @[src/main/scala/fifo/fifo.scala 225:{19,19}]
    node _data_WIRE = _GEN_2 @[src/main/scala/fifo/fifo.scala 225:19]
    node _data_T = or(_data_WIRE, UInt<2>("h0")) @[src/main/scala/fifo/fifo.scala 225:19]
    node _data_T_1 = bits(_data_T, 1, 0) @[src/main/scala/fifo/fifo.scala 225:19]
    node _GEN_3 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 225:{19,19} 206:24]
    node _GEN_4 = validif(UInt<1>("h1"), _data_T_1) @[src/main/scala/fifo/fifo.scala 225:{19,19}]
    node _GEN_5 = validif(UInt<1>("h1"), clock) @[src/main/scala/fifo/fifo.scala 225:{19,19}]
    node doWrite = _GEN_19 @[src/main/scala/fifo/fifo.scala 223:28]
    node _GEN_6 = validif(doWrite, writePtr) @[src/main/scala/fifo/fifo.scala 227:17]
    node _GEN_7 = validif(doWrite, clock) @[src/main/scala/fifo/fifo.scala 227:17]
    node _GEN_8 = mux(doWrite, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 227:17 206:24]
    node _GEN_9 = validif(doWrite, UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 227:17]
    node _GEN_10 = validif(doWrite, io_enq_bits) @[src/main/scala/fifo/fifo.scala 227:17]
    node _emptyReg_T = eq(nextRead, writePtr) @[src/main/scala/fifo/fifo.scala 238:26]
    node data = mem.data_MPORT.data @[src/main/scala/fifo/fifo.scala 224:18 225:8]
    node _GEN_12 = mux(readCond, data, outputReg) @[src/main/scala/fifo/fifo.scala 233:18 236:15 216:22]
    node _GEN_13 = mux(readCond, UInt<1>("h1"), outputValidReg) @[src/main/scala/fifo/fifo.scala 233:18 237:20 217:31]
    node _GEN_14 = mux(readCond, _emptyReg_T, emptyReg) @[src/main/scala/fifo/fifo.scala 233:18 238:14 213:25]
    node _GEN_15 = mux(readCond, UInt<1>("h0"), fullReg) @[src/main/scala/fifo/fifo.scala 233:18 239:13 214:24]
    node _T = and(io_deq_ready, io_deq_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_16 = mux(_T, UInt<1>("h0"), _GEN_13) @[src/main/scala/fifo/fifo.scala 241:21 242:20]
    node _fullReg_T = eq(nextWrite, readPtr) @[src/main/scala/fifo/fifo.scala 248:27]
    node read = _GEN_11 @[src/main/scala/fifo/fifo.scala 218:25]
    node _fullReg_T_1 = eq(read, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 248:42]
    node _fullReg_T_2 = and(_fullReg_T, _fullReg_T_1) @[src/main/scala/fifo/fifo.scala 248:40]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_14) @[src/main/scala/fifo/fifo.scala 246:21 247:14]
    node _GEN_18 = mux(_T_1, _fullReg_T_2, _GEN_15) @[src/main/scala/fifo/fifo.scala 246:21 248:13]
    io_enq_ready <= _io_enq_ready_T @[src/main/scala/fifo/fifo.scala 221:16]
    io_deq_valid <= outputValidReg @[src/main/scala/fifo/fifo.scala 220:16]
    io_deq_bits <= outputReg @[src/main/scala/fifo/fifo.scala 244:15]
    mem.data_MPORT.addr <= _GEN_4
    mem.data_MPORT.en <= _GEN_3
    mem.data_MPORT.clk <= _GEN_5
    mem.MPORT.addr <= _GEN_6
    mem.MPORT.en <= _GEN_8
    mem.MPORT.clk <= _GEN_7
    mem.MPORT.data <= _GEN_10
    mem.MPORT.mask <= _GEN_9
    readPtr <= mux(reset, UInt<2>("h0"), _GEN_0) @[src/main/scala/fifo/fifo.scala 198:{25,25}]
    writePtr <= mux(reset, UInt<2>("h0"), _GEN_1) @[src/main/scala/fifo/fifo.scala 198:{25,25}]
    emptyReg <= mux(reset, UInt<1>("h1"), _GEN_17) @[src/main/scala/fifo/fifo.scala 213:{25,25}]
    fullReg <= mux(reset, UInt<1>("h0"), _GEN_18) @[src/main/scala/fifo/fifo.scala 214:{24,24}]
    outputReg <= _GEN_12
    outputValidReg <= mux(reset, UInt<1>("h0"), _GEN_16) @[src/main/scala/fifo/fifo.scala 217:{31,31}]
