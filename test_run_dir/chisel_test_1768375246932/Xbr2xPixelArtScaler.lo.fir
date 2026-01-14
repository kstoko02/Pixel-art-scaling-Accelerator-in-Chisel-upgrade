FIRRTL version 1.2.0
circuit Xbr2xPixelArtScaler :
  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_valid : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_0 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_1 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_2 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_3 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_x : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_y : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_sof : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_eol : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_deq_ready : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_valid : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_0 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_1 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_2 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_3 : UInt<24> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_x : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_y : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_sof : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_eol : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_count : UInt<5> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]

    mem ram_block_0 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<24>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_1 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<24>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_2 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<24>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_3 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<24>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_x : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<16>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_y : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<16>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_sof : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<1>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_eol : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<1>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg enq_ptr_value : UInt<4>, clock with :
      reset => (UInt<1>("h0"), enq_ptr_value) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    reg deq_ptr_value : UInt<4>, clock with :
      reset => (UInt<1>("h0"), deq_ptr_value) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 283:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 284:28]
    node empty = and(ptr_match, _empty_T) @[src/main/scala/chisel3/util/Decoupled.scala 284:25]
    node full = and(ptr_match, maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 285:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node wrap = eq(enq_ptr_value, UInt<4>("hf")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
    node _value_T = add(enq_ptr_value, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
    node _value_T_1 = tail(_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
    node do_enq = _do_enq_T @[src/main/scala/chisel3/util/Decoupled.scala 286:{27,27}]
    node _GEN_0 = validif(do_enq, enq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:8]
    node _GEN_1 = validif(do_enq, clock) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:8]
    node _GEN_2 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:8 279:95]
    node _GEN_3 = validif(do_enq, UInt<1>("h1")) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_4 = validif(do_enq, io_enq_bits_block_0) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_5 = validif(do_enq, io_enq_bits_block_1) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_6 = validif(do_enq, io_enq_bits_block_2) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_7 = validif(do_enq, io_enq_bits_block_3) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_8 = validif(do_enq, io_enq_bits_x) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_9 = validif(do_enq, io_enq_bits_y) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_10 = validif(do_enq, io_enq_bits_sof) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_11 = validif(do_enq, io_enq_bits_eol) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 293:24]
    node _GEN_12 = mux(do_enq, _value_T_1, enq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 292:16 src/main/scala/chisel3/util/Counter.scala 77:15 61:40]
    node wrap_1 = eq(deq_ptr_value, UInt<4>("hf")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
    node _value_T_2 = add(deq_ptr_value, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
    node _value_T_3 = tail(_value_T_2, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
    node do_deq = _do_deq_T @[src/main/scala/chisel3/util/Decoupled.scala 287:{27,27}]
    node _GEN_13 = mux(do_deq, _value_T_3, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 296:16 src/main/scala/chisel3/util/Counter.scala 77:15 61:40]
    node _T = neq(do_enq, do_deq) @[src/main/scala/chisel3/util/Decoupled.scala 299:15]
    node _GEN_14 = mux(_T, do_enq, maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 299:27 300:16 282:27]
    node _GEN_15 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_12) @[src/main/scala/chisel3/util/Decoupled.scala 302:15 src/main/scala/chisel3/util/Counter.scala 98:11]
    node _GEN_16 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_13) @[src/main/scala/chisel3/util/Decoupled.scala 302:15 src/main/scala/chisel3/util/Counter.scala 98:11]
    node _GEN_17 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_14) @[src/main/scala/chisel3/util/Decoupled.scala 302:15 305:16]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 308:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 309:19]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 332:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[src/main/scala/chisel3/util/Decoupled.scala 332:32]
    node _io_count_T = and(maybe_full, ptr_match) @[src/main/scala/chisel3/util/Decoupled.scala 335:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<5>("h10"), UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 335:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[src/main/scala/chisel3/util/Decoupled.scala 335:62]
    io_enq_ready <= _io_enq_ready_T @[src/main/scala/chisel3/util/Decoupled.scala 309:16]
    io_deq_valid <= _io_deq_valid_T @[src/main/scala/chisel3/util/Decoupled.scala 308:16]
    io_deq_bits_block_0 <= ram_block_0.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_deq_bits_block_1 <= ram_block_1.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_deq_bits_block_2 <= ram_block_2.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_deq_bits_block_3 <= ram_block_3.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_deq_bits_x <= ram_x.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_deq_bits_y <= ram_y.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_deq_bits_sof <= ram_sof.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_deq_bits_eol <= ram_eol.io_deq_bits_MPORT.data @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
    io_count <= _io_count_T_2 @[src/main/scala/chisel3/util/Decoupled.scala 335:14]
    ram_block_0.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_1.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_2.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_3.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_x.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_y.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_sof.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_eol.io_deq_bits_MPORT.addr <= deq_ptr_value @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_0.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_1.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_2.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_3.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_x.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_y.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_sof.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_eol.io_deq_bits_MPORT.en <= UInt<1>("h1") @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_0.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_1.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_2.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_3.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_x.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_y.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_sof.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_eol.io_deq_bits_MPORT.clk <= clock @[src/main/scala/chisel3/util/Decoupled.scala 316:23]
    ram_block_0.MPORT.addr <= _GEN_0
    ram_block_1.MPORT.addr <= _GEN_0
    ram_block_2.MPORT.addr <= _GEN_0
    ram_block_3.MPORT.addr <= _GEN_0
    ram_x.MPORT.addr <= _GEN_0
    ram_y.MPORT.addr <= _GEN_0
    ram_sof.MPORT.addr <= _GEN_0
    ram_eol.MPORT.addr <= _GEN_0
    ram_block_0.MPORT.en <= _GEN_2
    ram_block_1.MPORT.en <= _GEN_2
    ram_block_2.MPORT.en <= _GEN_2
    ram_block_3.MPORT.en <= _GEN_2
    ram_x.MPORT.en <= _GEN_2
    ram_y.MPORT.en <= _GEN_2
    ram_sof.MPORT.en <= _GEN_2
    ram_eol.MPORT.en <= _GEN_2
    ram_block_0.MPORT.clk <= _GEN_1
    ram_block_1.MPORT.clk <= _GEN_1
    ram_block_2.MPORT.clk <= _GEN_1
    ram_block_3.MPORT.clk <= _GEN_1
    ram_x.MPORT.clk <= _GEN_1
    ram_y.MPORT.clk <= _GEN_1
    ram_sof.MPORT.clk <= _GEN_1
    ram_eol.MPORT.clk <= _GEN_1
    ram_block_0.MPORT.data <= _GEN_4
    ram_block_1.MPORT.data <= _GEN_5
    ram_block_2.MPORT.data <= _GEN_6
    ram_block_3.MPORT.data <= _GEN_7
    ram_x.MPORT.data <= _GEN_8
    ram_y.MPORT.data <= _GEN_9
    ram_sof.MPORT.data <= _GEN_10
    ram_eol.MPORT.data <= _GEN_11
    ram_block_0.MPORT.mask <= _GEN_3
    ram_block_1.MPORT.mask <= _GEN_3
    ram_block_2.MPORT.mask <= _GEN_3
    ram_block_3.MPORT.mask <= _GEN_3
    ram_x.MPORT.mask <= _GEN_3
    ram_y.MPORT.mask <= _GEN_3
    ram_sof.MPORT.mask <= _GEN_3
    ram_eol.MPORT.mask <= _GEN_3
    enq_ptr_value <= mux(reset, UInt<4>("h0"), _GEN_15) @[src/main/scala/chisel3/util/Counter.scala 61:{40,40}]
    deq_ptr_value <= mux(reset, UInt<4>("h0"), _GEN_16) @[src/main/scala/chisel3/util/Counter.scala 61:{40,40}]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_17) @[src/main/scala/chisel3/util/Decoupled.scala 282:{27,27}]

  module S2Window :
    input clock : Clock
    input reset : UInt<1>
    input io_in_pix : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_in_yuv : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_row_m1_rgb : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_row_m2_rgb : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_row_m1_yuv : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_row_m2_yuv : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_s1_x : UInt<16> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_s1_y : UInt<16> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_s1_sof : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_s1_eol : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_v1 : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_stall : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    input io_out_ready : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_valid : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_A : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_B : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_C : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_D : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_E : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_F : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_G : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_H : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_winRGB_I : UInt<24> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_meta_xc : UInt<16> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_meta_yc : UInt<16> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_meta_sof : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_meta_eol : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]
    output io_out_bits_meta_emit : UInt<1> @[src/main/scala/pixelart/S2Window.scala 11:14]

    reg outReg_winRGB_A : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_A) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_B : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_B) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_C : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_C) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_D : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_D) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_E : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_E) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_F : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_F) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_G : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_G) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_H : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_H) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_winRGB_I : UInt<24>, clock with :
      reset => (UInt<1>("h0"), outReg_winRGB_I) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_meta_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), outReg_meta_xc) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_meta_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), outReg_meta_yc) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_meta_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outReg_meta_sof) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_meta_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outReg_meta_eol) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outReg_meta_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outReg_meta_emit) @[src/main/scala/pixelart/S2Window.scala 28:23]
    reg outVld : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outVld) @[src/main/scala/pixelart/S2Window.scala 29:23]
    node _T = eq(io_stall, UInt<1>("h0")) @[src/main/scala/pixelart/S2Window.scala 43:8]
    node _GEN_0 = mux(_T, io_v1, outVld) @[src/main/scala/pixelart/S2Window.scala 43:19 44:12 29:23]
    node _T_1 = and(io_out_ready, io_out_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_1 = mux(_T_1, UInt<1>("h0"), _GEN_0) @[src/main/scala/pixelart/S2Window.scala 49:{21,30}]
    node _outReg_WIRE_winRGB_A = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_B = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_C = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_D = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_E = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_F = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_G = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_H = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_winRGB_I = UInt<24>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_meta_xc = UInt<16>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_meta_yc = UInt<16>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_meta_sof = UInt<1>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_meta_eol = UInt<1>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    node _outReg_WIRE_meta_emit = UInt<1>("h0") @[src/main/scala/pixelart/S2Window.scala 28:{36,36}]
    io_out_valid <= outVld @[src/main/scala/pixelart/S2Window.scala 47:16]
    io_out_bits_winRGB_A <= outReg_winRGB_A @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_B <= outReg_winRGB_B @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_C <= outReg_winRGB_C @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_D <= outReg_winRGB_D @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_E <= outReg_winRGB_E @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_F <= outReg_winRGB_F @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_G <= outReg_winRGB_G @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_H <= outReg_winRGB_H @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_winRGB_I <= outReg_winRGB_I @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_meta_xc <= outReg_meta_xc @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_meta_yc <= outReg_meta_yc @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_meta_sof <= outReg_meta_sof @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_meta_eol <= outReg_meta_eol @[src/main/scala/pixelart/S2Window.scala 48:16]
    io_out_bits_meta_emit <= outReg_meta_emit @[src/main/scala/pixelart/S2Window.scala 48:16]
    outReg_winRGB_A <= mux(reset, _outReg_WIRE_winRGB_A, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 33:19]
    outReg_winRGB_B <= mux(reset, _outReg_WIRE_winRGB_B, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 33:41]
    outReg_winRGB_C <= mux(reset, _outReg_WIRE_winRGB_C, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 33:63]
    outReg_winRGB_D <= mux(reset, _outReg_WIRE_winRGB_D, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 34:19]
    outReg_winRGB_E <= mux(reset, _outReg_WIRE_winRGB_E, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 34:41]
    outReg_winRGB_F <= mux(reset, _outReg_WIRE_winRGB_F, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 34:63]
    outReg_winRGB_G <= mux(reset, _outReg_WIRE_winRGB_G, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 35:19]
    outReg_winRGB_H <= mux(reset, _outReg_WIRE_winRGB_H, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 35:41]
    outReg_winRGB_I <= mux(reset, _outReg_WIRE_winRGB_I, io_in_pix) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 35:63]
    outReg_meta_xc <= mux(reset, _outReg_WIRE_meta_xc, io_s1_x) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 37:19]
    outReg_meta_yc <= mux(reset, _outReg_WIRE_meta_yc, io_s1_y) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 38:19]
    outReg_meta_sof <= mux(reset, _outReg_WIRE_meta_sof, io_s1_sof) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 39:19]
    outReg_meta_eol <= mux(reset, _outReg_WIRE_meta_eol, io_s1_eol) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 40:19]
    outReg_meta_emit <= mux(reset, _outReg_WIRE_meta_emit, UInt<1>("h1")) @[src/main/scala/pixelart/S2Window.scala 28:{23,23} 41:19]
    outVld <= mux(reset, UInt<1>("h0"), _GEN_1) @[src/main/scala/pixelart/S2Window.scala 29:{23,23}]

  module S3Latch :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_valid : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_A : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_B : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_C : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_D : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_E : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_F : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_G : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_H : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_winRGB_I : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_meta_xc : UInt<16> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_meta_yc : UInt<16> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_meta_sof : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_meta_eol : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_in_bits_meta_emit : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_out_ready : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_valid : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_A : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_B : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_C : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_D : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_E : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_F : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_G : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_H : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_winRGB_I : UInt<24> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_meta_xc : UInt<16> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_meta_yc : UInt<16> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_meta_sof : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_meta_eol : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    output io_out_bits_meta_emit : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]
    input io_stall : UInt<1> @[src/main/scala/pixelart/S3Latch.scala 10:14]

    reg r_winRGB_A : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_A) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_B : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_B) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_C : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_C) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_D : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_D) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_E : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_E) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_F : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_F) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_G : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_G) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_H : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_H) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_winRGB_I : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_I) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_meta_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), r_meta_xc) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_meta_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), r_meta_yc) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_meta_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_sof) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_meta_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_eol) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg r_meta_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_emit) @[src/main/scala/pixelart/S3Latch.scala 16:21]
    reg rVld : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rVld) @[src/main/scala/pixelart/S3Latch.scala 17:21]
    node _io_in_ready_T = eq(rVld, UInt<1>("h0")) @[src/main/scala/pixelart/S3Latch.scala 20:18]
    node _io_in_ready_T_1 = and(io_out_ready, io_out_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[src/main/scala/pixelart/S3Latch.scala 20:24]
    node _T = eq(io_stall, UInt<1>("h0")) @[src/main/scala/pixelart/S3Latch.scala 22:8]
    node _T_1 = and(io_in_ready, io_in_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_0 = mux(_T_1, io_in_bits_winRGB_A, r_winRGB_A) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_1 = mux(_T_1, io_in_bits_winRGB_B, r_winRGB_B) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_2 = mux(_T_1, io_in_bits_winRGB_C, r_winRGB_C) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_3 = mux(_T_1, io_in_bits_winRGB_D, r_winRGB_D) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_4 = mux(_T_1, io_in_bits_winRGB_E, r_winRGB_E) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_5 = mux(_T_1, io_in_bits_winRGB_F, r_winRGB_F) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_6 = mux(_T_1, io_in_bits_winRGB_G, r_winRGB_G) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_7 = mux(_T_1, io_in_bits_winRGB_H, r_winRGB_H) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_8 = mux(_T_1, io_in_bits_winRGB_I, r_winRGB_I) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_9 = mux(_T_1, io_in_bits_meta_xc, r_meta_xc) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_10 = mux(_T_1, io_in_bits_meta_yc, r_meta_yc) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_11 = mux(_T_1, io_in_bits_meta_sof, r_meta_sof) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_12 = mux(_T_1, io_in_bits_meta_eol, r_meta_eol) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_13 = mux(_T_1, io_in_bits_meta_emit, r_meta_emit) @[src/main/scala/pixelart/S3Latch.scala 16:21 23:{22,26}]
    node _GEN_14 = mux(_T_1, UInt<1>("h1"), rVld) @[src/main/scala/pixelart/S3Latch.scala 17:21 23:{22,46}]
    node _T_2 = and(io_out_ready, io_out_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_15 = mux(_T_2, UInt<1>("h0"), _GEN_14) @[src/main/scala/pixelart/S3Latch.scala 24:{23,30}]
    node _GEN_16 = mux(_T, _GEN_0, r_winRGB_A) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_17 = mux(_T, _GEN_1, r_winRGB_B) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_18 = mux(_T, _GEN_2, r_winRGB_C) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_19 = mux(_T, _GEN_3, r_winRGB_D) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_20 = mux(_T, _GEN_4, r_winRGB_E) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_21 = mux(_T, _GEN_5, r_winRGB_F) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_22 = mux(_T, _GEN_6, r_winRGB_G) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_23 = mux(_T, _GEN_7, r_winRGB_H) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_24 = mux(_T, _GEN_8, r_winRGB_I) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_25 = mux(_T, _GEN_9, r_meta_xc) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_26 = mux(_T, _GEN_10, r_meta_yc) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_27 = mux(_T, _GEN_11, r_meta_sof) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_28 = mux(_T, _GEN_12, r_meta_eol) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_29 = mux(_T, _GEN_13, r_meta_emit) @[src/main/scala/pixelart/S3Latch.scala 22:19 16:21]
    node _GEN_30 = mux(_T, _GEN_15, rVld) @[src/main/scala/pixelart/S3Latch.scala 22:19 17:21]
    node _r_WIRE_winRGB_A = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_B = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_C = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_D = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_E = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_F = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_G = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_H = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_winRGB_I = UInt<24>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_meta_xc = UInt<16>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_meta_yc = UInt<16>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_meta_sof = UInt<1>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_meta_eol = UInt<1>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    node _r_WIRE_meta_emit = UInt<1>("h0") @[src/main/scala/pixelart/S3Latch.scala 16:{34,34}]
    io_in_ready <= _io_in_ready_T_2 @[src/main/scala/pixelart/S3Latch.scala 20:15]
    io_out_valid <= rVld @[src/main/scala/pixelart/S3Latch.scala 27:16]
    io_out_bits_winRGB_A <= r_winRGB_A @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_B <= r_winRGB_B @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_C <= r_winRGB_C @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_D <= r_winRGB_D @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_E <= r_winRGB_E @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_F <= r_winRGB_F @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_G <= r_winRGB_G @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_H <= r_winRGB_H @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_winRGB_I <= r_winRGB_I @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_meta_xc <= r_meta_xc @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_meta_yc <= r_meta_yc @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_meta_sof <= r_meta_sof @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_meta_eol <= r_meta_eol @[src/main/scala/pixelart/S3Latch.scala 28:16]
    io_out_bits_meta_emit <= r_meta_emit @[src/main/scala/pixelart/S3Latch.scala 28:16]
    r_winRGB_A <= mux(reset, _r_WIRE_winRGB_A, _GEN_16) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_B <= mux(reset, _r_WIRE_winRGB_B, _GEN_17) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_C <= mux(reset, _r_WIRE_winRGB_C, _GEN_18) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_D <= mux(reset, _r_WIRE_winRGB_D, _GEN_19) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_E <= mux(reset, _r_WIRE_winRGB_E, _GEN_20) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_F <= mux(reset, _r_WIRE_winRGB_F, _GEN_21) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_G <= mux(reset, _r_WIRE_winRGB_G, _GEN_22) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_H <= mux(reset, _r_WIRE_winRGB_H, _GEN_23) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_winRGB_I <= mux(reset, _r_WIRE_winRGB_I, _GEN_24) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_meta_xc <= mux(reset, _r_WIRE_meta_xc, _GEN_25) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_meta_yc <= mux(reset, _r_WIRE_meta_yc, _GEN_26) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_meta_sof <= mux(reset, _r_WIRE_meta_sof, _GEN_27) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_meta_eol <= mux(reset, _r_WIRE_meta_eol, _GEN_28) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    r_meta_emit <= mux(reset, _r_WIRE_meta_emit, _GEN_29) @[src/main/scala/pixelart/S3Latch.scala 16:{21,21}]
    rVld <= mux(reset, UInt<1>("h0"), _GEN_30) @[src/main/scala/pixelart/S3Latch.scala 17:{21,21}]

  module S4aPrecompute :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_valid : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_A : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_B : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_C : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_D : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_E : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_F : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_G : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_H : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_winRGB_I : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_meta_xc : UInt<16> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_meta_yc : UInt<16> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_meta_sof : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_meta_eol : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_in_bits_meta_emit : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_out_ready : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_valid : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_A : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_B : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_C : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_D : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_E : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_F : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_G : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_H : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_winRGB_I : UInt<24> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_meta_xc : UInt<16> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_meta_yc : UInt<16> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_meta_sof : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_meta_eol : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    output io_out_bits_meta_emit : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]
    input io_stall : UInt<1> @[src/main/scala/pixelart/S4aPrecompute.scala 10:14]

    reg r_winRGB_A : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_A) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_B : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_B) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_C : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_C) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_D : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_D) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_E : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_E) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_F : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_F) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_G : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_G) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_H : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_H) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_winRGB_I : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_winRGB_I) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_meta_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), r_meta_xc) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_meta_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), r_meta_yc) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_meta_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_sof) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_meta_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_eol) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg r_meta_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_emit) @[src/main/scala/pixelart/S4aPrecompute.scala 16:21]
    reg rVld : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rVld) @[src/main/scala/pixelart/S4aPrecompute.scala 17:21]
    node _io_in_ready_T = eq(rVld, UInt<1>("h0")) @[src/main/scala/pixelart/S4aPrecompute.scala 19:18]
    node _io_in_ready_T_1 = and(io_out_ready, io_out_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[src/main/scala/pixelart/S4aPrecompute.scala 19:24]
    node _T = eq(io_stall, UInt<1>("h0")) @[src/main/scala/pixelart/S4aPrecompute.scala 21:8]
    node _T_1 = and(io_in_ready, io_in_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_0 = mux(_T_1, io_in_bits_winRGB_A, r_winRGB_A) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_1 = mux(_T_1, io_in_bits_winRGB_B, r_winRGB_B) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_2 = mux(_T_1, io_in_bits_winRGB_C, r_winRGB_C) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_3 = mux(_T_1, io_in_bits_winRGB_D, r_winRGB_D) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_4 = mux(_T_1, io_in_bits_winRGB_E, r_winRGB_E) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_5 = mux(_T_1, io_in_bits_winRGB_F, r_winRGB_F) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_6 = mux(_T_1, io_in_bits_winRGB_G, r_winRGB_G) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_7 = mux(_T_1, io_in_bits_winRGB_H, r_winRGB_H) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_8 = mux(_T_1, io_in_bits_winRGB_I, r_winRGB_I) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 24:16 16:21]
    node _GEN_9 = mux(_T_1, io_in_bits_meta_xc, r_meta_xc) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 25:16 16:21]
    node _GEN_10 = mux(_T_1, io_in_bits_meta_yc, r_meta_yc) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 25:16 16:21]
    node _GEN_11 = mux(_T_1, io_in_bits_meta_sof, r_meta_sof) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 25:16 16:21]
    node _GEN_12 = mux(_T_1, io_in_bits_meta_eol, r_meta_eol) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 25:16 16:21]
    node _GEN_13 = mux(_T_1, io_in_bits_meta_emit, r_meta_emit) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 25:16 16:21]
    node _GEN_14 = mux(_T_1, UInt<1>("h1"), rVld) @[src/main/scala/pixelart/S4aPrecompute.scala 22:22 26:16 17:21]
    node _T_2 = and(io_out_ready, io_out_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_15 = mux(_T_2, UInt<1>("h0"), _GEN_14) @[src/main/scala/pixelart/S4aPrecompute.scala 28:{23,30}]
    node _GEN_16 = mux(_T, _GEN_0, r_winRGB_A) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_17 = mux(_T, _GEN_1, r_winRGB_B) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_18 = mux(_T, _GEN_2, r_winRGB_C) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_19 = mux(_T, _GEN_3, r_winRGB_D) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_20 = mux(_T, _GEN_4, r_winRGB_E) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_21 = mux(_T, _GEN_5, r_winRGB_F) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_22 = mux(_T, _GEN_6, r_winRGB_G) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_23 = mux(_T, _GEN_7, r_winRGB_H) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_24 = mux(_T, _GEN_8, r_winRGB_I) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_25 = mux(_T, _GEN_9, r_meta_xc) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_26 = mux(_T, _GEN_10, r_meta_yc) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_27 = mux(_T, _GEN_11, r_meta_sof) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_28 = mux(_T, _GEN_12, r_meta_eol) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_29 = mux(_T, _GEN_13, r_meta_emit) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 16:21]
    node _GEN_30 = mux(_T, _GEN_15, rVld) @[src/main/scala/pixelart/S4aPrecompute.scala 21:19 17:21]
    node _r_WIRE_winRGB_A = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_B = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_C = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_D = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_E = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_F = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_G = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_H = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_winRGB_I = UInt<24>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_meta_xc = UInt<16>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_meta_yc = UInt<16>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_meta_sof = UInt<1>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_meta_eol = UInt<1>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    node _r_WIRE_meta_emit = UInt<1>("h0") @[src/main/scala/pixelart/S4aPrecompute.scala 16:{34,34}]
    io_in_ready <= _io_in_ready_T_2 @[src/main/scala/pixelart/S4aPrecompute.scala 19:15]
    io_out_valid <= rVld @[src/main/scala/pixelart/S4aPrecompute.scala 31:16]
    io_out_bits_winRGB_A <= r_winRGB_A @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_B <= r_winRGB_B @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_C <= r_winRGB_C @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_D <= r_winRGB_D @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_E <= r_winRGB_E @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_F <= r_winRGB_F @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_G <= r_winRGB_G @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_H <= r_winRGB_H @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_winRGB_I <= r_winRGB_I @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_meta_xc <= r_meta_xc @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_meta_yc <= r_meta_yc @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_meta_sof <= r_meta_sof @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_meta_eol <= r_meta_eol @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    io_out_bits_meta_emit <= r_meta_emit @[src/main/scala/pixelart/S4aPrecompute.scala 32:16]
    r_winRGB_A <= mux(reset, _r_WIRE_winRGB_A, _GEN_16) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_B <= mux(reset, _r_WIRE_winRGB_B, _GEN_17) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_C <= mux(reset, _r_WIRE_winRGB_C, _GEN_18) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_D <= mux(reset, _r_WIRE_winRGB_D, _GEN_19) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_E <= mux(reset, _r_WIRE_winRGB_E, _GEN_20) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_F <= mux(reset, _r_WIRE_winRGB_F, _GEN_21) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_G <= mux(reset, _r_WIRE_winRGB_G, _GEN_22) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_H <= mux(reset, _r_WIRE_winRGB_H, _GEN_23) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_winRGB_I <= mux(reset, _r_WIRE_winRGB_I, _GEN_24) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_meta_xc <= mux(reset, _r_WIRE_meta_xc, _GEN_25) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_meta_yc <= mux(reset, _r_WIRE_meta_yc, _GEN_26) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_meta_sof <= mux(reset, _r_WIRE_meta_sof, _GEN_27) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_meta_eol <= mux(reset, _r_WIRE_meta_eol, _GEN_28) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    r_meta_emit <= mux(reset, _r_WIRE_meta_emit, _GEN_29) @[src/main/scala/pixelart/S4aPrecompute.scala 16:{21,21}]
    rVld <= mux(reset, UInt<1>("h0"), _GEN_30) @[src/main/scala/pixelart/S4aPrecompute.scala 17:{21,21}]

  module S5Blend :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_valid : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_A : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_B : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_C : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_D : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_E : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_F : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_G : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_H : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_winRGB_I : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_meta_xc : UInt<16> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_meta_yc : UInt<16> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_meta_sof : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_meta_eol : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_in_bits_meta_emit : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    input io_out_ready : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_valid : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_block_0 : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_block_1 : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_block_2 : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_block_3 : UInt<24> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_meta_xc : UInt<16> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_meta_yc : UInt<16> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_meta_sof : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_meta_eol : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]
    output io_out_bits_meta_emit : UInt<1> @[src/main/scala/pixelart/S5Blend.scala 10:14]

    reg r_block_0 : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_block_0) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_block_1 : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_block_1) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_block_2 : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_block_2) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_block_3 : UInt<24>, clock with :
      reset => (UInt<1>("h0"), r_block_3) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_meta_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), r_meta_xc) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_meta_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), r_meta_yc) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_meta_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_sof) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_meta_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_eol) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg r_meta_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), r_meta_emit) @[src/main/scala/pixelart/S5Blend.scala 15:21]
    reg rVld : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rVld) @[src/main/scala/pixelart/S5Blend.scala 16:21]
    node _io_in_ready_T = eq(rVld, UInt<1>("h0")) @[src/main/scala/pixelart/S5Blend.scala 18:18]
    node _io_in_ready_T_1 = and(io_out_ready, io_out_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[src/main/scala/pixelart/S5Blend.scala 18:24]
    node _T = and(io_in_ready, io_in_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_0 = mux(_T, io_in_bits_winRGB_E, r_block_0) @[src/main/scala/pixelart/S5Blend.scala 20:20 22:16 15:21]
    node _GEN_1 = mux(_T, io_in_bits_winRGB_E, r_block_1) @[src/main/scala/pixelart/S5Blend.scala 20:20 23:16 15:21]
    node _GEN_2 = mux(_T, io_in_bits_winRGB_E, r_block_2) @[src/main/scala/pixelart/S5Blend.scala 20:20 24:16 15:21]
    node _GEN_3 = mux(_T, io_in_bits_winRGB_E, r_block_3) @[src/main/scala/pixelart/S5Blend.scala 20:20 25:16 15:21]
    node _GEN_4 = mux(_T, io_in_bits_meta_xc, r_meta_xc) @[src/main/scala/pixelart/S5Blend.scala 20:20 26:16 15:21]
    node _GEN_5 = mux(_T, io_in_bits_meta_yc, r_meta_yc) @[src/main/scala/pixelart/S5Blend.scala 20:20 26:16 15:21]
    node _GEN_6 = mux(_T, io_in_bits_meta_sof, r_meta_sof) @[src/main/scala/pixelart/S5Blend.scala 20:20 26:16 15:21]
    node _GEN_7 = mux(_T, io_in_bits_meta_eol, r_meta_eol) @[src/main/scala/pixelart/S5Blend.scala 20:20 26:16 15:21]
    node _GEN_8 = mux(_T, io_in_bits_meta_emit, r_meta_emit) @[src/main/scala/pixelart/S5Blend.scala 20:20 26:16 15:21]
    node _GEN_9 = mux(_T, UInt<1>("h1"), rVld) @[src/main/scala/pixelart/S5Blend.scala 20:20 27:16 16:21]
    node _T_1 = and(io_out_ready, io_out_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _GEN_10 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[src/main/scala/pixelart/S5Blend.scala 30:{21,28}]
    node _r_WIRE_block_0 = UInt<24>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_block_1 = UInt<24>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_block_2 = UInt<24>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_block_3 = UInt<24>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_meta_xc = UInt<16>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_meta_yc = UInt<16>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_meta_sof = UInt<1>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_meta_eol = UInt<1>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    node _r_WIRE_meta_emit = UInt<1>("h0") @[src/main/scala/pixelart/S5Blend.scala 15:{34,34}]
    io_in_ready <= _io_in_ready_T_2 @[src/main/scala/pixelart/S5Blend.scala 18:15]
    io_out_valid <= rVld @[src/main/scala/pixelart/S5Blend.scala 32:16]
    io_out_bits_block_0 <= r_block_0 @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_block_1 <= r_block_1 @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_block_2 <= r_block_2 @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_block_3 <= r_block_3 @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_meta_xc <= r_meta_xc @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_meta_yc <= r_meta_yc @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_meta_sof <= r_meta_sof @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_meta_eol <= r_meta_eol @[src/main/scala/pixelart/S5Blend.scala 33:16]
    io_out_bits_meta_emit <= r_meta_emit @[src/main/scala/pixelart/S5Blend.scala 33:16]
    r_block_0 <= mux(reset, _r_WIRE_block_0, _GEN_0) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_block_1 <= mux(reset, _r_WIRE_block_1, _GEN_1) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_block_2 <= mux(reset, _r_WIRE_block_2, _GEN_2) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_block_3 <= mux(reset, _r_WIRE_block_3, _GEN_3) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_meta_xc <= mux(reset, _r_WIRE_meta_xc, _GEN_4) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_meta_yc <= mux(reset, _r_WIRE_meta_yc, _GEN_5) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_meta_sof <= mux(reset, _r_WIRE_meta_sof, _GEN_6) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_meta_eol <= mux(reset, _r_WIRE_meta_eol, _GEN_7) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    r_meta_emit <= mux(reset, _r_WIRE_meta_emit, _GEN_8) @[src/main/scala/pixelart/S5Blend.scala 15:{21,21}]
    rVld <= mux(reset, UInt<1>("h0"), _GEN_10) @[src/main/scala/pixelart/S5Blend.scala 16:{21,21}]

  module Xbr2xPipeline :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    input io_in_valid : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    input io_in_bits_pix : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    input io_in_bits_yuv : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    input io_in_bits_sof : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    input io_in_bits_eol : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    input io_out_ready : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_valid : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_block_0 : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_block_1 : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_block_2 : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_block_3 : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_x : UInt<16> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_y : UInt<16> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_sof : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output io_out_bits_eol : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 16:14]
    output dbg_valid : UInt<1> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_A : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_B : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_C : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_D : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_E : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_F : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_G : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_H : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_I : UInt<24> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_xc : UInt<16> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]
    output dbg_yc : UInt<16> @[src/main/scala/pixelart/Xbr2xPipeline.scala 21:15]

    inst outQ of Queue @[src/main/scala/pixelart/Xbr2xPipeline.scala 33:20]
    inst s2 of S2Window @[src/main/scala/pixelart/Xbr2xPipeline.scala 100:18]
    inst s3 of S3Latch @[src/main/scala/pixelart/Xbr2xPipeline.scala 114:18]
    inst s4a of S4aPrecompute @[src/main/scala/pixelart/Xbr2xPipeline.scala 118:19]
    inst s5 of S5Blend @[src/main/scala/pixelart/Xbr2xPipeline.scala 122:18]
    reg v1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 39:19]
    reg v2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v2) @[src/main/scala/pixelart/Xbr2xPipeline.scala 40:19]
    reg v3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v3) @[src/main/scala/pixelart/Xbr2xPipeline.scala 41:19]
    reg v4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v4) @[src/main/scala/pixelart/Xbr2xPipeline.scala 42:19]
    node _s5_emit_w_T = and(s5.io_out_valid, s5.io_out_bits_meta_emit) @[src/main/scala/pixelart/Xbr2xPipeline.scala 140:32]
    node s5_emit_w = _s5_emit_w_T @[src/main/scala/pixelart/Xbr2xPipeline.scala 140:13 44:23]
    node _stall_T = and(v4, s5_emit_w) @[src/main/scala/pixelart/Xbr2xPipeline.scala 45:22]
    node _stall_T_1 = eq(outQ.io_enq_ready, UInt<1>("h0")) @[src/main/scala/pixelart/Xbr2xPipeline.scala 45:38]
    node stall = and(_stall_T, _stall_T_1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 45:35]
    node _io_in_ready_T = eq(stall, UInt<1>("h0")) @[src/main/scala/pixelart/Xbr2xPipeline.scala 48:18]
    node fireIn = and(io_in_valid, io_in_ready) @[src/main/scala/pixelart/Xbr2xPipeline.scala 49:29]
    node _T = eq(stall, UInt<1>("h0")) @[src/main/scala/pixelart/Xbr2xPipeline.scala 51:8]
    node _GEN_0 = mux(_T, fireIn, v1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 51:16 39:19 52:8]
    node _GEN_1 = mux(_T, v1, v2) @[src/main/scala/pixelart/Xbr2xPipeline.scala 51:16 40:19 53:8]
    node _GEN_2 = mux(_T, v2, v3) @[src/main/scala/pixelart/Xbr2xPipeline.scala 51:16 41:19 54:8]
    node _GEN_3 = mux(_T, v3, v4) @[src/main/scala/pixelart/Xbr2xPipeline.scala 51:16 42:19 55:8]
    reg xCnt : UInt<16>, clock with :
      reset => (UInt<1>("h0"), xCnt) @[src/main/scala/pixelart/Xbr2xPipeline.scala 61:25]
    reg yCnt : UInt<16>, clock with :
      reset => (UInt<1>("h0"), yCnt) @[src/main/scala/pixelart/Xbr2xPipeline.scala 62:25]
    reg firstPix : UInt<1>, clock with :
      reset => (UInt<1>("h0"), firstPix) @[src/main/scala/pixelart/Xbr2xPipeline.scala 63:25]
    node _s1_eol_T = sub(UInt<6>("h30"), UInt<1>("h1")) @[src/main/scala/pixelart/Xbr2xPipeline.scala 89:31]
    node _s1_eol_T_1 = tail(_s1_eol_T, 1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 89:31]
    node _s1_eol_T_2 = eq(xCnt, _s1_eol_T_1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 89:19]
    node _GEN_4 = mux(firstPix, UInt<1>("h0"), firstPix) @[src/main/scala/pixelart/Xbr2xPipeline.scala 92:20 63:25 92:31]
    node _yCnt_T = add(yCnt, UInt<1>("h1")) @[src/main/scala/pixelart/Xbr2xPipeline.scala 93:46]
    node _yCnt_T_1 = tail(_yCnt_T, 1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 93:46]
    node _xCnt_T = add(xCnt, UInt<1>("h1")) @[src/main/scala/pixelart/Xbr2xPipeline.scala 94:33]
    node _xCnt_T_1 = tail(_xCnt_T, 1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 94:33]
    node s1_eol = _s1_eol_T_2 @[src/main/scala/pixelart/Xbr2xPipeline.scala 71:27 89:10]
    node _GEN_5 = mux(s1_eol, UInt<1>("h0"), _xCnt_T_1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 93:{18,25} 94:25]
    node _GEN_6 = mux(s1_eol, _yCnt_T_1, yCnt) @[src/main/scala/pixelart/Xbr2xPipeline.scala 93:18 62:25 93:38]
    node _GEN_7 = mux(fireIn, _GEN_4, firstPix) @[src/main/scala/pixelart/Xbr2xPipeline.scala 91:16 63:25]
    node _GEN_8 = mux(fireIn, _GEN_5, xCnt) @[src/main/scala/pixelart/Xbr2xPipeline.scala 91:16 61:25]
    node _GEN_9 = mux(fireIn, _GEN_6, yCnt) @[src/main/scala/pixelart/Xbr2xPipeline.scala 91:16 62:25]
    node s1_pix = io_in_bits_pix @[src/main/scala/pixelart/Xbr2xPipeline.scala 66:27 78:17]
    node s1_yuv = io_in_bits_yuv @[src/main/scala/pixelart/Xbr2xPipeline.scala 67:27 79:17]
    node s1_x = xCnt @[src/main/scala/pixelart/Xbr2xPipeline.scala 68:27 86:10]
    node s1_y = yCnt @[src/main/scala/pixelart/Xbr2xPipeline.scala 69:27 87:10]
    node s1_sof = firstPix @[src/main/scala/pixelart/Xbr2xPipeline.scala 70:27 88:10]
    node s1_row_m1_rgb = io_in_bits_pix @[src/main/scala/pixelart/Xbr2xPipeline.scala 72:27 80:17]
    node s1_row_m2_rgb = io_in_bits_pix @[src/main/scala/pixelart/Xbr2xPipeline.scala 73:27 81:17]
    node s1_row_m1_yuv = io_in_bits_yuv @[src/main/scala/pixelart/Xbr2xPipeline.scala 74:27 82:17]
    node s1_row_m2_yuv = io_in_bits_yuv @[src/main/scala/pixelart/Xbr2xPipeline.scala 75:27 83:17]
    node _outQ_io_enq_bits_WIRE_block_0 = UInt<24>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    node _outQ_io_enq_bits_WIRE_block_1 = UInt<24>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    node _outQ_io_enq_bits_WIRE_block_2 = UInt<24>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    node _outQ_io_enq_bits_WIRE_block_3 = UInt<24>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    node _outQ_io_enq_bits_WIRE_x = UInt<16>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    node _outQ_io_enq_bits_WIRE_y = UInt<16>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    node _outQ_io_enq_bits_WIRE_sof = UInt<1>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    node _outQ_io_enq_bits_WIRE_eol = UInt<1>("h0") @[src/main/scala/pixelart/Xbr2xPipeline.scala 138:{35,35}]
    io_in_ready <= _io_in_ready_T @[src/main/scala/pixelart/Xbr2xPipeline.scala 48:15]
    io_out_valid <= outQ.io_deq_valid @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_block_0 <= outQ.io_deq_bits_block_0 @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_block_1 <= outQ.io_deq_bits_block_1 @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_block_2 <= outQ.io_deq_bits_block_2 @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_block_3 <= outQ.io_deq_bits_block_3 @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_x <= outQ.io_deq_bits_x @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_y <= outQ.io_deq_bits_y @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_sof <= outQ.io_deq_bits_sof @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    io_out_bits_eol <= outQ.io_deq_bits_eol @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    dbg_valid <= s3.io_out_valid @[src/main/scala/pixelart/Xbr2xPipeline.scala 129:13]
    dbg_A <= s3.io_out_bits_winRGB_A @[src/main/scala/pixelart/Xbr2xPipeline.scala 130:9]
    dbg_B <= s3.io_out_bits_winRGB_B @[src/main/scala/pixelart/Xbr2xPipeline.scala 130:43]
    dbg_C <= s3.io_out_bits_winRGB_C @[src/main/scala/pixelart/Xbr2xPipeline.scala 130:77]
    dbg_D <= s3.io_out_bits_winRGB_D @[src/main/scala/pixelart/Xbr2xPipeline.scala 131:9]
    dbg_E <= s3.io_out_bits_winRGB_E @[src/main/scala/pixelart/Xbr2xPipeline.scala 131:43]
    dbg_F <= s3.io_out_bits_winRGB_F @[src/main/scala/pixelart/Xbr2xPipeline.scala 131:77]
    dbg_G <= s3.io_out_bits_winRGB_G @[src/main/scala/pixelart/Xbr2xPipeline.scala 132:9]
    dbg_H <= s3.io_out_bits_winRGB_H @[src/main/scala/pixelart/Xbr2xPipeline.scala 132:43]
    dbg_I <= s3.io_out_bits_winRGB_I @[src/main/scala/pixelart/Xbr2xPipeline.scala 132:77]
    dbg_xc <= s3.io_out_bits_meta_xc @[src/main/scala/pixelart/Xbr2xPipeline.scala 133:10]
    dbg_yc <= s3.io_out_bits_meta_yc @[src/main/scala/pixelart/Xbr2xPipeline.scala 133:44]
    outQ.clock <= clock
    outQ.reset <= reset
    outQ.io_enq_valid <= s5_emit_w @[src/main/scala/pixelart/Xbr2xPipeline.scala 142:26]
    outQ.io_enq_bits_block_0 <= s5.io_out_bits_block_0 @[src/main/scala/pixelart/Xbr2xPipeline.scala 143:26]
    outQ.io_enq_bits_block_1 <= s5.io_out_bits_block_1 @[src/main/scala/pixelart/Xbr2xPipeline.scala 143:26]
    outQ.io_enq_bits_block_2 <= s5.io_out_bits_block_2 @[src/main/scala/pixelart/Xbr2xPipeline.scala 143:26]
    outQ.io_enq_bits_block_3 <= s5.io_out_bits_block_3 @[src/main/scala/pixelart/Xbr2xPipeline.scala 143:26]
    outQ.io_enq_bits_x <= s5.io_out_bits_meta_xc @[src/main/scala/pixelart/Xbr2xPipeline.scala 144:26]
    outQ.io_enq_bits_y <= s5.io_out_bits_meta_yc @[src/main/scala/pixelart/Xbr2xPipeline.scala 145:26]
    outQ.io_enq_bits_sof <= s5.io_out_bits_meta_sof @[src/main/scala/pixelart/Xbr2xPipeline.scala 146:26]
    outQ.io_enq_bits_eol <= s5.io_out_bits_meta_eol @[src/main/scala/pixelart/Xbr2xPipeline.scala 147:26]
    outQ.io_deq_ready <= io_out_ready @[src/main/scala/pixelart/Xbr2xPipeline.scala 34:10]
    v1 <= mux(reset, UInt<1>("h0"), _GEN_0) @[src/main/scala/pixelart/Xbr2xPipeline.scala 39:{19,19}]
    v2 <= mux(reset, UInt<1>("h0"), _GEN_1) @[src/main/scala/pixelart/Xbr2xPipeline.scala 40:{19,19}]
    v3 <= mux(reset, UInt<1>("h0"), _GEN_2) @[src/main/scala/pixelart/Xbr2xPipeline.scala 41:{19,19}]
    v4 <= mux(reset, UInt<1>("h0"), _GEN_3) @[src/main/scala/pixelart/Xbr2xPipeline.scala 42:{19,19}]
    xCnt <= mux(reset, UInt<16>("h0"), _GEN_8) @[src/main/scala/pixelart/Xbr2xPipeline.scala 61:{25,25}]
    yCnt <= mux(reset, UInt<16>("h0"), _GEN_9) @[src/main/scala/pixelart/Xbr2xPipeline.scala 62:{25,25}]
    firstPix <= mux(reset, UInt<1>("h1"), _GEN_7) @[src/main/scala/pixelart/Xbr2xPipeline.scala 63:{25,25}]
    s2.clock <= clock
    s2.reset <= reset
    s2.io_in_pix <= s1_pix @[src/main/scala/pixelart/Xbr2xPipeline.scala 101:21]
    s2.io_in_yuv <= s1_yuv @[src/main/scala/pixelart/Xbr2xPipeline.scala 102:21]
    s2.io_row_m1_rgb <= s1_row_m1_rgb @[src/main/scala/pixelart/Xbr2xPipeline.scala 103:21]
    s2.io_row_m2_rgb <= s1_row_m2_rgb @[src/main/scala/pixelart/Xbr2xPipeline.scala 104:21]
    s2.io_row_m1_yuv <= s1_row_m1_yuv @[src/main/scala/pixelart/Xbr2xPipeline.scala 105:21]
    s2.io_row_m2_yuv <= s1_row_m2_yuv @[src/main/scala/pixelart/Xbr2xPipeline.scala 106:21]
    s2.io_s1_x <= s1_x @[src/main/scala/pixelart/Xbr2xPipeline.scala 107:21]
    s2.io_s1_y <= s1_y @[src/main/scala/pixelart/Xbr2xPipeline.scala 108:21]
    s2.io_s1_sof <= s1_sof @[src/main/scala/pixelart/Xbr2xPipeline.scala 109:21]
    s2.io_s1_eol <= s1_eol @[src/main/scala/pixelart/Xbr2xPipeline.scala 110:21]
    s2.io_v1 <= v1 @[src/main/scala/pixelart/Xbr2xPipeline.scala 111:21]
    s2.io_stall <= stall @[src/main/scala/pixelart/Xbr2xPipeline.scala 112:21]
    s2.io_out_ready <= s3.io_in_ready @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.clock <= clock
    s3.reset <= reset
    s3.io_in_valid <= s2.io_out_valid @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_A <= s2.io_out_bits_winRGB_A @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_B <= s2.io_out_bits_winRGB_B @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_C <= s2.io_out_bits_winRGB_C @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_D <= s2.io_out_bits_winRGB_D @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_E <= s2.io_out_bits_winRGB_E @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_F <= s2.io_out_bits_winRGB_F @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_G <= s2.io_out_bits_winRGB_G @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_H <= s2.io_out_bits_winRGB_H @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_winRGB_I <= s2.io_out_bits_winRGB_I @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_meta_xc <= s2.io_out_bits_meta_xc @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_meta_yc <= s2.io_out_bits_meta_yc @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_meta_sof <= s2.io_out_bits_meta_sof @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_meta_eol <= s2.io_out_bits_meta_eol @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_in_bits_meta_emit <= s2.io_out_bits_meta_emit @[src/main/scala/pixelart/Xbr2xPipeline.scala 115:15]
    s3.io_out_ready <= s4a.io_in_ready @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s3.io_stall <= stall @[src/main/scala/pixelart/Xbr2xPipeline.scala 116:15]
    s4a.clock <= clock
    s4a.reset <= reset
    s4a.io_in_valid <= s3.io_out_valid @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_A <= s3.io_out_bits_winRGB_A @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_B <= s3.io_out_bits_winRGB_B @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_C <= s3.io_out_bits_winRGB_C @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_D <= s3.io_out_bits_winRGB_D @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_E <= s3.io_out_bits_winRGB_E @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_F <= s3.io_out_bits_winRGB_F @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_G <= s3.io_out_bits_winRGB_G @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_H <= s3.io_out_bits_winRGB_H @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_winRGB_I <= s3.io_out_bits_winRGB_I @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_meta_xc <= s3.io_out_bits_meta_xc @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_meta_yc <= s3.io_out_bits_meta_yc @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_meta_sof <= s3.io_out_bits_meta_sof @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_meta_eol <= s3.io_out_bits_meta_eol @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_in_bits_meta_emit <= s3.io_out_bits_meta_emit @[src/main/scala/pixelart/Xbr2xPipeline.scala 119:16]
    s4a.io_out_ready <= s5.io_in_ready @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s4a.io_stall <= stall @[src/main/scala/pixelart/Xbr2xPipeline.scala 120:16]
    s5.clock <= clock
    s5.reset <= reset
    s5.io_in_valid <= s4a.io_out_valid @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_A <= s4a.io_out_bits_winRGB_A @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_B <= s4a.io_out_bits_winRGB_B @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_C <= s4a.io_out_bits_winRGB_C @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_D <= s4a.io_out_bits_winRGB_D @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_E <= s4a.io_out_bits_winRGB_E @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_F <= s4a.io_out_bits_winRGB_F @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_G <= s4a.io_out_bits_winRGB_G @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_H <= s4a.io_out_bits_winRGB_H @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_winRGB_I <= s4a.io_out_bits_winRGB_I @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_meta_xc <= s4a.io_out_bits_meta_xc @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_meta_yc <= s4a.io_out_bits_meta_yc @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_meta_sof <= s4a.io_out_bits_meta_sof @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_meta_eol <= s4a.io_out_bits_meta_eol @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_in_bits_meta_emit <= s4a.io_out_bits_meta_emit @[src/main/scala/pixelart/Xbr2xPipeline.scala 123:16]
    s5.io_out_ready <= outQ.io_enq_ready @[src/main/scala/pixelart/Xbr2xPipeline.scala 126:19]

  module Xbr2xPixelArtScaler :
    input clock : Clock
    input reset : UInt<1>
    input io_inPixel : UInt<24> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    input io_inYuv : UInt<24> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    input io_inValid : UInt<1> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_inReady : UInt<1> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_outPixels_0 : UInt<24> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_outPixels_1 : UInt<24> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_outPixels_2 : UInt<24> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_outPixels_3 : UInt<24> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_outValid : UInt<1> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    input io_outReady : UInt<1> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_outX : UInt<16> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]
    output io_outY : UInt<16> @[src/main/scala/pixelart/PixelArtScale.scala 29:14]

    inst xbr of Xbr2xPipeline @[src/main/scala/pixelart/PixelArtScale.scala 43:19]
    reg col : UInt<6>, clock with :
      reset => (UInt<1>("h0"), col) @[src/main/scala/pixelart/PixelArtScale.scala 51:27]
    reg row : UInt<5>, clock with :
      reset => (UInt<1>("h0"), row) @[src/main/scala/pixelart/PixelArtScale.scala 52:27]
    reg firstPixel : UInt<1>, clock with :
      reset => (UInt<1>("h0"), firstPixel) @[src/main/scala/pixelart/PixelArtScale.scala 53:27]
    node _T = and(io_inValid, io_inReady) @[src/main/scala/pixelart/PixelArtScale.scala 59:19]
    node _xbr_io_in_bits_eol_T = eq(UInt<6>("h30"), UInt<1>("h1")) @[src/main/scala/pixelart/PixelArtScale.scala 62:38]
    node _T_1 = eq(col, UInt<6>("h2f")) @[src/main/scala/pixelart/PixelArtScale.scala 66:20]
    node _row_T = add(row, UInt<1>("h1")) @[src/main/scala/pixelart/PixelArtScale.scala 69:18]
    node _row_T_1 = tail(_row_T, 1) @[src/main/scala/pixelart/PixelArtScale.scala 69:18]
    node _col_T = add(col, UInt<1>("h1")) @[src/main/scala/pixelart/PixelArtScale.scala 71:18]
    node _col_T_1 = tail(_col_T, 1) @[src/main/scala/pixelart/PixelArtScale.scala 71:18]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/pixelart/PixelArtScale.scala 57:22 66:39 67:26]
    node _GEN_1 = mux(_T_1, UInt<1>("h0"), _col_T_1) @[src/main/scala/pixelart/PixelArtScale.scala 66:39 68:11 71:11]
    node _GEN_2 = mux(_T_1, _row_T_1, row) @[src/main/scala/pixelart/PixelArtScale.scala 66:39 69:11 52:27]
    node _GEN_3 = mux(firstPixel, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/pixelart/PixelArtScale.scala 56:22 60:22 61:26]
    node _GEN_4 = mux(firstPixel, _xbr_io_in_bits_eol_T, _GEN_0) @[src/main/scala/pixelart/PixelArtScale.scala 60:22 62:26]
    node _GEN_5 = mux(firstPixel, UInt<1>("h0"), firstPixel) @[src/main/scala/pixelart/PixelArtScale.scala 60:22 63:18 53:27]
    node _GEN_6 = mux(firstPixel, UInt<1>("h1"), _GEN_1) @[src/main/scala/pixelart/PixelArtScale.scala 60:22 64:11]
    node _GEN_7 = mux(firstPixel, UInt<1>("h0"), _GEN_2) @[src/main/scala/pixelart/PixelArtScale.scala 60:22 65:11]
    node _GEN_8 = mux(_T, _GEN_3, UInt<1>("h0")) @[src/main/scala/pixelart/PixelArtScale.scala 56:22 59:34]
    node _GEN_9 = mux(_T, _GEN_4, UInt<1>("h0")) @[src/main/scala/pixelart/PixelArtScale.scala 57:22 59:34]
    node _GEN_10 = mux(_T, _GEN_5, firstPixel) @[src/main/scala/pixelart/PixelArtScale.scala 53:27 59:34]
    node _GEN_11 = mux(_T, _GEN_6, col) @[src/main/scala/pixelart/PixelArtScale.scala 51:27 59:34]
    node _GEN_12 = mux(_T, _GEN_7, row) @[src/main/scala/pixelart/PixelArtScale.scala 52:27 59:34]
    io_inReady <= xbr.io_in_ready @[src/main/scala/pixelart/PixelArtScale.scala 48:23]
    io_outPixels_0 <= xbr.io_out_bits_block_0 @[src/main/scala/pixelart/PixelArtScale.scala 77:20]
    io_outPixels_1 <= xbr.io_out_bits_block_1 @[src/main/scala/pixelart/PixelArtScale.scala 77:20]
    io_outPixels_2 <= xbr.io_out_bits_block_2 @[src/main/scala/pixelart/PixelArtScale.scala 77:20]
    io_outPixels_3 <= xbr.io_out_bits_block_3 @[src/main/scala/pixelart/PixelArtScale.scala 77:20]
    io_outValid <= xbr.io_out_valid @[src/main/scala/pixelart/PixelArtScale.scala 76:20]
    io_outX <= xbr.io_out_bits_x @[src/main/scala/pixelart/PixelArtScale.scala 78:20]
    io_outY <= xbr.io_out_bits_y @[src/main/scala/pixelart/PixelArtScale.scala 79:20]
    xbr.clock <= clock
    xbr.reset <= reset
    xbr.io_in_valid <= io_inValid @[src/main/scala/pixelart/PixelArtScale.scala 45:23]
    xbr.io_in_bits_pix <= io_inPixel @[src/main/scala/pixelart/PixelArtScale.scala 46:23]
    xbr.io_in_bits_yuv <= io_inYuv @[src/main/scala/pixelart/PixelArtScale.scala 47:23]
    xbr.io_in_bits_sof <= _GEN_8
    xbr.io_in_bits_eol <= _GEN_9
    xbr.io_out_ready <= io_outReady @[src/main/scala/pixelart/PixelArtScale.scala 75:20]
    col <= mux(reset, UInt<6>("h0"), _GEN_11) @[src/main/scala/pixelart/PixelArtScale.scala 51:{27,27}]
    row <= mux(reset, UInt<5>("h0"), _GEN_12) @[src/main/scala/pixelart/PixelArtScale.scala 52:{27,27}]
    firstPixel <= mux(reset, UInt<1>("h1"), _GEN_10) @[src/main/scala/pixelart/PixelArtScale.scala 53:{27,27}]
