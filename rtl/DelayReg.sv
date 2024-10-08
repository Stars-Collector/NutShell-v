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

module DelayReg(	// difftest/src/main/scala/Difftest.scala:514:15
  input         clock,	// difftest/src/main/scala/Difftest.scala:514:15
                reset,	// difftest/src/main/scala/Difftest.scala:514:15
                i_valid,	// difftest/src/main/scala/Difftest.scala:510:13
                i_skip,	// difftest/src/main/scala/Difftest.scala:510:13
                i_isRVC,	// difftest/src/main/scala/Difftest.scala:510:13
                i_rfwen,	// difftest/src/main/scala/Difftest.scala:510:13
  input  [4:0]  i_wpdest,	// difftest/src/main/scala/Difftest.scala:510:13
  input  [7:0]  i_wdest,	// difftest/src/main/scala/Difftest.scala:510:13
  input  [63:0] i_pc,	// difftest/src/main/scala/Difftest.scala:510:13
  input  [31:0] i_instr,	// difftest/src/main/scala/Difftest.scala:510:13
  output        o_valid,	// difftest/src/main/scala/Difftest.scala:511:13
                o_skip,	// difftest/src/main/scala/Difftest.scala:511:13
                o_isRVC,	// difftest/src/main/scala/Difftest.scala:511:13
                o_rfwen,	// difftest/src/main/scala/Difftest.scala:511:13
  output [4:0]  o_wpdest,	// difftest/src/main/scala/Difftest.scala:511:13
  output [7:0]  o_wdest,	// difftest/src/main/scala/Difftest.scala:511:13
  output [63:0] o_pc,	// difftest/src/main/scala/Difftest.scala:511:13
  output [31:0] o_instr	// difftest/src/main/scala/Difftest.scala:511:13
);

  reg        REG_valid;	// difftest/src/main/scala/Difftest.scala:517:16
  reg        REG_skip;	// difftest/src/main/scala/Difftest.scala:517:16
  reg        REG_isRVC;	// difftest/src/main/scala/Difftest.scala:517:16
  reg        REG_rfwen;	// difftest/src/main/scala/Difftest.scala:517:16
  reg [4:0]  REG_wpdest;	// difftest/src/main/scala/Difftest.scala:517:16
  reg [7:0]  REG_wdest;	// difftest/src/main/scala/Difftest.scala:517:16
  reg [63:0] REG_pc;	// difftest/src/main/scala/Difftest.scala:517:16
  reg [31:0] REG_instr;	// difftest/src/main/scala/Difftest.scala:517:16
  always @(posedge clock) begin	// difftest/src/main/scala/Difftest.scala:514:15
    if (reset) begin	// difftest/src/main/scala/Difftest.scala:514:15
      REG_valid <= 1'h0;	// difftest/src/main/scala/Difftest.scala:510:13, :517:16
      REG_skip <= 1'h0;	// difftest/src/main/scala/Difftest.scala:510:13, :517:16
      REG_isRVC <= 1'h0;	// difftest/src/main/scala/Difftest.scala:510:13, :517:16
      REG_rfwen <= 1'h0;	// difftest/src/main/scala/Difftest.scala:510:13, :517:16
      REG_wpdest <= 5'h0;	// difftest/src/main/scala/Difftest.scala:517:{16,32}
      REG_wdest <= 8'h0;	// difftest/src/main/scala/Difftest.scala:510:13, :517:16
      REG_pc <= 64'h0;	// difftest/src/main/scala/Difftest.scala:517:{16,32}
      REG_instr <= 32'h0;	// difftest/src/main/scala/Difftest.scala:517:{16,32}
    end
    else begin	// difftest/src/main/scala/Difftest.scala:514:15
      REG_valid <= i_valid;	// difftest/src/main/scala/Difftest.scala:517:16
      REG_skip <= i_skip;	// difftest/src/main/scala/Difftest.scala:517:16
      REG_isRVC <= i_isRVC;	// difftest/src/main/scala/Difftest.scala:517:16
      REG_rfwen <= i_rfwen;	// difftest/src/main/scala/Difftest.scala:517:16
      REG_wpdest <= i_wpdest;	// difftest/src/main/scala/Difftest.scala:517:16
      REG_wdest <= i_wdest;	// difftest/src/main/scala/Difftest.scala:517:16
      REG_pc <= i_pc;	// difftest/src/main/scala/Difftest.scala:517:16
      REG_instr <= i_instr;	// difftest/src/main/scala/Difftest.scala:517:16
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// difftest/src/main/scala/Difftest.scala:514:15
    `ifdef FIRRTL_BEFORE_INITIAL	// difftest/src/main/scala/Difftest.scala:514:15
      `FIRRTL_BEFORE_INITIAL	// difftest/src/main/scala/Difftest.scala:514:15
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// difftest/src/main/scala/Difftest.scala:514:15
      automatic logic [31:0] _RANDOM[0:3];	// difftest/src/main/scala/Difftest.scala:514:15
      `ifdef INIT_RANDOM_PROLOG_	// difftest/src/main/scala/Difftest.scala:514:15
        `INIT_RANDOM_PROLOG_	// difftest/src/main/scala/Difftest.scala:514:15
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// difftest/src/main/scala/Difftest.scala:514:15
        for (logic [2:0] i = 3'h0; i < 3'h4; i += 3'h1) begin
          _RANDOM[i[1:0]] = `RANDOM;	// difftest/src/main/scala/Difftest.scala:514:15
        end	// difftest/src/main/scala/Difftest.scala:514:15
        REG_valid = _RANDOM[2'h0][0];	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
        REG_skip = _RANDOM[2'h0][1];	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
        REG_isRVC = _RANDOM[2'h0][2];	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
        REG_rfwen = _RANDOM[2'h0][3];	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
        REG_wpdest = _RANDOM[2'h0][10:6];	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
        REG_wdest = _RANDOM[2'h0][18:11];	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
        REG_pc = {_RANDOM[2'h0][31:19], _RANDOM[2'h1], _RANDOM[2'h2][18:0]};	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
        REG_instr = {_RANDOM[2'h2][31:19], _RANDOM[2'h3][18:0]};	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// difftest/src/main/scala/Difftest.scala:514:15
      `FIRRTL_AFTER_INITIAL	// difftest/src/main/scala/Difftest.scala:514:15
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign o_valid = REG_valid;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
  assign o_skip = REG_skip;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
  assign o_isRVC = REG_isRVC;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
  assign o_rfwen = REG_rfwen;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
  assign o_wpdest = REG_wpdest;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
  assign o_wdest = REG_wdest;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
  assign o_pc = REG_pc;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
  assign o_instr = REG_instr;	// difftest/src/main/scala/Difftest.scala:514:15, :517:16
endmodule

