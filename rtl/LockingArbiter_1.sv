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

module LockingArbiter_1(	// src/main/scala/chisel3/util/Arbiter.scala:97:7
  input         clock,	// src/main/scala/chisel3/util/Arbiter.scala:97:7
                reset,	// src/main/scala/chisel3/util/Arbiter.scala:97:7
  output        io_in_0_ready,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input         io_in_0_valid,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [31:0] io_in_0_bits_addr,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [2:0]  io_in_0_bits_size,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [3:0]  io_in_0_bits_cmd,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [7:0]  io_in_0_bits_wmask,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [63:0] io_in_0_bits_wdata,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output        io_in_1_ready,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input         io_in_1_valid,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [31:0] io_in_1_bits_addr,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [3:0]  io_in_1_bits_cmd,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [63:0] io_in_1_bits_wdata,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output        io_in_2_ready,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input         io_in_2_valid,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [31:0] io_in_2_bits_addr,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [3:0]  io_in_2_bits_cmd,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [63:0] io_in_2_bits_wdata,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output        io_in_3_ready,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input         io_in_3_valid,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [31:0] io_in_3_bits_addr,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [2:0]  io_in_3_bits_size,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [3:0]  io_in_3_bits_cmd,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [7:0]  io_in_3_bits_wmask,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input  [63:0] io_in_3_bits_wdata,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  input         io_out_ready,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output        io_out_valid,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output [31:0] io_out_bits_addr,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output [2:0]  io_out_bits_size,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output [3:0]  io_out_bits_cmd,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output [7:0]  io_out_bits_wmask,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output [63:0] io_out_bits_wdata,	// src/main/scala/chisel3/util/Arbiter.scala:52:14
  output [1:0]  io_chosen	// src/main/scala/chisel3/util/Arbiter.scala:52:14
);

  wire [1:0]       io_chosen_choice;	// src/main/scala/chisel3/util/Arbiter.scala:103:{26,35}
  wire [1:0]       io_chosen_0;	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :69:{18,30}
  wire [3:0]       _GEN =
    {{io_in_3_valid}, {io_in_2_valid}, {io_in_1_valid}, {io_in_0_valid}};	// src/main/scala/chisel3/util/Arbiter.scala:55:16
  wire             io_out_valid_0 = _GEN[io_chosen_0];	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :55:16, :69:{18,30}
  wire [3:0][31:0] _GEN_0 =
    {{io_in_3_bits_addr}, {io_in_2_bits_addr}, {io_in_1_bits_addr}, {io_in_0_bits_addr}};	// src/main/scala/chisel3/util/Arbiter.scala:55:16
  wire [3:0][2:0]  _GEN_1 = {{io_in_3_bits_size}, {3'h3}, {3'h3}, {io_in_0_bits_size}};	// src/main/scala/chisel3/util/Arbiter.scala:52:14, :55:16
  wire [3:0][3:0]  _GEN_2 =
    {{io_in_3_bits_cmd}, {io_in_2_bits_cmd}, {io_in_1_bits_cmd}, {io_in_0_bits_cmd}};	// src/main/scala/chisel3/util/Arbiter.scala:55:16
  wire [3:0]       io_out_bits_cmd_0 = _GEN_2[io_chosen_0];	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :55:16, :69:{18,30}
  wire [3:0][7:0]  _GEN_3 =
    {{io_in_3_bits_wmask}, {8'hFF}, {8'hFF}, {io_in_0_bits_wmask}};	// src/main/scala/chisel3/util/Arbiter.scala:52:14, :55:16
  wire [3:0][63:0] _GEN_4 =
    {{io_in_3_bits_wdata},
     {io_in_2_bits_wdata},
     {io_in_1_bits_wdata},
     {io_in_0_bits_wdata}};	// src/main/scala/chisel3/util/Arbiter.scala:55:16
  reg  [2:0]       lockCount_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg  [1:0]       lockIdx;	// src/main/scala/chisel3/util/Arbiter.scala:60:22
  assign io_chosen_0 = (|lockCount_value) ? lockIdx : io_chosen_choice;	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :60:22, :61:34, :69:{18,30}, :103:{26,35}, src/main/scala/chisel3/util/Counter.scala:61:40
  wire             _GEN_5 = io_in_0_valid | io_in_1_valid;	// src/main/scala/chisel3/util/Arbiter.scala:45:68
  assign io_chosen_choice =
    io_in_0_valid ? 2'h0 : io_in_1_valid ? 2'h1 : {1'h1, ~io_in_2_valid};	// src/main/scala/chisel3/util/Arbiter.scala:97:7, :101:41, :103:{26,35}
  always @(posedge clock) begin	// src/main/scala/chisel3/util/Arbiter.scala:97:7
    automatic logic _GEN_6;	// src/main/scala/chisel3/util/Arbiter.scala:64:22
    _GEN_6 = io_out_ready & io_out_valid_0 & io_out_bits_cmd_0[0] & io_out_bits_cmd_0[1];	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, :75:22, src/main/scala/chisel3/util/Arbiter.scala:55:16, :64:22
    if (reset)	// src/main/scala/chisel3/util/Arbiter.scala:97:7
      lockCount_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
    else if (_GEN_6)	// src/main/scala/chisel3/util/Arbiter.scala:64:22
      lockCount_value <= lockCount_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24
    if (~_GEN_6 | (|lockCount_value)) begin	// src/main/scala/chisel3/util/Arbiter.scala:60:22, :61:34, :64:{22,36}, :65:15, src/main/scala/chisel3/util/Counter.scala:61:40
    end
    else	// src/main/scala/chisel3/util/Arbiter.scala:60:22, :64:36, :65:15
      lockIdx <= io_chosen_choice;	// src/main/scala/chisel3/util/Arbiter.scala:60:22, :103:{26,35}
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/chisel3/util/Arbiter.scala:97:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/chisel3/util/Arbiter.scala:97:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/chisel3/util/Arbiter.scala:97:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/chisel3/util/Arbiter.scala:97:7
      automatic logic [31:0] _RANDOM[0:0];	// src/main/scala/chisel3/util/Arbiter.scala:97:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/chisel3/util/Arbiter.scala:97:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/chisel3/util/Arbiter.scala:97:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/chisel3/util/Arbiter.scala:97:7
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;	// src/main/scala/chisel3/util/Arbiter.scala:97:7
        lockCount_value = _RANDOM[/*Zero width*/ 1'b0][2:0];	// src/main/scala/chisel3/util/Arbiter.scala:97:7, src/main/scala/chisel3/util/Counter.scala:61:40
        lockIdx = _RANDOM[/*Zero width*/ 1'b0][4:3];	// src/main/scala/chisel3/util/Arbiter.scala:60:22, :97:7, src/main/scala/chisel3/util/Counter.scala:61:40
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/chisel3/util/Arbiter.scala:97:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/chisel3/util/Arbiter.scala:97:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_0_ready = (~(|lockCount_value) | lockIdx == 2'h0) & io_out_ready;	// src/main/scala/chisel3/util/Arbiter.scala:60:22, :61:34, :71:{22,39,56}, :97:7, :103:{26,35}, src/main/scala/chisel3/util/Counter.scala:61:40
  assign io_in_1_ready =
    ((|lockCount_value) ? lockIdx == 2'h1 : ~io_in_0_valid) & io_out_ready;	// src/main/scala/chisel3/util/Arbiter.scala:45:78, :60:22, :61:34, :71:{22,39,56}, :97:7, :103:{26,35}, src/main/scala/chisel3/util/Counter.scala:61:40
  assign io_in_2_ready = ((|lockCount_value) ? lockIdx == 2'h2 : ~_GEN_5) & io_out_ready;	// src/main/scala/chisel3/util/Arbiter.scala:45:{68,78}, :60:22, :61:34, :71:{22,39,56}, :97:7, src/main/scala/chisel3/util/Counter.scala:61:40
  assign io_in_3_ready =
    ((|lockCount_value) ? (&lockIdx) : ~(_GEN_5 | io_in_2_valid)) & io_out_ready;	// src/main/scala/chisel3/util/Arbiter.scala:45:{68,78}, :60:22, :61:34, :71:{22,39,56}, :97:7, src/main/scala/chisel3/util/Counter.scala:61:40
  assign io_out_valid = io_out_valid_0;	// src/main/scala/chisel3/util/Arbiter.scala:55:16, :97:7
  assign io_out_bits_addr = _GEN_0[io_chosen_0];	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :55:16, :69:{18,30}, :97:7
  assign io_out_bits_size = _GEN_1[io_chosen_0];	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :55:16, :69:{18,30}, :97:7
  assign io_out_bits_cmd = io_out_bits_cmd_0;	// src/main/scala/chisel3/util/Arbiter.scala:55:16, :97:7
  assign io_out_bits_wmask = _GEN_3[io_chosen_0];	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :55:16, :69:{18,30}, :97:7
  assign io_out_bits_wdata = _GEN_4[io_chosen_0];	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :55:16, :69:{18,30}, :97:7
  assign io_chosen = io_chosen_0;	// src/main/scala/chisel3/util/Arbiter.scala:54:13, :69:{18,30}, :97:7
endmodule

