FIRRTL version 1.2.0
circuit ClockDomains :
  module SourceClock :
    input clock : Clock
    input reset : UInt<1>
    output io_c_data : UInt<32> @[src/main/scala/ClockDomains.scala 8:14]
    output io_c_valid : UInt<1> @[src/main/scala/ClockDomains.scala 8:14]

    reg valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), valid) @[src/main/scala/ClockDomains.scala 12:22]
    reg cntReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[src/main/scala/ClockDomains.scala 13:23]
    reg xReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), xReg) @[src/main/scala/ClockDomains.scala 14:21]
    node _xReg_T = add(xReg, UInt<1>("h1")) @[src/main/scala/ClockDomains.scala 15:16]
    node _xReg_T_1 = tail(_xReg_T, 1) @[src/main/scala/ClockDomains.scala 15:16]
    node _valid_T = bits(xReg, 1, 1) @[src/main/scala/ClockDomains.scala 17:16]
    node _falling_T = eq(valid, UInt<1>("h0")) @[src/main/scala/ClockDomains.scala 18:17]
    reg falling_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), falling_REG) @[src/main/scala/ClockDomains.scala 18:33]
    node falling = and(_falling_T, falling_REG) @[src/main/scala/ClockDomains.scala 18:24]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[src/main/scala/ClockDomains.scala 20:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/ClockDomains.scala 20:22]
    node _GEN_0 = mux(falling, _cntReg_T_1, cntReg) @[src/main/scala/ClockDomains.scala 19:18 20:12 13:23]
    io_c_data <= cntReg @[src/main/scala/ClockDomains.scala 23:13]
    io_c_valid <= valid @[src/main/scala/ClockDomains.scala 22:14]
    valid <= mux(reset, UInt<1>("h0"), _valid_T) @[src/main/scala/ClockDomains.scala 12:{22,22} 17:9]
    cntReg <= mux(reset, UInt<32>("h0"), _GEN_0) @[src/main/scala/ClockDomains.scala 13:{23,23}]
    xReg <= mux(reset, UInt<2>("h0"), _xReg_T_1) @[src/main/scala/ClockDomains.scala 14:{21,21} 15:8]
    falling_REG <= valid @[src/main/scala/ClockDomains.scala 18:33]

  module SinkClock :
    input clock : Clock
    input reset : UInt<1>
    input io_c_data : UInt<32> @[src/main/scala/ClockDomains.scala 27:14]
    input io_c_valid : UInt<1> @[src/main/scala/ClockDomains.scala 27:14]
    output io_errorCnt : UInt<8> @[src/main/scala/ClockDomains.scala 27:14]

    reg expectedCntReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), expectedCntReg) @[src/main/scala/ClockDomains.scala 32:31]
    reg errCntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), errCntReg) @[src/main/scala/ClockDomains.scala 33:26]
    reg sampleReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), sampleReg) @[src/main/scala/ClockDomains.scala 34:26]
    reg rising_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rising_REG) @[src/main/scala/ClockDomains.scala 36:37]
    node _rising_T = eq(rising_REG, UInt<1>("h0")) @[src/main/scala/ClockDomains.scala 36:29]
    node rising = and(io_c_valid, _rising_T) @[src/main/scala/ClockDomains.scala 36:27]
    node _T = neq(expectedCntReg, io_c_data) @[src/main/scala/ClockDomains.scala 39:26]
    node _errCntReg_T = add(errCntReg, UInt<1>("h1")) @[src/main/scala/ClockDomains.scala 40:30]
    node _errCntReg_T_1 = tail(_errCntReg_T, 1) @[src/main/scala/ClockDomains.scala 40:30]
    node _GEN_0 = mux(_T, _errCntReg_T_1, errCntReg) @[src/main/scala/ClockDomains.scala 39:41 40:17 33:26]
    node _expectedCntReg_T = add(expectedCntReg, UInt<1>("h1")) @[src/main/scala/ClockDomains.scala 43:38]
    node _expectedCntReg_T_1 = tail(_expectedCntReg_T, 1) @[src/main/scala/ClockDomains.scala 43:38]
    node _GEN_1 = mux(rising, _GEN_0, errCntReg) @[src/main/scala/ClockDomains.scala 38:17 33:26]
    node _GEN_2 = mux(rising, io_c_data, sampleReg) @[src/main/scala/ClockDomains.scala 38:17 42:15 34:26]
    node _GEN_3 = mux(rising, _expectedCntReg_T_1, expectedCntReg) @[src/main/scala/ClockDomains.scala 38:17 43:20 32:31]
    io_errorCnt <= errCntReg @[src/main/scala/ClockDomains.scala 46:15]
    expectedCntReg <= mux(reset, UInt<32>("h0"), _GEN_3) @[src/main/scala/ClockDomains.scala 32:{31,31}]
    errCntReg <= mux(reset, UInt<8>("h0"), _GEN_1) @[src/main/scala/ClockDomains.scala 33:{26,26}]
    sampleReg <= mux(reset, UInt<32>("h0"), _GEN_2) @[src/main/scala/ClockDomains.scala 34:{26,26}]
    rising_REG <= io_c_valid @[src/main/scala/ClockDomains.scala 36:37]

  module ClockDomains :
    input clock : Clock
    input reset : UInt<1>
    output io_errCnt : UInt<8> @[src/main/scala/ClockDomains.scala 50:14]

    inst s of SourceClock @[src/main/scala/ClockDomains.scala 54:17]
    inst d of SinkClock @[src/main/scala/ClockDomains.scala 55:17]
    io_errCnt <= d.io_errorCnt @[src/main/scala/ClockDomains.scala 58:13]
    s.clock <= clock
    s.reset <= reset
    d.clock <= clock
    d.reset <= reset
    d.io_c_data <= s.io_c_data @[src/main/scala/ClockDomains.scala 57:10]
    d.io_c_valid <= s.io_c_valid @[src/main/scala/ClockDomains.scala 57:10]
