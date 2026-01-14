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
    output io_count : UInt<9> @[src/main/scala/chisel3/util/Decoupled.scala 278:14]

    mem ram_block_0 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_1 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_2 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_block_3 : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<8>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_x : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<16>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_y : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<16>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_sof : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<1>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    mem ram_eol : @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
      data-type => UInt<1>
      depth => 256
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg enq_ptr_value : UInt<8>, clock with :
      reset => (UInt<1>("h0"), enq_ptr_value) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    reg deq_ptr_value : UInt<8>, clock with :
      reset => (UInt<1>("h0"), deq_ptr_value) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 283:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 284:28]
    node empty = and(ptr_match, _empty_T) @[src/main/scala/chisel3/util/Decoupled.scala 284:25]
    node full = and(ptr_match, maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 285:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
    node wrap = eq(enq_ptr_value, UInt<8>("hff")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
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
    node wrap_1 = eq(deq_ptr_value, UInt<8>("hff")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
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
    node _io_count_T_1 = mux(_io_count_T, UInt<9>("h100"), UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 335:20]
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
    enq_ptr_value <= mux(reset, UInt<8>("h0"), _GEN_15) @[src/main/scala/chisel3/util/Counter.scala 61:{40,40}]
    deq_ptr_value <= mux(reset, UInt<8>("h0"), _GEN_16) @[src/main/scala/chisel3/util/Counter.scala 61:{40,40}]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_17) @[src/main/scala/chisel3/util/Decoupled.scala 282:{27,27}]

  module Xbr2xPipeline :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    input io_in_valid : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    input io_in_bits_pix : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    input io_in_bits_sof : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    input io_in_bits_eol : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    input io_out_ready : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_valid : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_block_0 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_block_1 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_block_2 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_block_3 : UInt<8> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_x : UInt<16> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_y : UInt<16> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_sof : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]
    output io_out_bits_eol : UInt<1> @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 48:14]

    inst outQ of Queue @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 54:20]
    mem buf0 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25]
      data-type => UInt<8>
      depth => 129
      read-latency => 1
      write-latency => 1
      reader => raw_m1_MPORT
      reader => raw_m2_MPORT
      reader => raw_m3_MPORT
      reader => raw_m4_MPORT
      writer => MPORT
      read-under-write => undefined
    mem buf1 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25]
      data-type => UInt<8>
      depth => 129
      read-latency => 1
      write-latency => 1
      reader => raw_m1_MPORT_1
      reader => raw_m2_MPORT_1
      reader => raw_m3_MPORT_1
      reader => raw_m4_MPORT_1
      writer => MPORT_1
      read-under-write => undefined
    mem buf2 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25]
      data-type => UInt<8>
      depth => 129
      read-latency => 1
      write-latency => 1
      reader => raw_m1_MPORT_2
      reader => raw_m2_MPORT_2
      reader => raw_m3_MPORT_2
      reader => raw_m4_MPORT_2
      writer => MPORT_2
      read-under-write => undefined
    mem buf3 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25]
      data-type => UInt<8>
      depth => 129
      read-latency => 1
      write-latency => 1
      reader => raw_m1_MPORT_3
      reader => raw_m2_MPORT_3
      reader => raw_m3_MPORT_3
      reader => raw_m4_MPORT_3
      writer => MPORT_3
      read-under-write => undefined
    mem buf4 : @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25]
      data-type => UInt<8>
      depth => 129
      read-latency => 1
      write-latency => 1
      reader => raw_m1_MPORT_4
      reader => raw_m2_MPORT_4
      reader => raw_m3_MPORT_4
      reader => raw_m4_MPORT_4
      writer => MPORT_4
      read-under-write => undefined
    reg v1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:19]
    reg v2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 59:19]
    reg v3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 60:19]
    reg v4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), v4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:19]
    reg s2_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s2_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 64:24]
    reg s3_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s3_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 65:24]
    reg s4_emit : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:24]
    reg s4_block_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    reg s4_block_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    reg s4_block_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    reg s4_block_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s4_block_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    reg s4_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s4_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 70:21]
    reg s4_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s4_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 71:21]
    reg s4_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s4_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 72:21]
    reg s4_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s4_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 73:21]
    node _stall_T = and(v4, s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 75:18]
    node _stall_T_1 = eq(outQ.io_enq_ready, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 75:32]
    node stall = and(_stall_T, _stall_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 75:29]
    node _io_in_ready_T = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 76:18]
    node fireIn = and(io_in_valid, io_in_ready) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 78:28]
    node _T = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 80:8]
    node _GEN_0 = mux(_T, fireIn, v1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 80:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 81:8]
    node _GEN_1 = mux(_T, v1, v2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 59:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 80:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 82:8]
    node _GEN_2 = mux(_T, v2, v3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 60:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 80:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 83:8]
    node _GEN_3 = mux(_T, v3, v4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 80:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 84:8]
    reg x : UInt<16>, clock with :
      reset => (UInt<1>("h0"), x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 90:18]
    reg y : UInt<16>, clock with :
      reset => (UInt<1>("h0"), y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 91:18]
    node _x_T = mux(io_in_bits_eol, UInt<1>("h0"), UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 101:15]
    node _y_T = add(y, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:14]
    node _y_T_1 = tail(_y_T, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:14]
    node _x_T_1 = add(x, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 107:14]
    node _x_T_2 = tail(_x_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 107:14]
    node _GEN_4 = mux(io_in_bits_eol, UInt<1>("h0"), _x_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 104:9 src/main/scala/Pixel Art/Xbr2xPipeline.scala 107:9]
    node _GEN_5 = mux(io_in_bits_eol, _y_T_1, y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:9 src/main/scala/Pixel Art/Xbr2xPipeline.scala 91:18]
    node _GEN_6 = mux(io_in_bits_sof, _x_T, _GEN_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 101:9]
    node _GEN_7 = mux(io_in_bits_sof, UInt<1>("h0"), _GEN_5) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 102:9]
    node _GEN_8 = mux(fireIn, _GEN_6, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 90:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:16]
    node _GEN_9 = mux(fireIn, _GEN_7, y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 91:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:16]
    reg curIdx : UInt<3>, clock with :
      reset => (UInt<1>("h0"), curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:25]
    reg prev1Idx : UInt<3>, clock with :
      reset => (UInt<1>("h0"), prev1Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 121:25]
    reg prev2Idx : UInt<3>, clock with :
      reset => (UInt<1>("h0"), prev2Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:25]
    reg prev3Idx : UInt<3>, clock with :
      reset => (UInt<1>("h0"), prev3Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 123:25]
    reg prev4Idx : UInt<3>, clock with :
      reset => (UInt<1>("h0"), prev4Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 124:25]
    node _T_1 = and(fireIn, io_in_bits_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 126:15]
    node _T_2 = and(fireIn, io_in_bits_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:21]
    node _GEN_10 = mux(_T_2, prev3Idx, prev4Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 124:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 139:14]
    node _GEN_11 = mux(_T_2, prev2Idx, prev3Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 123:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 140:14]
    node _GEN_12 = mux(_T_2, prev1Idx, prev2Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 141:14]
    node _GEN_13 = mux(_T_2, curIdx, prev1Idx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 121:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 142:14]
    node _GEN_14 = mux(_T_2, prev4Idx, curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:32 src/main/scala/Pixel Art/Xbr2xPipeline.scala 143:14]
    node _GEN_15 = mux(_T_1, UInt<1>("h0"), _GEN_14) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 126:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 127:14]
    node _GEN_16 = mux(_T_1, UInt<1>("h1"), _GEN_13) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 126:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 128:14]
    node _GEN_17 = mux(_T_1, UInt<2>("h2"), _GEN_12) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 126:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:14]
    node _GEN_18 = mux(_T_1, UInt<2>("h3"), _GEN_11) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 126:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 130:14]
    node _GEN_19 = mux(_T_1, UInt<3>("h4"), _GEN_10) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 126:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 131:14]
    node _T_3 = eq(UInt<1>("h0"), curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _T_4 = bits(x, 7, 0)
    node _T_5 = eq(UInt<1>("h1"), curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _T_6 = bits(x, 7, 0)
    node _T_7 = eq(UInt<2>("h2"), curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _T_8 = bits(x, 7, 0)
    node _T_9 = eq(UInt<2>("h3"), curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _T_10 = bits(x, 7, 0)
    node _T_11 = eq(UInt<3>("h4"), curIdx) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _T_12 = bits(x, 7, 0)
    node _GEN_20 = validif(_T_11, _T_12) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_21 = validif(_T_11, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_22 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_23 = validif(_T_11, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_24 = validif(_T_11, io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_25 = validif(_T_9, _T_10) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_26 = validif(_T_9, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_27 = mux(_T_9, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_28 = validif(_T_9, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_29 = validif(_T_9, io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_30 = validif(eq(_T_9, UInt<1>("h0")), _GEN_20) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_31 = validif(eq(_T_9, UInt<1>("h0")), _GEN_21) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_32 = mux(_T_9, UInt<1>("h0"), _GEN_22) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_33 = validif(eq(_T_9, UInt<1>("h0")), _GEN_23) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_34 = validif(eq(_T_9, UInt<1>("h0")), _GEN_24) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_35 = validif(_T_7, _T_8) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_36 = validif(_T_7, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_37 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_38 = validif(_T_7, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_39 = validif(_T_7, io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_40 = validif(eq(_T_7, UInt<1>("h0")), _GEN_25) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_41 = validif(eq(_T_7, UInt<1>("h0")), _GEN_26) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_42 = mux(_T_7, UInt<1>("h0"), _GEN_27) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_43 = validif(eq(_T_7, UInt<1>("h0")), _GEN_28) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_44 = validif(eq(_T_7, UInt<1>("h0")), _GEN_29) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_45 = validif(eq(_T_7, UInt<1>("h0")), _GEN_30) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_46 = validif(eq(_T_7, UInt<1>("h0")), _GEN_31) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_47 = mux(_T_7, UInt<1>("h0"), _GEN_32) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_48 = validif(eq(_T_7, UInt<1>("h0")), _GEN_33) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_49 = validif(eq(_T_7, UInt<1>("h0")), _GEN_34) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_50 = validif(_T_5, _T_6) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_51 = validif(_T_5, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_52 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_53 = validif(_T_5, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_54 = validif(_T_5, io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_55 = validif(eq(_T_5, UInt<1>("h0")), _GEN_35) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_56 = validif(eq(_T_5, UInt<1>("h0")), _GEN_36) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_57 = mux(_T_5, UInt<1>("h0"), _GEN_37) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_58 = validif(eq(_T_5, UInt<1>("h0")), _GEN_38) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_59 = validif(eq(_T_5, UInt<1>("h0")), _GEN_39) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_60 = validif(eq(_T_5, UInt<1>("h0")), _GEN_40) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_61 = validif(eq(_T_5, UInt<1>("h0")), _GEN_41) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_62 = mux(_T_5, UInt<1>("h0"), _GEN_42) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_63 = validif(eq(_T_5, UInt<1>("h0")), _GEN_43) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_64 = validif(eq(_T_5, UInt<1>("h0")), _GEN_44) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_65 = validif(eq(_T_5, UInt<1>("h0")), _GEN_45) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_66 = validif(eq(_T_5, UInt<1>("h0")), _GEN_46) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_67 = mux(_T_5, UInt<1>("h0"), _GEN_47) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_68 = validif(eq(_T_5, UInt<1>("h0")), _GEN_48) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_69 = validif(eq(_T_5, UInt<1>("h0")), _GEN_49) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_70 = validif(_T_3, _T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_71 = validif(_T_3, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_72 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_73 = validif(_T_3, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_74 = validif(_T_3, io_in_bits_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_75 = validif(eq(_T_3, UInt<1>("h0")), _GEN_50) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_76 = validif(eq(_T_3, UInt<1>("h0")), _GEN_51) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_77 = mux(_T_3, UInt<1>("h0"), _GEN_52) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_78 = validif(eq(_T_3, UInt<1>("h0")), _GEN_53) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_79 = validif(eq(_T_3, UInt<1>("h0")), _GEN_54) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_80 = validif(eq(_T_3, UInt<1>("h0")), _GEN_55) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_81 = validif(eq(_T_3, UInt<1>("h0")), _GEN_56) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_82 = mux(_T_3, UInt<1>("h0"), _GEN_57) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_83 = validif(eq(_T_3, UInt<1>("h0")), _GEN_58) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_84 = validif(eq(_T_3, UInt<1>("h0")), _GEN_59) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_85 = validif(eq(_T_3, UInt<1>("h0")), _GEN_60) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_86 = validif(eq(_T_3, UInt<1>("h0")), _GEN_61) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_87 = mux(_T_3, UInt<1>("h0"), _GEN_62) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_88 = validif(eq(_T_3, UInt<1>("h0")), _GEN_63) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_89 = validif(eq(_T_3, UInt<1>("h0")), _GEN_64) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_90 = validif(eq(_T_3, UInt<1>("h0")), _GEN_65) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_91 = validif(eq(_T_3, UInt<1>("h0")), _GEN_66) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_92 = mux(_T_3, UInt<1>("h0"), _GEN_67) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_93 = validif(eq(_T_3, UInt<1>("h0")), _GEN_68) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_94 = validif(eq(_T_3, UInt<1>("h0")), _GEN_69) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 148:20]
    node _GEN_95 = validif(fireIn, _GEN_70) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_96 = validif(fireIn, _GEN_71) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_97 = mux(fireIn, _GEN_72, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_98 = validif(fireIn, _GEN_73) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_99 = validif(fireIn, _GEN_74) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_100 = validif(fireIn, _GEN_75) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_101 = validif(fireIn, _GEN_76) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_102 = mux(fireIn, _GEN_77, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_103 = validif(fireIn, _GEN_78) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_104 = validif(fireIn, _GEN_79) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_105 = validif(fireIn, _GEN_80) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_106 = validif(fireIn, _GEN_81) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_107 = mux(fireIn, _GEN_82, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_108 = validif(fireIn, _GEN_83) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_109 = validif(fireIn, _GEN_84) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_110 = validif(fireIn, _GEN_85) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_111 = validif(fireIn, _GEN_86) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_112 = mux(fireIn, _GEN_87, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_113 = validif(fireIn, _GEN_88) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_114 = validif(fireIn, _GEN_89) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_115 = validif(fireIn, _GEN_90) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_116 = validif(fireIn, _GEN_91) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_117 = mux(fireIn, _GEN_92, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_118 = validif(fireIn, _GEN_93) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _GEN_119 = validif(fireIn, _GEN_94) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 147:16]
    node _raw_m1_T = neq(curIdx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:46]
    node _raw_m1_T_1 = and(fireIn, _raw_m1_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:35]
    node _GEN_120 = validif(_raw_m1_T_1, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m1_WIRE = _GEN_120 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m1_T_2 = or(_raw_m1_WIRE, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m1_T_3 = bits(_raw_m1_T_2, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_121 = mux(_raw_m1_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_122 = validif(_raw_m1_T_1, _raw_m1_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_123 = validif(_raw_m1_T_1, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m1_T_4 = neq(curIdx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:46]
    node _raw_m1_T_5 = and(fireIn, _raw_m1_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:35]
    node _GEN_124 = validif(_raw_m1_T_5, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m1_WIRE_1 = _GEN_124 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m1_T_6 = or(_raw_m1_WIRE_1, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m1_T_7 = bits(_raw_m1_T_6, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_125 = mux(_raw_m1_T_5, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_126 = validif(_raw_m1_T_5, _raw_m1_T_7) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_127 = validif(_raw_m1_T_5, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m1_T_8 = neq(curIdx, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:46]
    node _raw_m1_T_9 = and(fireIn, _raw_m1_T_8) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:35]
    node _GEN_128 = validif(_raw_m1_T_9, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m1_WIRE_2 = _GEN_128 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m1_T_10 = or(_raw_m1_WIRE_2, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m1_T_11 = bits(_raw_m1_T_10, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_129 = mux(_raw_m1_T_9, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_130 = validif(_raw_m1_T_9, _raw_m1_T_11) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_131 = validif(_raw_m1_T_9, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m1_T_12 = neq(curIdx, UInt<2>("h3")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:46]
    node _raw_m1_T_13 = and(fireIn, _raw_m1_T_12) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:35]
    node _GEN_132 = validif(_raw_m1_T_13, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m1_WIRE_3 = _GEN_132 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m1_T_14 = or(_raw_m1_WIRE_3, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m1_T_15 = bits(_raw_m1_T_14, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_133 = mux(_raw_m1_T_13, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_134 = validif(_raw_m1_T_13, _raw_m1_T_15) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_135 = validif(_raw_m1_T_13, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m1_T_16 = neq(curIdx, UInt<3>("h4")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:46]
    node _raw_m1_T_17 = and(fireIn, _raw_m1_T_16) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:35]
    node _GEN_136 = validif(_raw_m1_T_17, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m1_WIRE_4 = _GEN_136 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m1_T_18 = or(_raw_m1_WIRE_4, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m1_T_19 = bits(_raw_m1_T_18, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_137 = mux(_raw_m1_T_17, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_138 = validif(_raw_m1_T_17, _raw_m1_T_19) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_139 = validif(_raw_m1_T_17, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m1_T_20 = eq(UInt<1>("h0"), prev1Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_21 = mux(_raw_m1_T_20, buf0.raw_m1_MPORT.data, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_22 = eq(UInt<1>("h1"), prev1Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_23 = mux(_raw_m1_T_22, buf1.raw_m1_MPORT_1.data, _raw_m1_T_21) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_24 = eq(UInt<2>("h2"), prev1Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_25 = mux(_raw_m1_T_24, buf2.raw_m1_MPORT_2.data, _raw_m1_T_23) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_26 = eq(UInt<2>("h3"), prev1Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_27 = mux(_raw_m1_T_26, buf3.raw_m1_MPORT_3.data, _raw_m1_T_25) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m1_T_28 = eq(UInt<3>("h4"), prev1Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node raw_m1 = mux(_raw_m1_T_28, buf4.raw_m1_MPORT_4.data, _raw_m1_T_27) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T = neq(curIdx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:46]
    node _raw_m2_T_1 = and(fireIn, _raw_m2_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:35]
    node _GEN_140 = validif(_raw_m2_T_1, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m2_WIRE = _GEN_140 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m2_T_2 = or(_raw_m2_WIRE, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m2_T_3 = bits(_raw_m2_T_2, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_141 = mux(_raw_m2_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_142 = validif(_raw_m2_T_1, _raw_m2_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_143 = validif(_raw_m2_T_1, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m2_T_4 = neq(curIdx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:46]
    node _raw_m2_T_5 = and(fireIn, _raw_m2_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:35]
    node _GEN_144 = validif(_raw_m2_T_5, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m2_WIRE_1 = _GEN_144 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m2_T_6 = or(_raw_m2_WIRE_1, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m2_T_7 = bits(_raw_m2_T_6, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_145 = mux(_raw_m2_T_5, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_146 = validif(_raw_m2_T_5, _raw_m2_T_7) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_147 = validif(_raw_m2_T_5, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m2_T_8 = neq(curIdx, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:46]
    node _raw_m2_T_9 = and(fireIn, _raw_m2_T_8) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:35]
    node _GEN_148 = validif(_raw_m2_T_9, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m2_WIRE_2 = _GEN_148 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m2_T_10 = or(_raw_m2_WIRE_2, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m2_T_11 = bits(_raw_m2_T_10, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_149 = mux(_raw_m2_T_9, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_150 = validif(_raw_m2_T_9, _raw_m2_T_11) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_151 = validif(_raw_m2_T_9, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m2_T_12 = neq(curIdx, UInt<2>("h3")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:46]
    node _raw_m2_T_13 = and(fireIn, _raw_m2_T_12) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:35]
    node _GEN_152 = validif(_raw_m2_T_13, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m2_WIRE_3 = _GEN_152 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m2_T_14 = or(_raw_m2_WIRE_3, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m2_T_15 = bits(_raw_m2_T_14, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_153 = mux(_raw_m2_T_13, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_154 = validif(_raw_m2_T_13, _raw_m2_T_15) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_155 = validif(_raw_m2_T_13, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m2_T_16 = neq(curIdx, UInt<3>("h4")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:46]
    node _raw_m2_T_17 = and(fireIn, _raw_m2_T_16) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:35]
    node _GEN_156 = validif(_raw_m2_T_17, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m2_WIRE_4 = _GEN_156 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m2_T_18 = or(_raw_m2_WIRE_4, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m2_T_19 = bits(_raw_m2_T_18, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_157 = mux(_raw_m2_T_17, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_158 = validif(_raw_m2_T_17, _raw_m2_T_19) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_159 = validif(_raw_m2_T_17, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m2_T_20 = eq(UInt<1>("h0"), prev2Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_21 = mux(_raw_m2_T_20, buf0.raw_m2_MPORT.data, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_22 = eq(UInt<1>("h1"), prev2Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_23 = mux(_raw_m2_T_22, buf1.raw_m2_MPORT_1.data, _raw_m2_T_21) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_24 = eq(UInt<2>("h2"), prev2Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_25 = mux(_raw_m2_T_24, buf2.raw_m2_MPORT_2.data, _raw_m2_T_23) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_26 = eq(UInt<2>("h3"), prev2Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_27 = mux(_raw_m2_T_26, buf3.raw_m2_MPORT_3.data, _raw_m2_T_25) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m2_T_28 = eq(UInt<3>("h4"), prev2Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node raw_m2 = mux(_raw_m2_T_28, buf4.raw_m2_MPORT_4.data, _raw_m2_T_27) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T = neq(curIdx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:46]
    node _raw_m3_T_1 = and(fireIn, _raw_m3_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:35]
    node _GEN_160 = validif(_raw_m3_T_1, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m3_WIRE = _GEN_160 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m3_T_2 = or(_raw_m3_WIRE, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m3_T_3 = bits(_raw_m3_T_2, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_161 = mux(_raw_m3_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_162 = validif(_raw_m3_T_1, _raw_m3_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_163 = validif(_raw_m3_T_1, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m3_T_4 = neq(curIdx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:46]
    node _raw_m3_T_5 = and(fireIn, _raw_m3_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:35]
    node _GEN_164 = validif(_raw_m3_T_5, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m3_WIRE_1 = _GEN_164 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m3_T_6 = or(_raw_m3_WIRE_1, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m3_T_7 = bits(_raw_m3_T_6, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_165 = mux(_raw_m3_T_5, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_166 = validif(_raw_m3_T_5, _raw_m3_T_7) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_167 = validif(_raw_m3_T_5, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m3_T_8 = neq(curIdx, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:46]
    node _raw_m3_T_9 = and(fireIn, _raw_m3_T_8) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:35]
    node _GEN_168 = validif(_raw_m3_T_9, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m3_WIRE_2 = _GEN_168 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m3_T_10 = or(_raw_m3_WIRE_2, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m3_T_11 = bits(_raw_m3_T_10, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_169 = mux(_raw_m3_T_9, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_170 = validif(_raw_m3_T_9, _raw_m3_T_11) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_171 = validif(_raw_m3_T_9, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m3_T_12 = neq(curIdx, UInt<2>("h3")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:46]
    node _raw_m3_T_13 = and(fireIn, _raw_m3_T_12) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:35]
    node _GEN_172 = validif(_raw_m3_T_13, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m3_WIRE_3 = _GEN_172 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m3_T_14 = or(_raw_m3_WIRE_3, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m3_T_15 = bits(_raw_m3_T_14, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_173 = mux(_raw_m3_T_13, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_174 = validif(_raw_m3_T_13, _raw_m3_T_15) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_175 = validif(_raw_m3_T_13, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m3_T_16 = neq(curIdx, UInt<3>("h4")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:46]
    node _raw_m3_T_17 = and(fireIn, _raw_m3_T_16) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:35]
    node _GEN_176 = validif(_raw_m3_T_17, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m3_WIRE_4 = _GEN_176 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m3_T_18 = or(_raw_m3_WIRE_4, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m3_T_19 = bits(_raw_m3_T_18, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_177 = mux(_raw_m3_T_17, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_178 = validif(_raw_m3_T_17, _raw_m3_T_19) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_179 = validif(_raw_m3_T_17, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m3_T_20 = eq(UInt<1>("h0"), prev3Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_21 = mux(_raw_m3_T_20, buf0.raw_m3_MPORT.data, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_22 = eq(UInt<1>("h1"), prev3Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_23 = mux(_raw_m3_T_22, buf1.raw_m3_MPORT_1.data, _raw_m3_T_21) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_24 = eq(UInt<2>("h2"), prev3Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_25 = mux(_raw_m3_T_24, buf2.raw_m3_MPORT_2.data, _raw_m3_T_23) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_26 = eq(UInt<2>("h3"), prev3Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_27 = mux(_raw_m3_T_26, buf3.raw_m3_MPORT_3.data, _raw_m3_T_25) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m3_T_28 = eq(UInt<3>("h4"), prev3Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node raw_m3 = mux(_raw_m3_T_28, buf4.raw_m3_MPORT_4.data, _raw_m3_T_27) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T = neq(curIdx, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:46]
    node _raw_m4_T_1 = and(fireIn, _raw_m4_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:35]
    node _GEN_180 = validif(_raw_m4_T_1, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m4_WIRE = _GEN_180 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m4_T_2 = or(_raw_m4_WIRE, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m4_T_3 = bits(_raw_m4_T_2, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_181 = mux(_raw_m4_T_1, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 114:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_182 = validif(_raw_m4_T_1, _raw_m4_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _GEN_183 = validif(_raw_m4_T_1, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 159:21]
    node _raw_m4_T_4 = neq(curIdx, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:46]
    node _raw_m4_T_5 = and(fireIn, _raw_m4_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:35]
    node _GEN_184 = validif(_raw_m4_T_5, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m4_WIRE_1 = _GEN_184 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m4_T_6 = or(_raw_m4_WIRE_1, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m4_T_7 = bits(_raw_m4_T_6, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_185 = mux(_raw_m4_T_5, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 115:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_186 = validif(_raw_m4_T_5, _raw_m4_T_7) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _GEN_187 = validif(_raw_m4_T_5, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:21]
    node _raw_m4_T_8 = neq(curIdx, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:46]
    node _raw_m4_T_9 = and(fireIn, _raw_m4_T_8) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:35]
    node _GEN_188 = validif(_raw_m4_T_9, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m4_WIRE_2 = _GEN_188 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m4_T_10 = or(_raw_m4_WIRE_2, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m4_T_11 = bits(_raw_m4_T_10, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_189 = mux(_raw_m4_T_9, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_190 = validif(_raw_m4_T_9, _raw_m4_T_11) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _GEN_191 = validif(_raw_m4_T_9, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:21]
    node _raw_m4_T_12 = neq(curIdx, UInt<2>("h3")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:46]
    node _raw_m4_T_13 = and(fireIn, _raw_m4_T_12) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:35]
    node _GEN_192 = validif(_raw_m4_T_13, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m4_WIRE_3 = _GEN_192 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m4_T_14 = or(_raw_m4_WIRE_3, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m4_T_15 = bits(_raw_m4_T_14, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_193 = mux(_raw_m4_T_13, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 117:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_194 = validif(_raw_m4_T_13, _raw_m4_T_15) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _GEN_195 = validif(_raw_m4_T_13, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 162:21]
    node _raw_m4_T_16 = neq(curIdx, UInt<3>("h4")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:46]
    node _raw_m4_T_17 = and(fireIn, _raw_m4_T_16) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:35]
    node _GEN_196 = validif(_raw_m4_T_17, x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m4_WIRE_4 = _GEN_196 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m4_T_18 = or(_raw_m4_WIRE_4, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m4_T_19 = bits(_raw_m4_T_18, 7, 0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_197 = mux(_raw_m4_T_17, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 118:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_198 = validif(_raw_m4_T_17, _raw_m4_T_19) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _GEN_199 = validif(_raw_m4_T_17, clock) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21 src/main/scala/Pixel Art/Xbr2xPipeline.scala 163:21]
    node _raw_m4_T_20 = eq(UInt<1>("h0"), prev4Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_21 = mux(_raw_m4_T_20, buf0.raw_m4_MPORT.data, UInt<1>("h0")) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_22 = eq(UInt<1>("h1"), prev4Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_23 = mux(_raw_m4_T_22, buf1.raw_m4_MPORT_1.data, _raw_m4_T_21) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_24 = eq(UInt<2>("h2"), prev4Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_25 = mux(_raw_m4_T_24, buf2.raw_m4_MPORT_2.data, _raw_m4_T_23) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_26 = eq(UInt<2>("h3"), prev4Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_27 = mux(_raw_m4_T_26, buf3.raw_m4_MPORT_3.data, _raw_m4_T_25) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _raw_m4_T_28 = eq(UInt<3>("h4"), prev4Idx) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node raw_m4 = mux(_raw_m4_T_28, buf4.raw_m4_MPORT_4.data, _raw_m4_T_27) @[src/main/scala/chisel3/util/Mux.scala 77:13]
    node _s1_row_m1_T = eq(y, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:25]
    node _s1_row_m1_T_1 = mux(_s1_row_m1_T, io_in_bits_pix, raw_m1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:19]
    node _s1_row_m2_T = leq(y, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 178:25]
    node s1_row_m1 = _s1_row_m1_T_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 172:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:13]
    node _s1_row_m2_T_1 = mux(_s1_row_m2_T, s1_row_m1, raw_m2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 178:19]
    node _s1_row_m3_T = leq(y, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:25]
    node s1_row_m2 = _s1_row_m2_T_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 173:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 178:13]
    node _s1_row_m3_T_1 = mux(_s1_row_m3_T, s1_row_m2, raw_m3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:19]
    node _s1_row_m4_T = leq(y, UInt<2>("h3")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 180:25]
    node s1_row_m3 = _s1_row_m3_T_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 174:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:13]
    node _s1_row_m4_T_1 = mux(_s1_row_m4_T, s1_row_m3, raw_m4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 180:19]
    reg s1_pix : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s1_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 183:19]
    reg s1_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s1_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:19]
    reg s1_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s1_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:19]
    reg s1_x : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s1_x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 186:19]
    reg s1_y : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s1_y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 187:19]
    node _T_13 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:8]
    node _T_14 = and(_T_13, fireIn) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:15]
    node _GEN_200 = mux(_T_14, io_in_bits_pix, s1_pix) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 183:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 190:12]
    node _GEN_201 = mux(_T_14, io_in_bits_sof, s1_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 191:12]
    node _GEN_202 = mux(_T_14, io_in_bits_eol, s1_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 185:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 192:12]
    node _GEN_203 = mux(_T_14, x, s1_x) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 186:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 193:12]
    node _GEN_204 = mux(_T_14, y, s1_y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 187:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 189:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 194:12]
    reg sr4_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr4_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    reg sr4_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr4_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    reg sr4_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr4_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    reg sr4_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr4_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    reg sr4_4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr4_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    reg sr3_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr3_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    reg sr3_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr3_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    reg sr3_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr3_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    reg sr3_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr3_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    reg sr3_4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr3_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    reg sr2_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    reg sr2_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    reg sr2_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    reg sr2_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    reg sr2_4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr2_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    reg sr1_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    reg sr1_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    reg sr1_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    reg sr1_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    reg sr1_4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr1_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    reg sr0_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    reg sr0_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    reg sr0_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    reg sr0_3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    reg sr0_4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), sr0_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    reg s2_win_reg_A : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_B : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_C : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_D : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_E : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_F : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_G : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_H : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_I : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_J : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_J) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_K : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_K) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_L : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_L) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_M : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_N : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_O : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_O) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_P : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_P) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_Q : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_Q) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_R : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_S : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_S) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_T : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_U : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_U) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_V : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_V) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_W : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_W) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_X : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_X) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_win_reg_Y : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s2_win_reg_Y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23]
    reg s2_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s2_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 205:19]
    reg s2_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s2_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 206:19]
    reg s2_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s2_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 207:19]
    reg s2_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s2_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 208:19]
    node _T_15 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:8]
    node _T_16 = and(_T_15, v1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:15]
    node firstCol0 = eq(s1_x, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 211:27]
    node firstCol1 = eq(s1_x, UInt<1>("h1")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 212:27]
    node _n4_WIRE_1_0 = sr4_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n4_WIRE_2_0 = sr4_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n4_T_0 = mux(firstCol1, _n4_WIRE_1_0, _n4_WIRE_2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n4_WIRE_1_1 = sr4_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n4_WIRE_2_1 = sr4_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n4_T_1 = mux(firstCol1, _n4_WIRE_1_1, _n4_WIRE_2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n4_WIRE_1_2 = sr4_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n4_WIRE_2_2 = sr4_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n4_T_2 = mux(firstCol1, _n4_WIRE_1_2, _n4_WIRE_2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node s1_row_m4 = _s1_row_m4_T_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 180:13]
    node _n4_WIRE_1_3 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n4_WIRE_2_3 = sr4_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n4_T_3 = mux(firstCol1, _n4_WIRE_1_3, _n4_WIRE_2_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n4_WIRE_1_4 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n4_WIRE_2_4 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n4_T_4 = mux(firstCol1, _n4_WIRE_1_4, _n4_WIRE_2_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n4_WIRE__0 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n4_0 = mux(firstCol0, _n4_WIRE__0, _n4_T_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n4_WIRE__1 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n4_1 = mux(firstCol0, _n4_WIRE__1, _n4_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n4_WIRE__2 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n4_2 = mux(firstCol0, _n4_WIRE__2, _n4_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n4_WIRE__3 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n4_3 = mux(firstCol0, _n4_WIRE__3, _n4_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n4_WIRE__4 = s1_row_m4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n4_4 = mux(firstCol0, _n4_WIRE__4, _n4_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n3_WIRE_1_0 = sr3_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n3_WIRE_2_0 = sr3_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n3_T_0 = mux(firstCol1, _n3_WIRE_1_0, _n3_WIRE_2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n3_WIRE_1_1 = sr3_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n3_WIRE_2_1 = sr3_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n3_T_1 = mux(firstCol1, _n3_WIRE_1_1, _n3_WIRE_2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n3_WIRE_1_2 = sr3_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n3_WIRE_2_2 = sr3_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n3_T_2 = mux(firstCol1, _n3_WIRE_1_2, _n3_WIRE_2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n3_WIRE_1_3 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n3_WIRE_2_3 = sr3_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n3_T_3 = mux(firstCol1, _n3_WIRE_1_3, _n3_WIRE_2_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n3_WIRE_1_4 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n3_WIRE_2_4 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n3_T_4 = mux(firstCol1, _n3_WIRE_1_4, _n3_WIRE_2_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n3_WIRE__0 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n3_0 = mux(firstCol0, _n3_WIRE__0, _n3_T_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n3_WIRE__1 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n3_1 = mux(firstCol0, _n3_WIRE__1, _n3_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n3_WIRE__2 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n3_2 = mux(firstCol0, _n3_WIRE__2, _n3_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n3_WIRE__3 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n3_3 = mux(firstCol0, _n3_WIRE__3, _n3_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n3_WIRE__4 = s1_row_m3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n3_4 = mux(firstCol0, _n3_WIRE__4, _n3_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n2_WIRE_1_0 = sr2_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n2_WIRE_2_0 = sr2_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n2_T_0 = mux(firstCol1, _n2_WIRE_1_0, _n2_WIRE_2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n2_WIRE_1_1 = sr2_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n2_WIRE_2_1 = sr2_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n2_T_1 = mux(firstCol1, _n2_WIRE_1_1, _n2_WIRE_2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n2_WIRE_1_2 = sr2_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n2_WIRE_2_2 = sr2_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n2_T_2 = mux(firstCol1, _n2_WIRE_1_2, _n2_WIRE_2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n2_WIRE_1_3 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n2_WIRE_2_3 = sr2_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n2_T_3 = mux(firstCol1, _n2_WIRE_1_3, _n2_WIRE_2_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n2_WIRE_1_4 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n2_WIRE_2_4 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n2_T_4 = mux(firstCol1, _n2_WIRE_1_4, _n2_WIRE_2_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n2_WIRE__0 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n2_0 = mux(firstCol0, _n2_WIRE__0, _n2_T_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n2_WIRE__1 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n2_1 = mux(firstCol0, _n2_WIRE__1, _n2_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n2_WIRE__2 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n2_2 = mux(firstCol0, _n2_WIRE__2, _n2_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n2_WIRE__3 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n2_3 = mux(firstCol0, _n2_WIRE__3, _n2_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n2_WIRE__4 = s1_row_m2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n2_4 = mux(firstCol0, _n2_WIRE__4, _n2_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n1_WIRE_1_0 = sr1_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n1_WIRE_2_0 = sr1_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n1_T_0 = mux(firstCol1, _n1_WIRE_1_0, _n1_WIRE_2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n1_WIRE_1_1 = sr1_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n1_WIRE_2_1 = sr1_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n1_T_1 = mux(firstCol1, _n1_WIRE_1_1, _n1_WIRE_2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n1_WIRE_1_2 = sr1_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n1_WIRE_2_2 = sr1_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n1_T_2 = mux(firstCol1, _n1_WIRE_1_2, _n1_WIRE_2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n1_WIRE_1_3 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n1_WIRE_2_3 = sr1_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n1_T_3 = mux(firstCol1, _n1_WIRE_1_3, _n1_WIRE_2_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n1_WIRE_1_4 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n1_WIRE_2_4 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n1_T_4 = mux(firstCol1, _n1_WIRE_1_4, _n1_WIRE_2_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n1_WIRE__0 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n1_0 = mux(firstCol0, _n1_WIRE__0, _n1_T_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n1_WIRE__1 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n1_1 = mux(firstCol0, _n1_WIRE__1, _n1_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n1_WIRE__2 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n1_2 = mux(firstCol0, _n1_WIRE__2, _n1_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n1_WIRE__3 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n1_3 = mux(firstCol0, _n1_WIRE__3, _n1_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n1_WIRE__4 = s1_row_m1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n1_4 = mux(firstCol0, _n1_WIRE__4, _n1_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n0_WIRE_1_0 = sr0_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n0_WIRE_2_0 = sr0_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n0_T_0 = mux(firstCol1, _n0_WIRE_1_0, _n0_WIRE_2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n0_WIRE_1_1 = sr0_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n0_WIRE_2_1 = sr0_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n0_T_1 = mux(firstCol1, _n0_WIRE_1_1, _n0_WIRE_2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n0_WIRE_1_2 = sr0_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n0_WIRE_2_2 = sr0_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n0_T_2 = mux(firstCol1, _n0_WIRE_1_2, _n0_WIRE_2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n0_WIRE_1_3 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n0_WIRE_2_3 = sr0_4 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n0_T_3 = mux(firstCol1, _n0_WIRE_1_3, _n0_WIRE_2_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n0_WIRE_1_4 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:18]
    node _n0_WIRE_2_4 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:18]
    node _n0_T_4 = mux(firstCol1, _n0_WIRE_1_4, _n0_WIRE_2_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 218:12]
    node _n0_WIRE__0 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n0_0 = mux(firstCol0, _n0_WIRE__0, _n0_T_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n0_WIRE__1 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n0_1 = mux(firstCol0, _n0_WIRE__1, _n0_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n0_WIRE__2 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n0_2 = mux(firstCol0, _n0_WIRE__2, _n0_T_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n0_WIRE__3 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n0_3 = mux(firstCol0, _n0_WIRE__3, _n0_T_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _n0_WIRE__4 = s1_pix @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16 src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:16]
    node n0_4 = mux(firstCol0, _n0_WIRE__4, _n0_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:10]
    node _s2_emit_T = geq(s1_x, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 242:22]
    node _s2_emit_T_1 = geq(s1_y, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 242:39]
    node _s2_emit_T_2 = and(_s2_emit_T, _s2_emit_T_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 242:30]
    node _s2_xc_T = sub(s1_x, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:21]
    node _s2_xc_T_1 = tail(_s2_xc_T, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:21]
    node _s2_yc_T = sub(s1_y, UInt<2>("h2")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 244:21]
    node _s2_yc_T_1 = tail(_s2_yc_T, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 244:21]
    node _GEN_205 = mux(_T_16, n4_0, sr4_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:9]
    node _GEN_206 = mux(_T_16, n4_1, sr4_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:9]
    node _GEN_207 = mux(_T_16, n4_2, sr4_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:9]
    node _GEN_208 = mux(_T_16, n4_3, sr4_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:9]
    node _GEN_209 = mux(_T_16, n4_4, sr4_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:9]
    node _GEN_210 = mux(_T_16, n3_0, sr3_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:20]
    node _GEN_211 = mux(_T_16, n3_1, sr3_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:20]
    node _GEN_212 = mux(_T_16, n3_2, sr3_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:20]
    node _GEN_213 = mux(_T_16, n3_3, sr3_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:20]
    node _GEN_214 = mux(_T_16, n3_4, sr3_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:20]
    node _GEN_215 = mux(_T_16, n2_0, sr2_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:31]
    node _GEN_216 = mux(_T_16, n2_1, sr2_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:31]
    node _GEN_217 = mux(_T_16, n2_2, sr2_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:31]
    node _GEN_218 = mux(_T_16, n2_3, sr2_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:31]
    node _GEN_219 = mux(_T_16, n2_4, sr2_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:31]
    node _GEN_220 = mux(_T_16, n1_0, sr1_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:42]
    node _GEN_221 = mux(_T_16, n1_1, sr1_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:42]
    node _GEN_222 = mux(_T_16, n1_2, sr1_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:42]
    node _GEN_223 = mux(_T_16, n1_3, sr1_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:42]
    node _GEN_224 = mux(_T_16, n1_4, sr1_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:42]
    node _GEN_225 = mux(_T_16, n0_0, sr0_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:53]
    node _GEN_226 = mux(_T_16, n0_1, sr0_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:53]
    node _GEN_227 = mux(_T_16, n0_2, sr0_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:53]
    node _GEN_228 = mux(_T_16, n0_3, sr0_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:53]
    node _GEN_229 = mux(_T_16, n0_4, sr0_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 233:53]
    node _GEN_230 = mux(_T_16, n4_0, s2_win_reg_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:18]
    node _GEN_231 = mux(_T_16, n4_1, s2_win_reg_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:41]
    node _GEN_232 = mux(_T_16, n4_2, s2_win_reg_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:64]
    node _GEN_233 = mux(_T_16, n4_3, s2_win_reg_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:87]
    node _GEN_234 = mux(_T_16, n4_4, s2_win_reg_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:110]
    node _GEN_235 = mux(_T_16, n3_0, s2_win_reg_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:18]
    node _GEN_236 = mux(_T_16, n3_1, s2_win_reg_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:41]
    node _GEN_237 = mux(_T_16, n3_2, s2_win_reg_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:64]
    node _GEN_238 = mux(_T_16, n3_3, s2_win_reg_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:87]
    node _GEN_239 = mux(_T_16, n3_4, s2_win_reg_J) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:110]
    node _GEN_240 = mux(_T_16, n2_0, s2_win_reg_K) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 238:18]
    node _GEN_241 = mux(_T_16, n2_1, s2_win_reg_L) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 238:41]
    node _GEN_242 = mux(_T_16, n2_2, s2_win_reg_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 238:64]
    node _GEN_243 = mux(_T_16, n2_3, s2_win_reg_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 238:87]
    node _GEN_244 = mux(_T_16, n2_4, s2_win_reg_O) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 238:110]
    node _GEN_245 = mux(_T_16, n1_0, s2_win_reg_P) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 239:18]
    node _GEN_246 = mux(_T_16, n1_1, s2_win_reg_Q) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 239:41]
    node _GEN_247 = mux(_T_16, n1_2, s2_win_reg_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 239:64]
    node _GEN_248 = mux(_T_16, n1_3, s2_win_reg_S) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 239:87]
    node _GEN_249 = mux(_T_16, n1_4, s2_win_reg_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 239:110]
    node _GEN_250 = mux(_T_16, n0_0, s2_win_reg_U) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 240:18]
    node _GEN_251 = mux(_T_16, n0_1, s2_win_reg_V) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 240:41]
    node _GEN_252 = mux(_T_16, n0_2, s2_win_reg_W) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 240:64]
    node _GEN_253 = mux(_T_16, n0_3, s2_win_reg_X) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 240:87]
    node _GEN_254 = mux(_T_16, n0_4, s2_win_reg_Y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 204:23 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 240:110]
    node _GEN_255 = mux(_T_16, _s2_emit_T_2, s2_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 242:13 src/main/scala/Pixel Art/Xbr2xPipeline.scala 64:24]
    node _GEN_256 = mux(_T_16, _s2_xc_T_1, s2_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 205:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:13]
    node _GEN_257 = mux(_T_16, _s2_yc_T_1, s2_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 206:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 244:13]
    node _GEN_258 = mux(_T_16, s1_sof, s2_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 207:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 245:13]
    node _GEN_259 = mux(_T_16, s1_eol, s2_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 208:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 210:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 246:13]
    reg s3_win_A : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_B : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_C : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_D : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_E : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_F : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_G : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_H : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_I : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_J : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_J) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_K : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_K) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_L : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_L) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_M : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_N : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_O : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_O) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_P : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_P) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_Q : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_Q) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_R : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_S : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_S) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_T : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_U : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_U) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_V : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_V) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_W : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_W) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_X : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_X) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_win_Y : UInt<8>, clock with :
      reset => (UInt<1>("h0"), s3_win_Y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19]
    reg s3_xc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s3_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 251:19]
    reg s3_yc : UInt<16>, clock with :
      reset => (UInt<1>("h0"), s3_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 252:19]
    reg s3_sof : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s3_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 253:19]
    reg s3_eol : UInt<1>, clock with :
      reset => (UInt<1>("h0"), s3_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 254:19]
    node _T_17 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:8]
    node _T_18 = and(_T_17, v2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:15]
    node _GEN_260 = mux(_T_18, s2_win_reg_A, s3_win_A) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_261 = mux(_T_18, s2_win_reg_B, s3_win_B) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_262 = mux(_T_18, s2_win_reg_C, s3_win_C) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_263 = mux(_T_18, s2_win_reg_D, s3_win_D) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_264 = mux(_T_18, s2_win_reg_E, s3_win_E) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_265 = mux(_T_18, s2_win_reg_F, s3_win_F) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_266 = mux(_T_18, s2_win_reg_G, s3_win_G) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_267 = mux(_T_18, s2_win_reg_H, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_268 = mux(_T_18, s2_win_reg_I, s3_win_I) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_269 = mux(_T_18, s2_win_reg_J, s3_win_J) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_270 = mux(_T_18, s2_win_reg_K, s3_win_K) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_271 = mux(_T_18, s2_win_reg_L, s3_win_L) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_272 = mux(_T_18, s2_win_reg_M, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_273 = mux(_T_18, s2_win_reg_N, s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_274 = mux(_T_18, s2_win_reg_O, s3_win_O) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_275 = mux(_T_18, s2_win_reg_P, s3_win_P) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_276 = mux(_T_18, s2_win_reg_Q, s3_win_Q) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_277 = mux(_T_18, s2_win_reg_R, s3_win_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_278 = mux(_T_18, s2_win_reg_S, s3_win_S) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_279 = mux(_T_18, s2_win_reg_T, s3_win_T) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_280 = mux(_T_18, s2_win_reg_U, s3_win_U) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_281 = mux(_T_18, s2_win_reg_V, s3_win_V) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_282 = mux(_T_18, s2_win_reg_W, s3_win_W) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_283 = mux(_T_18, s2_win_reg_X, s3_win_X) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_284 = mux(_T_18, s2_win_reg_Y, s3_win_Y) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 250:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 257:12]
    node _GEN_285 = mux(_T_18, s2_xc, s3_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 251:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 258:12]
    node _GEN_286 = mux(_T_18, s2_yc, s3_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 252:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 259:12]
    node _GEN_287 = mux(_T_18, s2_sof, s3_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 253:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 260:12]
    node _GEN_288 = mux(_T_18, s2_eol, s3_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 254:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 261:12]
    node _GEN_289 = mux(_T_18, s2_emit, s3_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 256:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 262:13 src/main/scala/Pixel Art/Xbr2xPipeline.scala 65:24]
    node _T_19 = eq(stall, UInt<1>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:8]
    node _T_20 = and(_T_19, v3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:15]
    node _bNeqH_T = geq(s3_win_H, s3_win_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:47]
    node _bNeqH_T_1 = sub(s3_win_H, s3_win_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _bNeqH_T_2 = tail(_bNeqH_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _bNeqH_T_3 = sub(s3_win_R, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _bNeqH_T_4 = tail(_bNeqH_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _bNeqH_T_5 = mux(_bNeqH_T, _bNeqH_T_2, _bNeqH_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:44]
    node bNeqH = gt(_bNeqH_T_5, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 277:33]
    node _dNeqF_T = geq(s3_win_L, s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:47]
    node _dNeqF_T_1 = sub(s3_win_L, s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _dNeqF_T_2 = tail(_dNeqF_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _dNeqF_T_3 = sub(s3_win_N, s3_win_L) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _dNeqF_T_4 = tail(_dNeqF_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _dNeqF_T_5 = mux(_dNeqF_T, _dNeqF_T_2, _dNeqF_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:44]
    node dNeqF = gt(_dNeqF_T_5, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 278:33]
    node _T_21 = and(bNeqH, dNeqF) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 285:16]
    node _e0_T = geq(s3_win_L, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:47]
    node _e0_T_1 = sub(s3_win_L, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e0_T_2 = tail(_e0_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e0_T_3 = sub(s3_win_H, s3_win_L) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e0_T_4 = tail(_e0_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e0_T_5 = mux(_e0_T, _e0_T_2, _e0_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:44]
    node _e0_T_6 = leq(_e0_T_5, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 286:33]
    node _e0_T_7 = mux(_e0_T_6, s3_win_L, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 286:16]
    node _e1_T = geq(s3_win_H, s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:47]
    node _e1_T_1 = sub(s3_win_H, s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e1_T_2 = tail(_e1_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e1_T_3 = sub(s3_win_N, s3_win_H) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e1_T_4 = tail(_e1_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e1_T_5 = mux(_e1_T, _e1_T_2, _e1_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:44]
    node _e1_T_6 = leq(_e1_T_5, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 287:33]
    node _e1_T_7 = mux(_e1_T_6, s3_win_N, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 287:16]
    node _e2_T = geq(s3_win_L, s3_win_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:47]
    node _e2_T_1 = sub(s3_win_L, s3_win_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e2_T_2 = tail(_e2_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e2_T_3 = sub(s3_win_R, s3_win_L) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e2_T_4 = tail(_e2_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e2_T_5 = mux(_e2_T, _e2_T_2, _e2_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:44]
    node _e2_T_6 = leq(_e2_T_5, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 288:33]
    node _e2_T_7 = mux(_e2_T_6, s3_win_L, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 288:16]
    node _e3_T = geq(s3_win_R, s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:47]
    node _e3_T_1 = sub(s3_win_R, s3_win_N) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e3_T_2 = tail(_e3_T_1, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:55]
    node _e3_T_3 = sub(s3_win_N, s3_win_R) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e3_T_4 = tail(_e3_T_3, 1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:62]
    node _e3_T_5 = mux(_e3_T, _e3_T_2, _e3_T_4) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 266:44]
    node _e3_T_6 = leq(_e3_T_5, UInt<8>("h0")) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 289:33]
    node _e3_T_7 = mux(_e3_T_6, s3_win_N, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 289:16]
    node _GEN_290 = mux(_T_21, _e0_T_7, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 285:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 286:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 291:10]
    node _GEN_291 = mux(_T_21, _e1_T_7, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 285:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 287:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 291:20]
    node _GEN_292 = mux(_T_21, _e2_T_7, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 285:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 288:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 291:30]
    node _GEN_293 = mux(_T_21, _e3_T_7, s3_win_M) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 285:26 src/main/scala/Pixel Art/Xbr2xPipeline.scala 289:10 src/main/scala/Pixel Art/Xbr2xPipeline.scala 291:40]
    node e0 = _GEN_290 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 280:18]
    node _WIRE_0 = e0 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24]
    node _GEN_294 = mux(_T_20, _WIRE_0, s4_block_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    node e1 = _GEN_291 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 281:18]
    node _WIRE_1 = e1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24]
    node _GEN_295 = mux(_T_20, _WIRE_1, s4_block_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    node e2 = _GEN_292 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 282:18]
    node _WIRE_2 = e2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24]
    node _GEN_296 = mux(_T_20, _WIRE_2, s4_block_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    node e3 = _GEN_293 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 283:18]
    node _WIRE_3 = e3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:24]
    node _GEN_297 = mux(_T_20, _WIRE_3, s4_block_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 294:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:21]
    node _GEN_298 = mux(_T_20, s3_xc, s4_xc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 295:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 70:21]
    node _GEN_299 = mux(_T_20, s3_yc, s4_yc) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 296:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 71:21]
    node _GEN_300 = mux(_T_20, s3_sof, s4_sof) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 297:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 72:21]
    node _GEN_301 = mux(_T_20, s3_eol, s4_eol) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 298:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 73:21]
    node _GEN_302 = mux(_T_20, s3_emit, s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:22 src/main/scala/Pixel Art/Xbr2xPipeline.scala 299:14 src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:24]
    node _outQ_io_enq_valid_T = and(v4, s4_emit) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 303:27]
    node _sr4_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28]
    node _sr4_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28]
    node _sr4_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28]
    node _sr4_WIRE_3 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28]
    node _sr4_WIRE_4 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:28]
    node _sr3_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28]
    node _sr3_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28]
    node _sr3_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28]
    node _sr3_WIRE_3 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28]
    node _sr3_WIRE_4 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:28]
    node _sr2_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28]
    node _sr2_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28]
    node _sr2_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28]
    node _sr2_WIRE_3 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28]
    node _sr2_WIRE_4 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:28]
    node _sr1_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28]
    node _sr1_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28]
    node _sr1_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28]
    node _sr1_WIRE_3 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28]
    node _sr1_WIRE_4 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:28]
    node _sr0_WIRE_0 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28]
    node _sr0_WIRE_1 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28]
    node _sr0_WIRE_2 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28]
    node _sr0_WIRE_3 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28]
    node _sr0_WIRE_4 = UInt<8>("h0") @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:28]
    io_in_ready <= _io_in_ready_T @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 76:15]
    io_out_valid <= outQ.io_deq_valid @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_block_0 <= outQ.io_deq_bits_block_0 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_block_1 <= outQ.io_deq_bits_block_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_block_2 <= outQ.io_deq_bits_block_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_block_3 <= outQ.io_deq_bits_block_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_x <= outQ.io_deq_bits_x @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_y <= outQ.io_deq_bits_y @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_sof <= outQ.io_deq_bits_sof @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    io_out_bits_eol <= outQ.io_deq_bits_eol @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    outQ.clock <= clock
    outQ.reset <= reset
    outQ.io_enq_valid <= _outQ_io_enq_valid_T @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 303:21]
    outQ.io_enq_bits_block_0 <= s4_block_0 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 304:26]
    outQ.io_enq_bits_block_1 <= s4_block_1 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 304:26]
    outQ.io_enq_bits_block_2 <= s4_block_2 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 304:26]
    outQ.io_enq_bits_block_3 <= s4_block_3 @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 304:26]
    outQ.io_enq_bits_x <= s4_xc @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 305:22]
    outQ.io_enq_bits_y <= s4_yc @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 306:22]
    outQ.io_enq_bits_sof <= s4_sof @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 307:24]
    outQ.io_enq_bits_eol <= s4_eol @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 308:24]
    outQ.io_deq_ready <= io_out_ready @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:10]
    v1 <= mux(reset, UInt<1>("h0"), _GEN_0) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:19]
    v2 <= mux(reset, UInt<1>("h0"), _GEN_1) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 59:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 59:19]
    v3 <= mux(reset, UInt<1>("h0"), _GEN_2) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 60:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 60:19]
    v4 <= mux(reset, UInt<1>("h0"), _GEN_3) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:19 src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:19]
    s2_emit <= mux(reset, UInt<1>("h0"), _GEN_255) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 64:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 64:24]
    s3_emit <= mux(reset, UInt<1>("h0"), _GEN_289) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 65:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 65:24]
    s4_emit <= mux(reset, UInt<1>("h0"), _GEN_302) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:24 src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:24]
    s4_block_0 <= _GEN_294
    s4_block_1 <= _GEN_295
    s4_block_2 <= _GEN_296
    s4_block_3 <= _GEN_297
    s4_xc <= _GEN_298
    s4_yc <= _GEN_299
    s4_sof <= _GEN_300
    s4_eol <= _GEN_301
    x <= mux(reset, UInt<16>("h0"), _GEN_8) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 90:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 90:18]
    y <= mux(reset, UInt<16>("h0"), _GEN_9) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 91:18 src/main/scala/Pixel Art/Xbr2xPipeline.scala 91:18]
    buf0.raw_m1_MPORT.addr <= _GEN_122
    buf0.raw_m1_MPORT.en <= _GEN_121
    buf0.raw_m1_MPORT.clk <= _GEN_123
    buf0.raw_m2_MPORT.addr <= _GEN_142
    buf0.raw_m2_MPORT.en <= _GEN_141
    buf0.raw_m2_MPORT.clk <= _GEN_143
    buf0.raw_m3_MPORT.addr <= _GEN_162
    buf0.raw_m3_MPORT.en <= _GEN_161
    buf0.raw_m3_MPORT.clk <= _GEN_163
    buf0.raw_m4_MPORT.addr <= _GEN_182
    buf0.raw_m4_MPORT.en <= _GEN_181
    buf0.raw_m4_MPORT.clk <= _GEN_183
    buf0.MPORT.addr <= _GEN_95
    buf0.MPORT.en <= _GEN_97
    buf0.MPORT.clk <= _GEN_96
    buf0.MPORT.data <= _GEN_99
    buf0.MPORT.mask <= _GEN_98
    buf1.raw_m1_MPORT_1.addr <= _GEN_126
    buf1.raw_m1_MPORT_1.en <= _GEN_125
    buf1.raw_m1_MPORT_1.clk <= _GEN_127
    buf1.raw_m2_MPORT_1.addr <= _GEN_146
    buf1.raw_m2_MPORT_1.en <= _GEN_145
    buf1.raw_m2_MPORT_1.clk <= _GEN_147
    buf1.raw_m3_MPORT_1.addr <= _GEN_166
    buf1.raw_m3_MPORT_1.en <= _GEN_165
    buf1.raw_m3_MPORT_1.clk <= _GEN_167
    buf1.raw_m4_MPORT_1.addr <= _GEN_186
    buf1.raw_m4_MPORT_1.en <= _GEN_185
    buf1.raw_m4_MPORT_1.clk <= _GEN_187
    buf1.MPORT_1.addr <= _GEN_100
    buf1.MPORT_1.en <= _GEN_102
    buf1.MPORT_1.clk <= _GEN_101
    buf1.MPORT_1.data <= _GEN_104
    buf1.MPORT_1.mask <= _GEN_103
    buf2.raw_m1_MPORT_2.addr <= _GEN_130
    buf2.raw_m1_MPORT_2.en <= _GEN_129
    buf2.raw_m1_MPORT_2.clk <= _GEN_131
    buf2.raw_m2_MPORT_2.addr <= _GEN_150
    buf2.raw_m2_MPORT_2.en <= _GEN_149
    buf2.raw_m2_MPORT_2.clk <= _GEN_151
    buf2.raw_m3_MPORT_2.addr <= _GEN_170
    buf2.raw_m3_MPORT_2.en <= _GEN_169
    buf2.raw_m3_MPORT_2.clk <= _GEN_171
    buf2.raw_m4_MPORT_2.addr <= _GEN_190
    buf2.raw_m4_MPORT_2.en <= _GEN_189
    buf2.raw_m4_MPORT_2.clk <= _GEN_191
    buf2.MPORT_2.addr <= _GEN_105
    buf2.MPORT_2.en <= _GEN_107
    buf2.MPORT_2.clk <= _GEN_106
    buf2.MPORT_2.data <= _GEN_109
    buf2.MPORT_2.mask <= _GEN_108
    buf3.raw_m1_MPORT_3.addr <= _GEN_134
    buf3.raw_m1_MPORT_3.en <= _GEN_133
    buf3.raw_m1_MPORT_3.clk <= _GEN_135
    buf3.raw_m2_MPORT_3.addr <= _GEN_154
    buf3.raw_m2_MPORT_3.en <= _GEN_153
    buf3.raw_m2_MPORT_3.clk <= _GEN_155
    buf3.raw_m3_MPORT_3.addr <= _GEN_174
    buf3.raw_m3_MPORT_3.en <= _GEN_173
    buf3.raw_m3_MPORT_3.clk <= _GEN_175
    buf3.raw_m4_MPORT_3.addr <= _GEN_194
    buf3.raw_m4_MPORT_3.en <= _GEN_193
    buf3.raw_m4_MPORT_3.clk <= _GEN_195
    buf3.MPORT_3.addr <= _GEN_110
    buf3.MPORT_3.en <= _GEN_112
    buf3.MPORT_3.clk <= _GEN_111
    buf3.MPORT_3.data <= _GEN_114
    buf3.MPORT_3.mask <= _GEN_113
    buf4.raw_m1_MPORT_4.addr <= _GEN_138
    buf4.raw_m1_MPORT_4.en <= _GEN_137
    buf4.raw_m1_MPORT_4.clk <= _GEN_139
    buf4.raw_m2_MPORT_4.addr <= _GEN_158
    buf4.raw_m2_MPORT_4.en <= _GEN_157
    buf4.raw_m2_MPORT_4.clk <= _GEN_159
    buf4.raw_m3_MPORT_4.addr <= _GEN_178
    buf4.raw_m3_MPORT_4.en <= _GEN_177
    buf4.raw_m3_MPORT_4.clk <= _GEN_179
    buf4.raw_m4_MPORT_4.addr <= _GEN_198
    buf4.raw_m4_MPORT_4.en <= _GEN_197
    buf4.raw_m4_MPORT_4.clk <= _GEN_199
    buf4.MPORT_4.addr <= _GEN_115
    buf4.MPORT_4.en <= _GEN_117
    buf4.MPORT_4.clk <= _GEN_116
    buf4.MPORT_4.data <= _GEN_119
    buf4.MPORT_4.mask <= _GEN_118
    curIdx <= mux(reset, UInt<3>("h0"), _GEN_15) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:25]
    prev1Idx <= mux(reset, UInt<3>("h1"), _GEN_16) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 121:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 121:25]
    prev2Idx <= mux(reset, UInt<3>("h2"), _GEN_17) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 122:25]
    prev3Idx <= mux(reset, UInt<3>("h3"), _GEN_18) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 123:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 123:25]
    prev4Idx <= mux(reset, UInt<3>("h4"), _GEN_19) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 124:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 124:25]
    s1_pix <= _GEN_200
    s1_sof <= _GEN_201
    s1_eol <= _GEN_202
    s1_x <= _GEN_203
    s1_y <= _GEN_204
    sr4_0 <= mux(reset, _sr4_WIRE_0, _GEN_205) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    sr4_1 <= mux(reset, _sr4_WIRE_1, _GEN_206) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    sr4_2 <= mux(reset, _sr4_WIRE_2, _GEN_207) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    sr4_3 <= mux(reset, _sr4_WIRE_3, _GEN_208) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    sr4_4 <= mux(reset, _sr4_WIRE_4, _GEN_209) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 198:20]
    sr3_0 <= mux(reset, _sr3_WIRE_0, _GEN_210) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    sr3_1 <= mux(reset, _sr3_WIRE_1, _GEN_211) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    sr3_2 <= mux(reset, _sr3_WIRE_2, _GEN_212) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    sr3_3 <= mux(reset, _sr3_WIRE_3, _GEN_213) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    sr3_4 <= mux(reset, _sr3_WIRE_4, _GEN_214) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 199:20]
    sr2_0 <= mux(reset, _sr2_WIRE_0, _GEN_215) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    sr2_1 <= mux(reset, _sr2_WIRE_1, _GEN_216) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    sr2_2 <= mux(reset, _sr2_WIRE_2, _GEN_217) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    sr2_3 <= mux(reset, _sr2_WIRE_3, _GEN_218) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    sr2_4 <= mux(reset, _sr2_WIRE_4, _GEN_219) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 200:20]
    sr1_0 <= mux(reset, _sr1_WIRE_0, _GEN_220) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    sr1_1 <= mux(reset, _sr1_WIRE_1, _GEN_221) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    sr1_2 <= mux(reset, _sr1_WIRE_2, _GEN_222) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    sr1_3 <= mux(reset, _sr1_WIRE_3, _GEN_223) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    sr1_4 <= mux(reset, _sr1_WIRE_4, _GEN_224) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 201:20]
    sr0_0 <= mux(reset, _sr0_WIRE_0, _GEN_225) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    sr0_1 <= mux(reset, _sr0_WIRE_1, _GEN_226) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    sr0_2 <= mux(reset, _sr0_WIRE_2, _GEN_227) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    sr0_3 <= mux(reset, _sr0_WIRE_3, _GEN_228) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    sr0_4 <= mux(reset, _sr0_WIRE_4, _GEN_229) @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 202:20]
    s2_win_reg_A <= _GEN_230
    s2_win_reg_B <= _GEN_231
    s2_win_reg_C <= _GEN_232
    s2_win_reg_D <= _GEN_233
    s2_win_reg_E <= _GEN_234
    s2_win_reg_F <= _GEN_235
    s2_win_reg_G <= _GEN_236
    s2_win_reg_H <= _GEN_237
    s2_win_reg_I <= _GEN_238
    s2_win_reg_J <= _GEN_239
    s2_win_reg_K <= _GEN_240
    s2_win_reg_L <= _GEN_241
    s2_win_reg_M <= _GEN_242
    s2_win_reg_N <= _GEN_243
    s2_win_reg_O <= _GEN_244
    s2_win_reg_P <= _GEN_245
    s2_win_reg_Q <= _GEN_246
    s2_win_reg_R <= _GEN_247
    s2_win_reg_S <= _GEN_248
    s2_win_reg_T <= _GEN_249
    s2_win_reg_U <= _GEN_250
    s2_win_reg_V <= _GEN_251
    s2_win_reg_W <= _GEN_252
    s2_win_reg_X <= _GEN_253
    s2_win_reg_Y <= _GEN_254
    s2_xc <= _GEN_256
    s2_yc <= _GEN_257
    s2_sof <= _GEN_258
    s2_eol <= _GEN_259
    s3_win_A <= _GEN_260
    s3_win_B <= _GEN_261
    s3_win_C <= _GEN_262
    s3_win_D <= _GEN_263
    s3_win_E <= _GEN_264
    s3_win_F <= _GEN_265
    s3_win_G <= _GEN_266
    s3_win_H <= _GEN_267
    s3_win_I <= _GEN_268
    s3_win_J <= _GEN_269
    s3_win_K <= _GEN_270
    s3_win_L <= _GEN_271
    s3_win_M <= _GEN_272
    s3_win_N <= _GEN_273
    s3_win_O <= _GEN_274
    s3_win_P <= _GEN_275
    s3_win_Q <= _GEN_276
    s3_win_R <= _GEN_277
    s3_win_S <= _GEN_278
    s3_win_T <= _GEN_279
    s3_win_U <= _GEN_280
    s3_win_V <= _GEN_281
    s3_win_W <= _GEN_282
    s3_win_X <= _GEN_283
    s3_win_Y <= _GEN_284
    s3_xc <= _GEN_285
    s3_yc <= _GEN_286
    s3_sof <= _GEN_287
    s3_eol <= _GEN_288
