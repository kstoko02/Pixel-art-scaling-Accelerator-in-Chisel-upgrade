module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [23:0] io_enq_bits_block_0, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [23:0] io_enq_bits_block_1, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [23:0] io_enq_bits_block_2, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [23:0] io_enq_bits_block_3, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [15:0] io_enq_bits_x, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input  [15:0] io_enq_bits_y, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_bits_sof, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_enq_bits_eol, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  input         io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [23:0] io_deq_bits_block_0, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [23:0] io_deq_bits_block_1, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [23:0] io_deq_bits_block_2, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [23:0] io_deq_bits_block_3, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [15:0] io_deq_bits_x, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output [15:0] io_deq_bits_y, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_bits_sof, // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
  output        io_deq_bits_eol // @[src/main/scala/chisel3/util/Decoupled.scala 278:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [23:0] ram_block_0 [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_0_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_0_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_0_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_0_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_0_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_0_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_0_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [23:0] ram_block_1 [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_1_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_1_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_1_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_1_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_1_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_1_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_1_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [23:0] ram_block_2 [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_2_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_2_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_2_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_2_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_2_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_2_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_2_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [23:0] ram_block_3 [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_3_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_3_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_3_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [23:0] ram_block_3_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_block_3_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_3_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_block_3_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [15:0] ram_x [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_x_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_x_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [15:0] ram_x_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [15:0] ram_x_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_x_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_x_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_x_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [15:0] ram_y [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_y_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_y_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [15:0] ram_y_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [15:0] ram_y_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_y_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_y_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_y_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg  ram_sof [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_sof_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_sof_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_sof_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_sof_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_sof_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_sof_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_sof_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg  ram_eol [0:1023]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_eol_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_eol_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_eol_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_eol_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire [9:0] ram_eol_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_eol_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  wire  ram_eol_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  reg [9:0] enq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg [9:0] deq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[src/main/scala/chisel3/util/Decoupled.scala 283:33]
  wire  empty = ptr_match & ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 284:25]
  wire  full = ptr_match & maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 285:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 57:35]
  wire [9:0] _value_T_1 = enq_ptr_value + 10'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire [9:0] _value_T_3 = deq_ptr_value + 10'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  assign ram_block_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_block_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_block_0_io_deq_bits_MPORT_data = ram_block_0[ram_block_0_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_block_0_MPORT_data = io_enq_bits_block_0;
  assign ram_block_0_MPORT_addr = enq_ptr_value;
  assign ram_block_0_MPORT_mask = 1'h1;
  assign ram_block_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_block_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_block_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_block_1_io_deq_bits_MPORT_data = ram_block_1[ram_block_1_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_block_1_MPORT_data = io_enq_bits_block_1;
  assign ram_block_1_MPORT_addr = enq_ptr_value;
  assign ram_block_1_MPORT_mask = 1'h1;
  assign ram_block_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_block_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_block_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_block_2_io_deq_bits_MPORT_data = ram_block_2[ram_block_2_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_block_2_MPORT_data = io_enq_bits_block_2;
  assign ram_block_2_MPORT_addr = enq_ptr_value;
  assign ram_block_2_MPORT_mask = 1'h1;
  assign ram_block_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_block_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_block_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_block_3_io_deq_bits_MPORT_data = ram_block_3[ram_block_3_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_block_3_MPORT_data = io_enq_bits_block_3;
  assign ram_block_3_MPORT_addr = enq_ptr_value;
  assign ram_block_3_MPORT_mask = 1'h1;
  assign ram_block_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_x_io_deq_bits_MPORT_en = 1'h1;
  assign ram_x_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_x_io_deq_bits_MPORT_data = ram_x[ram_x_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_x_MPORT_data = io_enq_bits_x;
  assign ram_x_MPORT_addr = enq_ptr_value;
  assign ram_x_MPORT_mask = 1'h1;
  assign ram_x_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_y_io_deq_bits_MPORT_en = 1'h1;
  assign ram_y_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_y_io_deq_bits_MPORT_data = ram_y[ram_y_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_y_MPORT_data = io_enq_bits_y;
  assign ram_y_MPORT_addr = enq_ptr_value;
  assign ram_y_MPORT_mask = 1'h1;
  assign ram_y_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sof_io_deq_bits_MPORT_en = 1'h1;
  assign ram_sof_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_sof_io_deq_bits_MPORT_data = ram_sof[ram_sof_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_sof_MPORT_data = io_enq_bits_sof;
  assign ram_sof_MPORT_addr = enq_ptr_value;
  assign ram_sof_MPORT_mask = 1'h1;
  assign ram_sof_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_eol_io_deq_bits_MPORT_en = 1'h1;
  assign ram_eol_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_eol_io_deq_bits_MPORT_data = ram_eol[ram_eol_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
  assign ram_eol_MPORT_data = io_enq_bits_eol;
  assign ram_eol_MPORT_addr = enq_ptr_value;
  assign ram_eol_MPORT_mask = 1'h1;
  assign ram_eol_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[src/main/scala/chisel3/util/Decoupled.scala 309:19]
  assign io_deq_valid = ~empty; // @[src/main/scala/chisel3/util/Decoupled.scala 308:19]
  assign io_deq_bits_block_0 = ram_block_0_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_block_1 = ram_block_1_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_block_2 = ram_block_2_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_block_3 = ram_block_3_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_x = ram_x_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_y = ram_y_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_sof = ram_sof_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  assign io_deq_bits_eol = ram_eol_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 316:17]
  always @(posedge clock) begin
    if (ram_block_0_MPORT_en & ram_block_0_MPORT_mask) begin
      ram_block_0[ram_block_0_MPORT_addr] <= ram_block_0_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_block_1_MPORT_en & ram_block_1_MPORT_mask) begin
      ram_block_1[ram_block_1_MPORT_addr] <= ram_block_1_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_block_2_MPORT_en & ram_block_2_MPORT_mask) begin
      ram_block_2[ram_block_2_MPORT_addr] <= ram_block_2_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_block_3_MPORT_en & ram_block_3_MPORT_mask) begin
      ram_block_3[ram_block_3_MPORT_addr] <= ram_block_3_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_x_MPORT_en & ram_x_MPORT_mask) begin
      ram_x[ram_x_MPORT_addr] <= ram_x_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_y_MPORT_en & ram_y_MPORT_mask) begin
      ram_y[ram_y_MPORT_addr] <= ram_y_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_sof_MPORT_en & ram_sof_MPORT_mask) begin
      ram_sof[ram_sof_MPORT_addr] <= ram_sof_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (ram_eol_MPORT_en & ram_eol_MPORT_mask) begin
      ram_eol[ram_eol_MPORT_addr] <= ram_eol_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 279:95]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      enq_ptr_value <= 10'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_enq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 292:16]
      enq_ptr_value <= _value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      deq_ptr_value <= 10'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 296:16]
      deq_ptr_value <= _value_T_3; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
      maybe_full <= 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
    end else if (do_enq != do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 299:27]
      maybe_full <= do_enq; // @[src/main/scala/chisel3/util/Decoupled.scala 300:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_block_0[initvar] = _RAND_0[23:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_block_1[initvar] = _RAND_1[23:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_block_2[initvar] = _RAND_2[23:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_block_3[initvar] = _RAND_3[23:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_x[initvar] = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_y[initvar] = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_sof[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_eol[initvar] = _RAND_7[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  enq_ptr_value = _RAND_8[9:0];
  _RAND_9 = {1{`RANDOM}};
  deq_ptr_value = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  maybe_full = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PhlabXbr2xPipelineRGB(
  input         clock,
  input         reset,
  output        io_in_ready, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  input         io_in_valid, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  input  [23:0] io_in_bits_pix, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  input         io_in_bits_sof, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  input         io_in_bits_eol, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  input         io_out_ready, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output        io_out_valid, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output [23:0] io_out_bits_block_0, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output [23:0] io_out_bits_block_1, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output [23:0] io_out_bits_block_2, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output [23:0] io_out_bits_block_3, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output [15:0] io_out_bits_x, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output [15:0] io_out_bits_y, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output        io_out_bits_sof, // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
  output        io_out_bits_eol // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 41:14]
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_52;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
`endif // RANDOMIZE_REG_INIT
  wire  outQ_clock; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_reset; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_enq_ready; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_enq_valid; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_enq_bits_block_0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_enq_bits_block_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_enq_bits_block_2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_enq_bits_block_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [15:0] outQ_io_enq_bits_x; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [15:0] outQ_io_enq_bits_y; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_enq_bits_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_enq_bits_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_deq_ready; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_deq_valid; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_deq_bits_block_0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_deq_bits_block_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_deq_bits_block_2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [23:0] outQ_io_deq_bits_block_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [15:0] outQ_io_deq_bits_x; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire [15:0] outQ_io_deq_bits_y; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_deq_bits_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  wire  outQ_io_deq_bits_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
  reg [23:0] buf0 [0:128]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire  buf0_raw_m1_MPORT_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [7:0] buf0_raw_m1_MPORT_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [23:0] buf0_raw_m1_MPORT_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire  buf0_raw_m2_MPORT_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [7:0] buf0_raw_m2_MPORT_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [23:0] buf0_raw_m2_MPORT_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire  buf0_raw_m3_MPORT_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [7:0] buf0_raw_m3_MPORT_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [23:0] buf0_raw_m3_MPORT_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire  buf0_raw_m4_MPORT_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [7:0] buf0_raw_m4_MPORT_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [23:0] buf0_raw_m4_MPORT_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [23:0] buf0_MPORT_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire [7:0] buf0_MPORT_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire  buf0_MPORT_mask; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  wire  buf0_MPORT_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  reg  buf0_raw_m1_MPORT_en_pipe_0;
  reg [7:0] buf0_raw_m1_MPORT_addr_pipe_0;
  reg  buf0_raw_m2_MPORT_en_pipe_0;
  reg [7:0] buf0_raw_m2_MPORT_addr_pipe_0;
  reg  buf0_raw_m3_MPORT_en_pipe_0;
  reg [7:0] buf0_raw_m3_MPORT_addr_pipe_0;
  reg  buf0_raw_m4_MPORT_en_pipe_0;
  reg [7:0] buf0_raw_m4_MPORT_addr_pipe_0;
  reg [23:0] buf1 [0:128]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire  buf1_raw_m1_MPORT_1_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [7:0] buf1_raw_m1_MPORT_1_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [23:0] buf1_raw_m1_MPORT_1_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire  buf1_raw_m2_MPORT_1_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [7:0] buf1_raw_m2_MPORT_1_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [23:0] buf1_raw_m2_MPORT_1_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire  buf1_raw_m3_MPORT_1_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [7:0] buf1_raw_m3_MPORT_1_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [23:0] buf1_raw_m3_MPORT_1_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire  buf1_raw_m4_MPORT_1_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [7:0] buf1_raw_m4_MPORT_1_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [23:0] buf1_raw_m4_MPORT_1_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [23:0] buf1_MPORT_1_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire [7:0] buf1_MPORT_1_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire  buf1_MPORT_1_mask; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire  buf1_MPORT_1_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  reg  buf1_raw_m1_MPORT_1_en_pipe_0;
  reg [7:0] buf1_raw_m1_MPORT_1_addr_pipe_0;
  reg  buf1_raw_m2_MPORT_1_en_pipe_0;
  reg [7:0] buf1_raw_m2_MPORT_1_addr_pipe_0;
  reg  buf1_raw_m3_MPORT_1_en_pipe_0;
  reg [7:0] buf1_raw_m3_MPORT_1_addr_pipe_0;
  reg  buf1_raw_m4_MPORT_1_en_pipe_0;
  reg [7:0] buf1_raw_m4_MPORT_1_addr_pipe_0;
  reg [23:0] buf2 [0:128]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  buf2_raw_m1_MPORT_2_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [7:0] buf2_raw_m1_MPORT_2_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [23:0] buf2_raw_m1_MPORT_2_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  buf2_raw_m2_MPORT_2_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [7:0] buf2_raw_m2_MPORT_2_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [23:0] buf2_raw_m2_MPORT_2_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  buf2_raw_m3_MPORT_2_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [7:0] buf2_raw_m3_MPORT_2_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [23:0] buf2_raw_m3_MPORT_2_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  buf2_raw_m4_MPORT_2_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [7:0] buf2_raw_m4_MPORT_2_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [23:0] buf2_raw_m4_MPORT_2_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [23:0] buf2_MPORT_2_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire [7:0] buf2_MPORT_2_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  buf2_MPORT_2_mask; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  buf2_MPORT_2_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  reg  buf2_raw_m1_MPORT_2_en_pipe_0;
  reg [7:0] buf2_raw_m1_MPORT_2_addr_pipe_0;
  reg  buf2_raw_m2_MPORT_2_en_pipe_0;
  reg [7:0] buf2_raw_m2_MPORT_2_addr_pipe_0;
  reg  buf2_raw_m3_MPORT_2_en_pipe_0;
  reg [7:0] buf2_raw_m3_MPORT_2_addr_pipe_0;
  reg  buf2_raw_m4_MPORT_2_en_pipe_0;
  reg [7:0] buf2_raw_m4_MPORT_2_addr_pipe_0;
  reg [23:0] buf3 [0:128]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  buf3_raw_m1_MPORT_3_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [7:0] buf3_raw_m1_MPORT_3_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [23:0] buf3_raw_m1_MPORT_3_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  buf3_raw_m2_MPORT_3_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [7:0] buf3_raw_m2_MPORT_3_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [23:0] buf3_raw_m2_MPORT_3_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  buf3_raw_m3_MPORT_3_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [7:0] buf3_raw_m3_MPORT_3_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [23:0] buf3_raw_m3_MPORT_3_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  buf3_raw_m4_MPORT_3_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [7:0] buf3_raw_m4_MPORT_3_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [23:0] buf3_raw_m4_MPORT_3_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [23:0] buf3_MPORT_3_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire [7:0] buf3_MPORT_3_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  buf3_MPORT_3_mask; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  buf3_MPORT_3_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  reg  buf3_raw_m1_MPORT_3_en_pipe_0;
  reg [7:0] buf3_raw_m1_MPORT_3_addr_pipe_0;
  reg  buf3_raw_m2_MPORT_3_en_pipe_0;
  reg [7:0] buf3_raw_m2_MPORT_3_addr_pipe_0;
  reg  buf3_raw_m3_MPORT_3_en_pipe_0;
  reg [7:0] buf3_raw_m3_MPORT_3_addr_pipe_0;
  reg  buf3_raw_m4_MPORT_3_en_pipe_0;
  reg [7:0] buf3_raw_m4_MPORT_3_addr_pipe_0;
  reg [23:0] buf4 [0:128]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire  buf4_raw_m1_MPORT_4_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [7:0] buf4_raw_m1_MPORT_4_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [23:0] buf4_raw_m1_MPORT_4_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire  buf4_raw_m2_MPORT_4_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [7:0] buf4_raw_m2_MPORT_4_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [23:0] buf4_raw_m2_MPORT_4_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire  buf4_raw_m3_MPORT_4_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [7:0] buf4_raw_m3_MPORT_4_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [23:0] buf4_raw_m3_MPORT_4_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire  buf4_raw_m4_MPORT_4_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [7:0] buf4_raw_m4_MPORT_4_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [23:0] buf4_raw_m4_MPORT_4_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [23:0] buf4_MPORT_4_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire [7:0] buf4_MPORT_4_addr; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire  buf4_MPORT_4_mask; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  wire  buf4_MPORT_4_en; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  reg  buf4_raw_m1_MPORT_4_en_pipe_0;
  reg [7:0] buf4_raw_m1_MPORT_4_addr_pipe_0;
  reg  buf4_raw_m2_MPORT_4_en_pipe_0;
  reg [7:0] buf4_raw_m2_MPORT_4_addr_pipe_0;
  reg  buf4_raw_m3_MPORT_4_en_pipe_0;
  reg [7:0] buf4_raw_m3_MPORT_4_addr_pipe_0;
  reg  buf4_raw_m4_MPORT_4_en_pipe_0;
  reg [7:0] buf4_raw_m4_MPORT_4_addr_pipe_0;
  reg  v1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
  reg  v2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
  reg  v3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
  reg  v4; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
  reg  s2_emit; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 51:24]
  reg  s3_emit; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 52:24]
  reg  s4_emit; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 53:24]
  reg [23:0] s4_block_0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:21]
  reg [23:0] s4_block_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:21]
  reg [23:0] s4_block_2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:21]
  reg [23:0] s4_block_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 55:21]
  reg [15:0] s4_xc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 56:21]
  reg [15:0] s4_yc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 57:21]
  reg  s4_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 58:21]
  reg  s4_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 59:21]
  wire  stall = v4 & s4_emit & ~outQ_io_enq_ready; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 61:29]
  wire  _io_in_ready_T = ~stall; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 62:18]
  wire  fireIn = io_in_valid & io_in_ready; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 64:28]
  reg [15:0] x; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 74:18]
  reg [15:0] y; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 75:18]
  wire  _x_T = io_in_bits_eol ? 1'h0 : 1'h1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 85:15]
  wire [15:0] _y_T_1 = y + 16'h1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 89:14]
  wire [15:0] _x_T_2 = x + 16'h1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 91:14]
  reg [2:0] curIdx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 102:25]
  reg [2:0] prev1Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:25]
  reg [2:0] prev2Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 104:25]
  reg [2:0] prev3Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:25]
  reg [2:0] prev4Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 106:25]
  wire  _T_3 = 3'h0 == curIdx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20]
  wire  _GEN_32 = 3'h3 == curIdx ? 1'h0 : 3'h4 == curIdx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20]
  wire  _GEN_42 = 3'h2 == curIdx ? 1'h0 : 3'h3 == curIdx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  _GEN_47 = 3'h2 == curIdx ? 1'h0 : _GEN_32; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20]
  wire  _GEN_57 = 3'h1 == curIdx ? 1'h0 : 3'h2 == curIdx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  _GEN_62 = 3'h1 == curIdx ? 1'h0 : _GEN_42; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  _GEN_67 = 3'h1 == curIdx ? 1'h0 : _GEN_47; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20]
  wire  _GEN_77 = 3'h0 == curIdx ? 1'h0 : 3'h1 == curIdx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  wire  _GEN_82 = 3'h0 == curIdx ? 1'h0 : _GEN_57; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  wire  _GEN_87 = 3'h0 == curIdx ? 1'h0 : _GEN_62; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20 src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  wire  _GEN_92 = 3'h0 == curIdx ? 1'h0 : _GEN_67; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25 src/main/scala/Pixel Art/Xbr2xPipeline.scala 120:20]
  wire  _raw_m1_T = curIdx != 3'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 131:48]
  wire  _raw_m1_T_4 = curIdx != 3'h1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 132:48]
  wire  _raw_m1_T_8 = curIdx != 3'h2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 133:48]
  wire  _raw_m1_T_12 = curIdx != 3'h3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 134:48]
  wire  _raw_m1_T_16 = curIdx != 3'h4; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 135:48]
  wire [23:0] _raw_m1_T_21 = 3'h0 == prev1Idx ? buf0_raw_m1_MPORT_data : 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m1_T_23 = 3'h1 == prev1Idx ? buf1_raw_m1_MPORT_1_data : _raw_m1_T_21; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m1_T_25 = 3'h2 == prev1Idx ? buf2_raw_m1_MPORT_2_data : _raw_m1_T_23; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m1_T_27 = 3'h3 == prev1Idx ? buf3_raw_m1_MPORT_3_data : _raw_m1_T_25; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] raw_m1 = 3'h4 == prev1Idx ? buf4_raw_m1_MPORT_4_data : _raw_m1_T_27; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m2_T_21 = 3'h0 == prev2Idx ? buf0_raw_m2_MPORT_data : 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m2_T_23 = 3'h1 == prev2Idx ? buf1_raw_m2_MPORT_1_data : _raw_m2_T_21; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m2_T_25 = 3'h2 == prev2Idx ? buf2_raw_m2_MPORT_2_data : _raw_m2_T_23; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m2_T_27 = 3'h3 == prev2Idx ? buf3_raw_m2_MPORT_3_data : _raw_m2_T_25; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] raw_m2 = 3'h4 == prev2Idx ? buf4_raw_m2_MPORT_4_data : _raw_m2_T_27; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m3_T_21 = 3'h0 == prev3Idx ? buf0_raw_m3_MPORT_data : 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m3_T_23 = 3'h1 == prev3Idx ? buf1_raw_m3_MPORT_1_data : _raw_m3_T_21; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m3_T_25 = 3'h2 == prev3Idx ? buf2_raw_m3_MPORT_2_data : _raw_m3_T_23; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] _raw_m3_T_27 = 3'h3 == prev3Idx ? buf3_raw_m3_MPORT_3_data : _raw_m3_T_25; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] raw_m3 = 3'h4 == prev3Idx ? buf4_raw_m3_MPORT_4_data : _raw_m3_T_27; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
  wire [23:0] s1_row_m1 = y == 16'h0 ? io_in_bits_pix : raw_m1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:19]
  wire [23:0] s1_row_m2 = y <= 16'h1 ? s1_row_m1 : raw_m2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:19]
  wire [23:0] s1_row_m3 = y <= 16'h2 ? s1_row_m2 : raw_m3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 151:19]
  reg  s1_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 155:19]
  reg  s1_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 156:19]
  reg [15:0] s1_x; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 157:19]
  reg [15:0] s1_y; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 158:19]
  reg [23:0] sr3_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 166:20]
  reg [23:0] sr3_4; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 166:20]
  reg [23:0] sr2_2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
  reg [23:0] sr2_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
  reg [23:0] sr2_4; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
  reg [23:0] sr1_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 168:20]
  reg [23:0] sr1_4; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 168:20]
  reg [23:0] s2_win_reg_H; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:23]
  reg [23:0] s2_win_reg_L; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:23]
  reg [23:0] s2_win_reg_M; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:23]
  reg [23:0] s2_win_reg_N; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:23]
  reg [23:0] s2_win_reg_R; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 171:23]
  reg [15:0] s2_xc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 172:19]
  reg [15:0] s2_yc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 173:19]
  reg  s2_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 174:19]
  reg  s2_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 175:19]
  wire  firstCol0 = s1_x == 16'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 178:27]
  wire  firstCol1 = s1_x == 16'h1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 179:27]
  wire [15:0] _s2_xc_T_1 = s1_x - 16'h2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 206:21]
  wire [15:0] _s2_yc_T_1 = s1_y - 16'h2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 207:21]
  reg [23:0] s3_win_H; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 213:19]
  reg [23:0] s3_win_L; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 213:19]
  reg [23:0] s3_win_M; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 213:19]
  reg [23:0] s3_win_N; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 213:19]
  reg [23:0] s3_win_R; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 213:19]
  reg [15:0] s3_xc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 214:19]
  reg [15:0] s3_yc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 215:19]
  reg  s3_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 216:19]
  reg  s3_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 217:19]
  wire [7:0] By_r = s3_win_H[23:16]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:14]
  wire [7:0] By_g = s3_win_H[15:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:32]
  wire [7:0] By_b = s3_win_H[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:49]
  wire [8:0] _By_y16_T = {1'b0,$signed(By_r)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:19]
  wire [16:0] _By_y16_T_1 = $signed(_By_y16_T) * 8'sh4d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:24]
  wire [8:0] _By_y16_T_2 = {1'b0,$signed(By_g)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:37]
  wire [17:0] _By_y16_T_3 = $signed(_By_y16_T_2) * 9'sh96; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:42]
  wire [17:0] _GEN_303 = {{1{_By_y16_T_1[16]}},_By_y16_T_1}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [17:0] _By_y16_T_6 = $signed(_GEN_303) + $signed(_By_y16_T_3); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [8:0] _By_y16_T_7 = {1'b0,$signed(By_b)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:56]
  wire [14:0] _By_y16_T_8 = $signed(_By_y16_T_7) * 6'sh1d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:61]
  wire [17:0] _GEN_304 = {{3{_By_y16_T_8[14]}},_By_y16_T_8}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [17:0] _By_y16_T_11 = $signed(_By_y16_T_6) + $signed(_GEN_304); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [9:0] _By_T = _By_y16_T_11[17:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:10]
  wire [7:0] By = _By_T[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:17]
  wire [7:0] Dy_r = s3_win_L[23:16]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:14]
  wire [7:0] Dy_g = s3_win_L[15:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:32]
  wire [7:0] Dy_b = s3_win_L[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:49]
  wire [8:0] _Dy_y16_T = {1'b0,$signed(Dy_r)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:19]
  wire [16:0] _Dy_y16_T_1 = $signed(_Dy_y16_T) * 8'sh4d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:24]
  wire [8:0] _Dy_y16_T_2 = {1'b0,$signed(Dy_g)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:37]
  wire [17:0] _Dy_y16_T_3 = $signed(_Dy_y16_T_2) * 9'sh96; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:42]
  wire [17:0] _GEN_305 = {{1{_Dy_y16_T_1[16]}},_Dy_y16_T_1}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [17:0] _Dy_y16_T_6 = $signed(_GEN_305) + $signed(_Dy_y16_T_3); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [8:0] _Dy_y16_T_7 = {1'b0,$signed(Dy_b)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:56]
  wire [14:0] _Dy_y16_T_8 = $signed(_Dy_y16_T_7) * 6'sh1d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:61]
  wire [17:0] _GEN_306 = {{3{_Dy_y16_T_8[14]}},_Dy_y16_T_8}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [17:0] _Dy_y16_T_11 = $signed(_Dy_y16_T_6) + $signed(_GEN_306); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [9:0] _Dy_T = _Dy_y16_T_11[17:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:10]
  wire [7:0] Dy = _Dy_T[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:17]
  wire [7:0] Fy_r = s3_win_N[23:16]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:14]
  wire [7:0] Fy_g = s3_win_N[15:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:32]
  wire [7:0] Fy_b = s3_win_N[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:49]
  wire [8:0] _Fy_y16_T = {1'b0,$signed(Fy_r)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:19]
  wire [16:0] _Fy_y16_T_1 = $signed(_Fy_y16_T) * 8'sh4d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:24]
  wire [8:0] _Fy_y16_T_2 = {1'b0,$signed(Fy_g)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:37]
  wire [17:0] _Fy_y16_T_3 = $signed(_Fy_y16_T_2) * 9'sh96; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:42]
  wire [17:0] _GEN_307 = {{1{_Fy_y16_T_1[16]}},_Fy_y16_T_1}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [17:0] _Fy_y16_T_6 = $signed(_GEN_307) + $signed(_Fy_y16_T_3); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [8:0] _Fy_y16_T_7 = {1'b0,$signed(Fy_b)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:56]
  wire [14:0] _Fy_y16_T_8 = $signed(_Fy_y16_T_7) * 6'sh1d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:61]
  wire [17:0] _GEN_308 = {{3{_Fy_y16_T_8[14]}},_Fy_y16_T_8}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [17:0] _Fy_y16_T_11 = $signed(_Fy_y16_T_6) + $signed(_GEN_308); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [9:0] _Fy_T = _Fy_y16_T_11[17:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:10]
  wire [7:0] Fy = _Fy_T[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:17]
  wire [7:0] Hy_r = s3_win_R[23:16]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:14]
  wire [7:0] Hy_g = s3_win_R[15:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:32]
  wire [7:0] Hy_b = s3_win_R[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 230:49]
  wire [8:0] _Hy_y16_T = {1'b0,$signed(Hy_r)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:19]
  wire [16:0] _Hy_y16_T_1 = $signed(_Hy_y16_T) * 8'sh4d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:24]
  wire [8:0] _Hy_y16_T_2 = {1'b0,$signed(Hy_g)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:37]
  wire [17:0] _Hy_y16_T_3 = $signed(_Hy_y16_T_2) * 9'sh96; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:42]
  wire [17:0] _GEN_309 = {{1{_Hy_y16_T_1[16]}},_Hy_y16_T_1}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [17:0] _Hy_y16_T_6 = $signed(_GEN_309) + $signed(_Hy_y16_T_3); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:32]
  wire [8:0] _Hy_y16_T_7 = {1'b0,$signed(Hy_b)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:56]
  wire [14:0] _Hy_y16_T_8 = $signed(_Hy_y16_T_7) * 6'sh1d; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:61]
  wire [17:0] _GEN_310 = {{3{_Hy_y16_T_8[14]}},_Hy_y16_T_8}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [17:0] _Hy_y16_T_11 = $signed(_Hy_y16_T_6) + $signed(_GEN_310); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 236:51]
  wire [9:0] _Hy_T = _Hy_y16_T_11[17:8]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:10]
  wire [7:0] Hy = _Hy_T[7:0]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 237:17]
  wire [8:0] bNeqH_a16 = {1'b0,$signed(By)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 241:17]
  wire [8:0] bNeqH_b16 = {1'b0,$signed(Hy)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 242:17]
  wire [8:0] _bNeqH_T_4 = $signed(bNeqH_a16) - $signed(bNeqH_b16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:33]
  wire [8:0] _bNeqH_T_8 = $signed(bNeqH_b16) - $signed(bNeqH_a16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:53]
  wire [8:0] _bNeqH_T_9 = $signed(bNeqH_a16) >= $signed(bNeqH_b16) ? _bNeqH_T_4 : _bNeqH_T_8; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:8]
  wire  bNeqH = _bNeqH_T_9[7:0] > 8'h10; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 261:34]
  wire [8:0] dNeqF_a16 = {1'b0,$signed(Dy)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 241:17]
  wire [8:0] dNeqF_b16 = {1'b0,$signed(Fy)}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 242:17]
  wire [8:0] _dNeqF_T_4 = $signed(dNeqF_a16) - $signed(dNeqF_b16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:33]
  wire [8:0] _dNeqF_T_8 = $signed(dNeqF_b16) - $signed(dNeqF_a16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:53]
  wire [8:0] _dNeqF_T_9 = $signed(dNeqF_a16) >= $signed(dNeqF_b16) ? _dNeqF_T_4 : _dNeqF_T_8; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:8]
  wire  dNeqF = _dNeqF_T_9[7:0] > 8'h10; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 262:34]
  wire [8:0] _e0_T_4 = $signed(dNeqF_a16) - $signed(bNeqH_a16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:33]
  wire [8:0] _e0_T_8 = $signed(bNeqH_a16) - $signed(dNeqF_a16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:53]
  wire [8:0] _e0_T_9 = $signed(dNeqF_a16) >= $signed(bNeqH_a16) ? _e0_T_4 : _e0_T_8; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:8]
  wire [8:0] _e1_T_4 = $signed(bNeqH_a16) - $signed(dNeqF_b16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:33]
  wire [8:0] _e1_T_8 = $signed(dNeqF_b16) - $signed(bNeqH_a16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:53]
  wire [8:0] _e1_T_9 = $signed(bNeqH_a16) >= $signed(dNeqF_b16) ? _e1_T_4 : _e1_T_8; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:8]
  wire [8:0] _e2_T_4 = $signed(dNeqF_a16) - $signed(bNeqH_b16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:33]
  wire [8:0] _e2_T_8 = $signed(bNeqH_b16) - $signed(dNeqF_a16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:53]
  wire [8:0] _e2_T_9 = $signed(dNeqF_a16) >= $signed(bNeqH_b16) ? _e2_T_4 : _e2_T_8; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:8]
  wire [8:0] _e3_T_4 = $signed(bNeqH_b16) - $signed(dNeqF_b16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:33]
  wire [8:0] _e3_T_8 = $signed(dNeqF_b16) - $signed(bNeqH_b16); // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:53]
  wire [8:0] _e3_T_9 = $signed(bNeqH_b16) >= $signed(dNeqF_b16) ? _e3_T_4 : _e3_T_8; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 243:8]
  Queue outQ ( // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 46:20]
    .clock(outQ_clock),
    .reset(outQ_reset),
    .io_enq_ready(outQ_io_enq_ready),
    .io_enq_valid(outQ_io_enq_valid),
    .io_enq_bits_block_0(outQ_io_enq_bits_block_0),
    .io_enq_bits_block_1(outQ_io_enq_bits_block_1),
    .io_enq_bits_block_2(outQ_io_enq_bits_block_2),
    .io_enq_bits_block_3(outQ_io_enq_bits_block_3),
    .io_enq_bits_x(outQ_io_enq_bits_x),
    .io_enq_bits_y(outQ_io_enq_bits_y),
    .io_enq_bits_sof(outQ_io_enq_bits_sof),
    .io_enq_bits_eol(outQ_io_enq_bits_eol),
    .io_deq_ready(outQ_io_deq_ready),
    .io_deq_valid(outQ_io_deq_valid),
    .io_deq_bits_block_0(outQ_io_deq_bits_block_0),
    .io_deq_bits_block_1(outQ_io_deq_bits_block_1),
    .io_deq_bits_block_2(outQ_io_deq_bits_block_2),
    .io_deq_bits_block_3(outQ_io_deq_bits_block_3),
    .io_deq_bits_x(outQ_io_deq_bits_x),
    .io_deq_bits_y(outQ_io_deq_bits_y),
    .io_deq_bits_sof(outQ_io_deq_bits_sof),
    .io_deq_bits_eol(outQ_io_deq_bits_eol)
  );
  assign buf0_raw_m1_MPORT_en = buf0_raw_m1_MPORT_en_pipe_0;
  assign buf0_raw_m1_MPORT_addr = buf0_raw_m1_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_raw_m1_MPORT_data = buf0[buf0_raw_m1_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `else
  assign buf0_raw_m1_MPORT_data = buf0_raw_m1_MPORT_addr >= 8'h81 ? _RAND_1[23:0] : buf0[buf0_raw_m1_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_raw_m2_MPORT_en = buf0_raw_m2_MPORT_en_pipe_0;
  assign buf0_raw_m2_MPORT_addr = buf0_raw_m2_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_raw_m2_MPORT_data = buf0[buf0_raw_m2_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `else
  assign buf0_raw_m2_MPORT_data = buf0_raw_m2_MPORT_addr >= 8'h81 ? _RAND_2[23:0] : buf0[buf0_raw_m2_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_raw_m3_MPORT_en = buf0_raw_m3_MPORT_en_pipe_0;
  assign buf0_raw_m3_MPORT_addr = buf0_raw_m3_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_raw_m3_MPORT_data = buf0[buf0_raw_m3_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `else
  assign buf0_raw_m3_MPORT_data = buf0_raw_m3_MPORT_addr >= 8'h81 ? _RAND_3[23:0] : buf0[buf0_raw_m3_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_raw_m4_MPORT_en = buf0_raw_m4_MPORT_en_pipe_0;
  assign buf0_raw_m4_MPORT_addr = buf0_raw_m4_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_raw_m4_MPORT_data = buf0[buf0_raw_m4_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `else
  assign buf0_raw_m4_MPORT_data = buf0_raw_m4_MPORT_addr >= 8'h81 ? _RAND_4[23:0] : buf0[buf0_raw_m4_MPORT_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf0_MPORT_data = io_in_bits_pix;
  assign buf0_MPORT_addr = x[7:0];
  assign buf0_MPORT_mask = 1'h1;
  assign buf0_MPORT_en = fireIn & _T_3;
  assign buf1_raw_m1_MPORT_1_en = buf1_raw_m1_MPORT_1_en_pipe_0;
  assign buf1_raw_m1_MPORT_1_addr = buf1_raw_m1_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_raw_m1_MPORT_1_data = buf1[buf1_raw_m1_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `else
  assign buf1_raw_m1_MPORT_1_data = buf1_raw_m1_MPORT_1_addr >= 8'h81 ? _RAND_14[23:0] : buf1[buf1_raw_m1_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_raw_m2_MPORT_1_en = buf1_raw_m2_MPORT_1_en_pipe_0;
  assign buf1_raw_m2_MPORT_1_addr = buf1_raw_m2_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_raw_m2_MPORT_1_data = buf1[buf1_raw_m2_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `else
  assign buf1_raw_m2_MPORT_1_data = buf1_raw_m2_MPORT_1_addr >= 8'h81 ? _RAND_15[23:0] : buf1[buf1_raw_m2_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_raw_m3_MPORT_1_en = buf1_raw_m3_MPORT_1_en_pipe_0;
  assign buf1_raw_m3_MPORT_1_addr = buf1_raw_m3_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_raw_m3_MPORT_1_data = buf1[buf1_raw_m3_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `else
  assign buf1_raw_m3_MPORT_1_data = buf1_raw_m3_MPORT_1_addr >= 8'h81 ? _RAND_16[23:0] : buf1[buf1_raw_m3_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_raw_m4_MPORT_1_en = buf1_raw_m4_MPORT_1_en_pipe_0;
  assign buf1_raw_m4_MPORT_1_addr = buf1_raw_m4_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_raw_m4_MPORT_1_data = buf1[buf1_raw_m4_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `else
  assign buf1_raw_m4_MPORT_1_data = buf1_raw_m4_MPORT_1_addr >= 8'h81 ? _RAND_17[23:0] : buf1[buf1_raw_m4_MPORT_1_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf1_MPORT_1_data = io_in_bits_pix;
  assign buf1_MPORT_1_addr = x[7:0];
  assign buf1_MPORT_1_mask = 1'h1;
  assign buf1_MPORT_1_en = fireIn & _GEN_77;
  assign buf2_raw_m1_MPORT_2_en = buf2_raw_m1_MPORT_2_en_pipe_0;
  assign buf2_raw_m1_MPORT_2_addr = buf2_raw_m1_MPORT_2_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_raw_m1_MPORT_2_data = buf2[buf2_raw_m1_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `else
  assign buf2_raw_m1_MPORT_2_data = buf2_raw_m1_MPORT_2_addr >= 8'h81 ? _RAND_27[23:0] : buf2[buf2_raw_m1_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_raw_m2_MPORT_2_en = buf2_raw_m2_MPORT_2_en_pipe_0;
  assign buf2_raw_m2_MPORT_2_addr = buf2_raw_m2_MPORT_2_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_raw_m2_MPORT_2_data = buf2[buf2_raw_m2_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `else
  assign buf2_raw_m2_MPORT_2_data = buf2_raw_m2_MPORT_2_addr >= 8'h81 ? _RAND_28[23:0] : buf2[buf2_raw_m2_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_raw_m3_MPORT_2_en = buf2_raw_m3_MPORT_2_en_pipe_0;
  assign buf2_raw_m3_MPORT_2_addr = buf2_raw_m3_MPORT_2_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_raw_m3_MPORT_2_data = buf2[buf2_raw_m3_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `else
  assign buf2_raw_m3_MPORT_2_data = buf2_raw_m3_MPORT_2_addr >= 8'h81 ? _RAND_29[23:0] : buf2[buf2_raw_m3_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_raw_m4_MPORT_2_en = buf2_raw_m4_MPORT_2_en_pipe_0;
  assign buf2_raw_m4_MPORT_2_addr = buf2_raw_m4_MPORT_2_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_raw_m4_MPORT_2_data = buf2[buf2_raw_m4_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `else
  assign buf2_raw_m4_MPORT_2_data = buf2_raw_m4_MPORT_2_addr >= 8'h81 ? _RAND_30[23:0] : buf2[buf2_raw_m4_MPORT_2_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf2_MPORT_2_data = io_in_bits_pix;
  assign buf2_MPORT_2_addr = x[7:0];
  assign buf2_MPORT_2_mask = 1'h1;
  assign buf2_MPORT_2_en = fireIn & _GEN_82;
  assign buf3_raw_m1_MPORT_3_en = buf3_raw_m1_MPORT_3_en_pipe_0;
  assign buf3_raw_m1_MPORT_3_addr = buf3_raw_m1_MPORT_3_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_raw_m1_MPORT_3_data = buf3[buf3_raw_m1_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `else
  assign buf3_raw_m1_MPORT_3_data = buf3_raw_m1_MPORT_3_addr >= 8'h81 ? _RAND_40[23:0] : buf3[buf3_raw_m1_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_raw_m2_MPORT_3_en = buf3_raw_m2_MPORT_3_en_pipe_0;
  assign buf3_raw_m2_MPORT_3_addr = buf3_raw_m2_MPORT_3_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_raw_m2_MPORT_3_data = buf3[buf3_raw_m2_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `else
  assign buf3_raw_m2_MPORT_3_data = buf3_raw_m2_MPORT_3_addr >= 8'h81 ? _RAND_41[23:0] : buf3[buf3_raw_m2_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_raw_m3_MPORT_3_en = buf3_raw_m3_MPORT_3_en_pipe_0;
  assign buf3_raw_m3_MPORT_3_addr = buf3_raw_m3_MPORT_3_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_raw_m3_MPORT_3_data = buf3[buf3_raw_m3_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `else
  assign buf3_raw_m3_MPORT_3_data = buf3_raw_m3_MPORT_3_addr >= 8'h81 ? _RAND_42[23:0] : buf3[buf3_raw_m3_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_raw_m4_MPORT_3_en = buf3_raw_m4_MPORT_3_en_pipe_0;
  assign buf3_raw_m4_MPORT_3_addr = buf3_raw_m4_MPORT_3_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_raw_m4_MPORT_3_data = buf3[buf3_raw_m4_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `else
  assign buf3_raw_m4_MPORT_3_data = buf3_raw_m4_MPORT_3_addr >= 8'h81 ? _RAND_43[23:0] : buf3[buf3_raw_m4_MPORT_3_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf3_MPORT_3_data = io_in_bits_pix;
  assign buf3_MPORT_3_addr = x[7:0];
  assign buf3_MPORT_3_mask = 1'h1;
  assign buf3_MPORT_3_en = fireIn & _GEN_87;
  assign buf4_raw_m1_MPORT_4_en = buf4_raw_m1_MPORT_4_en_pipe_0;
  assign buf4_raw_m1_MPORT_4_addr = buf4_raw_m1_MPORT_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_raw_m1_MPORT_4_data = buf4[buf4_raw_m1_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `else
  assign buf4_raw_m1_MPORT_4_data = buf4_raw_m1_MPORT_4_addr >= 8'h81 ? _RAND_53[23:0] : buf4[buf4_raw_m1_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_raw_m2_MPORT_4_en = buf4_raw_m2_MPORT_4_en_pipe_0;
  assign buf4_raw_m2_MPORT_4_addr = buf4_raw_m2_MPORT_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_raw_m2_MPORT_4_data = buf4[buf4_raw_m2_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `else
  assign buf4_raw_m2_MPORT_4_data = buf4_raw_m2_MPORT_4_addr >= 8'h81 ? _RAND_54[23:0] : buf4[buf4_raw_m2_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_raw_m3_MPORT_4_en = buf4_raw_m3_MPORT_4_en_pipe_0;
  assign buf4_raw_m3_MPORT_4_addr = buf4_raw_m3_MPORT_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_raw_m3_MPORT_4_data = buf4[buf4_raw_m3_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `else
  assign buf4_raw_m3_MPORT_4_data = buf4_raw_m3_MPORT_4_addr >= 8'h81 ? _RAND_55[23:0] : buf4[buf4_raw_m3_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_raw_m4_MPORT_4_en = buf4_raw_m4_MPORT_4_en_pipe_0;
  assign buf4_raw_m4_MPORT_4_addr = buf4_raw_m4_MPORT_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_raw_m4_MPORT_4_data = buf4[buf4_raw_m4_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `else
  assign buf4_raw_m4_MPORT_4_data = buf4_raw_m4_MPORT_4_addr >= 8'h81 ? _RAND_56[23:0] : buf4[buf4_raw_m4_MPORT_4_addr]; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buf4_MPORT_4_data = io_in_bits_pix;
  assign buf4_MPORT_4_addr = x[7:0];
  assign buf4_MPORT_4_mask = 1'h1;
  assign buf4_MPORT_4_en = fireIn & _GEN_92;
  assign io_in_ready = ~stall; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 62:18]
  assign io_out_valid = outQ_io_deq_valid; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_block_0 = outQ_io_deq_bits_block_0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_block_1 = outQ_io_deq_bits_block_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_block_2 = outQ_io_deq_bits_block_2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_block_3 = outQ_io_deq_bits_block_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_x = outQ_io_deq_bits_x; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_y = outQ_io_deq_bits_y; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_sof = outQ_io_deq_bits_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign io_out_bits_eol = outQ_io_deq_bits_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  assign outQ_clock = clock;
  assign outQ_reset = reset;
  assign outQ_io_enq_valid = v4 & s4_emit; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 286:32]
  assign outQ_io_enq_bits_block_0 = s4_block_0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 287:26]
  assign outQ_io_enq_bits_block_1 = s4_block_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 287:26]
  assign outQ_io_enq_bits_block_2 = s4_block_2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 287:26]
  assign outQ_io_enq_bits_block_3 = s4_block_3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 287:26]
  assign outQ_io_enq_bits_x = s4_xc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 288:26]
  assign outQ_io_enq_bits_y = s4_yc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 289:26]
  assign outQ_io_enq_bits_sof = s4_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 290:26]
  assign outQ_io_enq_bits_eol = s4_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 291:26]
  assign outQ_io_deq_ready = io_out_ready; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 47:10]
  always @(posedge clock) begin
    if (buf0_MPORT_en & buf0_MPORT_mask) begin
      buf0[buf0_MPORT_addr] <= buf0_MPORT_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 96:25]
    end
    buf0_raw_m1_MPORT_en_pipe_0 <= fireIn & _raw_m1_T;
    if (fireIn & _raw_m1_T) begin
      buf0_raw_m1_MPORT_addr_pipe_0 <= x[7:0];
    end
    buf0_raw_m2_MPORT_en_pipe_0 <= fireIn & _raw_m1_T;
    if (fireIn & _raw_m1_T) begin
      buf0_raw_m2_MPORT_addr_pipe_0 <= x[7:0];
    end
    buf0_raw_m3_MPORT_en_pipe_0 <= fireIn & _raw_m1_T;
    if (fireIn & _raw_m1_T) begin
      buf0_raw_m3_MPORT_addr_pipe_0 <= x[7:0];
    end
    buf0_raw_m4_MPORT_en_pipe_0 <= fireIn & _raw_m1_T;
    if (fireIn & _raw_m1_T) begin
      buf0_raw_m4_MPORT_addr_pipe_0 <= x[7:0];
    end
    if (buf1_MPORT_1_en & buf1_MPORT_1_mask) begin
      buf1[buf1_MPORT_1_addr] <= buf1_MPORT_1_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 97:25]
    end
    buf1_raw_m1_MPORT_1_en_pipe_0 <= fireIn & _raw_m1_T_4;
    if (fireIn & _raw_m1_T_4) begin
      buf1_raw_m1_MPORT_1_addr_pipe_0 <= x[7:0];
    end
    buf1_raw_m2_MPORT_1_en_pipe_0 <= fireIn & _raw_m1_T_4;
    if (fireIn & _raw_m1_T_4) begin
      buf1_raw_m2_MPORT_1_addr_pipe_0 <= x[7:0];
    end
    buf1_raw_m3_MPORT_1_en_pipe_0 <= fireIn & _raw_m1_T_4;
    if (fireIn & _raw_m1_T_4) begin
      buf1_raw_m3_MPORT_1_addr_pipe_0 <= x[7:0];
    end
    buf1_raw_m4_MPORT_1_en_pipe_0 <= fireIn & _raw_m1_T_4;
    if (fireIn & _raw_m1_T_4) begin
      buf1_raw_m4_MPORT_1_addr_pipe_0 <= x[7:0];
    end
    if (buf2_MPORT_2_en & buf2_MPORT_2_mask) begin
      buf2[buf2_MPORT_2_addr] <= buf2_MPORT_2_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 98:25]
    end
    buf2_raw_m1_MPORT_2_en_pipe_0 <= fireIn & _raw_m1_T_8;
    if (fireIn & _raw_m1_T_8) begin
      buf2_raw_m1_MPORT_2_addr_pipe_0 <= x[7:0];
    end
    buf2_raw_m2_MPORT_2_en_pipe_0 <= fireIn & _raw_m1_T_8;
    if (fireIn & _raw_m1_T_8) begin
      buf2_raw_m2_MPORT_2_addr_pipe_0 <= x[7:0];
    end
    buf2_raw_m3_MPORT_2_en_pipe_0 <= fireIn & _raw_m1_T_8;
    if (fireIn & _raw_m1_T_8) begin
      buf2_raw_m3_MPORT_2_addr_pipe_0 <= x[7:0];
    end
    buf2_raw_m4_MPORT_2_en_pipe_0 <= fireIn & _raw_m1_T_8;
    if (fireIn & _raw_m1_T_8) begin
      buf2_raw_m4_MPORT_2_addr_pipe_0 <= x[7:0];
    end
    if (buf3_MPORT_3_en & buf3_MPORT_3_mask) begin
      buf3[buf3_MPORT_3_addr] <= buf3_MPORT_3_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 99:25]
    end
    buf3_raw_m1_MPORT_3_en_pipe_0 <= fireIn & _raw_m1_T_12;
    if (fireIn & _raw_m1_T_12) begin
      buf3_raw_m1_MPORT_3_addr_pipe_0 <= x[7:0];
    end
    buf3_raw_m2_MPORT_3_en_pipe_0 <= fireIn & _raw_m1_T_12;
    if (fireIn & _raw_m1_T_12) begin
      buf3_raw_m2_MPORT_3_addr_pipe_0 <= x[7:0];
    end
    buf3_raw_m3_MPORT_3_en_pipe_0 <= fireIn & _raw_m1_T_12;
    if (fireIn & _raw_m1_T_12) begin
      buf3_raw_m3_MPORT_3_addr_pipe_0 <= x[7:0];
    end
    buf3_raw_m4_MPORT_3_en_pipe_0 <= fireIn & _raw_m1_T_12;
    if (fireIn & _raw_m1_T_12) begin
      buf3_raw_m4_MPORT_3_addr_pipe_0 <= x[7:0];
    end
    if (buf4_MPORT_4_en & buf4_MPORT_4_mask) begin
      buf4[buf4_MPORT_4_addr] <= buf4_MPORT_4_data; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 100:25]
    end
    buf4_raw_m1_MPORT_4_en_pipe_0 <= fireIn & _raw_m1_T_16;
    if (fireIn & _raw_m1_T_16) begin
      buf4_raw_m1_MPORT_4_addr_pipe_0 <= x[7:0];
    end
    buf4_raw_m2_MPORT_4_en_pipe_0 <= fireIn & _raw_m1_T_16;
    if (fireIn & _raw_m1_T_16) begin
      buf4_raw_m2_MPORT_4_addr_pipe_0 <= x[7:0];
    end
    buf4_raw_m3_MPORT_4_en_pipe_0 <= fireIn & _raw_m1_T_16;
    if (fireIn & _raw_m1_T_16) begin
      buf4_raw_m3_MPORT_4_addr_pipe_0 <= x[7:0];
    end
    buf4_raw_m4_MPORT_4_en_pipe_0 <= fireIn & _raw_m1_T_16;
    if (fireIn & _raw_m1_T_16) begin
      buf4_raw_m4_MPORT_4_addr_pipe_0 <= x[7:0];
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
      v1 <= 1'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
    end else if (_io_in_ready_T) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:16]
      v1 <= fireIn; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 67:8]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
      v2 <= 1'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
    end else if (_io_in_ready_T) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:16]
      v2 <= v1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 68:8]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
      v3 <= 1'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
    end else if (_io_in_ready_T) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:16]
      v3 <= v2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 69:8]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
      v4 <= 1'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 49:31]
    end else if (_io_in_ready_T) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 66:16]
      v4 <= v3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 70:8]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 51:24]
      s2_emit <= 1'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 51:24]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      s2_emit <= s1_x >= 16'h2 & s1_y >= 16'h2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 205:13]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 52:24]
      s3_emit <= 1'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 52:24]
    end else if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_emit <= s2_emit; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 225:13]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 53:24]
      s4_emit <= 1'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 53:24]
    end else if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      s4_emit <= s3_emit; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 283:14]
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      if (bNeqH & dNeqF) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:26]
        if (_e0_T_9[7:0] <= 8'h10) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 270:16]
          s4_block_0 <= s3_win_L;
        end else begin
          s4_block_0 <= s3_win_M;
        end
      end else begin
        s4_block_0 <= s3_win_M; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 275:10]
      end
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      if (bNeqH & dNeqF) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:26]
        if (_e1_T_9[7:0] <= 8'h10) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 271:16]
          s4_block_1 <= s3_win_N;
        end else begin
          s4_block_1 <= s3_win_M;
        end
      end else begin
        s4_block_1 <= s3_win_M; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 275:20]
      end
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      if (bNeqH & dNeqF) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:26]
        if (_e2_T_9[7:0] <= 8'h10) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 272:16]
          s4_block_2 <= s3_win_L;
        end else begin
          s4_block_2 <= s3_win_M;
        end
      end else begin
        s4_block_2 <= s3_win_M; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 275:30]
      end
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      if (bNeqH & dNeqF) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 269:26]
        if (_e3_T_9[7:0] <= 8'h10) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 273:16]
          s4_block_3 <= s3_win_N;
        end else begin
          s4_block_3 <= s3_win_M;
        end
      end else begin
        s4_block_3 <= s3_win_M; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 275:40]
      end
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      s4_xc <= s3_xc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 279:14]
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      s4_yc <= s3_yc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 280:14]
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      s4_sof <= s3_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 281:14]
    end
    if (_io_in_ready_T & v3) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 249:22]
      s4_eol <= s3_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 282:14]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 74:18]
      x <= 16'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 74:18]
    end else if (fireIn) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 83:16]
      if (io_in_bits_sof) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 84:18]
        x <= {{15'd0}, _x_T}; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 85:9]
      end else if (io_in_bits_eol) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 87:24]
        x <= 16'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 88:9]
      end else begin
        x <= _x_T_2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 91:9]
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 75:18]
      y <= 16'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 75:18]
    end else if (fireIn) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 83:16]
      if (io_in_bits_sof) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 84:18]
        y <= 16'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 86:9]
      end else if (io_in_bits_eol) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 87:24]
        y <= _y_T_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 89:9]
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 102:25]
      curIdx <= 3'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 102:25]
    end else if (fireIn & io_in_bits_sof) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 108:26]
      curIdx <= 3'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 109:14]
    end else if (fireIn & io_in_bits_eol) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 110:32]
      curIdx <= prev4Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:92]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:25]
      prev1Idx <= 3'h1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 103:25]
    end else if (fireIn & io_in_bits_sof) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 108:26]
      prev1Idx <= 3'h1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 109:31]
    end else if (fireIn & io_in_bits_eol) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 110:32]
      prev1Idx <= curIdx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:74]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 104:25]
      prev2Idx <= 3'h2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 104:25]
    end else if (fireIn & io_in_bits_sof) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 108:26]
      prev2Idx <= 3'h2; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 109:48]
    end else if (fireIn & io_in_bits_eol) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 110:32]
      prev2Idx <= prev1Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:54]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:25]
      prev3Idx <= 3'h3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 105:25]
    end else if (fireIn & io_in_bits_sof) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 108:26]
      prev3Idx <= 3'h3; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 109:65]
    end else if (fireIn & io_in_bits_eol) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 110:32]
      prev3Idx <= prev2Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:34]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 106:25]
      prev4Idx <= 3'h4; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 106:25]
    end else if (fireIn & io_in_bits_sof) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 108:26]
      prev4Idx <= 3'h4; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 109:82]
    end else if (fireIn & io_in_bits_eol) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 110:32]
      prev4Idx <= prev3Idx; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 116:14]
    end
    if (_io_in_ready_T & fireIn) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:26]
      s1_sof <= io_in_bits_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:30]
    end
    if (_io_in_ready_T & fireIn) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:26]
      s1_eol <= io_in_bits_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:48]
    end
    if (_io_in_ready_T & fireIn) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:26]
      s1_x <= x; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:64]
    end
    if (_io_in_ready_T & fireIn) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 160:26]
      s1_y <= y; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 161:78]
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 166:20]
      sr3_3 <= 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 166:20]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        sr3_3 <= s1_row_m3;
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        sr3_3 <= s1_row_m3;
      end else begin
        sr3_3 <= sr3_4;
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 166:20]
      sr3_4 <= 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 166:20]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (y <= 16'h2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 151:19]
        if (y <= 16'h1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:19]
          sr3_4 <= s1_row_m1;
        end else begin
          sr3_4 <= raw_m2;
        end
      end else if (3'h4 == prev3Idx) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
        sr3_4 <= buf4_raw_m3_MPORT_4_data;
      end else begin
        sr3_4 <= _raw_m3_T_27;
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
      sr2_2 <= 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        if (y <= 16'h1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:19]
          sr2_2 <= s1_row_m1;
        end else begin
          sr2_2 <= raw_m2;
        end
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        sr2_2 <= sr2_4;
      end else begin
        sr2_2 <= sr2_3;
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
      sr2_3 <= 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        sr2_3 <= s1_row_m2;
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        sr2_3 <= s1_row_m2;
      end else begin
        sr2_3 <= sr2_4;
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
      sr2_4 <= 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 167:20]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (y <= 16'h1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:19]
        if (y == 16'h0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:19]
          sr2_4 <= io_in_bits_pix;
        end else begin
          sr2_4 <= raw_m1;
        end
      end else if (3'h4 == prev2Idx) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
        sr2_4 <= buf4_raw_m2_MPORT_4_data;
      end else begin
        sr2_4 <= _raw_m2_T_27;
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 168:20]
      sr1_3 <= 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 168:20]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        sr1_3 <= s1_row_m1;
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        sr1_3 <= s1_row_m1;
      end else begin
        sr1_3 <= sr1_4;
      end
    end
    if (reset) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 168:20]
      sr1_4 <= 24'h0; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 168:20]
    end else if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (y == 16'h0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:19]
        sr1_4 <= io_in_bits_pix;
      end else if (3'h4 == prev1Idx) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
        sr1_4 <= buf4_raw_m1_MPORT_4_data;
      end else begin
        sr1_4 <= _raw_m1_T_27;
      end
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        if (y <= 16'h2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 151:19]
          if (y <= 16'h1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:19]
            s2_win_reg_H <= s1_row_m1;
          end else begin
            s2_win_reg_H <= raw_m2;
          end
        end else if (3'h4 == prev3Idx) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
          s2_win_reg_H <= buf4_raw_m3_MPORT_4_data;
        end else begin
          s2_win_reg_H <= _raw_m3_T_27;
        end
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        s2_win_reg_H <= sr3_4;
      end else begin
        s2_win_reg_H <= sr3_3;
      end
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        if (y <= 16'h1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:19]
          if (y == 16'h0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:19]
            s2_win_reg_L <= io_in_bits_pix;
          end else begin
            s2_win_reg_L <= raw_m1;
          end
        end else if (3'h4 == prev2Idx) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
          s2_win_reg_L <= buf4_raw_m2_MPORT_4_data;
        end else begin
          s2_win_reg_L <= _raw_m2_T_27;
        end
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        s2_win_reg_L <= sr2_3;
      end else begin
        s2_win_reg_L <= sr2_2;
      end
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        if (y <= 16'h1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 150:19]
          if (y == 16'h0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:19]
            s2_win_reg_M <= io_in_bits_pix;
          end else begin
            s2_win_reg_M <= raw_m1;
          end
        end else if (3'h4 == prev2Idx) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
          s2_win_reg_M <= buf4_raw_m2_MPORT_4_data;
        end else begin
          s2_win_reg_M <= _raw_m2_T_27;
        end
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        s2_win_reg_M <= sr2_4;
      end else begin
        s2_win_reg_M <= sr2_3;
      end
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        s2_win_reg_N <= s1_row_m2;
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        s2_win_reg_N <= s1_row_m2;
      end else begin
        s2_win_reg_N <= sr2_4;
      end
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      if (firstCol0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 182:10]
        if (y == 16'h0) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 149:19]
          s2_win_reg_R <= io_in_bits_pix;
        end else if (3'h4 == prev1Idx) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 129:54]
          s2_win_reg_R <= buf4_raw_m1_MPORT_4_data;
        end else begin
          s2_win_reg_R <= _raw_m1_T_27;
        end
      end else if (firstCol1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 184:12]
        s2_win_reg_R <= sr1_4;
      end else begin
        s2_win_reg_R <= sr1_3;
      end
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      s2_xc <= _s2_xc_T_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 206:13]
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      s2_yc <= _s2_yc_T_1; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 207:13]
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      s2_sof <= s1_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 208:13]
    end
    if (_io_in_ready_T & v1) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 177:22]
      s2_eol <= s1_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 209:13]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_win_H <= s2_win_reg_H; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_win_L <= s2_win_reg_L; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_win_M <= s2_win_reg_M; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_win_N <= s2_win_reg_N; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_win_R <= s2_win_reg_R; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 220:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_xc <= s2_xc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 221:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_yc <= s2_yc; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 222:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_sof <= s2_sof; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 223:12]
    end
    if (_io_in_ready_T & v2) begin // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 219:22]
      s3_eol <= s2_eol; // @[src/main/scala/Pixel Art/Xbr2xPipeline.scala 224:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_14 = {1{`RANDOM}};
  _RAND_15 = {1{`RANDOM}};
  _RAND_16 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_28 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_30 = {1{`RANDOM}};
  _RAND_40 = {1{`RANDOM}};
  _RAND_41 = {1{`RANDOM}};
  _RAND_42 = {1{`RANDOM}};
  _RAND_43 = {1{`RANDOM}};
  _RAND_53 = {1{`RANDOM}};
  _RAND_54 = {1{`RANDOM}};
  _RAND_55 = {1{`RANDOM}};
  _RAND_56 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 129; initvar = initvar+1)
    buf0[initvar] = _RAND_0[23:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 129; initvar = initvar+1)
    buf1[initvar] = _RAND_13[23:0];
  _RAND_26 = {1{`RANDOM}};
  for (initvar = 0; initvar < 129; initvar = initvar+1)
    buf2[initvar] = _RAND_26[23:0];
  _RAND_39 = {1{`RANDOM}};
  for (initvar = 0; initvar < 129; initvar = initvar+1)
    buf3[initvar] = _RAND_39[23:0];
  _RAND_52 = {1{`RANDOM}};
  for (initvar = 0; initvar < 129; initvar = initvar+1)
    buf4[initvar] = _RAND_52[23:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  buf0_raw_m1_MPORT_en_pipe_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  buf0_raw_m1_MPORT_addr_pipe_0 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  buf0_raw_m2_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  buf0_raw_m2_MPORT_addr_pipe_0 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  buf0_raw_m3_MPORT_en_pipe_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  buf0_raw_m3_MPORT_addr_pipe_0 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  buf0_raw_m4_MPORT_en_pipe_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  buf0_raw_m4_MPORT_addr_pipe_0 = _RAND_12[7:0];
  _RAND_18 = {1{`RANDOM}};
  buf1_raw_m1_MPORT_1_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  buf1_raw_m1_MPORT_1_addr_pipe_0 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  buf1_raw_m2_MPORT_1_en_pipe_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  buf1_raw_m2_MPORT_1_addr_pipe_0 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  buf1_raw_m3_MPORT_1_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  buf1_raw_m3_MPORT_1_addr_pipe_0 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  buf1_raw_m4_MPORT_1_en_pipe_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  buf1_raw_m4_MPORT_1_addr_pipe_0 = _RAND_25[7:0];
  _RAND_31 = {1{`RANDOM}};
  buf2_raw_m1_MPORT_2_en_pipe_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  buf2_raw_m1_MPORT_2_addr_pipe_0 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  buf2_raw_m2_MPORT_2_en_pipe_0 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  buf2_raw_m2_MPORT_2_addr_pipe_0 = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  buf2_raw_m3_MPORT_2_en_pipe_0 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  buf2_raw_m3_MPORT_2_addr_pipe_0 = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  buf2_raw_m4_MPORT_2_en_pipe_0 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  buf2_raw_m4_MPORT_2_addr_pipe_0 = _RAND_38[7:0];
  _RAND_44 = {1{`RANDOM}};
  buf3_raw_m1_MPORT_3_en_pipe_0 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  buf3_raw_m1_MPORT_3_addr_pipe_0 = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  buf3_raw_m2_MPORT_3_en_pipe_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  buf3_raw_m2_MPORT_3_addr_pipe_0 = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  buf3_raw_m3_MPORT_3_en_pipe_0 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  buf3_raw_m3_MPORT_3_addr_pipe_0 = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  buf3_raw_m4_MPORT_3_en_pipe_0 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  buf3_raw_m4_MPORT_3_addr_pipe_0 = _RAND_51[7:0];
  _RAND_57 = {1{`RANDOM}};
  buf4_raw_m1_MPORT_4_en_pipe_0 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  buf4_raw_m1_MPORT_4_addr_pipe_0 = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  buf4_raw_m2_MPORT_4_en_pipe_0 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  buf4_raw_m2_MPORT_4_addr_pipe_0 = _RAND_60[7:0];
  _RAND_61 = {1{`RANDOM}};
  buf4_raw_m3_MPORT_4_en_pipe_0 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  buf4_raw_m3_MPORT_4_addr_pipe_0 = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  buf4_raw_m4_MPORT_4_en_pipe_0 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  buf4_raw_m4_MPORT_4_addr_pipe_0 = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  v1 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  v2 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  v3 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  v4 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  s2_emit = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  s3_emit = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  s4_emit = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  s4_block_0 = _RAND_72[23:0];
  _RAND_73 = {1{`RANDOM}};
  s4_block_1 = _RAND_73[23:0];
  _RAND_74 = {1{`RANDOM}};
  s4_block_2 = _RAND_74[23:0];
  _RAND_75 = {1{`RANDOM}};
  s4_block_3 = _RAND_75[23:0];
  _RAND_76 = {1{`RANDOM}};
  s4_xc = _RAND_76[15:0];
  _RAND_77 = {1{`RANDOM}};
  s4_yc = _RAND_77[15:0];
  _RAND_78 = {1{`RANDOM}};
  s4_sof = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  s4_eol = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  x = _RAND_80[15:0];
  _RAND_81 = {1{`RANDOM}};
  y = _RAND_81[15:0];
  _RAND_82 = {1{`RANDOM}};
  curIdx = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  prev1Idx = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  prev2Idx = _RAND_84[2:0];
  _RAND_85 = {1{`RANDOM}};
  prev3Idx = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  prev4Idx = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  s1_sof = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  s1_eol = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  s1_x = _RAND_89[15:0];
  _RAND_90 = {1{`RANDOM}};
  s1_y = _RAND_90[15:0];
  _RAND_91 = {1{`RANDOM}};
  sr3_3 = _RAND_91[23:0];
  _RAND_92 = {1{`RANDOM}};
  sr3_4 = _RAND_92[23:0];
  _RAND_93 = {1{`RANDOM}};
  sr2_2 = _RAND_93[23:0];
  _RAND_94 = {1{`RANDOM}};
  sr2_3 = _RAND_94[23:0];
  _RAND_95 = {1{`RANDOM}};
  sr2_4 = _RAND_95[23:0];
  _RAND_96 = {1{`RANDOM}};
  sr1_3 = _RAND_96[23:0];
  _RAND_97 = {1{`RANDOM}};
  sr1_4 = _RAND_97[23:0];
  _RAND_98 = {1{`RANDOM}};
  s2_win_reg_H = _RAND_98[23:0];
  _RAND_99 = {1{`RANDOM}};
  s2_win_reg_L = _RAND_99[23:0];
  _RAND_100 = {1{`RANDOM}};
  s2_win_reg_M = _RAND_100[23:0];
  _RAND_101 = {1{`RANDOM}};
  s2_win_reg_N = _RAND_101[23:0];
  _RAND_102 = {1{`RANDOM}};
  s2_win_reg_R = _RAND_102[23:0];
  _RAND_103 = {1{`RANDOM}};
  s2_xc = _RAND_103[15:0];
  _RAND_104 = {1{`RANDOM}};
  s2_yc = _RAND_104[15:0];
  _RAND_105 = {1{`RANDOM}};
  s2_sof = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  s2_eol = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  s3_win_H = _RAND_107[23:0];
  _RAND_108 = {1{`RANDOM}};
  s3_win_L = _RAND_108[23:0];
  _RAND_109 = {1{`RANDOM}};
  s3_win_M = _RAND_109[23:0];
  _RAND_110 = {1{`RANDOM}};
  s3_win_N = _RAND_110[23:0];
  _RAND_111 = {1{`RANDOM}};
  s3_win_R = _RAND_111[23:0];
  _RAND_112 = {1{`RANDOM}};
  s3_xc = _RAND_112[15:0];
  _RAND_113 = {1{`RANDOM}};
  s3_yc = _RAND_113[15:0];
  _RAND_114 = {1{`RANDOM}};
  s3_sof = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  s3_eol = _RAND_115[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
