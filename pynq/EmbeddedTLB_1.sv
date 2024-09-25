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

module EmbeddedTLB_1(	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
  input         clock,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
                reset,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
  output        io_in_req_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_in_req_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [38:0] io_in_req_bits_addr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [2:0]  io_in_req_bits_size,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [3:0]  io_in_req_bits_cmd,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [7:0]  io_in_req_bits_wmask,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [63:0] io_in_req_bits_wdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_in_resp_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [63:0] io_in_resp_bits_rdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_out_req_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_out_req_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [31:0] io_out_req_bits_addr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [2:0]  io_out_req_bits_size,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [3:0]  io_out_req_bits_cmd,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [7:0]  io_out_req_bits_wmask,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [63:0] io_out_req_bits_wdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_out_resp_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [63:0] io_out_resp_bits_rdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_mem_req_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_mem_req_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [31:0] io_mem_req_bits_addr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [3:0]  io_mem_req_bits_cmd,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [63:0] io_mem_req_bits_wdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_mem_resp_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [63:0] io_mem_resp_bits_rdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [1:0]  io_csrMMU_privilegeMode,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_csrMMU_status_sum,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
                io_csrMMU_status_mxr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_csrMMU_loadPF,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
                io_csrMMU_storePF,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [38:0] io_csrMMU_addr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [63:0] satp__bore,
  output        _WIRE__bore,
  input         flushTLB__bore,
                tlbExec_isAMO__bore,
  output        _WIRE_1__bore,
                _WIRE_1__bore_0,
                _WIRE_2__bore,
                _WIRE_2__bore_0,
                _WIRE_2__bore_1
);

  wire [120:0] _mdTLB_io_tlbmd_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire [120:0] _mdTLB_io_tlbmd_1;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire [120:0] _mdTLB_io_tlbmd_2;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire [120:0] _mdTLB_io_tlbmd_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire         _mdTLB_io_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire         _tlbEmpty_io_in_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
  wire         _tlbEmpty_io_out_valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
  wire [31:0]  _tlbEmpty_io_out_bits_addr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
  wire [2:0]   _tlbEmpty_io_out_bits_size;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
  wire [3:0]   _tlbEmpty_io_out_bits_cmd;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
  wire [7:0]   _tlbEmpty_io_out_bits_wmask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
  wire [63:0]  _tlbEmpty_io_out_bits_wdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
  wire         _tlbExec_io_in_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_out_valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [31:0]  _tlbExec_io_out_bits_addr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [2:0]   _tlbExec_io_out_bits_size;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [3:0]   _tlbExec_io_out_bits_cmd;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [7:0]   _tlbExec_io_out_bits_wmask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [63:0]  _tlbExec_io_out_bits_wdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_mdWrite_wen;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [3:0]   _tlbExec_io_mdWrite_windex;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [3:0]   _tlbExec_io_mdWrite_waymask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [120:0] _tlbExec_io_mdWrite_wdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_pf_loadPF;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_pf_storePF;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_isFinish;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  reg  [120:0] r_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  reg  [120:0] r_1;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  reg  [120:0] r_2;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  reg  [120:0] r_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  wire         _GEN = satp__bore[63:60] == 4'h8 & io_csrMMU_privilegeMode != 2'h3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:107:{31,49,57,85}, :152:35
  reg          valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:110:24
  reg  [38:0]  tlbExec_io_in_bits_raddr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
  reg  [2:0]   tlbExec_io_in_bits_rsize;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
  reg  [3:0]   tlbExec_io_in_bits_rcmd;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
  reg  [7:0]   tlbExec_io_in_bits_rwmask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
  reg  [63:0]  tlbExec_io_in_bits_rwdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
  reg          valid_1;	// src/main/scala/utils/Pipeline.scala:24:24
  reg  [31:0]  tlbEmpty_io_in_bits_raddr;	// src/main/scala/utils/Pipeline.scala:30:28
  reg  [2:0]   tlbEmpty_io_in_bits_rsize;	// src/main/scala/utils/Pipeline.scala:30:28
  reg  [3:0]   tlbEmpty_io_in_bits_rcmd;	// src/main/scala/utils/Pipeline.scala:30:28
  reg  [7:0]   tlbEmpty_io_in_bits_rwmask;	// src/main/scala/utils/Pipeline.scala:30:28
  reg  [63:0]  tlbEmpty_io_in_bits_rwdata;	// src/main/scala/utils/Pipeline.scala:30:28
  wire         _GEN_0 = ~_GEN | _tlbEmpty_io_in_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24, :128:{8,19}, :129:26, :152:35, src/main/scala/utils/Pipeline.scala:29:16
  wire         _GEN_1 = ~_GEN | io_out_req_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:128:{8,19}, :130:52, :140:41, :152:35
  reg          alreadyOutFinish;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:147:37
  wire         _GEN_2 =
    _tlbExec_io_out_valid & ~alreadyOutFinish | _tlbExec_io_pf_loadPF
    | _tlbExec_io_pf_storePF;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :147:37, :149:{43,46,65}, :150:35
  wire         _GEN_3 = _tlbExec_io_pf_loadPF | _tlbExec_io_pf_storePF;	// src/main/scala/nutcore/Bundle.scala:131:23, src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :151:35
  always @(posedge clock) begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    automatic logic mdUpdate;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:112:22
    automatic logic _tlbEmpty_io_in_bits_T;	// src/main/scala/utils/Pipeline.scala:26:22
    mdUpdate = io_in_req_valid & _tlbExec_io_in_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :112:22
    _tlbEmpty_io_in_bits_T = _tlbExec_io_out_valid & _tlbEmpty_io_in_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :86:24, src/main/scala/utils/Pipeline.scala:26:22
    if (mdUpdate) begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:112:22
      r_0 <= _mdTLB_io_tlbmd_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      r_1 <= _mdTLB_io_tlbmd_1;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      r_2 <= _mdTLB_io_tlbmd_2;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      r_3 <= _mdTLB_io_tlbmd_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      tlbExec_io_in_bits_raddr <= io_in_req_bits_addr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
      tlbExec_io_in_bits_rsize <= io_in_req_bits_size;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
      tlbExec_io_in_bits_rcmd <= io_in_req_bits_cmd;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
      tlbExec_io_in_bits_rwmask <= io_in_req_bits_wmask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
      tlbExec_io_in_bits_rwdata <= io_in_req_bits_wdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    end
    if (_tlbEmpty_io_in_bits_T) begin	// src/main/scala/utils/Pipeline.scala:26:22
      tlbEmpty_io_in_bits_raddr <= _tlbExec_io_out_bits_addr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, src/main/scala/utils/Pipeline.scala:30:28
      tlbEmpty_io_in_bits_rsize <= _tlbExec_io_out_bits_size;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, src/main/scala/utils/Pipeline.scala:30:28
      tlbEmpty_io_in_bits_rcmd <= _tlbExec_io_out_bits_cmd;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, src/main/scala/utils/Pipeline.scala:30:28
      tlbEmpty_io_in_bits_rwmask <= _tlbExec_io_out_bits_wmask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, src/main/scala/utils/Pipeline.scala:30:28
      tlbEmpty_io_in_bits_rwdata <= _tlbExec_io_out_bits_wdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, src/main/scala/utils/Pipeline.scala:30:28
    end
    if (reset) begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      valid <= 1'h0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14, :85:23, :110:24
      valid_1 <= 1'h0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14, :85:23, src/main/scala/utils/Pipeline.scala:24:24
      alreadyOutFinish <= 1'h0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14, :85:23, :147:37
    end
    else begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      valid <= mdUpdate & _GEN | ~_tlbExec_io_isFinish & valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :110:24, :111:{25,33}, :112:{22,37,50,58}, :152:35
      valid_1 <= _tlbEmpty_io_in_bits_T | ~(_GEN_1 & _tlbEmpty_io_out_valid) & valid_1;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24, :128:19, :130:52, :140:41, src/main/scala/utils/Pipeline.scala:24:24, :25:{25,33}, :26:{22,38,46}
      alreadyOutFinish <=
        ~(alreadyOutFinish & _GEN_0 & _tlbExec_io_out_valid)
        & (_tlbExec_io_out_valid & ~_GEN_0 | alreadyOutFinish);	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :128:19, :129:26, :147:{37,76,79}, :148:{27,51,70}, src/main/scala/utils/Pipeline.scala:29:16
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      automatic logic [31:0] _RANDOM[0:22];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
        for (logic [4:0] i = 5'h0; i < 5'h17; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
        end	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
        r_0 = {_RANDOM[5'h0], _RANDOM[5'h1], _RANDOM[5'h2], _RANDOM[5'h3][24:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :94:29
        r_1 =
          {_RANDOM[5'h3][31:25],
           _RANDOM[5'h4],
           _RANDOM[5'h5],
           _RANDOM[5'h6],
           _RANDOM[5'h7][17:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :94:29
        r_2 =
          {_RANDOM[5'h7][31:18],
           _RANDOM[5'h8],
           _RANDOM[5'h9],
           _RANDOM[5'hA],
           _RANDOM[5'hB][10:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :94:29
        r_3 =
          {_RANDOM[5'hB][31:11],
           _RANDOM[5'hC],
           _RANDOM[5'hD],
           _RANDOM[5'hE],
           _RANDOM[5'hF][3:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :94:29
        valid = _RANDOM[5'hF][4];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :94:29, :110:24
        tlbExec_io_in_bits_raddr = {_RANDOM[5'hF][31:5], _RANDOM[5'h10][11:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :94:29, :116:28
        tlbExec_io_in_bits_rsize = _RANDOM[5'h10][14:12];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28
        tlbExec_io_in_bits_rcmd = _RANDOM[5'h10][18:15];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28
        tlbExec_io_in_bits_rwmask = _RANDOM[5'h10][26:19];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28
        tlbExec_io_in_bits_rwdata =
          {_RANDOM[5'h10][31:27], _RANDOM[5'h11], _RANDOM[5'h12][26:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28
        valid_1 = _RANDOM[5'h12][27];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28, src/main/scala/utils/Pipeline.scala:24:24
        tlbEmpty_io_in_bits_raddr = {_RANDOM[5'h12][31:28], _RANDOM[5'h13][27:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28, src/main/scala/utils/Pipeline.scala:30:28
        tlbEmpty_io_in_bits_rsize = _RANDOM[5'h13][30:28];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, src/main/scala/utils/Pipeline.scala:30:28
        tlbEmpty_io_in_bits_rcmd = {_RANDOM[5'h13][31], _RANDOM[5'h14][2:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, src/main/scala/utils/Pipeline.scala:30:28
        tlbEmpty_io_in_bits_rwmask = _RANDOM[5'h14][10:3];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, src/main/scala/utils/Pipeline.scala:30:28
        tlbEmpty_io_in_bits_rwdata =
          {_RANDOM[5'h14][31:11], _RANDOM[5'h15], _RANDOM[5'h16][10:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, src/main/scala/utils/Pipeline.scala:30:28
        alreadyOutFinish = _RANDOM[5'h16][11];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :147:37, src/main/scala/utils/Pipeline.scala:30:28
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  EmbeddedTLBExec_1 tlbExec (	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .clock                  (clock),
    .reset                  (reset),
    .io_in_ready            (_tlbExec_io_in_ready),
    .io_in_valid            (valid),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:110:24
    .io_in_bits_addr        (tlbExec_io_in_bits_raddr),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    .io_in_bits_size        (tlbExec_io_in_bits_rsize),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    .io_in_bits_cmd         (tlbExec_io_in_bits_rcmd),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    .io_in_bits_wmask       (tlbExec_io_in_bits_rwmask),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    .io_in_bits_wdata       (tlbExec_io_in_bits_rwdata),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    .io_out_ready           (_GEN_0),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:128:19, :129:26, src/main/scala/utils/Pipeline.scala:29:16
    .io_out_valid           (_tlbExec_io_out_valid),
    .io_out_bits_addr       (_tlbExec_io_out_bits_addr),
    .io_out_bits_size       (_tlbExec_io_out_bits_size),
    .io_out_bits_cmd        (_tlbExec_io_out_bits_cmd),
    .io_out_bits_wmask      (_tlbExec_io_out_bits_wmask),
    .io_out_bits_wdata      (_tlbExec_io_out_bits_wdata),
    .io_md_0                (r_0),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_md_1                (r_1),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_md_2                (r_2),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_md_3                (r_3),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_mdWrite_wen         (_tlbExec_io_mdWrite_wen),
    .io_mdWrite_windex      (_tlbExec_io_mdWrite_windex),
    .io_mdWrite_waymask     (_tlbExec_io_mdWrite_waymask),
    .io_mdWrite_wdata       (_tlbExec_io_mdWrite_wdata),
    .io_mdReady             (_mdTLB_io_ready),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
    .io_mem_req_ready       (io_mem_req_ready),
    .io_mem_req_valid       (io_mem_req_valid),
    .io_mem_req_bits_addr   (io_mem_req_bits_addr),
    .io_mem_req_bits_cmd    (io_mem_req_bits_cmd),
    .io_mem_req_bits_wdata  (io_mem_req_bits_wdata),
    .io_mem_resp_valid      (io_mem_resp_valid),
    .io_mem_resp_bits_rdata (io_mem_resp_bits_rdata),
    .io_satp                (satp__bore),
    .io_pf_privilegeMode    (io_csrMMU_privilegeMode),
    .io_pf_status_sum       (io_csrMMU_status_sum),
    .io_pf_status_mxr       (io_csrMMU_status_mxr),
    .io_pf_loadPF           (_tlbExec_io_pf_loadPF),
    .io_pf_storePF          (_tlbExec_io_pf_storePF),
    .io_pf_addr             (io_csrMMU_addr),
    .io_isFinish            (_tlbExec_io_isFinish),
    .isAMO__bore            (tlbExec_isAMO__bore)
  );
  EmbeddedTLBEmpty_1 tlbEmpty (	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:86:24
    .io_in_ready       (_tlbEmpty_io_in_ready),
    .io_in_valid       (valid_1),	// src/main/scala/utils/Pipeline.scala:24:24
    .io_in_bits_addr   (tlbEmpty_io_in_bits_raddr),	// src/main/scala/utils/Pipeline.scala:30:28
    .io_in_bits_size   (tlbEmpty_io_in_bits_rsize),	// src/main/scala/utils/Pipeline.scala:30:28
    .io_in_bits_cmd    (tlbEmpty_io_in_bits_rcmd),	// src/main/scala/utils/Pipeline.scala:30:28
    .io_in_bits_wmask  (tlbEmpty_io_in_bits_rwmask),	// src/main/scala/utils/Pipeline.scala:30:28
    .io_in_bits_wdata  (tlbEmpty_io_in_bits_rwdata),	// src/main/scala/utils/Pipeline.scala:30:28
    .io_out_ready      (_GEN_1),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:128:19, :130:52, :140:41
    .io_out_valid      (_tlbEmpty_io_out_valid),
    .io_out_bits_addr  (_tlbEmpty_io_out_bits_addr),
    .io_out_bits_size  (_tlbEmpty_io_out_bits_size),
    .io_out_bits_cmd   (_tlbEmpty_io_out_bits_cmd),
    .io_out_bits_wmask (_tlbEmpty_io_out_bits_wmask),
    .io_out_bits_wdata (_tlbEmpty_io_out_bits_wdata)
  );
  EmbeddedTLBMD_1 mdTLB (	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
    .clock            (clock),
    .reset            (reset | flushTLB__bore),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:104:31
    .io_tlbmd_0       (_mdTLB_io_tlbmd_0),
    .io_tlbmd_1       (_mdTLB_io_tlbmd_1),
    .io_tlbmd_2       (_mdTLB_io_tlbmd_2),
    .io_tlbmd_3       (_mdTLB_io_tlbmd_3),
    .io_write_wen     (_tlbExec_io_mdWrite_wen),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .io_write_windex  (_tlbExec_io_mdWrite_windex),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .io_write_waymask (_tlbExec_io_mdWrite_waymask),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .io_write_wdata   (_tlbExec_io_mdWrite_wdata),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .io_rindex        (io_in_req_bits_addr[15:12]),	// src/main/scala/nutcore/mem/TLB.scala:200:19
    .io_ready         (_mdTLB_io_ready)
  );
  assign io_in_req_ready = _GEN ? _tlbExec_io_in_ready : io_out_req_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :85:23, :115:16, :128:19, :132:21, :152:35
  assign io_in_resp_valid = io_out_resp_valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
  assign io_in_resp_bits_rdata = io_out_resp_bits_rdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
  assign io_out_req_valid = _GEN ? _tlbEmpty_io_out_valid : io_in_req_valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :86:24, :128:19, :131:22, :140:41, :152:35
  assign io_out_req_bits_addr =
    _GEN ? _tlbEmpty_io_out_bits_addr : io_in_req_bits_addr[31:0];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :86:24, :128:19, :133:{26,48}, :140:41, :152:35
  assign io_out_req_bits_size = _GEN ? _tlbEmpty_io_out_bits_size : io_in_req_bits_size;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :86:24, :128:19, :134:26, :140:41, :152:35
  assign io_out_req_bits_cmd = _GEN ? _tlbEmpty_io_out_bits_cmd : io_in_req_bits_cmd;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :86:24, :128:19, :135:25, :140:41, :152:35
  assign io_out_req_bits_wmask =
    _GEN ? _tlbEmpty_io_out_bits_wmask : io_in_req_bits_wmask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :86:24, :128:19, :136:27, :140:41, :152:35
  assign io_out_req_bits_wdata =
    _GEN ? _tlbEmpty_io_out_bits_wdata : io_in_req_bits_wdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :86:24, :128:19, :137:27, :140:41, :152:35
  assign io_csrMMU_loadPF = _tlbExec_io_pf_loadPF;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :85:23
  assign io_csrMMU_storePF = _tlbExec_io_pf_storePF;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :85:23
  assign _WIRE__bore = _GEN_2;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :150:35
  assign _WIRE_1__bore = _GEN_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :151:35
  assign _WIRE_1__bore_0 = _GEN_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :151:35
  assign _WIRE_2__bore = _GEN;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :152:35
  assign _WIRE_2__bore_0 = _GEN;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :152:35
  assign _WIRE_2__bore_1 = _GEN;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :152:35
endmodule

