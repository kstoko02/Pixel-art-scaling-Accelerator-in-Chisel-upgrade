FIRRTL version 1.2.0
circuit FrameStore :
  module FrameStore :
    input clock : Clock
    input reset : UInt<1>
    input io_sof : UInt<1> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    input io_imgW : UInt<16> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    input io_imgH : UInt<16> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    input io_inPixel : UInt<24> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    input io_inValid : UInt<1> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    output io_inReady : UInt<1> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    output io_outPixel : UInt<24> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    output io_outValid : UInt<1> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    input io_outReady : UInt<1> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]
    output io_busy : UInt<1> @[src/main/scala/Pixel Art/FrameStore.scala 22:14]

    mem mem : @[src/main/scala/Pixel Art/FrameStore.scala 52:24]
      data-type => UInt<24>
      depth => 4194304
      read-latency => 1
      write-latency => 1
      reader => rdData
      writer => MPORT
      read-under-write => undefined
    reg wReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), wReg) @[src/main/scala/Pixel Art/FrameStore.scala 45:21]
    reg hReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), hReg) @[src/main/scala/Pixel Art/FrameStore.scala 46:21]
    reg totalPixels : UInt<23>, clock with :
      reset => (UInt<1>("h0"), totalPixels) @[src/main/scala/Pixel Art/FrameStore.scala 47:28]
    reg wrAddr : UInt<23>, clock with :
      reset => (UInt<1>("h0"), wrAddr) @[src/main/scala/Pixel Art/FrameStore.scala 57:25]
    reg rdAddr : UInt<23>, clock with :
      reset => (UInt<1>("h0"), rdAddr) @[src/main/scala/Pixel Art/FrameStore.scala 58:25]
    reg outCount : UInt<23>, clock with :
      reset => (UInt<1>("h0"), outCount) @[src/main/scala/Pixel Art/FrameStore.scala 59:25]
    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[src/main/scala/Pixel Art/FrameStore.scala 65:22]
    node _inReadyW_T = eq(state, UInt<2>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 70:37]
    node _busyW_T = neq(state, UInt<2>("h3")) @[src/main/scala/Pixel Art/FrameStore.scala 73:37]
    node _totalPixels_T = mul(io_imgW, io_imgH) @[src/main/scala/Pixel Art/FrameStore.scala 86:29]
    node _totalPixels_T_1 = bits(_totalPixels_T, 22, 0) @[src/main/scala/Pixel Art/FrameStore.scala 86:39]
    node _GEN_0 = mux(io_sof, io_imgW, wReg) @[src/main/scala/Pixel Art/FrameStore.scala 45:21 src/main/scala/Pixel Art/FrameStore.scala 83:16 src/main/scala/Pixel Art/FrameStore.scala 84:10]
    node _GEN_1 = mux(io_sof, io_imgH, hReg) @[src/main/scala/Pixel Art/FrameStore.scala 46:21 src/main/scala/Pixel Art/FrameStore.scala 83:16 src/main/scala/Pixel Art/FrameStore.scala 85:10]
    node _GEN_2 = mux(io_sof, _totalPixels_T_1, totalPixels) @[src/main/scala/Pixel Art/FrameStore.scala 47:28 src/main/scala/Pixel Art/FrameStore.scala 83:16 src/main/scala/Pixel Art/FrameStore.scala 86:17]
    node _GEN_3 = mux(io_sof, UInt<1>("h0"), wrAddr) @[src/main/scala/Pixel Art/FrameStore.scala 57:25 src/main/scala/Pixel Art/FrameStore.scala 83:16 src/main/scala/Pixel Art/FrameStore.scala 88:12]
    node _GEN_4 = mux(io_sof, UInt<1>("h0"), rdAddr) @[src/main/scala/Pixel Art/FrameStore.scala 58:25 src/main/scala/Pixel Art/FrameStore.scala 83:16 src/main/scala/Pixel Art/FrameStore.scala 89:12]
    node _GEN_5 = mux(io_sof, UInt<1>("h0"), outCount) @[src/main/scala/Pixel Art/FrameStore.scala 59:25 src/main/scala/Pixel Art/FrameStore.scala 83:16 src/main/scala/Pixel Art/FrameStore.scala 90:14]
    node _GEN_6 = mux(io_sof, UInt<2>("h0"), state) @[src/main/scala/Pixel Art/FrameStore.scala 65:22 src/main/scala/Pixel Art/FrameStore.scala 83:16 src/main/scala/Pixel Art/FrameStore.scala 91:11]
    node inFire = and(io_inValid, io_inReady) @[src/main/scala/Pixel Art/FrameStore.scala 97:27]
    node _T = eq(state, UInt<2>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 99:14]
    node _T_1 = lt(wrAddr, UInt<23>("h400000")) @[src/main/scala/Pixel Art/FrameStore.scala 101:19]
    node _T_2 = bits(wrAddr, 21, 0)
    node _GEN_7 = validif(_T_1, _T_2) @[src/main/scala/Pixel Art/FrameStore.scala 101:34]
    node _GEN_8 = validif(_T_1, clock) @[src/main/scala/Pixel Art/FrameStore.scala 101:34]
    node _GEN_9 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 101:34 src/main/scala/Pixel Art/FrameStore.scala 52:24]
    node _GEN_10 = validif(_T_1, UInt<1>("h1")) @[src/main/scala/Pixel Art/FrameStore.scala 101:34]
    node _GEN_11 = validif(_T_1, io_inPixel) @[src/main/scala/Pixel Art/FrameStore.scala 101:34]
    node _wrAddr_T = add(wrAddr, UInt<1>("h1")) @[src/main/scala/Pixel Art/FrameStore.scala 104:24]
    node _wrAddr_T_1 = tail(_wrAddr_T, 1) @[src/main/scala/Pixel Art/FrameStore.scala 104:24]
    node _T_3 = add(wrAddr, UInt<1>("h1")) @[src/main/scala/Pixel Art/FrameStore.scala 107:20]
    node _T_4 = tail(_T_3, 1) @[src/main/scala/Pixel Art/FrameStore.scala 107:20]
    node _T_5 = eq(_T_4, totalPixels) @[src/main/scala/Pixel Art/FrameStore.scala 107:27]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), _GEN_4) @[src/main/scala/Pixel Art/FrameStore.scala 107:44 src/main/scala/Pixel Art/FrameStore.scala 108:16]
    node _GEN_13 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[src/main/scala/Pixel Art/FrameStore.scala 107:44 src/main/scala/Pixel Art/FrameStore.scala 109:18]
    node _GEN_14 = mux(_T_5, UInt<2>("h1"), _GEN_6) @[src/main/scala/Pixel Art/FrameStore.scala 107:44 src/main/scala/Pixel Art/FrameStore.scala 110:15]
    node _GEN_15 = validif(inFire, _GEN_7) @[src/main/scala/Pixel Art/FrameStore.scala 100:18]
    node _GEN_16 = validif(inFire, _GEN_8) @[src/main/scala/Pixel Art/FrameStore.scala 100:18]
    node _GEN_17 = mux(inFire, _GEN_9, UInt<1>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 100:18 src/main/scala/Pixel Art/FrameStore.scala 52:24]
    node _GEN_18 = validif(inFire, _GEN_10) @[src/main/scala/Pixel Art/FrameStore.scala 100:18]
    node _GEN_19 = validif(inFire, _GEN_11) @[src/main/scala/Pixel Art/FrameStore.scala 100:18]
    node _GEN_20 = mux(inFire, _wrAddr_T_1, _GEN_3) @[src/main/scala/Pixel Art/FrameStore.scala 100:18 src/main/scala/Pixel Art/FrameStore.scala 104:14]
    node _GEN_21 = mux(inFire, _GEN_12, _GEN_4) @[src/main/scala/Pixel Art/FrameStore.scala 100:18]
    node _GEN_22 = mux(inFire, _GEN_13, _GEN_5) @[src/main/scala/Pixel Art/FrameStore.scala 100:18]
    node _GEN_23 = mux(inFire, _GEN_14, _GEN_6) @[src/main/scala/Pixel Art/FrameStore.scala 100:18]
    node _GEN_24 = validif(_T, _GEN_15) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_25 = validif(_T, _GEN_16) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_26 = mux(_T, _GEN_17, UInt<1>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 52:24 src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_27 = validif(_T, _GEN_18) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_28 = validif(_T, _GEN_19) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_29 = mux(_T, _GEN_20, _GEN_3) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_30 = mux(_T, _GEN_21, _GEN_4) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_31 = mux(_T, _GEN_22, _GEN_5) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _GEN_32 = mux(_T, _GEN_23, _GEN_6) @[src/main/scala/Pixel Art/FrameStore.scala 99:26]
    node _T_6 = eq(UInt<2>("h1"), state) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _GEN_52 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 118:25 src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 123:12]
    node rdEn = _GEN_52 @[src/main/scala/Pixel Art/FrameStore.scala 118:25]
    node _GEN_33 = validif(rdEn, rdAddr) @[src/main/scala/Pixel Art/FrameStore.scala 119:24 src/main/scala/Pixel Art/FrameStore.scala 119:24]
    node _rdData_WIRE = _GEN_33 @[src/main/scala/Pixel Art/FrameStore.scala 119:24]
    node _rdData_T = or(_rdData_WIRE, UInt<22>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 119:24]
    node _rdData_T_1 = bits(_rdData_T, 21, 0) @[src/main/scala/Pixel Art/FrameStore.scala 119:24]
    node _GEN_34 = mux(rdEn, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 119:24 src/main/scala/Pixel Art/FrameStore.scala 119:24 src/main/scala/Pixel Art/FrameStore.scala 52:24]
    node _GEN_35 = validif(rdEn, _rdData_T_1) @[src/main/scala/Pixel Art/FrameStore.scala 119:24 src/main/scala/Pixel Art/FrameStore.scala 119:24]
    node _GEN_36 = validif(rdEn, clock) @[src/main/scala/Pixel Art/FrameStore.scala 119:24 src/main/scala/Pixel Art/FrameStore.scala 119:24]
    node _T_7 = eq(UInt<2>("h2"), state) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _outCount_T = add(outCount, UInt<1>("h1")) @[src/main/scala/Pixel Art/FrameStore.scala 132:30]
    node _outCount_T_1 = tail(_outCount_T, 1) @[src/main/scala/Pixel Art/FrameStore.scala 132:30]
    node _rdAddr_T = add(rdAddr, UInt<1>("h1")) @[src/main/scala/Pixel Art/FrameStore.scala 133:26]
    node _rdAddr_T_1 = tail(_rdAddr_T, 1) @[src/main/scala/Pixel Art/FrameStore.scala 133:26]
    node _T_8 = add(outCount, UInt<1>("h1")) @[src/main/scala/Pixel Art/FrameStore.scala 135:24]
    node _T_9 = tail(_T_8, 1) @[src/main/scala/Pixel Art/FrameStore.scala 135:24]
    node _T_10 = eq(_T_9, totalPixels) @[src/main/scala/Pixel Art/FrameStore.scala 135:31]
    node _GEN_37 = mux(_T_10, UInt<2>("h3"), UInt<2>("h1")) @[src/main/scala/Pixel Art/FrameStore.scala 135:48 src/main/scala/Pixel Art/FrameStore.scala 136:17 src/main/scala/Pixel Art/FrameStore.scala 138:17]
    node _GEN_38 = mux(io_outReady, _outCount_T_1, _GEN_31) @[src/main/scala/Pixel Art/FrameStore.scala 131:25 src/main/scala/Pixel Art/FrameStore.scala 132:18]
    node _GEN_39 = mux(io_outReady, _rdAddr_T_1, _GEN_30) @[src/main/scala/Pixel Art/FrameStore.scala 131:25 src/main/scala/Pixel Art/FrameStore.scala 133:16]
    node _GEN_40 = mux(io_outReady, _GEN_37, _GEN_32) @[src/main/scala/Pixel Art/FrameStore.scala 131:25]
    node _T_11 = eq(UInt<2>("h3"), state) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _GEN_41 = mux(_T_11, UInt<1>("h0"), _inReadyW_T) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 144:16 src/main/scala/Pixel Art/FrameStore.scala 70:30]
    node _GEN_42 = mux(_T_11, UInt<1>("h0"), UInt<1>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 145:17 src/main/scala/Pixel Art/FrameStore.scala 71:30]
    node _GEN_43 = mux(_T_11, UInt<1>("h0"), UInt<24>("h0")) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 146:17 src/main/scala/Pixel Art/FrameStore.scala 72:30]
    node _GEN_44 = mux(_T_11, UInt<1>("h0"), _busyW_T) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 147:13 src/main/scala/Pixel Art/FrameStore.scala 73:30]
    node _GEN_45 = mux(_T_7, UInt<1>("h1"), _GEN_42) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 128:17]
    node _GEN_46 = mux(_T_7, mem.rdData.data, _GEN_43) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 129:17]
    node _GEN_47 = mux(_T_7, _GEN_38, _GEN_31) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _GEN_48 = mux(_T_7, _GEN_39, _GEN_30) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _GEN_49 = mux(_T_7, _GEN_40, _GEN_32) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _GEN_50 = mux(_T_7, _inReadyW_T, _GEN_41) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 70:30]
    node _GEN_51 = mux(_T_7, _busyW_T, _GEN_44) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 73:30]
    node _GEN_53 = mux(_T_6, UInt<2>("h2"), _GEN_49) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 124:13]
    node _GEN_54 = mux(_T_6, UInt<1>("h0"), _GEN_45) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 71:30]
    node _GEN_55 = mux(_T_6, UInt<24>("h0"), _GEN_46) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 72:30]
    node _GEN_56 = mux(_T_6, _GEN_31, _GEN_47) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _GEN_57 = mux(_T_6, _GEN_30, _GEN_48) @[src/main/scala/Pixel Art/FrameStore.scala 121:17]
    node _GEN_58 = mux(_T_6, _inReadyW_T, _GEN_50) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 70:30]
    node _GEN_59 = mux(_T_6, _busyW_T, _GEN_51) @[src/main/scala/Pixel Art/FrameStore.scala 121:17 src/main/scala/Pixel Art/FrameStore.scala 73:30]
    node inReadyW = _GEN_58 @[src/main/scala/Pixel Art/FrameStore.scala 70:30]
    node outValidW = _GEN_54 @[src/main/scala/Pixel Art/FrameStore.scala 71:30]
    node outPixelW = _GEN_55 @[src/main/scala/Pixel Art/FrameStore.scala 72:30]
    node busyW = _GEN_59 @[src/main/scala/Pixel Art/FrameStore.scala 73:30]
    io_inReady <= inReadyW @[src/main/scala/Pixel Art/FrameStore.scala 75:15]
    io_outPixel <= outPixelW @[src/main/scala/Pixel Art/FrameStore.scala 77:15]
    io_outValid <= outValidW @[src/main/scala/Pixel Art/FrameStore.scala 76:15]
    io_busy <= busyW @[src/main/scala/Pixel Art/FrameStore.scala 78:15]
    wReg <= mux(reset, UInt<16>("h0"), _GEN_0) @[src/main/scala/Pixel Art/FrameStore.scala 45:21 src/main/scala/Pixel Art/FrameStore.scala 45:21]
    hReg <= mux(reset, UInt<16>("h0"), _GEN_1) @[src/main/scala/Pixel Art/FrameStore.scala 46:21 src/main/scala/Pixel Art/FrameStore.scala 46:21]
    totalPixels <= mux(reset, UInt<23>("h0"), _GEN_2) @[src/main/scala/Pixel Art/FrameStore.scala 47:28 src/main/scala/Pixel Art/FrameStore.scala 47:28]
    mem.rdData.addr <= _GEN_35
    mem.rdData.en <= _GEN_34
    mem.rdData.clk <= _GEN_36
    mem.MPORT.addr <= _GEN_24
    mem.MPORT.en <= _GEN_26
    mem.MPORT.clk <= _GEN_25
    mem.MPORT.data <= _GEN_28
    mem.MPORT.mask <= _GEN_27
    wrAddr <= mux(reset, UInt<23>("h0"), _GEN_29) @[src/main/scala/Pixel Art/FrameStore.scala 57:25 src/main/scala/Pixel Art/FrameStore.scala 57:25]
    rdAddr <= mux(reset, UInt<23>("h0"), _GEN_57) @[src/main/scala/Pixel Art/FrameStore.scala 58:25 src/main/scala/Pixel Art/FrameStore.scala 58:25]
    outCount <= mux(reset, UInt<23>("h0"), _GEN_56) @[src/main/scala/Pixel Art/FrameStore.scala 59:25 src/main/scala/Pixel Art/FrameStore.scala 59:25]
    state <= mux(reset, UInt<2>("h0"), _GEN_53) @[src/main/scala/Pixel Art/FrameStore.scala 65:22 src/main/scala/Pixel Art/FrameStore.scala 65:22]
