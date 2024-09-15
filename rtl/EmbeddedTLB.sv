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

module EmbeddedTLB(	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
  input         clock,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
                reset,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
  output        io_in_req_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_in_req_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [38:0] io_in_req_bits_addr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [86:0] io_in_req_bits_user,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_in_resp_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_in_resp_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [63:0] io_in_resp_bits_rdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [86:0] io_in_resp_bits_user,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_out_req_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_out_req_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [31:0] io_out_req_bits_addr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [86:0] io_out_req_bits_user,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_out_resp_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_out_resp_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [3:0]  io_out_resp_bits_cmd,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [63:0] io_out_resp_bits_rdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [86:0] io_out_resp_bits_user,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_mem_req_ready,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_mem_req_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [31:0] io_mem_req_bits_addr,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [3:0]  io_mem_req_bits_cmd,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output [63:0] io_mem_req_bits_wdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_mem_resp_valid,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [3:0]  io_mem_resp_bits_cmd,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [63:0] io_mem_resp_bits_rdata,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_flush,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [1:0]  io_csrMMU_privilegeMode,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input         io_cacheEmpty,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  output        io_ipf,	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14
  input  [63:0] satp__bore,
  input         flushTLB__bore
);

  wire [63:0]  _LogPerfHelper_timer;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire         _LogPerfHelper_logEnable;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire [120:0] _mdTLB_io_tlbmd_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire [120:0] _mdTLB_io_tlbmd_1;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire [120:0] _mdTLB_io_tlbmd_2;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire [120:0] _mdTLB_io_tlbmd_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire         _mdTLB_io_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
  wire         _tlbExec_io_in_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_out_valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [31:0]  _tlbExec_io_out_bits_addr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [86:0]  _tlbExec_io_out_bits_user;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_mdWrite_wen;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [3:0]   _tlbExec_io_mdWrite_waymask;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire [120:0] _tlbExec_io_mdWrite_wdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_ipf;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  wire         _tlbExec_io_isFinish;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
  reg  [120:0] r_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  reg  [120:0] r_1;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  reg  [120:0] r_2;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  reg  [120:0] r_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
  wire         vmEnable = satp__bore[63:60] == 4'h8 & io_csrMMU_privilegeMode != 2'h3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:107:{31,49,57,85}
  reg          valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:110:24
  reg  [38:0]  tlbExec_io_in_bits_raddr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
  reg  [86:0]  tlbExec_io_in_bits_ruser;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
  wire         io_in_req_ready_0 = vmEnable ? _tlbExec_io_in_ready : io_out_req_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :107:57, :115:16, :128:19, :132:21
  wire [31:0]  io_out_req_bits_addr_0 =
    vmEnable ? _tlbExec_io_out_bits_addr : io_in_req_bits_addr[31:0];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :107:57, :128:19, :133:{26,48}, :141:23
  wire         _GEN = _tlbExec_io_ipf & vmEnable;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :107:57, :157:26
  wire         io_out_req_valid_0 =
    ~_GEN & (vmEnable ? _tlbExec_io_out_valid : io_in_req_valid);	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :107:57, :128:19, :131:22, :141:23, :157:{26,39}, :159:24
  wire         _GEN_0 = _GEN & io_cacheEmpty;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:157:26, :162:38
  wire         io_in_resp_valid_0 = _GEN_0 | io_out_resp_valid;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:143:15, :162:{38,56}, :163:24
  wire [63:0]  io_in_resp_bits_rdata_0 = _GEN_0 ? 64'h0 : io_out_resp_bits_rdata;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14, :79:7, :85:23, :143:15, :162:{38,56}, :164:29
  wire         io_ipf_0 = _GEN_0 & _tlbExec_io_ipf;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :99:10, :162:{38,56}, :167:14
  `ifndef SYNTHESIS	// src/main/scala/utils/Debug.scala:49:26
    always @(posedge clock) begin	// src/main/scala/utils/Debug.scala:49:26
      if ((`PRINTF_COND_) & _LogPerfHelper_logEnable & ~reset) begin	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] EmbeddedTLB: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002,
                "InReq(%d, %d) InResp(%d, %d) OutReq(%d, %d) OutResp(%d, %d) vmEnable:%d mode:%d\n",
                io_in_req_valid, io_in_req_ready_0, io_in_resp_valid_0, io_in_resp_ready,
                io_out_req_valid_0, io_out_req_ready, io_out_resp_valid, io_in_resp_ready,
                vmEnable, io_csrMMU_privilegeMode);	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:107:57, :115:16, :128:19, :132:21, :143:15, :157:39, :159:24, :162:56, :163:24, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] EmbeddedTLB: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002,
                "InReq: addr:%x cmd:%d wdata:%x OutReq: addr:%x cmd:%x wdata:%x\n",
                io_in_req_bits_addr, 4'h0, 64'h0, io_out_req_bits_addr_0, 4'h0, 64'h0);	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:37:14, :79:7, :85:23, :128:19, :133:26, :141:23, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] EmbeddedTLB: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "OutResp: rdata:%x cmd:%x Inresp: rdata:%x cmd:%x\n",
                io_out_resp_bits_rdata, io_out_resp_bits_cmd, io_in_resp_bits_rdata_0,
                _GEN_0 ? 4'h6 : io_out_resp_bits_cmd);	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:143:15, :162:{38,56}, :164:29, :165:27, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] EmbeddedTLB: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002,
                "satp:%x flush:%d cacheEmpty:%d instrPF:%d loadPF:%d storePF:%d \n",
                satp__bore, io_flush, io_cacheEmpty, io_ipf_0, 1'h0, 1'h0);	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :85:23, :99:10, :162:56, :167:14, src/main/scala/utils/Debug.scala:49:26, :50:15
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    automatic logic mdUpdate;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:112:22
    mdUpdate = io_in_req_valid & _tlbExec_io_in_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :112:22
    if (mdUpdate) begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:112:22
      r_0 <= _mdTLB_io_tlbmd_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      r_1 <= _mdTLB_io_tlbmd_1;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      r_2 <= _mdTLB_io_tlbmd_2;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      r_3 <= _mdTLB_io_tlbmd_3;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21, :94:29
      tlbExec_io_in_bits_raddr <= io_in_req_bits_addr;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
      tlbExec_io_in_bits_ruser <= io_in_req_bits_user;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    end
    if (reset)	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      valid <= 1'h0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :85:23, :110:24
    else	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      valid <= ~io_flush & (mdUpdate & vmEnable | ~_tlbExec_io_isFinish & valid);	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23, :107:57, :110:24, :111:{25,33}, :112:{22,37,50,58}, :113:{20,28}
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      automatic logic [31:0] _RANDOM[0:21];	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
        for (logic [4:0] i = 5'h0; i < 5'h16; i += 5'h1) begin
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
        tlbExec_io_in_bits_ruser =
          {_RANDOM[5'h12][31:27], _RANDOM[5'h13], _RANDOM[5'h14], _RANDOM[5'h15][17:0]};	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  EmbeddedTLBExec tlbExec (	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .clock                  (clock),
    .reset                  (reset),
    .io_in_ready            (_tlbExec_io_in_ready),
    .io_in_valid            (valid),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:110:24
    .io_in_bits_addr        (tlbExec_io_in_bits_raddr),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    .io_in_bits_user        (tlbExec_io_in_bits_ruser),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:116:28
    .io_out_ready
      (_GEN ? io_cacheEmpty & io_in_resp_ready : ~vmEnable | io_out_req_ready),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:107:57, :128:{8,19}, :129:26, :141:23, :157:{26,39}, :158:{28,45}
    .io_out_valid           (_tlbExec_io_out_valid),
    .io_out_bits_addr       (_tlbExec_io_out_bits_addr),
    .io_out_bits_user       (_tlbExec_io_out_bits_user),
    .io_md_0                (r_0),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_md_1                (r_1),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_md_2                (r_2),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_md_3                (r_3),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:94:29
    .io_mdWrite_wen         (_tlbExec_io_mdWrite_wen),
    .io_mdWrite_waymask     (_tlbExec_io_mdWrite_waymask),
    .io_mdWrite_wdata       (_tlbExec_io_mdWrite_wdata),
    .io_mdReady             (_mdTLB_io_ready),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
    .io_mem_req_ready       (io_mem_req_ready),
    .io_mem_req_valid       (io_mem_req_valid),
    .io_mem_req_bits_addr   (io_mem_req_bits_addr),
    .io_mem_req_bits_cmd    (io_mem_req_bits_cmd),
    .io_mem_req_bits_wdata  (io_mem_req_bits_wdata),
    .io_mem_resp_valid      (io_mem_resp_valid),
    .io_mem_resp_bits_cmd   (io_mem_resp_bits_cmd),
    .io_mem_resp_bits_rdata (io_mem_resp_bits_rdata),
    .io_flush               (io_flush),
    .io_satp                (satp__bore),
    .io_pf_privilegeMode    (io_csrMMU_privilegeMode),
    .io_ipf                 (_tlbExec_io_ipf),
    .io_isFinish            (_tlbExec_io_isFinish)
  );
  EmbeddedTLBMD mdTLB (	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:87:21
    .clock            (clock),
    .reset            (reset | flushTLB__bore),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:104:31
    .io_tlbmd_0       (_mdTLB_io_tlbmd_0),
    .io_tlbmd_1       (_mdTLB_io_tlbmd_1),
    .io_tlbmd_2       (_mdTLB_io_tlbmd_2),
    .io_tlbmd_3       (_mdTLB_io_tlbmd_3),
    .io_write_wen     (_tlbExec_io_mdWrite_wen),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .io_write_waymask (_tlbExec_io_mdWrite_waymask),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .io_write_wdata   (_tlbExec_io_mdWrite_wdata),	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:85:23
    .io_ready         (_mdTLB_io_ready)
  );
  LogPerfHelper LogPerfHelper (	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
    .timer     (_LogPerfHelper_timer),
    .logEnable (_LogPerfHelper_logEnable),
    .clean     (/* unused */),
    .dump      (/* unused */)
  );
  assign io_in_req_ready = io_in_req_ready_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :115:16, :128:19, :132:21
  assign io_in_resp_valid = io_in_resp_valid_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :143:15, :162:56, :163:24
  assign io_in_resp_bits_rdata = io_in_resp_bits_rdata_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :143:15, :162:56, :164:29
  assign io_in_resp_bits_user =
    _GEN_0 ? tlbExec_io_in_bits_ruser : io_out_resp_bits_user;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :116:28, :143:15, :162:{38,56}, :166:34
  assign io_out_req_valid = io_out_req_valid_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :128:19, :157:39, :159:24
  assign io_out_req_bits_addr = io_out_req_bits_addr_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :128:19, :133:26, :141:23
  assign io_out_req_bits_user =
    vmEnable ? _tlbExec_io_out_bits_user : io_in_req_bits_user;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :85:23, :107:57, :128:19, :138:32, :141:23
  assign io_out_resp_ready = io_in_resp_ready;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7
  assign io_ipf = io_ipf_0;	// src/main/scala/nutcore/mem/EmbeddedTLB.scala:79:7, :99:10, :162:56, :167:14
endmodule

