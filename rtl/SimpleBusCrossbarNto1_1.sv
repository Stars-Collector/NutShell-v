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

module SimpleBusCrossbarNto1_1(	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  input         clock,	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
                reset,	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  output        io_in_0_req_ready,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input         io_in_0_req_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [31:0] io_in_0_req_bits_addr,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [2:0]  io_in_0_req_bits_size,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [3:0]  io_in_0_req_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [7:0]  io_in_0_req_bits_wmask,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [63:0] io_in_0_req_bits_wdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_in_0_resp_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [3:0]  io_in_0_resp_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [63:0] io_in_0_resp_bits_rdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_in_1_req_ready,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input         io_in_1_req_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [31:0] io_in_1_req_bits_addr,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [3:0]  io_in_1_req_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [63:0] io_in_1_req_bits_wdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_in_1_resp_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [3:0]  io_in_1_resp_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [63:0] io_in_1_resp_bits_rdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_in_2_req_ready,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input         io_in_2_req_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [31:0] io_in_2_req_bits_addr,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [3:0]  io_in_2_req_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [63:0] io_in_2_req_bits_wdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_in_2_resp_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [3:0]  io_in_2_resp_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [63:0] io_in_2_resp_bits_rdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_in_3_req_ready,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input         io_in_3_req_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [31:0] io_in_3_req_bits_addr,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [2:0]  io_in_3_req_bits_size,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [3:0]  io_in_3_req_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [7:0]  io_in_3_req_bits_wmask,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [63:0] io_in_3_req_bits_wdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input         io_in_3_resp_ready,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_in_3_resp_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [3:0]  io_in_3_resp_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [63:0] io_in_3_resp_bits_rdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input         io_out_req_ready,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_out_req_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [31:0] io_out_req_bits_addr,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [2:0]  io_out_req_bits_size,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [3:0]  io_out_req_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [7:0]  io_out_req_bits_wmask,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output [63:0] io_out_req_bits_wdata,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  output        io_out_resp_ready,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input         io_out_resp_valid,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [3:0]  io_out_resp_bits_cmd,	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
  input  [63:0] io_out_resp_bits_rdata	// src/main/scala/bus/simplebus/Crossbar.scala:86:14
);

  wire       _inputArb_io_out_valid;	// src/main/scala/bus/simplebus/Crossbar.scala:95:24
  wire [3:0] _inputArb_io_out_bits_cmd;	// src/main/scala/bus/simplebus/Crossbar.scala:95:24
  wire [1:0] _inputArb_io_chosen;	// src/main/scala/bus/simplebus/Crossbar.scala:95:24
  reg  [1:0] state;	// src/main/scala/bus/simplebus/Crossbar.scala:92:22
  wire       _GEN = ~(_inputArb_io_out_bits_cmd[0]) & ~(_inputArb_io_out_bits_cmd[3]);	// src/main/scala/bus/simplebus/Crossbar.scala:95:24, src/main/scala/bus/simplebus/SimpleBus.scala:73:{18,22,26,29,33}
  `ifndef SYNTHESIS	// src/main/scala/bus/simplebus/Crossbar.scala:98:9
    always @(posedge clock) begin	// src/main/scala/bus/simplebus/Crossbar.scala:98:9
      if (~reset & _inputArb_io_out_valid & ~_GEN & ~(_inputArb_io_out_bits_cmd[0])) begin	// src/main/scala/bus/simplebus/Crossbar.scala:95:24, :98:{9,29}, src/main/scala/bus/simplebus/SimpleBus.scala:73:{18,22,26}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/bus/simplebus/Crossbar.scala:98:9
          $error("Assertion failed\n    at Crossbar.scala:98 assert(!(thisReq.valid && !thisReq.bits.isRead() && !thisReq.bits.isWrite()))\n");	// src/main/scala/bus/simplebus/Crossbar.scala:98:9
        if (`STOP_COND_)	// src/main/scala/bus/simplebus/Crossbar.scala:98:9
          $fatal;	// src/main/scala/bus/simplebus/Crossbar.scala:98:9
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg  [1:0] inflightSrc;	// src/main/scala/bus/simplebus/Crossbar.scala:99:28
  wire       _inputArb_io_out_ready_T_1 = io_out_req_ready & ~(|state);	// src/main/scala/bus/simplebus/Crossbar.scala:92:22, :103:47, :104:37
  wire [3:0] _GEN_0 = {{io_in_3_resp_ready}, {1'h1}, {1'h1}, {1'h1}};	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :109:13
  wire       io_out_resp_ready_0 = _GEN_0[inflightSrc];	// src/main/scala/bus/simplebus/Crossbar.scala:99:28, :109:13
  always @(posedge clock) begin	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
    if (reset) begin	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
      state <= 2'h0;	// src/main/scala/bus/simplebus/Crossbar.scala:92:22
      inflightSrc <= 2'h0;	// src/main/scala/bus/simplebus/Crossbar.scala:92:22, :99:28
    end
    else begin	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
      automatic logic _GEN_1;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
      _GEN_1 = _inputArb_io_out_ready_T_1 & _inputArb_io_out_valid;	// src/main/scala/bus/simplebus/Crossbar.scala:95:24, :104:37, src/main/scala/chisel3/util/Decoupled.scala:51:35
      if (|state) begin	// src/main/scala/bus/simplebus/Crossbar.scala:92:22, :103:47
        automatic logic _GEN_2 = io_out_resp_ready_0 & io_out_resp_valid;	// src/main/scala/bus/simplebus/Crossbar.scala:109:13, src/main/scala/chisel3/util/Decoupled.scala:51:35
        if (state == 2'h1
              ? _GEN_2 & io_out_resp_bits_cmd == 4'h6
              : state == 2'h2 & _GEN_2)	// src/main/scala/bus/simplebus/Crossbar.scala:92:22, :109:13, :113:18, :121:{46,78,86}, :122:{48,56}, src/main/scala/bus/simplebus/SimpleBus.scala:91:24, src/main/scala/chisel3/util/Decoupled.scala:51:35
          state <= 2'h0;	// src/main/scala/bus/simplebus/Crossbar.scala:92:22
      end
      else if (_GEN_1) begin	// src/main/scala/chisel3/util/Decoupled.scala:51:35
        if (_GEN)	// src/main/scala/bus/simplebus/SimpleBus.scala:73:26
          state <= 2'h1;	// src/main/scala/bus/simplebus/Crossbar.scala:92:22, :109:13
        else if (_inputArb_io_out_bits_cmd == 4'h7 | _inputArb_io_out_bits_cmd == 4'h1)	// src/main/scala/bus/simplebus/Crossbar.scala:95:24, :118:47, src/main/scala/bus/simplebus/SimpleBus.scala:77:29, :78:27
          state <= 2'h2;	// src/main/scala/bus/simplebus/Crossbar.scala:92:22, :109:13
      end
      if (~(|state) & _GEN_1)	// src/main/scala/bus/simplebus/Crossbar.scala:92:22, :99:28, :103:47, :113:18, :115:27, :116:21, src/main/scala/chisel3/util/Decoupled.scala:51:35
        inflightSrc <= _inputArb_io_chosen;	// src/main/scala/bus/simplebus/Crossbar.scala:95:24, :99:28
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
      automatic logic [31:0] _RANDOM[0:0];	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
        state = _RANDOM[/*Zero width*/ 1'b0][1:0];	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :92:22
        inflightSrc = _RANDOM[/*Zero width*/ 1'b0][3:2];	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :92:22, :99:28
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  LockingArbiter_1 inputArb (	// src/main/scala/bus/simplebus/Crossbar.scala:95:24
    .clock              (clock),
    .reset              (reset),
    .io_in_0_ready      (io_in_0_req_ready),
    .io_in_0_valid      (io_in_0_req_valid),
    .io_in_0_bits_addr  (io_in_0_req_bits_addr),
    .io_in_0_bits_size  (io_in_0_req_bits_size),
    .io_in_0_bits_cmd   (io_in_0_req_bits_cmd),
    .io_in_0_bits_wmask (io_in_0_req_bits_wmask),
    .io_in_0_bits_wdata (io_in_0_req_bits_wdata),
    .io_in_1_ready      (io_in_1_req_ready),
    .io_in_1_valid      (io_in_1_req_valid),
    .io_in_1_bits_addr  (io_in_1_req_bits_addr),
    .io_in_1_bits_cmd   (io_in_1_req_bits_cmd),
    .io_in_1_bits_wdata (io_in_1_req_bits_wdata),
    .io_in_2_ready      (io_in_2_req_ready),
    .io_in_2_valid      (io_in_2_req_valid),
    .io_in_2_bits_addr  (io_in_2_req_bits_addr),
    .io_in_2_bits_cmd   (io_in_2_req_bits_cmd),
    .io_in_2_bits_wdata (io_in_2_req_bits_wdata),
    .io_in_3_ready      (io_in_3_req_ready),
    .io_in_3_valid      (io_in_3_req_valid),
    .io_in_3_bits_addr  (io_in_3_req_bits_addr),
    .io_in_3_bits_size  (io_in_3_req_bits_size),
    .io_in_3_bits_cmd   (io_in_3_req_bits_cmd),
    .io_in_3_bits_wmask (io_in_3_req_bits_wmask),
    .io_in_3_bits_wdata (io_in_3_req_bits_wdata),
    .io_out_ready       (_inputArb_io_out_ready_T_1),	// src/main/scala/bus/simplebus/Crossbar.scala:104:37
    .io_out_valid       (_inputArb_io_out_valid),
    .io_out_bits_addr   (io_out_req_bits_addr),
    .io_out_bits_size   (io_out_req_bits_size),
    .io_out_bits_cmd    (_inputArb_io_out_bits_cmd),
    .io_out_bits_wmask  (io_out_req_bits_wmask),
    .io_out_bits_wdata  (io_out_req_bits_wdata),
    .io_chosen          (_inputArb_io_chosen)
  );
  assign io_in_0_resp_valid = inflightSrc == 2'h0 & io_out_resp_valid;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :92:22, :99:28, :107:26, :109:13
  assign io_in_0_resp_bits_cmd = io_out_resp_bits_cmd;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_in_0_resp_bits_rdata = io_out_resp_bits_rdata;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_in_1_resp_valid = inflightSrc == 2'h1 & io_out_resp_valid;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :99:28, :107:26, :109:13
  assign io_in_1_resp_bits_cmd = io_out_resp_bits_cmd;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_in_1_resp_bits_rdata = io_out_resp_bits_rdata;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_in_2_resp_valid = inflightSrc == 2'h2 & io_out_resp_valid;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :99:28, :107:26, :109:13
  assign io_in_2_resp_bits_cmd = io_out_resp_bits_cmd;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_in_2_resp_bits_rdata = io_out_resp_bits_rdata;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_in_3_resp_valid = (&inflightSrc) & io_out_resp_valid;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :99:28, :107:26, :109:13
  assign io_in_3_resp_bits_cmd = io_out_resp_bits_cmd;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_in_3_resp_bits_rdata = io_out_resp_bits_rdata;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7
  assign io_out_req_valid = _inputArb_io_out_valid & ~(|state);	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :92:22, :95:24, :103:{37,47}
  assign io_out_req_bits_cmd = _inputArb_io_out_bits_cmd;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :95:24
  assign io_out_resp_ready = io_out_resp_ready_0;	// src/main/scala/bus/simplebus/Crossbar.scala:85:7, :109:13
endmodule

