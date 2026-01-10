FIRRTL version 1.2.0
circuit Pwm :
  module Pwm :
    input clock : Clock
    input reset : UInt<1>
    output io_led : UInt<4> @[src/main/scala/Pwm.scala 5:14]

    reg dout_cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), dout_cntReg) @[src/main/scala/Pwm.scala 11:25]
    node _dout_cntReg_T = eq(dout_cntReg, UInt<4>("h9")) @[src/main/scala/Pwm.scala 12:26]
    node _dout_cntReg_T_1 = add(dout_cntReg, UInt<1>("h1")) @[src/main/scala/Pwm.scala 12:58]
    node _dout_cntReg_T_2 = tail(_dout_cntReg_T_1, 1) @[src/main/scala/Pwm.scala 12:58]
    node _dout_cntReg_T_3 = mux(_dout_cntReg_T, UInt<1>("h0"), _dout_cntReg_T_2) @[src/main/scala/Pwm.scala 12:18]
    node dout = gt(UInt<2>("h3"), dout_cntReg) @[src/main/scala/Pwm.scala 13:9]
    reg modulationReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), modulationReg) @[src/main/scala/Pwm.scala 24:30]
    reg upReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), upReg) @[src/main/scala/Pwm.scala 26:22]
    node _T = lt(modulationReg, UInt<27>("h5f5e100")) @[src/main/scala/Pwm.scala 28:23]
    node _T_1 = and(_T, upReg) @[src/main/scala/Pwm.scala 28:32]
    node _modulationReg_T = add(modulationReg, UInt<1>("h1")) @[src/main/scala/Pwm.scala 29:36]
    node _modulationReg_T_1 = tail(_modulationReg_T, 1) @[src/main/scala/Pwm.scala 29:36]
    node _T_2 = eq(modulationReg, UInt<27>("h5f5e100")) @[src/main/scala/Pwm.scala 30:30]
    node _T_3 = and(_T_2, upReg) @[src/main/scala/Pwm.scala 30:41]
    node _T_4 = gt(modulationReg, UInt<1>("h0")) @[src/main/scala/Pwm.scala 32:30]
    node _T_5 = eq(upReg, UInt<1>("h0")) @[src/main/scala/Pwm.scala 32:39]
    node _T_6 = and(_T_4, _T_5) @[src/main/scala/Pwm.scala 32:36]
    node _modulationReg_T_2 = sub(modulationReg, UInt<1>("h1")) @[src/main/scala/Pwm.scala 33:36]
    node _modulationReg_T_3 = tail(_modulationReg_T_2, 1) @[src/main/scala/Pwm.scala 33:36]
    node _GEN_0 = mux(_T_6, _modulationReg_T_3, modulationReg) @[src/main/scala/Pwm.scala 32:47 33:19 24:30]
    node _GEN_1 = mux(_T_6, upReg, UInt<1>("h1")) @[src/main/scala/Pwm.scala 26:22 32:47 35:11]
    node _GEN_2 = mux(_T_3, UInt<1>("h0"), _GEN_1) @[src/main/scala/Pwm.scala 30:51 31:11]
    node _GEN_3 = mux(_T_3, modulationReg, _GEN_0) @[src/main/scala/Pwm.scala 24:30 30:51]
    node _GEN_4 = mux(_T_1, _modulationReg_T_1, _GEN_3) @[src/main/scala/Pwm.scala 28:42 29:19]
    node _GEN_5 = mux(_T_1, upReg, _GEN_2) @[src/main/scala/Pwm.scala 26:22 28:42]
    node _sig_T = shr(modulationReg, 10) @[src/main/scala/Pwm.scala 39:36]
    reg sig_cntReg : UInt<17>, clock with :
      reset => (UInt<1>("h0"), sig_cntReg) @[src/main/scala/Pwm.scala 11:25]
    node _sig_cntReg_T = eq(sig_cntReg, UInt<17>("h1869f")) @[src/main/scala/Pwm.scala 12:26]
    node _sig_cntReg_T_1 = add(sig_cntReg, UInt<1>("h1")) @[src/main/scala/Pwm.scala 12:58]
    node _sig_cntReg_T_2 = tail(_sig_cntReg_T_1, 1) @[src/main/scala/Pwm.scala 12:58]
    node _sig_cntReg_T_3 = mux(_sig_cntReg_T, UInt<1>("h0"), _sig_cntReg_T_2) @[src/main/scala/Pwm.scala 12:18]
    node sig = gt(_sig_T, sig_cntReg) @[src/main/scala/Pwm.scala 13:9]
    node io_led_hi = cat(UInt<1>("h0"), sig) @[src/main/scala/Pwm.scala 43:16]
    node _io_led_T = cat(io_led_hi, dout) @[src/main/scala/Pwm.scala 43:16]
    io_led <= pad(_io_led_T, 4) @[src/main/scala/Pwm.scala 43:10]
    dout_cntReg <= mux(reset, UInt<4>("h0"), _dout_cntReg_T_3) @[src/main/scala/Pwm.scala 11:{25,25} 12:12]
    modulationReg <= mux(reset, UInt<32>("h0"), _GEN_4) @[src/main/scala/Pwm.scala 24:{30,30}]
    upReg <= mux(reset, UInt<1>("h1"), _GEN_5) @[src/main/scala/Pwm.scala 26:{22,22}]
    sig_cntReg <= mux(reset, UInt<17>("h0"), _sig_cntReg_T_3) @[src/main/scala/Pwm.scala 11:{25,25} 12:12]
