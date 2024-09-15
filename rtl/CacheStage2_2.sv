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

module CacheStage2_2(	// src/main/scala/nutcore/mem/Cache.scala:162:14
  input         clock,	// src/main/scala/nutcore/mem/Cache.scala:162:14
                reset,	// src/main/scala/nutcore/mem/Cache.scala:162:14
  output        io_in_ready,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_in_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [31:0] io_in_bits_req_addr,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [2:0]  io_in_bits_req_size,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [3:0]  io_in_bits_req_cmd,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [7:0]  io_in_bits_req_wmask,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [63:0] io_in_bits_req_wdata,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_out_ready,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output        io_out_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [31:0] io_out_bits_req_addr,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [2:0]  io_out_bits_req_size,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [3:0]  io_out_bits_req_cmd,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [7:0]  io_out_bits_req_wmask,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [63:0] io_out_bits_req_wdata,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [16:0] io_out_bits_metas_0_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output        io_out_bits_metas_0_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_metas_0_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [16:0] io_out_bits_metas_1_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output        io_out_bits_metas_1_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_metas_1_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [16:0] io_out_bits_metas_2_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output        io_out_bits_metas_2_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_metas_2_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [16:0] io_out_bits_metas_3_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output        io_out_bits_metas_3_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_metas_3_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [63:0] io_out_bits_datas_0_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_datas_1_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_datas_2_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_datas_3_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output        io_out_bits_hit,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [3:0]  io_out_bits_waymask,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output        io_out_bits_mmio,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_out_bits_isForwardData,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [63:0] io_out_bits_forwardData_data_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  output [3:0]  io_out_bits_forwardData_waymask,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [16:0] io_metaReadResp_0_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_metaReadResp_0_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_metaReadResp_0_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [16:0] io_metaReadResp_1_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_metaReadResp_1_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_metaReadResp_1_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [16:0] io_metaReadResp_2_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_metaReadResp_2_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_metaReadResp_2_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [16:0] io_metaReadResp_3_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_metaReadResp_3_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_metaReadResp_3_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [63:0] io_dataReadResp_0_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_dataReadResp_1_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_dataReadResp_2_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
                io_dataReadResp_3_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_metaWriteBus_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [8:0]  io_metaWriteBus_req_bits_setIdx,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [16:0] io_metaWriteBus_req_bits_data_tag,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_metaWriteBus_req_bits_data_dirty,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [3:0]  io_metaWriteBus_req_bits_waymask,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input         io_dataWriteBus_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [11:0] io_dataWriteBus_req_bits_setIdx,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [63:0] io_dataWriteBus_req_bits_data_data,	// src/main/scala/nutcore/mem/Cache.scala:171:14
  input  [3:0]  io_dataWriteBus_req_bits_waymask	// src/main/scala/nutcore/mem/Cache.scala:171:14
);

  wire        io_in_ready_0;	// src/main/scala/nutcore/mem/Cache.scala:228:31
  wire        io_out_bits_hit_0;	// src/main/scala/nutcore/mem/Cache.scala:211:34
  wire [63:0] _LogPerfHelper_2_timer;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire        _LogPerfHelper_2_logEnable;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire [63:0] _LogPerfHelper_1_timer;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire        _LogPerfHelper_1_logEnable;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire [63:0] _LogPerfHelper_timer;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire        _LogPerfHelper_logEnable;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire        isForwardMeta =
    io_in_valid & io_metaWriteBus_req_valid
    & io_metaWriteBus_req_bits_setIdx == io_in_bits_req_addr[14:6];	// src/main/scala/nutcore/mem/Cache.scala:77:45, :176:{64,99}
  reg         isForwardMetaReg;	// src/main/scala/nutcore/mem/Cache.scala:177:33
  wire        _GEN = io_in_ready_0 & io_in_valid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:228:31
  reg  [16:0] forwardMetaReg_data_tag;	// src/main/scala/nutcore/mem/Cache.scala:180:33
  reg         forwardMetaReg_data_dirty;	// src/main/scala/nutcore/mem/Cache.scala:180:33
  reg  [3:0]  forwardMetaReg_waymask;	// src/main/scala/nutcore/mem/Cache.scala:180:33
  wire        pickForwardMeta = isForwardMetaReg | isForwardMeta;	// src/main/scala/nutcore/mem/Cache.scala:176:64, :177:33, :183:42
  wire [16:0] forwardMeta_data_tag =
    isForwardMeta ? io_metaWriteBus_req_bits_data_tag : forwardMetaReg_data_tag;	// src/main/scala/nutcore/mem/Cache.scala:176:64, :180:33, :184:24
  wire        forwardMeta_data_dirty =
    isForwardMeta ? io_metaWriteBus_req_bits_data_dirty : forwardMetaReg_data_dirty;	// src/main/scala/nutcore/mem/Cache.scala:176:64, :180:33, :184:24
  wire [3:0]  forwardMeta_waymask =
    isForwardMeta ? io_metaWriteBus_req_bits_waymask : forwardMetaReg_waymask;	// src/main/scala/nutcore/mem/Cache.scala:176:64, :180:33, :184:24
  wire        _metaWay_0_T = pickForwardMeta & forwardMeta_waymask[0];	// src/main/scala/nutcore/mem/Cache.scala:183:42, :184:24, :185:61, :187:39
  wire [16:0] metaWay_0_tag = _metaWay_0_T ? forwardMeta_data_tag : io_metaReadResp_0_tag;	// src/main/scala/nutcore/mem/Cache.scala:184:24, :187:{22,39}
  wire        metaWay_0_valid = _metaWay_0_T | io_metaReadResp_0_valid;	// src/main/scala/nutcore/mem/Cache.scala:187:{22,39}
  wire        _metaWay_1_T = pickForwardMeta & forwardMeta_waymask[1];	// src/main/scala/nutcore/mem/Cache.scala:183:42, :184:24, :185:61, :187:39
  wire [16:0] metaWay_1_tag = _metaWay_1_T ? forwardMeta_data_tag : io_metaReadResp_1_tag;	// src/main/scala/nutcore/mem/Cache.scala:184:24, :187:{22,39}
  wire        metaWay_1_valid = _metaWay_1_T | io_metaReadResp_1_valid;	// src/main/scala/nutcore/mem/Cache.scala:187:{22,39}
  wire        _metaWay_2_T = pickForwardMeta & forwardMeta_waymask[2];	// src/main/scala/nutcore/mem/Cache.scala:183:42, :184:24, :185:61, :187:39
  wire [16:0] metaWay_2_tag = _metaWay_2_T ? forwardMeta_data_tag : io_metaReadResp_2_tag;	// src/main/scala/nutcore/mem/Cache.scala:184:24, :187:{22,39}
  wire        metaWay_2_valid = _metaWay_2_T | io_metaReadResp_2_valid;	// src/main/scala/nutcore/mem/Cache.scala:187:{22,39}
  wire        _metaWay_3_T = pickForwardMeta & forwardMeta_waymask[3];	// src/main/scala/nutcore/mem/Cache.scala:183:42, :184:24, :185:61, :187:39
  wire [16:0] metaWay_3_tag = _metaWay_3_T ? forwardMeta_data_tag : io_metaReadResp_3_tag;	// src/main/scala/nutcore/mem/Cache.scala:184:24, :187:{22,39}
  wire        metaWay_3_valid = _metaWay_3_T | io_metaReadResp_3_valid;	// src/main/scala/nutcore/mem/Cache.scala:187:{22,39}
  wire [3:0]  hitVec =
    {metaWay_3_valid & metaWay_3_tag == io_in_bits_req_addr[31:15] & io_in_valid,
     metaWay_2_valid & metaWay_2_tag == io_in_bits_req_addr[31:15] & io_in_valid,
     metaWay_1_valid & metaWay_1_tag == io_in_bits_req_addr[31:15] & io_in_valid,
     metaWay_0_valid & metaWay_0_tag == io_in_bits_req_addr[31:15] & io_in_valid};	// src/main/scala/nutcore/mem/Cache.scala:174:31, :187:22, :190:{59,73,90}
  reg  [63:0] victimWaymask_lfsr;	// src/main/scala/utils/LFSR64.scala:25:23
  wire [3:0]  waymask =
    io_out_bits_hit_0
      ? hitVec
      : (|{~metaWay_3_valid, ~metaWay_2_valid, ~metaWay_1_valid, ~metaWay_0_valid})
          ? (metaWay_3_valid
               ? {1'h0,
                  (|{~metaWay_3_valid, ~metaWay_2_valid})
                    ? 3'h4
                    : {1'h0,
                       (|{~metaWay_3_valid, ~metaWay_2_valid, ~metaWay_1_valid})
                         ? 2'h2
                         : 2'h1}}
               : 4'h8)
          : 4'h1 << victimWaymask_lfsr[1:0];	// src/main/scala/nutcore/mem/Cache.scala:162:14, :177:33, :187:22, :190:90, :191:{42,53}, :193:{45,56}, :194:34, :195:{33,45}, :196:{8,20}, :197:{8,20}, :200:{20,49}, :211:34, src/main/scala/utils/LFSR64.scala:25:23
  assign io_out_bits_hit_0 = io_in_valid & (|hitVec);	// src/main/scala/nutcore/mem/Cache.scala:190:90, :211:{34,44}
  wire        isForwardData =
    io_in_valid & io_dataWriteBus_req_valid
    & io_dataWriteBus_req_bits_setIdx == io_in_bits_req_addr[14:3];	// src/main/scala/nutcore/mem/Cache.scala:78:35, :216:35, :217:30
  reg         isForwardDataReg;	// src/main/scala/nutcore/mem/Cache.scala:219:33
  reg  [63:0] forwardDataReg_data_data;	// src/main/scala/nutcore/mem/Cache.scala:222:33
  reg  [3:0]  forwardDataReg_waymask;	// src/main/scala/nutcore/mem/Cache.scala:222:33
  assign io_in_ready_0 = ~io_in_valid | io_out_ready & io_in_valid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:179:23, :228:31
  `ifndef SYNTHESIS	// src/main/scala/utils/Debug.scala:49:26
    always @(posedge clock) begin	// src/main/scala/utils/Debug.scala:49:26
      automatic logic [2:0] _GEN_0 =
        {1'h0, {1'h0, waymask[0]} + {1'h0, waymask[1]}}
        + {1'h0, {1'h0, waymask[2]} + {1'h0, waymask[3]}};	// src/main/scala/nutcore/mem/Cache.scala:177:33, :200:20, :201:16
      if ((`PRINTF_COND_) & (|(_GEN_0[2:1])) & _LogPerfHelper_logEnable & ~reset) begin	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/nutcore/mem/Cache.scala:201:{16,26}, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaWay %x metat %x reqt %x\n", metaWay_0_valid,
                metaWay_0_tag, io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, :187:22, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaWay %x metat %x reqt %x\n", metaWay_1_valid,
                metaWay_1_tag, io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, :187:22, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaWay %x metat %x reqt %x\n", metaWay_2_valid,
                metaWay_2_tag, io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, :187:22, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaWay %x metat %x reqt %x\n", metaWay_3_valid,
                metaWay_3_tag, io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, :187:22, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaReadResp %x metat %x reqt %x\n",
                io_metaReadResp_0_valid, io_metaReadResp_0_tag,
                io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaReadResp %x metat %x reqt %x\n",
                io_metaReadResp_1_valid, io_metaReadResp_1_tag,
                io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaReadResp %x metat %x reqt %x\n",
                io_metaReadResp_2_valid, io_metaReadResp_2_tag,
                io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] metaReadResp %x metat %x reqt %x\n",
                io_metaReadResp_3_valid, io_metaReadResp_3_tag,
                io_in_bits_req_addr[31:15]);	// src/main/scala/nutcore/mem/Cache.scala:174:31, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002,
                "[ERROR] forwardMetaReg isForwardMetaReg %x %x metat %x wm %b\n",
                isForwardMetaReg, 1'h1, forwardMetaReg_data_tag, forwardMetaReg_waymask);	// src/main/scala/nutcore/mem/Cache.scala:171:14, :177:33, :180:33, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] forwardMeta isForwardMeta %x %x metat %x wm %b\n",
                isForwardMeta, 1'h1, io_metaWriteBus_req_bits_data_tag,
                io_metaWriteBus_req_bits_waymask);	// src/main/scala/nutcore/mem/Cache.scala:171:14, :176:64, src/main/scala/utils/Debug.scala:49:26, :50:15
      end
      if ((`PRINTF_COND_) & (|(_GEN_0[2:1])) & _LogPerfHelper_1_logEnable & ~reset) begin	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/nutcore/mem/Cache.scala:201:{16,26}, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_1_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] hit %b wmask %b hitvec %b\n", io_out_bits_hit_0,
                forwardMeta_waymask, hitVec);	// src/main/scala/nutcore/mem/Cache.scala:184:24, :190:90, :211:34, src/main/scala/utils/Debug.scala:49:26, :50:15
      end
      if (~reset & io_in_valid & (|(_GEN_0[2:1]))) begin	// src/main/scala/nutcore/mem/Cache.scala:201:{16,26}, :208:9, src/main/scala/utils/Debug.scala:49:26
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/nutcore/mem/Cache.scala:208:9
          $error("Assertion failed\n    at Cache.scala:208 assert(!(io.in.valid && PopCount(waymask) > 1.U))\n");	// src/main/scala/nutcore/mem/Cache.scala:208:9
        if (`STOP_COND_)	// src/main/scala/nutcore/mem/Cache.scala:208:9
          $fatal;	// src/main/scala/nutcore/mem/Cache.scala:208:9
      end
      if ((`PRINTF_COND_) & _LogPerfHelper_2_logEnable & ~reset) begin	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_2_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[isFD:%d isFDreg:%d inFire:%d invalid:%d \n",
                isForwardData, isForwardDataReg, _GEN, io_in_valid);	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:216:35, :219:33, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] CacheStage2_2: ", _LogPerfHelper_2_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[isFM:%d isFMreg:%d metawreq:%x widx:%x ridx:%x \n",
                isForwardMeta, isForwardMetaReg, io_metaWriteBus_req_valid,
                io_metaWriteBus_req_bits_setIdx, io_in_bits_req_addr[14:6]);	// src/main/scala/nutcore/mem/Cache.scala:77:45, :176:64, :177:33, src/main/scala/utils/Debug.scala:49:26, :50:15
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin	// src/main/scala/nutcore/mem/Cache.scala:162:14
    if (reset) begin	// src/main/scala/nutcore/mem/Cache.scala:162:14
      isForwardMetaReg <= 1'h0;	// src/main/scala/nutcore/mem/Cache.scala:177:33
      victimWaymask_lfsr <= 64'h1234567887654321;	// src/main/scala/utils/LFSR64.scala:25:23
      isForwardDataReg <= 1'h0;	// src/main/scala/nutcore/mem/Cache.scala:177:33, :219:33
    end
    else begin	// src/main/scala/nutcore/mem/Cache.scala:162:14
      automatic logic _GEN_1 = _GEN | ~io_in_valid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:179:{20,23}
      isForwardMetaReg <= ~_GEN_1 & (isForwardMeta | isForwardMetaReg);	// src/main/scala/nutcore/mem/Cache.scala:176:64, :177:33, :178:{24,43}, :179:{20,37,56}
      if (victimWaymask_lfsr == 64'h0)	// src/main/scala/utils/LFSR64.scala:25:23, :28:24
        victimWaymask_lfsr <= 64'h1;	// src/main/scala/utils/LFSR64.scala:25:23, :28:18
      else	// src/main/scala/utils/LFSR64.scala:28:24
        victimWaymask_lfsr <=
          {victimWaymask_lfsr[0] ^ victimWaymask_lfsr[1] ^ victimWaymask_lfsr[3]
             ^ victimWaymask_lfsr[4],
           victimWaymask_lfsr[63:1]};	// src/main/scala/utils/LFSR64.scala:25:23, :26:{19,29,39,43,49}, :28:{41,51}
      isForwardDataReg <= ~_GEN_1 & (isForwardData | isForwardDataReg);	// src/main/scala/nutcore/mem/Cache.scala:178:24, :179:{20,37,56}, :216:35, :219:33, :220:{24,43}, :221:{37,56}
    end
    if (isForwardMeta) begin	// src/main/scala/nutcore/mem/Cache.scala:176:64
      forwardMetaReg_data_tag <= io_metaWriteBus_req_bits_data_tag;	// src/main/scala/nutcore/mem/Cache.scala:180:33
      forwardMetaReg_data_dirty <= io_metaWriteBus_req_bits_data_dirty;	// src/main/scala/nutcore/mem/Cache.scala:180:33
      forwardMetaReg_waymask <= io_metaWriteBus_req_bits_waymask;	// src/main/scala/nutcore/mem/Cache.scala:180:33
    end
    if (isForwardData) begin	// src/main/scala/nutcore/mem/Cache.scala:216:35
      forwardDataReg_data_data <= io_dataWriteBus_req_bits_data_data;	// src/main/scala/nutcore/mem/Cache.scala:222:33
      forwardDataReg_waymask <= io_dataWriteBus_req_bits_waymask;	// src/main/scala/nutcore/mem/Cache.scala:222:33
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/nutcore/mem/Cache.scala:162:14
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:162:14
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:162:14
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/nutcore/mem/Cache.scala:162:14
      automatic logic [31:0] _RANDOM[0:5];	// src/main/scala/nutcore/mem/Cache.scala:162:14
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/Cache.scala:162:14
        `INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/Cache.scala:162:14
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/nutcore/mem/Cache.scala:162:14
        for (logic [2:0] i = 3'h0; i < 3'h6; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/nutcore/mem/Cache.scala:162:14
        end	// src/main/scala/nutcore/mem/Cache.scala:162:14
        isForwardMetaReg = _RANDOM[3'h0][0];	// src/main/scala/nutcore/mem/Cache.scala:162:14, :177:33
        forwardMetaReg_data_tag = _RANDOM[3'h0][26:10];	// src/main/scala/nutcore/mem/Cache.scala:162:14, :177:33, :180:33
        forwardMetaReg_data_dirty = _RANDOM[3'h0][28];	// src/main/scala/nutcore/mem/Cache.scala:162:14, :177:33, :180:33
        forwardMetaReg_waymask = {_RANDOM[3'h0][31:29], _RANDOM[3'h1][0]};	// src/main/scala/nutcore/mem/Cache.scala:162:14, :177:33, :180:33
        victimWaymask_lfsr = {_RANDOM[3'h1][31:1], _RANDOM[3'h2], _RANDOM[3'h3][0]};	// src/main/scala/nutcore/mem/Cache.scala:162:14, :180:33, src/main/scala/utils/LFSR64.scala:25:23
        isForwardDataReg = _RANDOM[3'h3][1];	// src/main/scala/nutcore/mem/Cache.scala:162:14, :219:33, src/main/scala/utils/LFSR64.scala:25:23
        forwardDataReg_data_data =
          {_RANDOM[3'h3][31:14], _RANDOM[3'h4], _RANDOM[3'h5][13:0]};	// src/main/scala/nutcore/mem/Cache.scala:162:14, :222:33, src/main/scala/utils/LFSR64.scala:25:23
        forwardDataReg_waymask = _RANDOM[3'h5][17:14];	// src/main/scala/nutcore/mem/Cache.scala:162:14, :222:33
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:162:14
      `FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:162:14
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  LogPerfHelper LogPerfHelper (	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
    .timer     (_LogPerfHelper_timer),
    .logEnable (_LogPerfHelper_logEnable),
    .clean     (/* unused */),
    .dump      (/* unused */)
  );
  LogPerfHelper LogPerfHelper_1 (	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
    .timer     (_LogPerfHelper_1_timer),
    .logEnable (_LogPerfHelper_1_logEnable),
    .clean     (/* unused */),
    .dump      (/* unused */)
  );
  LogPerfHelper LogPerfHelper_2 (	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
    .timer     (_LogPerfHelper_2_timer),
    .logEnable (_LogPerfHelper_2_logEnable),
    .clean     (/* unused */),
    .dump      (/* unused */)
  );
  assign io_in_ready = io_in_ready_0;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :228:31
  assign io_out_valid = io_in_valid;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_req_addr = io_in_bits_req_addr;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_req_size = io_in_bits_req_size;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_req_cmd = io_in_bits_req_cmd;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_req_wmask = io_in_bits_req_wmask;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_req_wdata = io_in_bits_req_wdata;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_metas_0_tag = metaWay_0_tag;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_0_valid = metaWay_0_valid;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_0_dirty =
    _metaWay_0_T ? forwardMeta_data_dirty : io_metaReadResp_0_dirty;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :184:24, :187:{22,39}
  assign io_out_bits_metas_1_tag = metaWay_1_tag;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_1_valid = metaWay_1_valid;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_1_dirty =
    _metaWay_1_T ? forwardMeta_data_dirty : io_metaReadResp_1_dirty;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :184:24, :187:{22,39}
  assign io_out_bits_metas_2_tag = metaWay_2_tag;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_2_valid = metaWay_2_valid;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_2_dirty =
    _metaWay_2_T ? forwardMeta_data_dirty : io_metaReadResp_2_dirty;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :184:24, :187:{22,39}
  assign io_out_bits_metas_3_tag = metaWay_3_tag;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_3_valid = metaWay_3_valid;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :187:22
  assign io_out_bits_metas_3_dirty =
    _metaWay_3_T ? forwardMeta_data_dirty : io_metaReadResp_3_dirty;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :184:24, :187:{22,39}
  assign io_out_bits_datas_0_data = io_dataReadResp_0_data;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_datas_1_data = io_dataReadResp_1_data;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_datas_2_data = io_dataReadResp_2_data;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_datas_3_data = io_dataReadResp_3_data;	// src/main/scala/nutcore/mem/Cache.scala:162:14
  assign io_out_bits_hit = io_out_bits_hit_0;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :211:34
  assign io_out_bits_waymask = waymask;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :200:20
  assign io_out_bits_mmio =
    {io_in_bits_req_addr[31:30], ~(io_in_bits_req_addr[29:28])} == 4'h0
    | {io_in_bits_req_addr[31], ~(io_in_bits_req_addr[30])} == 2'h0;	// src/main/scala/nutcore/NutCore.scala:86:{11,24,44}, :87:15, src/main/scala/nutcore/mem/Cache.scala:162:14, :191:42, :194:34
  assign io_out_bits_isForwardData = isForwardDataReg | isForwardData;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :216:35, :219:33, :223:49
  assign io_out_bits_forwardData_data_data =
    isForwardData ? io_dataWriteBus_req_bits_data_data : forwardDataReg_data_data;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :216:35, :222:33, :224:33
  assign io_out_bits_forwardData_waymask =
    isForwardData ? io_dataWriteBus_req_bits_waymask : forwardDataReg_waymask;	// src/main/scala/nutcore/mem/Cache.scala:162:14, :216:35, :222:33, :224:33
endmodule

