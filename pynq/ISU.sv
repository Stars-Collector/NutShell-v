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

module ISU(	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  input         clock,	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
                reset,	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  output        io_in_0_ready,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_in_0_valid,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [63:0] io_in_0_bits_cf_instr,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [38:0] io_in_0_bits_cf_pc,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_pnpc,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_in_0_bits_cf_exceptionVec_1,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_exceptionVec_2,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_exceptionVec_12,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_0,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_1,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_2,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_3,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_4,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_5,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_6,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_7,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_8,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_9,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_10,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_cf_intrVec_11,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [3:0]  io_in_0_bits_cf_brIdx,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_in_0_bits_cf_crossPageIPFFix,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_ctrl_src1Type,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_ctrl_src2Type,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [2:0]  io_in_0_bits_ctrl_fuType,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [6:0]  io_in_0_bits_ctrl_fuOpType,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [4:0]  io_in_0_bits_ctrl_rfSrc1,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_in_0_bits_ctrl_rfSrc2,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_in_0_bits_ctrl_rfWen,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [4:0]  io_in_0_bits_ctrl_rfDest,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [63:0] io_in_0_bits_data_imm,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_out_ready,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output        io_out_valid,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output [63:0] io_out_bits_cf_instr,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output [38:0] io_out_bits_cf_pc,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_pnpc,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output        io_out_bits_cf_exceptionVec_1,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_exceptionVec_2,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_exceptionVec_12,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_0,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_1,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_2,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_3,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_4,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_5,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_6,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_7,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_8,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_9,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_10,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_cf_intrVec_11,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output [3:0]  io_out_bits_cf_brIdx,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output        io_out_bits_cf_crossPageIPFFix,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output [2:0]  io_out_bits_ctrl_fuType,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output [6:0]  io_out_bits_ctrl_fuOpType,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output        io_out_bits_ctrl_rfWen,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output [4:0]  io_out_bits_ctrl_rfDest,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  output [63:0] io_out_bits_data_src1,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_data_src2,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_out_bits_data_imm,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_wb_rfWen,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [4:0]  io_wb_rfDest,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [63:0] io_wb_rfData,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_forward_valid,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
                io_forward_wb_rfWen,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [4:0]  io_forward_wb_rfDest,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [63:0] io_forward_wb_rfData,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input  [2:0]  io_forward_fuType,	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
  input         io_flush	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
);

  wire [63:0] _rf_ext_R0_data;	// src/main/scala/nutcore/RF.scala:30:15
  wire [63:0] _rf_ext_R1_data;	// src/main/scala/nutcore/RF.scala:30:15
  wire        forwardRfWen = io_forward_wb_rfWen & io_forward_valid;	// src/main/scala/nutcore/backend/seq/ISU.scala:43:42
  wire        dontForward1 = (|io_forward_fuType) & io_forward_fuType != 3'h1;	// src/main/scala/nutcore/backend/seq/ISU.scala:44:{41,57,79}
  wire        src1DependEX =
    (|io_in_0_bits_ctrl_rfSrc1) & io_in_0_bits_ctrl_rfSrc1 == io_forward_wb_rfDest
    & forwardRfWen;	// src/main/scala/nutcore/backend/seq/ISU.scala:41:{69,88,100}, :43:42
  wire        src2DependEX =
    (|io_in_0_bits_ctrl_rfSrc2) & io_in_0_bits_ctrl_rfSrc2 == io_forward_wb_rfDest
    & forwardRfWen;	// src/main/scala/nutcore/backend/seq/ISU.scala:41:{69,88,100}, :43:42
  wire        src1ForwardNextCycle = src1DependEX & ~dontForward1;	// src/main/scala/nutcore/backend/seq/ISU.scala:41:100, :44:57, :50:{43,46}
  wire        src2ForwardNextCycle = src2DependEX & ~dontForward1;	// src/main/scala/nutcore/backend/seq/ISU.scala:41:100, :44:57, :50:46, :51:43
  wire        src1Forward =
    (|io_in_0_bits_ctrl_rfSrc1) & io_in_0_bits_ctrl_rfSrc1 == io_wb_rfDest & io_wb_rfWen
    & (~dontForward1 | ~src1DependEX);	// src/main/scala/nutcore/backend/seq/ISU.scala:41:{69,88,100}, :44:57, :52:{34,40,55}
  wire        src2Forward =
    (|io_in_0_bits_ctrl_rfSrc2) & io_in_0_bits_ctrl_rfSrc2 == io_wb_rfDest & io_wb_rfWen
    & (~dontForward1 | ~src2DependEX);	// src/main/scala/nutcore/backend/seq/ISU.scala:41:{69,88,100}, :44:57, :52:40, :53:{34,40,55}
  reg  [31:0] busy;	// src/main/scala/nutcore/RF.scala:36:21
  wire [31:0] _src1Ready_T = busy >> io_in_0_bits_ctrl_rfSrc1;	// src/main/scala/nutcore/RF.scala:36:21, :37:37
  wire [31:0] _src2Ready_T = busy >> io_in_0_bits_ctrl_rfSrc2;	// src/main/scala/nutcore/RF.scala:36:21, :37:37
  wire        io_out_valid_0 =
    io_in_0_valid & (~(_src1Ready_T[0]) | src1ForwardNextCycle | src1Forward)
    & (~(_src2Ready_T[0]) | src2ForwardNextCycle | src2Forward);	// src/main/scala/nutcore/RF.scala:37:37, src/main/scala/nutcore/backend/seq/ISU.scala:50:43, :51:43, :52:34, :53:34, :56:{19,62}, :57:{19,62}, :58:47
  wire        _GEN = io_out_ready & io_out_valid_0;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/backend/seq/ISU.scala:58:47, :99:33
  wire        _GEN_0 = io_in_0_valid & ~io_out_valid_0;	// src/main/scala/nutcore/backend/seq/ISU.scala:58:47, :97:{33,49,52}
  wire        _GEN_1 = io_out_valid_0 & ~_GEN;	// src/main/scala/nutcore/backend/seq/ISU.scala:58:47, :98:{33,47,50}, :99:33
  always @(posedge clock) begin	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
    if (reset)	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
      busy <= 32'h0;	// src/main/scala/nutcore/RF.scala:36:21
    else if (io_flush)	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
      busy <= 32'h0;	// src/main/scala/nutcore/RF.scala:36:21
    else begin	// src/main/scala/nutcore/backend/seq/ISU.scala:28:14
      automatic logic [62:0] _wbClearMask_T_6 = 63'h1 << io_wb_rfDest;	// src/main/scala/nutcore/RF.scala:38:39
      automatic logic [62:0] _isuFireSetMask_T_1 = 63'h1 << io_in_0_bits_ctrl_rfDest;	// src/main/scala/nutcore/RF.scala:38:39
      busy <=
        {busy[31:1]
           & ~(io_wb_rfWen
               & ~((|io_wb_rfDest) & io_wb_rfDest == io_forward_wb_rfDest & forwardRfWen)
                 ? _wbClearMask_T_6[31:1]
                 : 31'h0) | (_GEN ? _isuFireSetMask_T_1[31:1] : 31'h0),
         1'h0};	// src/main/scala/nutcore/RF.scala:36:21, :38:{39,46}, :44:{16,24,26,38}, src/main/scala/nutcore/backend/seq/ISU.scala:27:7, :41:{69,88,100}, :43:42, :85:{24,37,40}, :87:27, :99:33
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
      automatic logic [31:0] _RANDOM[0:0];	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
        busy = _RANDOM[/*Zero width*/ 1'b0];	// src/main/scala/nutcore/RF.scala:36:21, src/main/scala/nutcore/backend/seq/ISU.scala:27:7
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  rf_32x64 rf_ext (	// src/main/scala/nutcore/RF.scala:30:15
    .R0_addr (io_in_0_bits_ctrl_rfSrc2),
    .R0_en   (1'h1),	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
    .R0_clk  (clock),
    .R0_data (_rf_ext_R0_data),
    .R1_addr (io_in_0_bits_ctrl_rfSrc1),
    .R1_en   (1'h1),	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
    .R1_clk  (clock),
    .R1_data (_rf_ext_R1_data),
    .W0_addr (io_wb_rfDest),
    .W0_en   (io_wb_rfWen),
    .W0_clk  (clock),
    .W0_data (io_wb_rfData)
  );
  assign io_in_0_ready = ~io_in_0_valid | _GEN;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7, :91:{21,37}, :99:33
  assign io_out_valid = io_out_valid_0;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7, :58:47
  assign io_out_bits_cf_instr = io_in_0_bits_cf_instr;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_pc = io_in_0_bits_cf_pc;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_pnpc = io_in_0_bits_cf_pnpc;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_exceptionVec_1 = io_in_0_bits_cf_exceptionVec_1;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_exceptionVec_2 = io_in_0_bits_cf_exceptionVec_2;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_exceptionVec_12 = io_in_0_bits_cf_exceptionVec_12;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_0 = io_in_0_bits_cf_intrVec_0;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_1 = io_in_0_bits_cf_intrVec_1;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_2 = io_in_0_bits_cf_intrVec_2;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_3 = io_in_0_bits_cf_intrVec_3;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_4 = io_in_0_bits_cf_intrVec_4;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_5 = io_in_0_bits_cf_intrVec_5;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_6 = io_in_0_bits_cf_intrVec_6;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_7 = io_in_0_bits_cf_intrVec_7;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_8 = io_in_0_bits_cf_intrVec_8;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_9 = io_in_0_bits_cf_intrVec_9;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_10 = io_in_0_bits_cf_intrVec_10;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_intrVec_11 = io_in_0_bits_cf_intrVec_11;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_brIdx = io_in_0_bits_cf_brIdx;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_cf_crossPageIPFFix = io_in_0_bits_cf_crossPageIPFFix;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_ctrl_fuType = io_in_0_bits_ctrl_fuType;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_ctrl_fuOpType = io_in_0_bits_ctrl_fuOpType;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_ctrl_rfWen = io_in_0_bits_ctrl_rfWen;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_ctrl_rfDest = io_in_0_bits_ctrl_rfDest;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
  assign io_out_bits_data_src1 =
    (io_in_0_bits_ctrl_src1Type
       ? {{25{io_in_0_bits_cf_pc[38]}}, io_in_0_bits_cf_pc}
       : 64'h0) | (src1ForwardNextCycle ? io_forward_wb_rfData : 64'h0)
    | (src1Forward & ~src1ForwardNextCycle ? io_wb_rfData : 64'h0)
    | (io_in_0_bits_ctrl_src1Type | src1ForwardNextCycle | src1Forward
       | io_in_0_bits_ctrl_rfSrc1 == 5'h0
         ? 64'h0
         : _rf_ext_R1_data);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/RF.scala:30:15, :31:42, src/main/scala/nutcore/backend/seq/ISU.scala:27:7, :41:69, :50:43, :52:34, :66:{18,21}, src/main/scala/utils/BitUtils.scala:41:20, :42:{41,46}
  assign io_out_bits_data_src2 =
    (io_in_0_bits_ctrl_src2Type ? io_in_0_bits_data_imm : 64'h0)
    | (src2ForwardNextCycle ? io_forward_wb_rfData : 64'h0)
    | (src2Forward & ~src2ForwardNextCycle ? io_wb_rfData : 64'h0)
    | (io_in_0_bits_ctrl_src2Type | src2ForwardNextCycle | src2Forward
       | io_in_0_bits_ctrl_rfSrc2 == 5'h0
         ? 64'h0
         : _rf_ext_R0_data);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/RF.scala:30:15, :31:42, src/main/scala/nutcore/backend/seq/ISU.scala:27:7, :41:69, :51:43, :53:34, :72:{18,21}
  assign io_out_bits_data_imm = io_in_0_bits_data_imm;	// src/main/scala/nutcore/backend/seq/ISU.scala:27:7
endmodule

