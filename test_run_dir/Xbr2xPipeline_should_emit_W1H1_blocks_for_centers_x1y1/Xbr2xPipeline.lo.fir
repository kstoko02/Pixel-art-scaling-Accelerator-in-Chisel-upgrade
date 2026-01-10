FIRRTL version 1.2.0
circuit Xbr2xPipeline :
  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_valid : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_0 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_1 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_2 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_block_3 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_x : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_y : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_sof : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_enq_bits_eol : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    input io_deq_ready : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_valid : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_0 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_1 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_2 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_block_3 : UInt<8> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_x : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_y : UInt<16> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_sof : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_deq_bits_eol : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
    output io_count : UInt<5> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]

    mem ram_block_0 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_1 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_2 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
      depth => 16
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_3 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
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

  module Xbr2xPipeline :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    input io_in_valid : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    input io_in_bits_pix : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    input io_in_bits_sof : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    input io_in_bits_eol : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    input io_out_ready : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_valid : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_block_0 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_block_1 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_block_2 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_block_3 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_x : UInt<16> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_y : UInt<16> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_sof : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]
    output io_out_bits_eol : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 40:14]

    inst outQ of Queue @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
    mem buf0 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 112:25]
      data-type => UInt<8>
      depth => 4
      read-latency => 1
      write-latency => 1
      reader => r0
      writer => MPORT
      read-under-write => undefined
    mem buf1 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 113:25]
      data-type => UInt<8>
      depth => 4
      read-latency => 1
      write-latency => 1
      reader => r1
      writer => MPORT_1
      read-under-write => undefined
    mem buf2 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25]
      data-type => UInt<8>
      depth => 4
      read-latency => 1
      write-latency => 1
      reader => r2
      writer => MPORT_2
      read-under-write => undefined
    reg v1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 50:19]
    reg v2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 51:19]
    reg v3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 52:19]
    reg v4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 53:19]
    reg s2_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s2_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 56:24]
    reg s3_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s3_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 57:24]
    reg s4_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:24]
    reg s4_block_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    reg s4_block_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    reg s4_block_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    reg s4_block_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    reg s4_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s4_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 62:21]
    reg s4_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s4_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 63:21]
    reg s4_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s4_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 64:21]
    reg s4_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s4_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 65:21]
    node _stall_T = and(v4, s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 68:18]
    node _stall_T_1 = eq(outQ.io_enq_ready, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 68:32]
    node stall = and(_stall_T, _stall_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 68:29]
    node _io_in_ready_T = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:18]
    node fireIn = and(io_in_valid, io_in_ready) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 71:28]
    node _T = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 73:8]
    node _GEN_0 = mux(_T, fireIn, v1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 50:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 73:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 74:8]
    node _GEN_1 = mux(_T, v1, v2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 51:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 73:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 75:8]
    node _GEN_2 = mux(_T, v2, v3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 52:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 73:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 76:8]
    node _GEN_3 = mux(_T, v3, v4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 53:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 73:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 77:8]
    reg x : UInt<16>, clock with :
      reset => (UInt<1>("h0"), x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 87:18]
    reg y : UInt<16>, clock with :
      reset => (UInt<1>("h0"), y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 88:18]
    node _x_T = mux(io_in_bits_eol, UInt<1>("h0"), UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:15]
    node _y_T = add(y, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:14]
    node _y_T_1 = tail(_y_T, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:14]
    node _x_T_1 = add(x, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:14]
    node _x_T_2 = tail(_x_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:14]
    node _GEN_4 = mux(io_in_bits_eol, UInt<1>("h0"), _x_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 101:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 102:9 src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:9]
    node _GEN_5 = mux(io_in_bits_eol, _y_T_1, y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 101:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:9 src/main/scala/Pixel Art/Xbr2xPipeline.scala 88:18]
    node _GEN_6 = mux(io_in_bits_sof, _x_T, _GEN_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:9]
    node _GEN_7 = mux(io_in_bits_sof, UInt<1>("h0"), _GEN_5) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:9 src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:18]
    node _GEN_8 = mux(fireIn, _GEN_6, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 87:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:16]
    node _GEN_9 = mux(fireIn, _GEN_7, y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 88:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:16]
    reg curIdx : UInt<2>, clock with :
      reset => (UInt<1>("h0"), curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25]
    reg prevIdx : UInt<2>, clock with :
      reset => (UInt<1>("h0"), prevIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25]
    reg prev2Idx : UInt<2>, clock with :
      reset => (UInt<1>("h0"), prev2Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25]
    node _T_1 = and(fireIn, io_in_bits_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:15]
    node _T_2 = and(fireIn, io_in_bits_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:21]
    node _GEN_10 = mux(_T_2, prevIdx, prev2Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 126:14]
    node _GEN_11 = mux(_T_2, curIdx, prevIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 127:14]
    node _GEN_12 = mux(_T_2, prev2Idx, curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 128:14]
    node _GEN_13 = mux(_T_1, UInt<1>("h0"), _GEN_12) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 121:14]
    node _GEN_14 = mux(_T_1, UInt<1>("h1"), _GEN_11) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 121:30]
    node _GEN_15 = mux(_T_1, UInt<2>("h2"), _GEN_10) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 121:47]
    node _T_3 = eq(curIdx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:17]
    node _T_4 = bits(x, 1, 0)
    node _T_5 = eq(curIdx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:24]
    node _T_6 = bits(x, 1, 0)
    node _T_7 = bits(x, 1, 0)
    node _GEN_16 = validif(_T_5, _T_6) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_17 = validif(_T_5, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_18 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 113:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_19 = validif(_T_5, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_20 = validif(_T_5, io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_21 = validif(eq(_T_5, UInt<1>("h0")), _T_7) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_22 = validif(eq(_T_5, UInt<1>("h0")), clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_23 = mux(_T_5, UInt<1>("h0"), UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_24 = validif(eq(_T_5, UInt<1>("h0")), UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_25 = validif(eq(_T_5, UInt<1>("h0")), io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:33]
    node _GEN_26 = validif(_T_3, _T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_27 = validif(_T_3, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_28 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 112:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_29 = validif(_T_3, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_30 = validif(_T_3, io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_31 = validif(eq(_T_3, UInt<1>("h0")), _GEN_16) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_32 = validif(eq(_T_3, UInt<1>("h0")), _GEN_17) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_33 = mux(_T_3, UInt<1>("h0"), _GEN_18) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 113:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_34 = validif(eq(_T_3, UInt<1>("h0")), _GEN_19) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_35 = validif(eq(_T_3, UInt<1>("h0")), _GEN_20) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_36 = validif(eq(_T_3, UInt<1>("h0")), _GEN_21) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_37 = validif(eq(_T_3, UInt<1>("h0")), _GEN_22) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_38 = mux(_T_3, UInt<1>("h0"), _GEN_23) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_39 = validif(eq(_T_3, UInt<1>("h0")), _GEN_24) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_40 = validif(eq(_T_3, UInt<1>("h0")), _GEN_25) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:26]
    node _GEN_41 = validif(fireIn, _GEN_26) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_42 = validif(fireIn, _GEN_27) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_43 = mux(fireIn, _GEN_28, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 112:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_44 = validif(fireIn, _GEN_29) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_45 = validif(fireIn, _GEN_30) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_46 = validif(fireIn, _GEN_31) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_47 = validif(fireIn, _GEN_32) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_48 = mux(fireIn, _GEN_33, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 113:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_49 = validif(fireIn, _GEN_34) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_50 = validif(fireIn, _GEN_35) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_51 = validif(fireIn, _GEN_36) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_52 = validif(fireIn, _GEN_37) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_53 = mux(fireIn, _GEN_38, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_54 = validif(fireIn, _GEN_39) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _GEN_55 = validif(fireIn, _GEN_40) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:16]
    node _r0_T = neq(curIdx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:46]
    node _r0_T_1 = and(fireIn, _r0_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:35]
    node _GEN_56 = validif(_r0_T_1, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21]
    node _r0_WIRE = _GEN_56 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21]
    node _r0_T_2 = or(_r0_WIRE, UInt<2>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21]
    node _r0_T_3 = bits(_r0_T_2, 1, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21]
    node _GEN_57 = mux(_r0_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 112:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21]
    node _GEN_58 = validif(_r0_T_1, _r0_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21]
    node _GEN_59 = validif(_r0_T_1, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:21]
    node _r1_T = neq(curIdx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:46]
    node _r1_T_1 = and(fireIn, _r1_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:35]
    node _GEN_60 = validif(_r1_T_1, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21]
    node _r1_WIRE = _GEN_60 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21]
    node _r1_T_2 = or(_r1_WIRE, UInt<2>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21]
    node _r1_T_3 = bits(_r1_T_2, 1, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21]
    node _GEN_61 = mux(_r1_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 113:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21]
    node _GEN_62 = validif(_r1_T_1, _r1_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21]
    node _GEN_63 = validif(_r1_T_1, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:21]
    node _r2_T = neq(curIdx, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:46]
    node _r2_T_1 = and(fireIn, _r2_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:35]
    node _GEN_64 = validif(_r2_T_1, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21]
    node _r2_WIRE = _GEN_64 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21]
    node _r2_T_2 = or(_r2_WIRE, UInt<2>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21]
    node _r2_T_3 = bits(_r2_T_2, 1, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21]
    node _GEN_65 = mux(_r2_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21]
    node _GEN_66 = validif(_r2_T_1, _r2_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21]
    node _GEN_67 = validif(_r2_T_1, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:21]
    reg s1_pix : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s1_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 144:19]
    reg s1_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s1_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 145:19]
    reg s1_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s1_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 146:19]
    reg s1_x : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s1_x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:19]
    reg s1_y : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s1_y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:19]
    reg s1_prevIdx : UInt<2>, clock with :
      reset => (UInt<1>("h0"), s1_prevIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:24]
    reg s1_prev2Idx : UInt<2>, clock with :
      reset => (UInt<1>("h0"), s1_prev2Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:24]
    node _T_8 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:8]
    node _T_9 = and(_T_8, fireIn) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:15]
    node _GEN_68 = mux(_T_9, io_in_bits_pix, s1_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 144:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 153:12]
    node _GEN_69 = mux(_T_9, io_in_bits_sof, s1_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 145:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 154:12]
    node _GEN_70 = mux(_T_9, io_in_bits_eol, s1_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 146:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 155:12]
    node _GEN_71 = mux(_T_9, x, s1_x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 156:12]
    node _GEN_72 = mux(_T_9, y, s1_y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 157:12]
    node _GEN_73 = mux(_T_9, prevIdx, s1_prevIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 158:17]
    node _GEN_74 = mux(_T_9, prev2Idx, s1_prev2Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 152:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:17]
    node _raw_m1_T = eq(s1_prevIdx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:13]
    node _raw_m1_T_1 = eq(s1_prevIdx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:34]
    node _raw_m1_T_2 = mux(_raw_m1_T_1, buf1.r1.data, buf2.r2.data) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:29]
    node raw_m1 = mux(_raw_m1_T, buf0.r0.data, _raw_m1_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:8]
    node _raw_m2_T = eq(s1_prev2Idx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:13]
    node _raw_m2_T_1 = eq(s1_prev2Idx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:34]
    node _raw_m2_T_2 = mux(_raw_m2_T_1, buf1.r1.data, buf2.r2.data) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:29]
    node raw_m2 = mux(_raw_m2_T, buf0.r0.data, _raw_m2_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:8]
    node _s1_row_m1_T = eq(s1_y, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:25]
    node _s1_row_m1_T_1 = mux(_s1_row_m1_T, s1_pix, raw_m1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:19]
    node _s1_row_m2_T = eq(s1_y, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 172:25]
    node _s1_row_m2_T_1 = eq(s1_y, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 172:51]
    node s1_row_m1 = _s1_row_m1_T_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 169:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:13]
    node _s1_row_m2_T_2 = mux(_s1_row_m2_T_1, s1_row_m1, raw_m2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 172:45]
    node _s1_row_m2_T_3 = mux(_s1_row_m2_T, s1_pix, _s1_row_m2_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 172:19]
    reg sr2_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20]
    reg sr2_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20]
    reg sr2_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20]
    reg sr1_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20]
    reg sr1_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20]
    reg sr1_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20]
    reg sr0_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20]
    reg sr0_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20]
    reg sr0_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20]
    reg s2_win_reg_A : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_B : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_C : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_D : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_E : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_F : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_G : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_H : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_win_reg_I : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23]
    reg s2_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s2_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 180:19]
    reg s2_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s2_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 181:19]
    reg s2_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s2_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:19]
    reg s2_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s2_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 183:19]
    node _T_10 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:8]
    node _T_11 = and(_T_10, v1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:15]
    node firstCol = eq(s1_x, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 186:26]
    node s1_row_m2 = _s1_row_m2_T_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 170:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 172:13]
    node _next_sr2_WIRE__0 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:14]
    node _next_sr2_WIRE_1_0 = sr2_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 190:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 190:14]
    node next_sr2_0 = mux(firstCol, _next_sr2_WIRE__0, _next_sr2_WIRE_1_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 188:23]
    node _next_sr2_WIRE__1 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:14]
    node _next_sr2_WIRE_1_1 = sr2_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 190:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 190:14]
    node next_sr2_1 = mux(firstCol, _next_sr2_WIRE__1, _next_sr2_WIRE_1_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 188:23]
    node _next_sr2_WIRE__2 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:14]
    node _next_sr2_WIRE_1_2 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 190:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 190:14]
    node next_sr2_2 = mux(firstCol, _next_sr2_WIRE__2, _next_sr2_WIRE_1_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 188:23]
    node _next_sr1_WIRE__0 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 193:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 193:14]
    node _next_sr1_WIRE_1_0 = sr1_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 194:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 194:14]
    node next_sr1_0 = mux(firstCol, _next_sr1_WIRE__0, _next_sr1_WIRE_1_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 192:23]
    node _next_sr1_WIRE__1 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 193:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 193:14]
    node _next_sr1_WIRE_1_1 = sr1_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 194:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 194:14]
    node next_sr1_1 = mux(firstCol, _next_sr1_WIRE__1, _next_sr1_WIRE_1_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 192:23]
    node _next_sr1_WIRE__2 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 193:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 193:14]
    node _next_sr1_WIRE_1_2 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 194:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 194:14]
    node next_sr1_2 = mux(firstCol, _next_sr1_WIRE__2, _next_sr1_WIRE_1_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 192:23]
    node _next_sr0_WIRE__0 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 197:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 197:14]
    node _next_sr0_WIRE_1_0 = sr0_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:14]
    node next_sr0_0 = mux(firstCol, _next_sr0_WIRE__0, _next_sr0_WIRE_1_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 196:23]
    node _next_sr0_WIRE__1 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 197:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 197:14]
    node _next_sr0_WIRE_1_1 = sr0_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:14]
    node next_sr0_1 = mux(firstCol, _next_sr0_WIRE__1, _next_sr0_WIRE_1_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 196:23]
    node _next_sr0_WIRE__2 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 197:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 197:14]
    node _next_sr0_WIRE_1_2 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:14]
    node next_sr0_2 = mux(firstCol, _next_sr0_WIRE__2, _next_sr0_WIRE_1_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 196:23]
    node _s2_emit_T = neq(s1_x, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 209:22]
    node _s2_emit_T_1 = neq(s1_y, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 209:40]
    node _s2_emit_T_2 = and(_s2_emit_T, _s2_emit_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 209:31]
    node _s2_xc_T = sub(s1_x, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:20]
    node _s2_xc_T_1 = tail(_s2_xc_T, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:20]
    node _s2_yc_T = sub(s1_y, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 211:20]
    node _s2_yc_T_1 = tail(_s2_yc_T, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 211:20]
    node _GEN_75 = mux(_T_11, next_sr2_0, sr2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:9]
    node _GEN_76 = mux(_T_11, next_sr2_1, sr2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:9]
    node _GEN_77 = mux(_T_11, next_sr2_2, sr2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:9]
    node _GEN_78 = mux(_T_11, next_sr1_0, sr1_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:9]
    node _GEN_79 = mux(_T_11, next_sr1_1, sr1_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:9]
    node _GEN_80 = mux(_T_11, next_sr1_2, sr1_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:9]
    node _GEN_81 = mux(_T_11, next_sr0_0, sr0_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 203:9]
    node _GEN_82 = mux(_T_11, next_sr0_1, sr0_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 203:9]
    node _GEN_83 = mux(_T_11, next_sr0_2, sr0_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 203:9]
    node _GEN_84 = mux(_T_11, next_sr2_0, s2_win_reg_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 205:18]
    node _GEN_85 = mux(_T_11, next_sr2_1, s2_win_reg_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 205:47]
    node _GEN_86 = mux(_T_11, next_sr2_2, s2_win_reg_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 205:76]
    node _GEN_87 = mux(_T_11, next_sr1_0, s2_win_reg_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 206:18]
    node _GEN_88 = mux(_T_11, next_sr1_1, s2_win_reg_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 206:47]
    node _GEN_89 = mux(_T_11, next_sr1_2, s2_win_reg_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 206:76]
    node _GEN_90 = mux(_T_11, next_sr0_0, s2_win_reg_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 207:18]
    node _GEN_91 = mux(_T_11, next_sr0_1, s2_win_reg_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 207:47]
    node _GEN_92 = mux(_T_11, next_sr0_2, s2_win_reg_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 207:76]
    node _GEN_93 = mux(_T_11, _s2_emit_T_2, s2_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 209:13 src/main/scala/Pixel Art/Xbr2xPipeline.scala 56:24]
    node _GEN_94 = mux(_T_11, _s2_xc_T_1, s2_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 180:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:12]
    node _GEN_95 = mux(_T_11, _s2_yc_T_1, s2_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 181:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 211:12]
    node _GEN_96 = mux(_T_11, s1_sof, s2_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 212:12]
    node _GEN_97 = mux(_T_11, s1_eol, s2_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 183:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 213:12]
    reg s3_win_A : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_B : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_C : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_D : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_E : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_F : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_G : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_H : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_win_I : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
    reg s3_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s3_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:19]
    reg s3_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s3_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:19]
    reg s3_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s3_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:19]
    reg s3_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s3_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 221:19]
    node _T_12 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:8]
    node _T_13 = and(_T_12, v2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:15]
    node _GEN_98 = mux(_T_13, s2_win_reg_A, s3_win_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_99 = mux(_T_13, s2_win_reg_B, s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_100 = mux(_T_13, s2_win_reg_C, s3_win_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_101 = mux(_T_13, s2_win_reg_D, s3_win_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_102 = mux(_T_13, s2_win_reg_E, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_103 = mux(_T_13, s2_win_reg_F, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_104 = mux(_T_13, s2_win_reg_G, s3_win_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_105 = mux(_T_13, s2_win_reg_H, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_106 = mux(_T_13, s2_win_reg_I, s3_win_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    node _GEN_107 = mux(_T_13, s2_xc, s3_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 225:12]
    node _GEN_108 = mux(_T_13, s2_yc, s3_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 226:12]
    node _GEN_109 = mux(_T_13, s2_sof, s3_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 227:12]
    node _GEN_110 = mux(_T_13, s2_eol, s3_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 221:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 228:12]
    node _GEN_111 = mux(_T_13, s2_emit, s3_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 229:13 src/main/scala/Pixel Art/Xbr2xPipeline.scala 57:24]
    node _T_14 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:8]
    node _T_15 = and(_T_14, v3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:15]
    node _bNeqH_T = geq(s3_win_B, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:47]
    node _bNeqH_T_1 = sub(s3_win_B, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _bNeqH_T_2 = tail(_bNeqH_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _bNeqH_T_3 = sub(s3_win_H, s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _bNeqH_T_4 = tail(_bNeqH_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _bNeqH_T_5 = mux(_bNeqH_T, _bNeqH_T_2, _bNeqH_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:44]
    node bNeqH = gt(_bNeqH_T_5, UInt<8>("hff")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:33]
    node _dNeqF_T = geq(s3_win_D, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:47]
    node _dNeqF_T_1 = sub(s3_win_D, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _dNeqF_T_2 = tail(_dNeqF_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _dNeqF_T_3 = sub(s3_win_F, s3_win_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _dNeqF_T_4 = tail(_dNeqF_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _dNeqF_T_5 = mux(_dNeqF_T, _dNeqF_T_2, _dNeqF_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:44]
    node dNeqF = gt(_dNeqF_T_5, UInt<8>("hff")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 244:33]
    node _T_16 = and(bNeqH, dNeqF) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 251:16]
    node _e0_T = geq(s3_win_D, s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:47]
    node _e0_T_1 = sub(s3_win_D, s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e0_T_2 = tail(_e0_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e0_T_3 = sub(s3_win_B, s3_win_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e0_T_4 = tail(_e0_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e0_T_5 = mux(_e0_T, _e0_T_2, _e0_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:44]
    node _e0_T_6 = leq(_e0_T_5, UInt<8>("hff")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 252:33]
    node _e0_T_7 = mux(_e0_T_6, s3_win_D, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 252:16]
    node _e1_T = geq(s3_win_B, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:47]
    node _e1_T_1 = sub(s3_win_B, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e1_T_2 = tail(_e1_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e1_T_3 = sub(s3_win_F, s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e1_T_4 = tail(_e1_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e1_T_5 = mux(_e1_T, _e1_T_2, _e1_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:44]
    node _e1_T_6 = leq(_e1_T_5, UInt<8>("hff")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 253:33]
    node _e1_T_7 = mux(_e1_T_6, s3_win_F, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 253:16]
    node _e2_T = geq(s3_win_D, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:47]
    node _e2_T_1 = sub(s3_win_D, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e2_T_2 = tail(_e2_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e2_T_3 = sub(s3_win_H, s3_win_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e2_T_4 = tail(_e2_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e2_T_5 = mux(_e2_T, _e2_T_2, _e2_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:44]
    node _e2_T_6 = leq(_e2_T_5, UInt<8>("hff")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 254:33]
    node _e2_T_7 = mux(_e2_T_6, s3_win_D, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 254:16]
    node _e3_T = geq(s3_win_H, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:47]
    node _e3_T_1 = sub(s3_win_H, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e3_T_2 = tail(_e3_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:55]
    node _e3_T_3 = sub(s3_win_F, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e3_T_4 = tail(_e3_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:62]
    node _e3_T_5 = mux(_e3_T, _e3_T_2, _e3_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:44]
    node _e3_T_6 = leq(_e3_T_5, UInt<8>("hff")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 255:33]
    node _e3_T_7 = mux(_e3_T_6, s3_win_F, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 255:16]
    node _GEN_112 = mux(_T_16, _e0_T_7, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 251:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 252:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:10]
    node _GEN_113 = mux(_T_16, _e1_T_7, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 251:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 253:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:20]
    node _GEN_114 = mux(_T_16, _e2_T_7, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 251:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 254:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:30]
    node _GEN_115 = mux(_T_16, _e3_T_7, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 251:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 255:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:40]
    node e0 = _GEN_112 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 246:18]
    node _WIRE_0 = e0 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24]
    node _GEN_116 = mux(_T_15, _WIRE_0, s4_block_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    node e1 = _GEN_113 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 247:18]
    node _WIRE_1 = e1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24]
    node _GEN_117 = mux(_T_15, _WIRE_1, s4_block_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    node e2 = _GEN_114 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 248:18]
    node _WIRE_2 = e2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24]
    node _GEN_118 = mux(_T_15, _WIRE_2, s4_block_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    node e3 = _GEN_115 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:18]
    node _WIRE_3 = e3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:24]
    node _GEN_119 = mux(_T_15, _WIRE_3, s4_block_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:21]
    node _GEN_120 = mux(_T_15, s3_xc, s4_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 261:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 62:21]
    node _GEN_121 = mux(_T_15, s3_yc, s4_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 262:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 63:21]
    node _GEN_122 = mux(_T_15, s3_sof, s4_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 263:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 64:21]
    node _GEN_123 = mux(_T_15, s3_eol, s4_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 264:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 65:21]
    node _GEN_124 = mux(_T_15, s3_emit, s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 265:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:24]
    node _outQ_io_enq_valid_T = and(v4, s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:27]
    node _sr2_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:28]
    node _sr2_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:28]
    node _sr2_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:28]
    node _sr1_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:28]
    node _sr1_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:28]
    node _sr1_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:28]
    node _sr0_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:28]
    node _sr0_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:28]
    node _sr0_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:28]
    io_in_ready <= _io_in_ready_T @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:15]
    io_out_valid <= outQ.io_deq_valid @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_block_0 <= outQ.io_deq_bits_block_0 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_block_1 <= outQ.io_deq_bits_block_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_block_2 <= outQ.io_deq_bits_block_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_block_3 <= outQ.io_deq_bits_block_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_x <= outQ.io_deq_bits_x @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_y <= outQ.io_deq_bits_y @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_sof <= outQ.io_deq_bits_sof @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    io_out_bits_eol <= outQ.io_deq_bits_eol @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    outQ.clock <= clock
    outQ.reset <= reset
    outQ.io_enq_valid <= _outQ_io_enq_valid_T @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:21]
    outQ.io_enq_bits_block_0 <= s4_block_0 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 270:26]
    outQ.io_enq_bits_block_1 <= s4_block_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 270:26]
    outQ.io_enq_bits_block_2 <= s4_block_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 270:26]
    outQ.io_enq_bits_block_3 <= s4_block_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 270:26]
    outQ.io_enq_bits_x <= s4_xc @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 271:22]
    outQ.io_enq_bits_y <= s4_yc @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 272:22]
    outQ.io_enq_bits_sof <= s4_sof @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 273:24]
    outQ.io_enq_bits_eol <= s4_eol @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 274:24]
    outQ.io_deq_ready <= io_out_ready @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
    v1 <= mux(reset, UInt<1>("h0"), _GEN_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 50:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 50:19]
    v2 <= mux(reset, UInt<1>("h0"), _GEN_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 51:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 51:19]
    v3 <= mux(reset, UInt<1>("h0"), _GEN_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 52:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 52:19]
    v4 <= mux(reset, UInt<1>("h0"), _GEN_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 53:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 53:19]
    s2_emit <= mux(reset, UInt<1>("h0"), _GEN_93) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 56:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 56:24]
    s3_emit <= mux(reset, UInt<1>("h0"), _GEN_111) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 57:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 57:24]
    s4_emit <= mux(reset, UInt<1>("h0"), _GEN_124) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:24]
    s4_block_0 <= _GEN_116
    s4_block_1 <= _GEN_117
    s4_block_2 <= _GEN_118
    s4_block_3 <= _GEN_119
    s4_xc <= _GEN_120
    s4_yc <= _GEN_121
    s4_sof <= _GEN_122
    s4_eol <= _GEN_123
    x <= mux(reset, UInt<16>("h0"), _GEN_8) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 87:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 87:18]
    y <= mux(reset, UInt<16>("h0"), _GEN_9) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 88:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 88:18]
    buf0.r0.addr <= _GEN_58
    buf0.r0.en <= _GEN_57
    buf0.r0.clk <= _GEN_59
    buf0.MPORT.addr <= _GEN_41
    buf0.MPORT.en <= _GEN_43
    buf0.MPORT.clk <= _GEN_42
    buf0.MPORT.data <= _GEN_45
    buf0.MPORT.mask <= _GEN_44
    buf1.r1.addr <= _GEN_62
    buf1.r1.en <= _GEN_61
    buf1.r1.clk <= _GEN_63
    buf1.MPORT_1.addr <= _GEN_46
    buf1.MPORT_1.en <= _GEN_48
    buf1.MPORT_1.clk <= _GEN_47
    buf1.MPORT_1.data <= _GEN_50
    buf1.MPORT_1.mask <= _GEN_49
    buf2.r2.addr <= _GEN_66
    buf2.r2.en <= _GEN_65
    buf2.r2.clk <= _GEN_67
    buf2.MPORT_2.addr <= _GEN_51
    buf2.MPORT_2.en <= _GEN_53
    buf2.MPORT_2.clk <= _GEN_52
    buf2.MPORT_2.data <= _GEN_55
    buf2.MPORT_2.mask <= _GEN_54
    curIdx <= mux(reset, UInt<2>("h0"), _GEN_13) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25]
    prevIdx <= mux(reset, UInt<2>("h1"), _GEN_14) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25]
    prev2Idx <= mux(reset, UInt<2>("h2"), _GEN_15) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25]
    s1_pix <= _GEN_68
    s1_sof <= _GEN_69
    s1_eol <= _GEN_70
    s1_x <= _GEN_71
    s1_y <= _GEN_72
    s1_prevIdx <= _GEN_73
    s1_prev2Idx <= _GEN_74
    sr2_0 <= mux(reset, _sr2_WIRE_0, _GEN_75) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20]
    sr2_1 <= mux(reset, _sr2_WIRE_1, _GEN_76) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20]
    sr2_2 <= mux(reset, _sr2_WIRE_2, _GEN_77) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:20]
    sr1_0 <= mux(reset, _sr1_WIRE_0, _GEN_78) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20]
    sr1_1 <= mux(reset, _sr1_WIRE_1, _GEN_79) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20]
    sr1_2 <= mux(reset, _sr1_WIRE_2, _GEN_80) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 176:20]
    sr0_0 <= mux(reset, _sr0_WIRE_0, _GEN_81) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20]
    sr0_1 <= mux(reset, _sr0_WIRE_1, _GEN_82) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20]
    sr0_2 <= mux(reset, _sr0_WIRE_2, _GEN_83) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:20]
    s2_win_reg_A <= _GEN_84
    s2_win_reg_B <= _GEN_85
    s2_win_reg_C <= _GEN_86
    s2_win_reg_D <= _GEN_87
    s2_win_reg_E <= _GEN_88
    s2_win_reg_F <= _GEN_89
    s2_win_reg_G <= _GEN_90
    s2_win_reg_H <= _GEN_91
    s2_win_reg_I <= _GEN_92
    s2_xc <= _GEN_94
    s2_yc <= _GEN_95
    s2_sof <= _GEN_96
    s2_eol <= _GEN_97
    s3_win_A <= _GEN_98
    s3_win_B <= _GEN_99
    s3_win_C <= _GEN_100
    s3_win_D <= _GEN_101
    s3_win_E <= _GEN_102
    s3_win_F <= _GEN_103
    s3_win_G <= _GEN_104
    s3_win_H <= _GEN_105
    s3_win_I <= _GEN_106
    s3_xc <= _GEN_107
    s3_yc <= _GEN_108
    s3_sof <= _GEN_109
    s3_eol <= _GEN_110
