FIRRTL version 1.2.0
circuit BundleVec :
  module BundleVec :
    input clock : Clock
    input reset : UInt<1>
    output io_chan_data : UInt<32> @[src/main/scala/BundleVec.scala 11:14]
    output io_chan_valid : UInt<1> @[src/main/scala/BundleVec.scala 11:14]
    output io_chan2_data : UInt<32> @[src/main/scala/BundleVec.scala 11:14]
    output io_chan2_valid : UInt<1> @[src/main/scala/BundleVec.scala 11:14]
    input io_idx : UInt<4> @[src/main/scala/BundleVec.scala 11:14]
    output io_array : UInt<4> @[src/main/scala/BundleVec.scala 11:14]
    input io_dIn : UInt<32> @[src/main/scala/BundleVec.scala 11:14]
    output io_dOut : UInt<32> @[src/main/scala/BundleVec.scala 11:14]
    output io_bvOut : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    output io_chreg_data : UInt<32> @[src/main/scala/BundleVec.scala 11:14]
    output io_chreg_valid : UInt<1> @[src/main/scala/BundleVec.scala 11:14]
    input io_din : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    output io_dout : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    input io_rdIdx : UInt<2> @[src/main/scala/BundleVec.scala 11:14]
    input io_wrIdx : UInt<2> @[src/main/scala/BundleVec.scala 11:14]
    input io_selMux : UInt<2> @[src/main/scala/BundleVec.scala 11:14]
    output io_muxOut : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    input io_selVec : UInt<5> @[src/main/scala/BundleVec.scala 11:14]
    input io_selVecCond : UInt<1> @[src/main/scala/BundleVec.scala 11:14]
    output io_defVecOut : UInt<3> @[src/main/scala/BundleVec.scala 11:14]
    input io_defVecSigIn_0 : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    input io_defVecSigIn_1 : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    input io_defVecSigIn_2 : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    input io_defVecSigIn_3 : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    input io_defVecSigIn_4 : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    input io_defVecSigIn_5 : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    output io_defVecSigOut : UInt<8> @[src/main/scala/BundleVec.scala 11:14]
    output io_regVecOut_0 : UInt<3> @[src/main/scala/BundleVec.scala 11:14]
    output io_regVecOut_1 : UInt<3> @[src/main/scala/BundleVec.scala 11:14]
    output io_regVecOut_2 : UInt<3> @[src/main/scala/BundleVec.scala 11:14]
    output io_resetRegFileOut : UInt<32> @[src/main/scala/BundleVec.scala 11:14]

    node _io_array_T = bits(io_idx, 1, 0)
    node v_0 = UInt<4>("h1") @[src/main/scala/BundleVec.scala 52:15 56:8]
    node _GEN_0 = validif(eq(UInt<1>("h0"), _io_array_T), v_0) @[src/main/scala/BundleVec.scala 64:{12,12}]
    node v_1 = UInt<4>("h3") @[src/main/scala/BundleVec.scala 52:15 57:8]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _io_array_T), v_1, _GEN_0) @[src/main/scala/BundleVec.scala 64:{12,12}]
    node v_2 = UInt<4>("h5") @[src/main/scala/BundleVec.scala 52:15 58:8]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _io_array_T), v_2, _GEN_1) @[src/main/scala/BundleVec.scala 64:{12,12}]
    reg vReg_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), vReg_0) @[src/main/scala/BundleVec.scala 71:17]
    reg vReg_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), vReg_1) @[src/main/scala/BundleVec.scala 71:17]
    reg vReg_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), vReg_2) @[src/main/scala/BundleVec.scala 71:17]
    node _vReg_io_wrIdx = io_din @[src/main/scala/BundleVec.scala 74:{15,15}]
    node _GEN_3 = mux(eq(UInt<1>("h0"), io_wrIdx), _vReg_io_wrIdx, vReg_0) @[src/main/scala/BundleVec.scala 74:{15,15} 71:17]
    node _GEN_4 = mux(eq(UInt<1>("h1"), io_wrIdx), _vReg_io_wrIdx, vReg_1) @[src/main/scala/BundleVec.scala 74:{15,15} 71:17]
    node _GEN_5 = mux(eq(UInt<2>("h2"), io_wrIdx), _vReg_io_wrIdx, vReg_2) @[src/main/scala/BundleVec.scala 74:{15,15} 71:17]
    node _GEN_6 = validif(eq(UInt<1>("h0"), io_rdIdx), vReg_0) @[src/main/scala/BundleVec.scala 76:{11,11}]
    node _GEN_7 = mux(eq(UInt<1>("h1"), io_rdIdx), vReg_1, _GEN_6) @[src/main/scala/BundleVec.scala 76:{11,11}]
    node _GEN_8 = mux(eq(UInt<2>("h2"), io_rdIdx), vReg_2, _GEN_7) @[src/main/scala/BundleVec.scala 76:{11,11}]
    node m_0 = UInt<8>("h0") @[src/main/scala/BundleVec.scala 84:15 85:8]
    node _GEN_9 = validif(eq(UInt<1>("h0"), io_selMux), m_0) @[src/main/scala/BundleVec.scala 90:{13,13}]
    node m_1 = UInt<8>("hb") @[src/main/scala/BundleVec.scala 84:15 86:8]
    node _GEN_10 = mux(eq(UInt<1>("h1"), io_selMux), m_1, _GEN_9) @[src/main/scala/BundleVec.scala 90:{13,13}]
    node m_2 = UInt<8>("h16") @[src/main/scala/BundleVec.scala 84:15 87:8]
    node _GEN_11 = mux(eq(UInt<2>("h2"), io_selMux), m_2, _GEN_10) @[src/main/scala/BundleVec.scala 90:{13,13}]
    reg registerFile_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_0) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_1) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_2) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_3) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_4) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_5) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_6) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_7) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_8) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_9) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_10) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_11) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_12) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_13) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_14) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_15) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_16) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_17) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_18) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_19) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_20) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_21) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_22) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_23) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_24) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_25) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_26) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_27) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_28) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_29) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_30) @[src/main/scala/BundleVec.scala 95:25]
    reg registerFile_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_31) @[src/main/scala/BundleVec.scala 95:25]
    reg channelReg_data : UInt<32>, clock with :
      reset => (UInt<1>("h0"), channelReg_data) @[src/main/scala/BundleVec.scala 137:27]
    reg channelReg_valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), channelReg_valid) @[src/main/scala/BundleVec.scala 137:27]
    node _GEN_12 = mux(io_selVecCond, UInt<3>("h4"), UInt<3>("h1")) @[src/main/scala/BundleVec.scala 152:15 153:15 151:23]
    node _GEN_13 = mux(io_selVecCond, UInt<3>("h5"), UInt<2>("h2")) @[src/main/scala/BundleVec.scala 152:15 154:15 151:23]
    node _GEN_14 = mux(io_selVecCond, UInt<3>("h6"), UInt<2>("h3")) @[src/main/scala/BundleVec.scala 152:15 155:15 151:23]
    node _vecOut_T = bits(io_selVec, 1, 0)
    node defVec_0 = _GEN_12 @[src/main/scala/BundleVec.scala 151:23]
    node _GEN_15 = validif(eq(UInt<1>("h0"), _vecOut_T), defVec_0) @[src/main/scala/BundleVec.scala 159:{16,16}]
    node defVec_1 = _GEN_13 @[src/main/scala/BundleVec.scala 151:23]
    node _GEN_16 = mux(eq(UInt<1>("h1"), _vecOut_T), defVec_1, _GEN_15) @[src/main/scala/BundleVec.scala 159:{16,16}]
    node defVec_2 = _GEN_14 @[src/main/scala/BundleVec.scala 151:23]
    node _GEN_17 = mux(eq(UInt<2>("h2"), _vecOut_T), defVec_2, _GEN_16) @[src/main/scala/BundleVec.scala 159:{16,16}]
    node _vecOutSig_T = bits(io_selVec, 1, 0)
    node defVecSig_0 = io_defVecSigIn_0 @[src/main/scala/BundleVec.scala 166:{26,26}]
    node _GEN_18 = validif(eq(UInt<1>("h0"), _vecOutSig_T), defVecSig_0) @[src/main/scala/BundleVec.scala 170:{19,19}]
    node defVecSig_1 = io_defVecSigIn_1 @[src/main/scala/BundleVec.scala 166:{26,26}]
    node _GEN_19 = mux(eq(UInt<1>("h1"), _vecOutSig_T), defVecSig_1, _GEN_18) @[src/main/scala/BundleVec.scala 170:{19,19}]
    node defVecSig_2 = io_defVecSigIn_2 @[src/main/scala/BundleVec.scala 166:{26,26}]
    node _GEN_20 = mux(eq(UInt<2>("h2"), _vecOutSig_T), defVecSig_2, _GEN_19) @[src/main/scala/BundleVec.scala 170:{19,19}]
    reg initReg_0 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), initReg_0) @[src/main/scala/BundleVec.scala 173:24]
    reg initReg_1 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), initReg_1) @[src/main/scala/BundleVec.scala 173:24]
    reg initReg_2 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), initReg_2) @[src/main/scala/BundleVec.scala 173:24]
    node _resetVal_T = bits(io_selVec, 1, 0)
    reg resetRegFile_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_0) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_1) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_2) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_3) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_4) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_5) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_6) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_7) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_8) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_9) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_10) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_11) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_12) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_13) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_14) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_15) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_16) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_17) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_18) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_19) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_20) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_21) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_22) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_23) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_24) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_25) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_26) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_27) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_28) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_29) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_30) @[src/main/scala/BundleVec.scala 183:29]
    reg resetRegFile_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), resetRegFile_31) @[src/main/scala/BundleVec.scala 183:29]
    node _GEN_21 = validif(eq(UInt<1>("h0"), io_selVec), resetRegFile_0) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_22 = mux(eq(UInt<1>("h1"), io_selVec), resetRegFile_1, _GEN_21) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_23 = mux(eq(UInt<2>("h2"), io_selVec), resetRegFile_2, _GEN_22) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_24 = mux(eq(UInt<2>("h3"), io_selVec), resetRegFile_3, _GEN_23) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_25 = mux(eq(UInt<3>("h4"), io_selVec), resetRegFile_4, _GEN_24) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_26 = mux(eq(UInt<3>("h5"), io_selVec), resetRegFile_5, _GEN_25) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_27 = mux(eq(UInt<3>("h6"), io_selVec), resetRegFile_6, _GEN_26) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_28 = mux(eq(UInt<3>("h7"), io_selVec), resetRegFile_7, _GEN_27) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_29 = mux(eq(UInt<4>("h8"), io_selVec), resetRegFile_8, _GEN_28) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_30 = mux(eq(UInt<4>("h9"), io_selVec), resetRegFile_9, _GEN_29) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_31 = mux(eq(UInt<4>("ha"), io_selVec), resetRegFile_10, _GEN_30) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_32 = mux(eq(UInt<4>("hb"), io_selVec), resetRegFile_11, _GEN_31) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_33 = mux(eq(UInt<4>("hc"), io_selVec), resetRegFile_12, _GEN_32) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_34 = mux(eq(UInt<4>("hd"), io_selVec), resetRegFile_13, _GEN_33) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_35 = mux(eq(UInt<4>("he"), io_selVec), resetRegFile_14, _GEN_34) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_36 = mux(eq(UInt<4>("hf"), io_selVec), resetRegFile_15, _GEN_35) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_37 = mux(eq(UInt<5>("h10"), io_selVec), resetRegFile_16, _GEN_36) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_38 = mux(eq(UInt<5>("h11"), io_selVec), resetRegFile_17, _GEN_37) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_39 = mux(eq(UInt<5>("h12"), io_selVec), resetRegFile_18, _GEN_38) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_40 = mux(eq(UInt<5>("h13"), io_selVec), resetRegFile_19, _GEN_39) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_41 = mux(eq(UInt<5>("h14"), io_selVec), resetRegFile_20, _GEN_40) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_42 = mux(eq(UInt<5>("h15"), io_selVec), resetRegFile_21, _GEN_41) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_43 = mux(eq(UInt<5>("h16"), io_selVec), resetRegFile_22, _GEN_42) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_44 = mux(eq(UInt<5>("h17"), io_selVec), resetRegFile_23, _GEN_43) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_45 = mux(eq(UInt<5>("h18"), io_selVec), resetRegFile_24, _GEN_44) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_46 = mux(eq(UInt<5>("h19"), io_selVec), resetRegFile_25, _GEN_45) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_47 = mux(eq(UInt<5>("h1a"), io_selVec), resetRegFile_26, _GEN_46) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_48 = mux(eq(UInt<5>("h1b"), io_selVec), resetRegFile_27, _GEN_47) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_49 = mux(eq(UInt<5>("h1c"), io_selVec), resetRegFile_28, _GEN_48) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_50 = mux(eq(UInt<5>("h1d"), io_selVec), resetRegFile_29, _GEN_49) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_51 = mux(eq(UInt<5>("h1e"), io_selVec), resetRegFile_30, _GEN_50) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node _GEN_52 = mux(eq(UInt<5>("h1f"), io_selVec), resetRegFile_31, _GEN_51) @[src/main/scala/BundleVec.scala 187:{22,22}]
    node ch_data = UInt<32>("h7b") @[src/main/scala/BundleVec.scala 40:16 41:11]
    node ch_valid = UInt<1>("h1") @[src/main/scala/BundleVec.scala 40:16 42:12]
    node _v_io_array_T = _GEN_2 @[src/main/scala/BundleVec.scala 64:12]
    node _vReg_io_rdIdx = _GEN_8 @[src/main/scala/BundleVec.scala 76:11]
    node _m_io_selMux = _GEN_11 @[src/main/scala/BundleVec.scala 90:13]
    node vecBundle_0_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_0_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_1_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_1_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_2_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_2_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_3_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_3_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_4_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_4_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_5_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_5_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_6_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_6_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_7_data = ch_data @[src/main/scala/BundleVec.scala 108:23 112:18]
    node vecBundle_7_valid = ch_valid @[src/main/scala/BundleVec.scala 108:23 112:18]
    node bv_field = UInt<8>("hd") @[src/main/scala/BundleVec.scala 123:16 124:12]
    node bv_vector_0 = UInt<8>("h3") @[src/main/scala/BundleVec.scala 123:16 126:18]
    node bv_vector_1 = UInt<8>("h3") @[src/main/scala/BundleVec.scala 123:16 126:18]
    node bv_vector_2 = UInt<8>("h3") @[src/main/scala/BundleVec.scala 123:16 126:18]
    node bv_vector_3 = UInt<8>("h3") @[src/main/scala/BundleVec.scala 123:16 126:18]
    node initVal_data = UInt<32>("h0") @[src/main/scala/BundleVec.scala 132:21 134:16]
    node initVal_valid = UInt<1>("h0") @[src/main/scala/BundleVec.scala 132:21 135:17]
    node _defVec_vecOut_T = _GEN_17 @[src/main/scala/BundleVec.scala 159:16]
    node _defVecSig_vecOutSig_T = _GEN_20 @[src/main/scala/BundleVec.scala 170:19]
    node _initReg_WIRE_0 = UInt<3>("h0") @[src/main/scala/BundleVec.scala 173:{32,32}]
    node _initReg_WIRE_1 = UInt<3>("h1") @[src/main/scala/BundleVec.scala 173:{32,32}]
    node _initReg_WIRE_2 = UInt<3>("h2") @[src/main/scala/BundleVec.scala 173:{32,32}]
    node _resetRegFile_WIRE_0 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_1 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_2 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_3 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_4 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_5 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_6 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_7 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_8 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_9 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_10 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_11 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_12 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_13 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_14 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_15 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_16 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_17 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_18 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_19 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_20 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_21 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_22 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_23 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_24 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_25 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_26 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_27 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_28 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_29 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_30 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_WIRE_31 = UInt<32>("h0") @[src/main/scala/BundleVec.scala 183:{37,37}]
    node _resetRegFile_io_selVec = _GEN_52 @[src/main/scala/BundleVec.scala 187:22]
    io_chan_data <= ch_data @[src/main/scala/BundleVec.scala 65:11]
    io_chan_valid <= ch_valid @[src/main/scala/BundleVec.scala 65:11]
    io_chan2_data <= vecBundle_1_data @[src/main/scala/BundleVec.scala 114:12]
    io_chan2_valid <= vecBundle_1_valid @[src/main/scala/BundleVec.scala 114:12]
    io_array <= _v_io_array_T @[src/main/scala/BundleVec.scala 64:12]
    io_dOut <= registerFile_1 @[src/main/scala/BundleVec.scala 105:11]
    io_bvOut <= bv_field @[src/main/scala/BundleVec.scala 129:12]
    io_chreg_data <= channelReg_data @[src/main/scala/BundleVec.scala 143:12]
    io_chreg_valid <= channelReg_valid @[src/main/scala/BundleVec.scala 143:12]
    io_dout <= _vReg_io_rdIdx @[src/main/scala/BundleVec.scala 76:11]
    io_muxOut <= _m_io_selMux @[src/main/scala/BundleVec.scala 90:13]
    io_defVecOut <= _defVec_vecOut_T @[src/main/scala/BundleVec.scala 159:16]
    io_defVecSigOut <= _defVecSig_vecOutSig_T @[src/main/scala/BundleVec.scala 170:19]
    io_regVecOut_0 <= initReg_0 @[src/main/scala/BundleVec.scala 180:16]
    io_regVecOut_1 <= initReg_1 @[src/main/scala/BundleVec.scala 180:16]
    io_regVecOut_2 <= initReg_2 @[src/main/scala/BundleVec.scala 180:16]
    io_resetRegFileOut <= _resetRegFile_io_selVec @[src/main/scala/BundleVec.scala 187:22]
    vReg_0 <= _GEN_3
    vReg_1 <= _GEN_4
    vReg_2 <= _GEN_5
    registerFile_0 <= registerFile_0 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_1 <= io_dIn @[src/main/scala/BundleVec.scala 101:23]
    registerFile_2 <= registerFile_2 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_3 <= registerFile_3 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_4 <= registerFile_4 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_5 <= registerFile_5 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_6 <= registerFile_6 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_7 <= registerFile_7 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_8 <= registerFile_8 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_9 <= registerFile_9 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_10 <= registerFile_10 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_11 <= registerFile_11 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_12 <= registerFile_12 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_13 <= registerFile_13 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_14 <= registerFile_14 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_15 <= registerFile_15 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_16 <= registerFile_16 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_17 <= registerFile_17 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_18 <= registerFile_18 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_19 <= registerFile_19 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_20 <= registerFile_20 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_21 <= registerFile_21 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_22 <= registerFile_22 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_23 <= registerFile_23 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_24 <= registerFile_24 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_25 <= registerFile_25 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_26 <= registerFile_26 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_27 <= registerFile_27 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_28 <= registerFile_28 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_29 <= registerFile_29 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_30 <= registerFile_30 @[src/main/scala/BundleVec.scala 95:25]
    registerFile_31 <= registerFile_31 @[src/main/scala/BundleVec.scala 95:25]
    channelReg_data <= mux(reset, initVal_data, UInt<1>("h1")) @[src/main/scala/BundleVec.scala 137:{27,27} 140:19]
    channelReg_valid <= mux(reset, initVal_valid, UInt<1>("h1")) @[src/main/scala/BundleVec.scala 137:{27,27} 141:20]
    initReg_0 <= bits(mux(reset, _initReg_WIRE_0, io_defVecSigIn_0), 2, 0) @[src/main/scala/BundleVec.scala 173:{24,24} 175:14]
    initReg_1 <= bits(mux(reset, _initReg_WIRE_1, io_defVecSigIn_1), 2, 0) @[src/main/scala/BundleVec.scala 173:{24,24} 176:14]
    initReg_2 <= bits(mux(reset, _initReg_WIRE_2, io_defVecSigIn_2), 2, 0) @[src/main/scala/BundleVec.scala 173:{24,24} 177:14]
    resetRegFile_0 <= mux(reset, _resetRegFile_WIRE_0, resetRegFile_0) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_1 <= mux(reset, _resetRegFile_WIRE_1, resetRegFile_1) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_2 <= mux(reset, _resetRegFile_WIRE_2, resetRegFile_2) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_3 <= mux(reset, _resetRegFile_WIRE_3, resetRegFile_3) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_4 <= mux(reset, _resetRegFile_WIRE_4, resetRegFile_4) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_5 <= mux(reset, _resetRegFile_WIRE_5, resetRegFile_5) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_6 <= mux(reset, _resetRegFile_WIRE_6, resetRegFile_6) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_7 <= mux(reset, _resetRegFile_WIRE_7, resetRegFile_7) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_8 <= mux(reset, _resetRegFile_WIRE_8, resetRegFile_8) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_9 <= mux(reset, _resetRegFile_WIRE_9, resetRegFile_9) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_10 <= mux(reset, _resetRegFile_WIRE_10, resetRegFile_10) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_11 <= mux(reset, _resetRegFile_WIRE_11, resetRegFile_11) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_12 <= mux(reset, _resetRegFile_WIRE_12, resetRegFile_12) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_13 <= mux(reset, _resetRegFile_WIRE_13, resetRegFile_13) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_14 <= mux(reset, _resetRegFile_WIRE_14, resetRegFile_14) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_15 <= mux(reset, _resetRegFile_WIRE_15, resetRegFile_15) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_16 <= mux(reset, _resetRegFile_WIRE_16, resetRegFile_16) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_17 <= mux(reset, _resetRegFile_WIRE_17, resetRegFile_17) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_18 <= mux(reset, _resetRegFile_WIRE_18, resetRegFile_18) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_19 <= mux(reset, _resetRegFile_WIRE_19, resetRegFile_19) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_20 <= mux(reset, _resetRegFile_WIRE_20, resetRegFile_20) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_21 <= mux(reset, _resetRegFile_WIRE_21, resetRegFile_21) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_22 <= mux(reset, _resetRegFile_WIRE_22, resetRegFile_22) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_23 <= mux(reset, _resetRegFile_WIRE_23, resetRegFile_23) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_24 <= mux(reset, _resetRegFile_WIRE_24, resetRegFile_24) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_25 <= mux(reset, _resetRegFile_WIRE_25, resetRegFile_25) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_26 <= mux(reset, _resetRegFile_WIRE_26, resetRegFile_26) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_27 <= mux(reset, _resetRegFile_WIRE_27, resetRegFile_27) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_28 <= mux(reset, _resetRegFile_WIRE_28, resetRegFile_28) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_29 <= mux(reset, _resetRegFile_WIRE_29, resetRegFile_29) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_30 <= mux(reset, _resetRegFile_WIRE_30, resetRegFile_30) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
    resetRegFile_31 <= mux(reset, _resetRegFile_WIRE_31, resetRegFile_31) @[src/main/scala/BundleVec.scala 183:{29,29,29}]
