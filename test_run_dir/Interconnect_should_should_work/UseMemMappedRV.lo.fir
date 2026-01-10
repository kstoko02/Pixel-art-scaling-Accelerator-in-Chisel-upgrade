FIRRTL version 1.2.0
circuit UseMemMappedRV :
  module MemMappedRV :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_address : UInt<4> @[src/main/scala/interconnect.scala 62:14]
    input io_mem_rd : UInt<1> @[src/main/scala/interconnect.scala 62:14]
    input io_mem_wr : UInt<1> @[src/main/scala/interconnect.scala 62:14]
    output io_mem_rdData : UInt<32> @[src/main/scala/interconnect.scala 62:14]
    input io_mem_wrData : UInt<32> @[src/main/scala/interconnect.scala 62:14]
    output io_mem_ack : UInt<1> @[src/main/scala/interconnect.scala 62:14]
    input io_tx_ready : UInt<1> @[src/main/scala/interconnect.scala 62:14]
    output io_tx_valid : UInt<1> @[src/main/scala/interconnect.scala 62:14]
    output io_tx_bits : UInt<16> @[src/main/scala/interconnect.scala 62:14]
    output io_rx_ready : UInt<1> @[src/main/scala/interconnect.scala 62:14]
    input io_rx_valid : UInt<1> @[src/main/scala/interconnect.scala 62:14]
    input io_rx_bits : UInt<16> @[src/main/scala/interconnect.scala 62:14]

    reg statusReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), statusReg) @[src/main/scala/interconnect.scala 68:26]
    reg ackReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ackReg) @[src/main/scala/interconnect.scala 69:23]
    reg addrReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), addrReg) @[src/main/scala/interconnect.scala 70:24]
    reg rdDlyReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rdDlyReg) @[src/main/scala/interconnect.scala 71:25]
    node _statusReg_T = cat(io_rx_valid, io_tx_ready) @[src/main/scala/interconnect.scala 73:28]
    node _ackReg_T = or(io_mem_rd, io_mem_wr) @[src/main/scala/interconnect.scala 76:23]
    node _GEN_0 = mux(io_mem_rd, io_mem_address, addrReg) @[src/main/scala/interconnect.scala 80:20 81:13 70:24]
    node _T = eq(addrReg, UInt<1>("h1")) @[src/main/scala/interconnect.scala 85:17]
    node _T_1 = and(_T, rdDlyReg) @[src/main/scala/interconnect.scala 85:25]
    node _GEN_1 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/interconnect.scala 84:15 85:38 86:17]
    node _io_mem_rdData_T = eq(addrReg, UInt<1>("h0")) @[src/main/scala/interconnect.scala 88:32]
    node _io_mem_rdData_T_1 = mux(_io_mem_rdData_T, statusReg, io_rx_bits) @[src/main/scala/interconnect.scala 88:23]
    io_mem_rdData <= pad(_io_mem_rdData_T_1, 32) @[src/main/scala/interconnect.scala 88:17]
    io_mem_ack <= ackReg @[src/main/scala/interconnect.scala 77:14]
    io_tx_valid <= io_mem_wr @[src/main/scala/interconnect.scala 92:15]
    io_tx_bits <= bits(io_mem_wrData, 15, 0) @[src/main/scala/interconnect.scala 91:14]
    io_rx_ready <= _GEN_1
    statusReg <= mux(reset, UInt<2>("h0"), _statusReg_T) @[src/main/scala/interconnect.scala 68:{26,26} 73:13]
    ackReg <= mux(reset, UInt<1>("h0"), _ackReg_T) @[src/main/scala/interconnect.scala 69:{23,23} 76:10]
    addrReg <= bits(mux(reset, UInt<1>("h0"), _GEN_0), 0, 0) @[src/main/scala/interconnect.scala 70:{24,24}]
    rdDlyReg <= mux(reset, UInt<1>("h0"), io_mem_rd) @[src/main/scala/interconnect.scala 71:{25,25} 83:12]

  module RegFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_enq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]
    input io_deq_ready : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_valid : UInt<1> @[src/main/scala/fifo/fifo.scala 17:14]
    output io_deq_bits : UInt<16> @[src/main/scala/fifo/fifo.scala 17:14]

    reg memReg_0 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), memReg_0) @[src/main/scala/fifo/fifo.scala 131:19]
    reg memReg_1 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), memReg_1) @[src/main/scala/fifo/fifo.scala 131:19]
    reg memReg_2 : UInt<16>, clock with :
      reset => (UInt<1>("h0"), memReg_2) @[src/main/scala/fifo/fifo.scala 131:19]
    reg readPtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), readPtr) @[src/main/scala/fifo/fifo.scala 122:25]
    node _nextVal_T = eq(readPtr, UInt<2>("h2")) @[src/main/scala/fifo/fifo.scala 123:30]
    node _nextVal_T_1 = add(readPtr, UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 123:61]
    node _nextVal_T_2 = tail(_nextVal_T_1, 1) @[src/main/scala/fifo/fifo.scala 123:61]
    node nextRead = mux(_nextVal_T, UInt<1>("h0"), _nextVal_T_2) @[src/main/scala/fifo/fifo.scala 123:22]
    node op = cat(io_enq_valid, io_deq_ready) @[src/main/scala/fifo/fifo.scala 141:25]
    node _T = eq(UInt<1>("h0"), op) @[src/main/scala/fifo/fifo.scala 144:14]
    node _T_1 = eq(UInt<1>("h1"), op) @[src/main/scala/fifo/fifo.scala 144:14]
    reg emptyReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), emptyReg) @[src/main/scala/fifo/fifo.scala 138:25]
    node _T_2 = eq(emptyReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 147:12]
    node _GEN_4 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 147:23 150:18 133:29]
    node _T_3 = eq(UInt<2>("h2"), op) @[src/main/scala/fifo/fifo.scala 144:14]
    node _T_5 = eq(UInt<2>("h3"), op) @[src/main/scala/fifo/fifo.scala 144:14]
    node _T_7 = eq(emptyReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 172:12]
    node _GEN_15 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 172:23 179:18 133:29]
    node _GEN_19 = mux(_T_5, _GEN_15, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 144:14 133:29]
    node _GEN_23 = mux(_T_3, UInt<1>("h0"), _GEN_19) @[src/main/scala/fifo/fifo.scala 144:14 133:29]
    node _GEN_26 = mux(_T_1, _GEN_4, _GEN_23) @[src/main/scala/fifo/fifo.scala 144:14]
    node _GEN_30 = mux(_T, UInt<1>("h0"), _GEN_26) @[src/main/scala/fifo/fifo.scala 144:14 133:29]
    node incrRead = _GEN_30 @[src/main/scala/fifo/fifo.scala 133:29]
    node _GEN_0 = mux(incrRead, nextRead, readPtr) @[src/main/scala/fifo/fifo.scala 124:16 125:14 122:25]
    reg writePtr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), writePtr) @[src/main/scala/fifo/fifo.scala 122:25]
    node _nextVal_T_3 = eq(writePtr, UInt<2>("h2")) @[src/main/scala/fifo/fifo.scala 123:30]
    node _nextVal_T_4 = add(writePtr, UInt<1>("h1")) @[src/main/scala/fifo/fifo.scala 123:61]
    node _nextVal_T_5 = tail(_nextVal_T_4, 1) @[src/main/scala/fifo/fifo.scala 123:61]
    node nextWrite = mux(_nextVal_T_3, UInt<1>("h0"), _nextVal_T_5) @[src/main/scala/fifo/fifo.scala 123:22]
    reg fullReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), fullReg) @[src/main/scala/fifo/fifo.scala 139:24]
    node _T_4 = eq(fullReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 154:12]
    node _GEN_5 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 154:22 155:17 142:28]
    node _T_6 = eq(fullReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 162:12]
    node _GEN_9 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 162:22 163:17 142:28]
    node _GEN_16 = mux(_T_5, _GEN_9, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 144:14 142:28]
    node _GEN_20 = mux(_T_3, _GEN_5, _GEN_16) @[src/main/scala/fifo/fifo.scala 144:14]
    node _GEN_27 = mux(_T_1, UInt<1>("h0"), _GEN_20) @[src/main/scala/fifo/fifo.scala 144:14 142:28]
    node _GEN_31 = mux(_T, UInt<1>("h0"), _GEN_27) @[src/main/scala/fifo/fifo.scala 144:14 142:28]
    node incrWrite = _GEN_31 @[src/main/scala/fifo/fifo.scala 134:30]
    node _GEN_1 = mux(incrWrite, nextWrite, writePtr) @[src/main/scala/fifo/fifo.scala 124:16 125:14 122:25]
    node _emptyReg_T = eq(nextRead, writePtr) @[src/main/scala/fifo/fifo.scala 149:30]
    node _GEN_2 = mux(_T_2, UInt<1>("h0"), fullReg) @[src/main/scala/fifo/fifo.scala 147:23 148:17 139:24]
    node _GEN_3 = mux(_T_2, _emptyReg_T, emptyReg) @[src/main/scala/fifo/fifo.scala 147:23 149:18 138:25]
    node _fullReg_T = eq(nextWrite, readPtr) @[src/main/scala/fifo/fifo.scala 157:30]
    node _GEN_6 = mux(_T_4, UInt<1>("h0"), emptyReg) @[src/main/scala/fifo/fifo.scala 154:22 156:18 138:25]
    node _GEN_7 = mux(_T_4, _fullReg_T, fullReg) @[src/main/scala/fifo/fifo.scala 154:22 157:17 139:24]
    node _fullReg_T_1 = eq(nextWrite, nextRead) @[src/main/scala/fifo/fifo.scala 168:32]
    node _GEN_8 = mux(emptyReg, UInt<1>("h0"), _fullReg_T_1) @[src/main/scala/fifo/fifo.scala 165:24 166:19 168:19]
    node _GEN_10 = mux(_T_6, UInt<1>("h0"), emptyReg) @[src/main/scala/fifo/fifo.scala 162:22 164:18 138:25]
    node _GEN_11 = mux(_T_6, _GEN_8, fullReg) @[src/main/scala/fifo/fifo.scala 162:22 139:24]
    node _emptyReg_T_1 = eq(nextRead, nextWrite) @[src/main/scala/fifo/fifo.scala 177:32]
    node _GEN_12 = mux(fullReg, UInt<1>("h0"), _emptyReg_T_1) @[src/main/scala/fifo/fifo.scala 174:23 175:20 177:20]
    node _GEN_13 = mux(_T_7, UInt<1>("h0"), _GEN_11) @[src/main/scala/fifo/fifo.scala 172:23 173:17]
    node _GEN_14 = mux(_T_7, _GEN_12, _GEN_10) @[src/main/scala/fifo/fifo.scala 172:23]
    node _GEN_17 = mux(_T_5, _GEN_14, emptyReg) @[src/main/scala/fifo/fifo.scala 144:14 138:25]
    node _GEN_18 = mux(_T_5, _GEN_13, fullReg) @[src/main/scala/fifo/fifo.scala 144:14 139:24]
    node _GEN_21 = mux(_T_3, _GEN_6, _GEN_17) @[src/main/scala/fifo/fifo.scala 144:14]
    node _GEN_22 = mux(_T_3, _GEN_7, _GEN_18) @[src/main/scala/fifo/fifo.scala 144:14]
    node _GEN_24 = mux(_T_1, _GEN_2, _GEN_22) @[src/main/scala/fifo/fifo.scala 144:14]
    node _GEN_25 = mux(_T_1, _GEN_3, _GEN_21) @[src/main/scala/fifo/fifo.scala 144:14]
    node _GEN_28 = mux(_T, fullReg, _GEN_24) @[src/main/scala/fifo/fifo.scala 144:14 139:24]
    node _GEN_29 = mux(_T, emptyReg, _GEN_25) @[src/main/scala/fifo/fifo.scala 144:14 138:25]
    node _memReg_writePtr = io_enq_bits @[src/main/scala/fifo/fifo.scala 185:{22,22}]
    node _GEN_32 = mux(eq(UInt<1>("h0"), writePtr), _memReg_writePtr, memReg_0) @[src/main/scala/fifo/fifo.scala 131:19 185:{22,22}]
    node _GEN_33 = mux(eq(UInt<1>("h1"), writePtr), _memReg_writePtr, memReg_1) @[src/main/scala/fifo/fifo.scala 131:19 185:{22,22}]
    node _GEN_34 = mux(eq(UInt<2>("h2"), writePtr), _memReg_writePtr, memReg_2) @[src/main/scala/fifo/fifo.scala 131:19 185:{22,22}]
    node doWrite = _GEN_31 @[src/main/scala/fifo/fifo.scala 142:28]
    node _GEN_35 = mux(doWrite, _GEN_32, memReg_0) @[src/main/scala/fifo/fifo.scala 184:17 131:19]
    node _GEN_36 = mux(doWrite, _GEN_33, memReg_1) @[src/main/scala/fifo/fifo.scala 184:17 131:19]
    node _GEN_37 = mux(doWrite, _GEN_34, memReg_2) @[src/main/scala/fifo/fifo.scala 184:17 131:19]
    node _GEN_38 = validif(eq(UInt<1>("h0"), readPtr), memReg_0) @[src/main/scala/fifo/fifo.scala 188:{15,15}]
    node _GEN_39 = mux(eq(UInt<1>("h1"), readPtr), memReg_1, _GEN_38) @[src/main/scala/fifo/fifo.scala 188:{15,15}]
    node _GEN_40 = mux(eq(UInt<2>("h2"), readPtr), memReg_2, _GEN_39) @[src/main/scala/fifo/fifo.scala 188:{15,15}]
    node _io_enq_ready_T = eq(fullReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 189:19]
    node _io_deq_valid_T = eq(emptyReg, UInt<1>("h0")) @[src/main/scala/fifo/fifo.scala 190:19]
    node _memReg_readPtr = _GEN_40 @[src/main/scala/fifo/fifo.scala 188:15]
    io_enq_ready <= _io_enq_ready_T @[src/main/scala/fifo/fifo.scala 189:16]
    io_deq_valid <= _io_deq_valid_T @[src/main/scala/fifo/fifo.scala 190:16]
    io_deq_bits <= _memReg_readPtr @[src/main/scala/fifo/fifo.scala 188:15]
    memReg_0 <= _GEN_35
    memReg_1 <= _GEN_36
    memReg_2 <= _GEN_37
    readPtr <= mux(reset, UInt<2>("h0"), _GEN_0) @[src/main/scala/fifo/fifo.scala 122:{25,25}]
    writePtr <= mux(reset, UInt<2>("h0"), _GEN_1) @[src/main/scala/fifo/fifo.scala 122:{25,25}]
    emptyReg <= mux(reset, UInt<1>("h1"), _GEN_29) @[src/main/scala/fifo/fifo.scala 138:{25,25}]
    fullReg <= mux(reset, UInt<1>("h0"), _GEN_28) @[src/main/scala/fifo/fifo.scala 139:{24,24}]

  module UseMemMappedRV :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_address : UInt<4> @[src/main/scala/interconnect.scala 97:14]
    input io_mem_rd : UInt<1> @[src/main/scala/interconnect.scala 97:14]
    input io_mem_wr : UInt<1> @[src/main/scala/interconnect.scala 97:14]
    output io_mem_rdData : UInt<32> @[src/main/scala/interconnect.scala 97:14]
    input io_mem_wrData : UInt<32> @[src/main/scala/interconnect.scala 97:14]
    output io_mem_ack : UInt<1> @[src/main/scala/interconnect.scala 97:14]

    inst memDevice of MemMappedRV @[src/main/scala/interconnect.scala 101:25]
    inst fifo of RegFifo @[src/main/scala/interconnect.scala 102:20]
    io_mem_rdData <= memDevice.io_mem_rdData @[src/main/scala/interconnect.scala 105:10]
    io_mem_ack <= memDevice.io_mem_ack @[src/main/scala/interconnect.scala 105:10]
    memDevice.clock <= clock
    memDevice.reset <= reset
    memDevice.io_mem_address <= io_mem_address @[src/main/scala/interconnect.scala 105:10]
    memDevice.io_mem_rd <= io_mem_rd @[src/main/scala/interconnect.scala 105:10]
    memDevice.io_mem_wr <= io_mem_wr @[src/main/scala/interconnect.scala 105:10]
    memDevice.io_mem_wrData <= io_mem_wrData @[src/main/scala/interconnect.scala 105:10]
    memDevice.io_tx_ready <= fifo.io_enq_ready @[src/main/scala/interconnect.scala 103:19]
    memDevice.io_rx_valid <= fifo.io_deq_valid @[src/main/scala/interconnect.scala 104:19]
    memDevice.io_rx_bits <= fifo.io_deq_bits @[src/main/scala/interconnect.scala 104:19]
    fifo.clock <= clock
    fifo.reset <= reset
    fifo.io_enq_valid <= memDevice.io_tx_valid @[src/main/scala/interconnect.scala 103:19]
    fifo.io_enq_bits <= memDevice.io_tx_bits @[src/main/scala/interconnect.scala 103:19]
    fifo.io_deq_ready <= memDevice.io_rx_ready @[src/main/scala/interconnect.scala 104:19]
