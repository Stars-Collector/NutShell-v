// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module SRAMTemplateWithArbiter(	// src/main/scala/utils/SRAMTemplate.scala:114:7
  input         clock,	// src/main/scala/utils/SRAMTemplate.scala:114:7
                reset,	// src/main/scala/utils/SRAMTemplate.scala:114:7
  output        io_r0_req_ready,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  input         io_r0_req_valid,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  input  [6:0]  io_r0_req_bits_setIdx,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output [18:0] io_r0_resp_data_0_tag,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output        io_r0_resp_data_0_valid,	// src/main/scala/utils/SRAMTemplate.scala:116:14
                io_r0_resp_data_0_dirty,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output [18:0] io_r0_resp_data_1_tag,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output        io_r0_resp_data_1_valid,	// src/main/scala/utils/SRAMTemplate.scala:116:14
                io_r0_resp_data_1_dirty,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output [18:0] io_r0_resp_data_2_tag,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output        io_r0_resp_data_2_valid,	// src/main/scala/utils/SRAMTemplate.scala:116:14
                io_r0_resp_data_2_dirty,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output [18:0] io_r0_resp_data_3_tag,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  output        io_r0_resp_data_3_valid,	// src/main/scala/utils/SRAMTemplate.scala:116:14
                io_r0_resp_data_3_dirty,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  input         io_wreq_valid,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  input  [6:0]  io_wreq_bits_setIdx,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  input  [18:0] io_wreq_bits_data_tag,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  input         io_wreq_bits_data_dirty,	// src/main/scala/utils/SRAMTemplate.scala:116:14
  input  [3:0]  io_wreq_bits_waymask	// src/main/scala/utils/SRAMTemplate.scala:116:14
);

  wire        _readArb_io_in_0_ready;	// src/main/scala/utils/SRAMTemplate.scala:124:23
  wire        _readArb_io_out_valid;	// src/main/scala/utils/SRAMTemplate.scala:124:23
  wire [6:0]  _readArb_io_out_bits_setIdx;	// src/main/scala/utils/SRAMTemplate.scala:124:23
  wire        _ram_io_rreq_ready;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire [18:0] _ram_io_rresp_data_0_tag;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_0_valid;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_0_dirty;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire [18:0] _ram_io_rresp_data_1_tag;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_1_valid;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_1_dirty;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire [18:0] _ram_io_rresp_data_2_tag;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_2_valid;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_2_dirty;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire [18:0] _ram_io_rresp_data_3_tag;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_3_valid;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  wire        _ram_io_rresp_data_3_dirty;	// src/main/scala/utils/SRAMTemplate.scala:121:19
  reg         REG;	// src/main/scala/utils/SRAMTemplate.scala:130:58
  reg  [18:0] r_0_tag;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_0_valid;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_0_dirty;	// src/main/scala/utils/Hold.scala:23:65
  reg  [18:0] r_1_tag;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_1_valid;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_1_dirty;	// src/main/scala/utils/Hold.scala:23:65
  reg  [18:0] r_2_tag;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_2_valid;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_2_dirty;	// src/main/scala/utils/Hold.scala:23:65
  reg  [18:0] r_3_tag;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_3_valid;	// src/main/scala/utils/Hold.scala:23:65
  reg         r_3_dirty;	// src/main/scala/utils/Hold.scala:23:65
  always @(posedge clock) begin	// src/main/scala/utils/SRAMTemplate.scala:114:7
    REG <= _readArb_io_in_0_ready & io_r0_req_valid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/SRAMTemplate.scala:124:23, :130:58
    if (reset) begin	// src/main/scala/utils/SRAMTemplate.scala:114:7
      r_0_tag <= 19'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_0_valid <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_0_dirty <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_1_tag <= 19'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_1_valid <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_1_dirty <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_2_tag <= 19'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_2_valid <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_2_dirty <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_3_tag <= 19'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_3_valid <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_3_dirty <= 1'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
    end
    else if (REG) begin	// src/main/scala/utils/SRAMTemplate.scala:130:58
      r_0_tag <= _ram_io_rresp_data_0_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_0_valid <= _ram_io_rresp_data_0_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_0_dirty <= _ram_io_rresp_data_0_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_1_tag <= _ram_io_rresp_data_1_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_1_valid <= _ram_io_rresp_data_1_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_1_dirty <= _ram_io_rresp_data_1_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_2_tag <= _ram_io_rresp_data_2_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_2_valid <= _ram_io_rresp_data_2_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_2_dirty <= _ram_io_rresp_data_2_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_3_tag <= _ram_io_rresp_data_3_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_3_valid <= _ram_io_rresp_data_3_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
      r_3_dirty <= _ram_io_rresp_data_3_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:121:19
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/utils/SRAMTemplate.scala:114:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/utils/SRAMTemplate.scala:114:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/utils/SRAMTemplate.scala:114:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/utils/SRAMTemplate.scala:114:7
      automatic logic [31:0] _RANDOM[0:2];	// src/main/scala/utils/SRAMTemplate.scala:114:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/utils/SRAMTemplate.scala:114:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/utils/SRAMTemplate.scala:114:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/utils/SRAMTemplate.scala:114:7
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/utils/SRAMTemplate.scala:114:7
        end	// src/main/scala/utils/SRAMTemplate.scala:114:7
        REG = _RANDOM[2'h0][0];	// src/main/scala/utils/SRAMTemplate.scala:114:7, :130:58
        r_0_tag = _RANDOM[2'h0][19:1];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :130:58
        r_0_valid = _RANDOM[2'h0][20];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :130:58
        r_0_dirty = _RANDOM[2'h0][21];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :130:58
        r_1_tag = {_RANDOM[2'h0][31:22], _RANDOM[2'h1][8:0]};	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :130:58
        r_1_valid = _RANDOM[2'h1][9];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
        r_1_dirty = _RANDOM[2'h1][10];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
        r_2_tag = _RANDOM[2'h1][29:11];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
        r_2_valid = _RANDOM[2'h1][30];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
        r_2_dirty = _RANDOM[2'h1][31];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
        r_3_tag = _RANDOM[2'h2][18:0];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
        r_3_valid = _RANDOM[2'h2][19];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
        r_3_dirty = _RANDOM[2'h2][20];	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/utils/SRAMTemplate.scala:114:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/utils/SRAMTemplate.scala:114:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  SRAMTemplate_1 ram (	// src/main/scala/utils/SRAMTemplate.scala:121:19
    .clock                    (clock),
    .reset                    (reset),
    .io_rreq_ready           (_ram_io_rreq_ready),
    .io_rreq_valid           (_readArb_io_out_valid),	// src/main/scala/utils/SRAMTemplate.scala:124:23
    .io_rreq_bits_setIdx     (_readArb_io_out_bits_setIdx),	// src/main/scala/utils/SRAMTemplate.scala:124:23
    .io_rresp_data_0_tag     (_ram_io_rresp_data_0_tag),
    .io_rresp_data_0_valid   (_ram_io_rresp_data_0_valid),
    .io_rresp_data_0_dirty   (_ram_io_rresp_data_0_dirty),
    .io_rresp_data_1_tag     (_ram_io_rresp_data_1_tag),
    .io_rresp_data_1_valid   (_ram_io_rresp_data_1_valid),
    .io_rresp_data_1_dirty   (_ram_io_rresp_data_1_dirty),
    .io_rresp_data_2_tag     (_ram_io_rresp_data_2_tag),
    .io_rresp_data_2_valid   (_ram_io_rresp_data_2_valid),
    .io_rresp_data_2_dirty   (_ram_io_rresp_data_2_dirty),
    .io_rresp_data_3_tag     (_ram_io_rresp_data_3_tag),
    .io_rresp_data_3_valid   (_ram_io_rresp_data_3_valid),
    .io_rresp_data_3_dirty   (_ram_io_rresp_data_3_dirty),
    .io_wreq_valid           (io_wreq_valid),
    .io_wreq_bits_setIdx     (io_wreq_bits_setIdx),
    .io_wreq_bits_data_tag   (io_wreq_bits_data_tag),
    .io_wreq_bits_data_dirty (io_wreq_bits_data_dirty),
    .io_wreq_bits_waymask    (io_wreq_bits_waymask)
  );
  Arbiter1_SRAMBundleA readArb (	// src/main/scala/utils/SRAMTemplate.scala:124:23
    .io_in_0_ready       (_readArb_io_in_0_ready),
    .io_in_0_valid       (io_r0_req_valid),
    .io_in_0_bits_setIdx (io_r0_req_bits_setIdx),
    .io_out_ready        (_ram_io_rreq_ready),	// src/main/scala/utils/SRAMTemplate.scala:121:19
    .io_out_valid        (_readArb_io_out_valid),
    .io_out_bits_setIdx  (_readArb_io_out_bits_setIdx)
  );
  assign io_r0_req_ready = _readArb_io_in_0_ready;	// src/main/scala/utils/SRAMTemplate.scala:114:7, :124:23
  assign io_r0_resp_data_0_tag = REG ? _ram_io_rresp_data_0_tag : r_0_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_0_valid = REG ? _ram_io_rresp_data_0_valid : r_0_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_0_dirty = REG ? _ram_io_rresp_data_0_dirty : r_0_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_1_tag = REG ? _ram_io_rresp_data_1_tag : r_1_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_1_valid = REG ? _ram_io_rresp_data_1_valid : r_1_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_1_dirty = REG ? _ram_io_rresp_data_1_dirty : r_1_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_2_tag = REG ? _ram_io_rresp_data_2_tag : r_2_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_2_valid = REG ? _ram_io_rresp_data_2_valid : r_2_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_2_dirty = REG ? _ram_io_rresp_data_2_dirty : r_2_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_3_tag = REG ? _ram_io_rresp_data_3_tag : r_3_tag;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_3_valid = REG ? _ram_io_rresp_data_3_valid : r_3_valid;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
  assign io_r0_resp_data_3_dirty = REG ? _ram_io_rresp_data_3_dirty : r_3_dirty;	// src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/SRAMTemplate.scala:114:7, :121:19, :130:58
endmodule

