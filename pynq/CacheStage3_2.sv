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

module CacheStage3_2(	// src/main/scala/nutcore/mem/Cache.scala:235:14
  input         clock,	// src/main/scala/nutcore/mem/Cache.scala:235:14
                reset,	// src/main/scala/nutcore/mem/Cache.scala:235:14
  output        io_in_ready,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_in_valid,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [31:0] io_in_bits_req_addr,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [3:0]  io_in_bits_req_cmd,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [7:0]  io_in_bits_req_wmask,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [63:0] io_in_bits_req_wdata,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [16:0] io_in_bits_metas_0_tag,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_in_bits_metas_0_dirty,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [16:0] io_in_bits_metas_1_tag,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_in_bits_metas_1_dirty,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [16:0] io_in_bits_metas_2_tag,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_in_bits_metas_2_dirty,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [16:0] io_in_bits_metas_3_tag,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_in_bits_metas_3_dirty,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [63:0] io_in_bits_datas_0_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
                io_in_bits_datas_1_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
                io_in_bits_datas_2_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
                io_in_bits_datas_3_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_in_bits_hit,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [3:0]  io_in_bits_waymask,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_in_bits_mmio,	// src/main/scala/nutcore/mem/Cache.scala:252:14
                io_in_bits_isForwardData,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [63:0] io_in_bits_forwardData_data_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [3:0]  io_in_bits_forwardData_waymask,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_out_valid,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [3:0]  io_out_bits_cmd,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [63:0] io_out_bits_rdata,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_isFinish,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_dataReadBus_req_ready,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_dataReadBus_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [11:0] io_dataReadBus_req_bits_setIdx,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [63:0] io_dataReadBus_resp_data_0_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
                io_dataReadBus_resp_data_1_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
                io_dataReadBus_resp_data_2_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
                io_dataReadBus_resp_data_3_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_dataWriteBus_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [11:0] io_dataWriteBus_req_bits_setIdx,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [63:0] io_dataWriteBus_req_bits_data_data,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [3:0]  io_dataWriteBus_req_bits_waymask,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_metaWriteBus_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [8:0]  io_metaWriteBus_req_bits_setIdx,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [16:0] io_metaWriteBus_req_bits_data_tag,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_metaWriteBus_req_bits_data_dirty,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [3:0]  io_metaWriteBus_req_bits_waymask,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_mem_req_ready,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_mem_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [31:0] io_mem_req_bits_addr,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [3:0]  io_mem_req_bits_cmd,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output [63:0] io_mem_req_bits_wdata,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input         io_mem_resp_valid,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [3:0]  io_mem_resp_bits_cmd,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  input  [63:0] io_mem_resp_bits_rdata,	// src/main/scala/nutcore/mem/Cache.scala:252:14
  output        io_dataReadRespToL1	// src/main/scala/nutcore/mem/Cache.scala:252:14
);

  wire        mmio = io_in_valid & io_in_bits_mmio;	// src/main/scala/nutcore/mem/Cache.scala:259:26
  wire        hit = io_in_valid & io_in_bits_hit;	// src/main/scala/nutcore/mem/Cache.scala:260:25
  wire        miss = io_in_valid & ~io_in_bits_hit;	// src/main/scala/nutcore/mem/Cache.scala:261:{26,29}
  wire        probe = io_in_valid & io_in_bits_req_cmd == 4'h8;	// src/main/scala/bus/simplebus/SimpleBus.scala:79:23, src/main/scala/nutcore/mem/Cache.scala:235:14, :262:39
  wire        _io_out_valid_T_11 = io_in_bits_req_cmd == 4'h2;	// src/main/scala/bus/simplebus/SimpleBus.scala:76:27, src/main/scala/nutcore/mem/Cache.scala:235:14
  wire        hitReadBurst = hit & _io_out_valid_T_11;	// src/main/scala/bus/simplebus/SimpleBus.scala:76:27, src/main/scala/nutcore/mem/Cache.scala:260:25, :263:26
  wire        _meta_T_10 =
    io_in_bits_waymask[0] & io_in_bits_metas_0_dirty | io_in_bits_waymask[1]
    & io_in_bits_metas_1_dirty | io_in_bits_waymask[2] & io_in_bits_metas_2_dirty
    | io_in_bits_waymask[3] & io_in_bits_metas_3_dirty;	// src/main/scala/chisel3/util/Mux.scala:30:73, :32:36
  wire [16:0] metaHitWriteBus_x8_tag =
    (io_in_bits_waymask[0] ? io_in_bits_metas_0_tag : 17'h0)
    | (io_in_bits_waymask[1] ? io_in_bits_metas_1_tag : 17'h0)
    | (io_in_bits_waymask[2] ? io_in_bits_metas_2_tag : 17'h0)
    | (io_in_bits_waymask[3] ? io_in_bits_metas_3_tag : 17'h0);	// src/main/scala/chisel3/util/Mux.scala:30:73, :32:36
  wire [63:0] dataRead =
    io_in_bits_isForwardData & io_in_bits_waymask == io_in_bits_forwardData_waymask
      ? io_in_bits_forwardData_data_data
      : (io_in_bits_waymask[0] ? io_in_bits_datas_0_data : 64'h0)
        | (io_in_bits_waymask[1] ? io_in_bits_datas_1_data : 64'h0)
        | (io_in_bits_waymask[2] ? io_in_bits_datas_2_data : 64'h0)
        | (io_in_bits_waymask[3] ? io_in_bits_datas_3_data : 64'h0);	// src/main/scala/chisel3/util/Mux.scala:30:73, :32:36, src/main/scala/nutcore/mem/Cache.scala:252:14, :273:{49,71}, :275:21
  wire [63:0] _wordMask_T_19 =
    {{8{io_in_bits_req_wmask[7]}},
     {8{io_in_bits_req_wmask[6]}},
     {8{io_in_bits_req_wmask[5]}},
     {8{io_in_bits_req_wmask[4]}},
     {8{io_in_bits_req_wmask[3]}},
     {8{io_in_bits_req_wmask[2]}},
     {8{io_in_bits_req_wmask[1]}},
     {8{io_in_bits_req_wmask[0]}}};	// src/main/scala/utils/BitUtils.scala:27:{26,29,45}
  wire [63:0] wordMask = io_in_bits_req_cmd[0] ? _wordMask_T_19 : 64'h0;	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/nutcore/mem/Cache.scala:252:14, :276:21, src/main/scala/utils/BitUtils.scala:27:26
  reg  [2:0]  writeL2BeatCnt_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  wire        _dataHitWriteBus_x3_T = io_in_bits_req_cmd == 4'h3;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :279:32
  wire        _dataHitWriteBus_x3_T_1 = io_in_bits_req_cmd == 4'h7;	// src/main/scala/bus/simplebus/SimpleBus.scala:78:27, src/main/scala/nutcore/mem/Cache.scala:235:14
  wire        hitWrite = hit & io_in_bits_req_cmd[0];	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/nutcore/mem/Cache.scala:260:25, :283:22
  wire        metaHitWriteBus_x5 = hitWrite & ~_meta_T_10;	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/mem/Cache.scala:283:22, :289:{22,25}
  reg  [3:0]  state;	// src/main/scala/nutcore/mem/Cache.scala:294:22
  reg  [2:0]  readBeatCnt_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg  [2:0]  writeBeatCnt_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg  [1:0]  state2;	// src/main/scala/nutcore/mem/Cache.scala:304:23
  wire        _io_mem_req_valid_T_1 = state == 4'h3;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :306:39
  wire        _io_dataReadRespToL1_T_2 = state == 4'h8;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :306:66
  wire        _GEN = state2 == 2'h0;	// src/main/scala/nutcore/mem/Cache.scala:304:23, :306:92
  wire        io_dataReadBus_req_valid_0 =
    (_io_mem_req_valid_T_1 | _io_dataReadRespToL1_T_2) & _GEN;	// src/main/scala/nutcore/mem/Cache.scala:306:{39,57,66,81,92}
  reg  [63:0] dataWay_0_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
  reg  [63:0] dataWay_1_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
  reg  [63:0] dataWay_2_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
  reg  [63:0] dataWay_3_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
  wire [63:0] _dataHitWay_T_10 =
    (io_in_bits_waymask[0] ? dataWay_0_data : 64'h0)
    | (io_in_bits_waymask[1] ? dataWay_1_data : 64'h0)
    | (io_in_bits_waymask[2] ? dataWay_2_data : 64'h0)
    | (io_in_bits_waymask[3] ? dataWay_3_data : 64'h0);	// src/main/scala/chisel3/util/Mux.scala:30:73, :32:36, src/main/scala/nutcore/mem/Cache.scala:252:14, :308:26
  wire        _io_mem_req_valid_T = state == 4'h1;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :322:23
  wire [2:0]  cmd = _io_mem_req_valid_T ? 3'h2 : {&writeBeatCnt_value, 2'h3};	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:322:{16,23}, :323:{8,29}
  wire        _io_dataReadRespToL1_T_3 = state2 == 2'h2;	// src/main/scala/bus/simplebus/SimpleBus.scala:76:27, src/main/scala/nutcore/mem/Cache.scala:304:23, :329:89
  wire        io_mem_req_valid_0 =
    _io_mem_req_valid_T | _io_mem_req_valid_T_1 & _io_dataReadRespToL1_T_3;	// src/main/scala/nutcore/mem/Cache.scala:306:39, :322:23, :329:{48,78,89}
  reg         afterFirstRead;	// src/main/scala/nutcore/mem/Cache.scala:336:31
  reg         alreadyOutFire;	// src/main/scala/nutcore/mem/Cache.scala:337:33
  wire        _io_out_valid_T_8 = state == 4'h2;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :338:68
  wire        readingFirst = ~afterFirstRead & io_mem_resp_valid & _io_out_valid_T_8;	// src/main/scala/nutcore/mem/Cache.scala:336:31, :338:{22,58,68}
  reg  [63:0] inRdataRegDemand;	// src/main/scala/nutcore/mem/Cache.scala:339:35
  wire        io_cohResp_valid =
    ~(|state) & probe | _io_dataReadRespToL1_T_2 & _io_dataReadRespToL1_T_3;	// src/main/scala/nutcore/mem/Cache.scala:262:39, :294:22, :306:66, :329:89, :343:{31,43,53}, :344:46
  wire        _releaseLast_T_2 = _io_dataReadRespToL1_T_2 & io_cohResp_valid;	// src/main/scala/nutcore/mem/Cache.scala:306:66, :343:53, :346:49
  reg  [2:0]  releaseLast_c_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  wire        releaseLast = _releaseLast_T_2 & (&releaseLast_c_value);	// src/main/scala/chisel3/util/Counter.scala:61:40, :73:24, :117:24, :118:{16,23}, src/main/scala/nutcore/mem/Cache.scala:346:49
  wire        respToL1Fire = hitReadBurst & _io_dataReadRespToL1_T_3;	// src/main/scala/nutcore/mem/Cache.scala:263:26, :329:89, :350:51
  wire        _respToL1Last_T_5 =
    (~(|state) | _io_dataReadRespToL1_T_2 & _io_dataReadRespToL1_T_3) & hitReadBurst;	// src/main/scala/nutcore/mem/Cache.scala:263:26, :294:22, :306:66, :329:89, :343:31, :351:{48,71,96}
  reg  [2:0]  respToL1Last_c_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  wire        respToL1Last = _respToL1Last_T_5 & (&respToL1Last_c_value);	// src/main/scala/chisel3/util/Counter.scala:61:40, :73:24, :117:24, :118:{16,23}, src/main/scala/nutcore/mem/Cache.scala:351:96
  wire [63:0] _dataRefill_T =
    readingFirst & io_in_bits_req_cmd[0] ? _wordMask_T_19 : 64'h0;	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/nutcore/mem/Cache.scala:252:14, :276:21, :338:58, :402:67, src/main/scala/utils/BitUtils.scala:27:26
  wire [63:0] dataRefill =
    io_in_bits_req_wdata & _dataRefill_T | io_mem_resp_bits_rdata & ~_dataRefill_T;	// src/main/scala/nutcore/mem/Cache.scala:276:21, :402:67, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
  wire        dataRefillWriteBus_x9 = _io_out_valid_T_8 & io_mem_resp_valid;	// src/main/scala/nutcore/mem/Cache.scala:338:68, :404:39
  wire        _io_out_bits_cmd_T = io_mem_resp_bits_cmd == 4'h6;	// src/main/scala/bus/simplebus/SimpleBus.scala:91:24, src/main/scala/nutcore/mem/Cache.scala:235:14
  wire        metaRefillWriteBus_req_valid =
    _io_out_valid_T_8 & io_mem_resp_valid & _io_out_bits_cmd_T;	// src/main/scala/bus/simplebus/SimpleBus.scala:91:24, src/main/scala/nutcore/mem/Cache.scala:338:68, :412:59
  wire        _GEN_0 = _io_out_valid_T_8 & io_mem_resp_valid & _io_out_valid_T_11;	// src/main/scala/bus/simplebus/SimpleBus.scala:76:27, src/main/scala/nutcore/mem/Cache.scala:338:68, :422:57
  wire        _GEN_1 = hitReadBurst & _io_dataReadRespToL1_T_2;	// src/main/scala/nutcore/mem/Cache.scala:263:26, :306:66, :430:30
  wire        _io_isFinish_T_9 = state == 4'h7;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :446:48
  wire        io_out_valid_0 =
    io_in_valid
    & (io_in_bits_req_cmd[1]
         ? io_in_bits_req_cmd[0] & (hit | ~hit & _io_isFinish_T_9) | _io_out_valid_T_8
           & io_mem_resp_valid & _io_out_valid_T_11 | respToL1Fire & respToL1Last
           & _io_dataReadRespToL1_T_2
         : ~probe
           & (hit
              | (io_in_bits_req_cmd[0] | mmio
                   ? _io_isFinish_T_9
                   : afterFirstRead & ~alreadyOutFire)));	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, :75:22, :76:27, src/main/scala/chisel3/util/Counter.scala:117:24, :118:{16,23}, src/main/scala/nutcore/mem/Cache.scala:259:26, :260:25, :262:39, :306:66, :336:31, :337:33, :338:68, :350:51, :445:{31,37}, :446:{23,31,34,39,48,119,159,192}, :447:{8,28,45,60,107,110}
  `ifndef SYNTHESIS	// src/main/scala/nutcore/mem/Cache.scala:265:9
    always @(posedge clock) begin	// src/main/scala/nutcore/mem/Cache.scala:265:9
      if (~reset & mmio & hit) begin	// src/main/scala/nutcore/mem/Cache.scala:259:26, :260:25, :265:9
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/nutcore/mem/Cache.scala:265:9
          $error("Assertion failed: MMIO request should not hit in cache\n    at Cache.scala:265 assert(!(mmio && hit), \"MMIO request should not hit in cache\")\n");	// src/main/scala/nutcore/mem/Cache.scala:265:9
        if (`STOP_COND_)	// src/main/scala/nutcore/mem/Cache.scala:265:9
          $fatal;	// src/main/scala/nutcore/mem/Cache.scala:265:9
      end
      if (~reset & metaHitWriteBus_x5 & metaRefillWriteBus_req_valid) begin	// src/main/scala/nutcore/mem/Cache.scala:265:9, :289:22, :412:59, :461:9
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/nutcore/mem/Cache.scala:461:9
          $error("Assertion failed\n    at Cache.scala:461 assert(!(metaHitWriteBus.req.valid && metaRefillWriteBus.req.valid))\n");	// src/main/scala/nutcore/mem/Cache.scala:461:9
        if (`STOP_COND_)	// src/main/scala/nutcore/mem/Cache.scala:461:9
          $fatal;	// src/main/scala/nutcore/mem/Cache.scala:461:9
      end
      if (~reset & hitWrite & dataRefillWriteBus_x9) begin	// src/main/scala/nutcore/mem/Cache.scala:265:9, :283:22, :404:39, :462:9
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/nutcore/mem/Cache.scala:462:9
          $error("Assertion failed\n    at Cache.scala:462 assert(!(dataHitWriteBus.req.valid && dataRefillWriteBus.req.valid))\n");	// src/main/scala/nutcore/mem/Cache.scala:462:9
        if (`STOP_COND_)	// src/main/scala/nutcore/mem/Cache.scala:462:9
          $fatal;	// src/main/scala/nutcore/mem/Cache.scala:462:9
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin	// src/main/scala/nutcore/mem/Cache.scala:235:14
    if (reset) begin	// src/main/scala/nutcore/mem/Cache.scala:235:14
      writeL2BeatCnt_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      state <= 4'h0;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
      readBeatCnt_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      writeBeatCnt_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      state2 <= 2'h0;	// src/main/scala/nutcore/mem/Cache.scala:304:23
      afterFirstRead <= 1'h0;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:252:14, :297:18, :336:31
      alreadyOutFire <= 1'h0;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:252:14, :297:18, :337:33
      releaseLast_c_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      respToL1Last_c_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
    end
    else begin	// src/main/scala/nutcore/mem/Cache.scala:235:14
      automatic logic _GEN_2;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
      automatic logic _GEN_3;	// src/main/scala/nutcore/mem/Cache.scala:353:18
      automatic logic _GEN_4;	// src/main/scala/nutcore/mem/Cache.scala:353:18
      automatic logic _GEN_5;	// src/main/scala/nutcore/mem/Cache.scala:353:18
      automatic logic _GEN_6;	// src/main/scala/nutcore/mem/Cache.scala:353:18
      automatic logic _GEN_7;	// src/main/scala/nutcore/mem/Cache.scala:353:18
      automatic logic _GEN_8;	// src/main/scala/nutcore/mem/Cache.scala:336:31, :353:18, :385:31, :386:24
      automatic logic _GEN_9;	// src/main/scala/nutcore/mem/Cache.scala:336:31, :353:18
      automatic logic _GEN_10;	// src/main/scala/nutcore/mem/Cache.scala:353:18
      _GEN_2 = io_mem_req_ready & io_mem_req_valid_0;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:329:48
      _GEN_3 = state == 4'h5;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :353:18
      _GEN_4 = state == 4'h6;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :353:18
      _GEN_5 = state == 4'h8;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :353:18
      _GEN_6 = state == 4'h1;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :353:18
      _GEN_7 = state == 4'h2;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :353:18
      _GEN_8 = _GEN_7 & io_mem_resp_valid;	// src/main/scala/nutcore/mem/Cache.scala:336:31, :353:18, :385:31, :386:24
      _GEN_9 = _GEN_3 | _GEN_4 | _GEN_5 | _GEN_6;	// src/main/scala/nutcore/mem/Cache.scala:336:31, :353:18
      _GEN_10 = state == 4'h3;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :353:18
      if (~(|state) | _GEN_9
          | ~(_GEN_7 & io_mem_resp_valid & _dataHitWriteBus_x3_T)) begin	// src/main/scala/nutcore/mem/Cache.scala:279:{32,83}, :294:22, :336:31, :343:31, :353:18, :385:31, :388:{52,75}
        if (io_out_valid_0 & (_dataHitWriteBus_x3_T | _dataHitWriteBus_x3_T_1))	// src/main/scala/bus/simplebus/SimpleBus.scala:78:27, src/main/scala/nutcore/mem/Cache.scala:279:{20,32,60}, :445:31
          writeL2BeatCnt_value <= writeL2BeatCnt_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/nutcore/mem/Cache.scala:322:23
      end
      else	// src/main/scala/nutcore/mem/Cache.scala:279:83, :353:18
        writeL2BeatCnt_value <= 3'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
      if (|state) begin	// src/main/scala/nutcore/mem/Cache.scala:294:22, :343:31
        if (~(_GEN_3 | _GEN_4)) begin	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:353:18
          if (_GEN_5) begin	// src/main/scala/nutcore/mem/Cache.scala:353:18
            if (probe & io_cohResp_valid & releaseLast | respToL1Fire & respToL1Last)	// src/main/scala/chisel3/util/Counter.scala:117:24, :118:{16,23}, src/main/scala/nutcore/mem/Cache.scala:262:39, :343:53, :350:51, :376:{38,53,69}
              state <= 4'h0;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
            if (io_cohResp_valid | respToL1Fire)	// src/main/scala/nutcore/mem/Cache.scala:343:53, :350:51, :375:29
              readBeatCnt_value <= readBeatCnt_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/nutcore/mem/Cache.scala:322:23
          end
          else if (_GEN_6) begin	// src/main/scala/nutcore/mem/Cache.scala:353:18
            if (_GEN_2) begin	// src/main/scala/chisel3/util/Decoupled.scala:51:35
              state <= 4'h2;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
              readBeatCnt_value <= io_in_bits_req_addr[5:3];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:258:31
            end
          end
          else begin	// src/main/scala/nutcore/mem/Cache.scala:353:18
            if (_GEN_7) begin	// src/main/scala/nutcore/mem/Cache.scala:353:18
              if (io_mem_resp_valid & io_mem_resp_bits_cmd == 4'h6)	// src/main/scala/bus/simplebus/SimpleBus.scala:91:24, src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :385:31, :389:{44,52}
                state <= 4'h7;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
            end
            else if (_GEN_10) begin	// src/main/scala/nutcore/mem/Cache.scala:353:18
              if ((&{cmd[2], cmd[0]}) & _GEN_2)	// src/main/scala/bus/simplebus/SimpleBus.scala:65:14, :78:27, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:322:16, :395:43
                state <= 4'h4;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
            end
            else if (state == 4'h4) begin	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :353:18
              if (io_mem_resp_valid)	// src/main/scala/nutcore/mem/Cache.scala:252:14
                state <= 4'h1;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
            end
            else if (state == 4'h7 & (io_out_valid_0 | alreadyOutFire))	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22, :337:33, :353:18, :399:{55,74,82}, :445:31
              state <= 4'h0;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
            if (_GEN_8)	// src/main/scala/nutcore/mem/Cache.scala:336:31, :353:18, :385:31, :386:24
              readBeatCnt_value <= readBeatCnt_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/nutcore/mem/Cache.scala:322:23
          end
        end
      end
      else if (probe) begin	// src/main/scala/nutcore/mem/Cache.scala:262:39
        if (io_cohResp_valid) begin	// src/main/scala/nutcore/mem/Cache.scala:343:53
          state <= {hit, 3'h0};	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:260:25, :294:22, :360:23
          readBeatCnt_value <= io_in_bits_req_addr[5:3];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:258:31
        end
      end
      else if (hitReadBurst) begin	// src/main/scala/nutcore/mem/Cache.scala:263:26
        state <= 4'h8;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
        readBeatCnt_value <=
          (&(io_in_bits_req_addr[5:3])) ? 3'h0 : io_in_bits_req_addr[5:3] + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:258:31, :322:23, :365:{33,49,93}
      end
      else if (miss | mmio)	// src/main/scala/nutcore/mem/Cache.scala:259:26, :261:26, :366:26
        state <= mmio ? 4'h5 : {2'h0, _meta_T_10, 1'h1};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/mem/Cache.scala:235:14, :252:14, :254:28, :255:28, :259:26, :294:22, :304:23, :366:38, :367:{21,42}, :463:9
      if (~(|state) | _GEN_3 | _GEN_4 | _GEN_5 | _GEN_6 | _GEN_7
          | ~(_GEN_10 & _GEN_2)) begin	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:15, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:294:22, :343:31, :353:18, :394:30
      end
      else	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:353:18
        writeBeatCnt_value <= writeBeatCnt_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/nutcore/mem/Cache.scala:322:23
      if (_GEN) begin	// src/main/scala/nutcore/mem/Cache.scala:306:92
        if (io_dataReadBus_req_ready & io_dataReadBus_req_valid_0)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:306:81
          state2 <= 2'h1;	// src/main/scala/nutcore/mem/Cache.scala:304:23, :308:60
      end
      else if (state2 == 2'h1)	// src/main/scala/nutcore/mem/Cache.scala:304:23, :308:60, :311:19
        state2 <= 2'h2;	// src/main/scala/bus/simplebus/SimpleBus.scala:76:27, src/main/scala/nutcore/mem/Cache.scala:304:23
      else if (state2 == 2'h2 & (_GEN_2 | io_cohResp_valid | hitReadBurst))	// src/main/scala/bus/simplebus/SimpleBus.scala:76:27, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:263:26, :304:23, :311:19, :314:{63,96,105}, :343:53
        state2 <= 2'h0;	// src/main/scala/nutcore/mem/Cache.scala:304:23
      afterFirstRead <= (|state) & (~_GEN_9 & _GEN_8 | afterFirstRead);	// src/main/scala/nutcore/mem/Cache.scala:294:22, :336:31, :343:31, :353:18, :355:22, :385:31, :386:24
      alreadyOutFire <= (|state) & (io_out_valid_0 | alreadyOutFire);	// src/main/scala/nutcore/mem/Cache.scala:294:22, :337:33, :343:31, :353:18, :356:22, :445:31
      if (_releaseLast_T_2)	// src/main/scala/nutcore/mem/Cache.scala:346:49
        releaseLast_c_value <= releaseLast_c_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/nutcore/mem/Cache.scala:322:23
      if (_respToL1Last_T_5)	// src/main/scala/nutcore/mem/Cache.scala:351:96
        respToL1Last_c_value <= respToL1Last_c_value + 3'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/nutcore/mem/Cache.scala:322:23
    end
    if (state2 == 2'h1) begin	// src/main/scala/nutcore/mem/Cache.scala:304:23, :308:60
      dataWay_0_data <= io_dataReadBus_resp_data_0_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
      dataWay_1_data <= io_dataReadBus_resp_data_1_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
      dataWay_2_data <= io_dataReadBus_resp_data_2_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
      dataWay_3_data <= io_dataReadBus_resp_data_3_data;	// src/main/scala/nutcore/mem/Cache.scala:308:26
    end
    if (mmio ? state == 4'h6 : readingFirst)	// src/main/scala/nutcore/mem/Cache.scala:235:14, :259:26, :294:22, :338:58, :340:{39,52}
      inRdataRegDemand <= mmio ? 64'h0 : io_mem_resp_bits_rdata;	// src/main/scala/nutcore/mem/Cache.scala:252:14, :259:26, :339:{35,39}
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/nutcore/mem/Cache.scala:235:14
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:235:14
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:235:14
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/nutcore/mem/Cache.scala:235:14
      automatic logic [31:0] _RANDOM[0:10];	// src/main/scala/nutcore/mem/Cache.scala:235:14
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/Cache.scala:235:14
        `INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/mem/Cache.scala:235:14
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/nutcore/mem/Cache.scala:235:14
        for (logic [3:0] i = 4'h0; i < 4'hB; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/nutcore/mem/Cache.scala:235:14
        end	// src/main/scala/nutcore/mem/Cache.scala:235:14
        writeL2BeatCnt_value = _RANDOM[4'h0][2:0];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14
        state = _RANDOM[4'h0][6:3];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14, :294:22
        readBeatCnt_value = _RANDOM[4'h0][10:8];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14
        writeBeatCnt_value = _RANDOM[4'h0][13:11];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14
        state2 = _RANDOM[4'h0][15:14];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14, :304:23
        dataWay_0_data = {_RANDOM[4'h0][31:16], _RANDOM[4'h1], _RANDOM[4'h2][15:0]};	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14, :308:26
        dataWay_1_data = {_RANDOM[4'h2][31:16], _RANDOM[4'h3], _RANDOM[4'h4][15:0]};	// src/main/scala/nutcore/mem/Cache.scala:235:14, :308:26
        dataWay_2_data = {_RANDOM[4'h4][31:16], _RANDOM[4'h5], _RANDOM[4'h6][15:0]};	// src/main/scala/nutcore/mem/Cache.scala:235:14, :308:26
        dataWay_3_data = {_RANDOM[4'h6][31:16], _RANDOM[4'h7], _RANDOM[4'h8][15:0]};	// src/main/scala/nutcore/mem/Cache.scala:235:14, :308:26
        afterFirstRead = _RANDOM[4'h8][16];	// src/main/scala/nutcore/mem/Cache.scala:235:14, :308:26, :336:31
        alreadyOutFire = _RANDOM[4'h8][17];	// src/main/scala/nutcore/mem/Cache.scala:235:14, :308:26, :337:33
        inRdataRegDemand = {_RANDOM[4'h8][31:18], _RANDOM[4'h9], _RANDOM[4'hA][17:0]};	// src/main/scala/nutcore/mem/Cache.scala:235:14, :308:26, :339:35
        releaseLast_c_value = _RANDOM[4'hA][20:18];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14, :339:35
        respToL1Last_c_value = _RANDOM[4'hA][23:21];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14, :339:35
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:235:14
      `FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/mem/Cache.scala:235:14
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  Arbiter2_SRAMBundleAW_4 metaWriteArb (	// src/main/scala/nutcore/mem/Cache.scala:254:28
    .io_in_0_valid           (metaHitWriteBus_x5),	// src/main/scala/nutcore/mem/Cache.scala:289:22
    .io_in_0_bits_setIdx     (io_in_bits_req_addr[14:6]),	// src/main/scala/nutcore/mem/Cache.scala:77:45
    .io_in_0_bits_data_tag   (metaHitWriteBus_x8_tag),	// src/main/scala/chisel3/util/Mux.scala:30:73
    .io_in_0_bits_waymask    (io_in_bits_waymask),
    .io_in_1_valid           (metaRefillWriteBus_req_valid),	// src/main/scala/nutcore/mem/Cache.scala:412:59
    .io_in_1_bits_setIdx     (io_in_bits_req_addr[14:6]),	// src/main/scala/nutcore/mem/Cache.scala:77:45
    .io_in_1_bits_data_tag   (io_in_bits_req_addr[31:15]),	// src/main/scala/nutcore/mem/Cache.scala:258:31
    .io_in_1_bits_data_dirty (io_in_bits_req_cmd[0]),	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22
    .io_in_1_bits_waymask    (io_in_bits_waymask),
    .io_out_valid            (io_metaWriteBus_req_valid),
    .io_out_bits_setIdx      (io_metaWriteBus_req_bits_setIdx),
    .io_out_bits_data_tag    (io_metaWriteBus_req_bits_data_tag),
    .io_out_bits_data_dirty  (io_metaWriteBus_req_bits_data_dirty),
    .io_out_bits_waymask     (io_metaWriteBus_req_bits_waymask)
  );
  Arbiter2_SRAMBundleAW_5 dataWriteArb (	// src/main/scala/nutcore/mem/Cache.scala:255:28
    .io_in_0_valid          (hitWrite),	// src/main/scala/nutcore/mem/Cache.scala:283:22
    .io_in_0_bits_setIdx
      ({io_in_bits_req_addr[14:6],
        _dataHitWriteBus_x3_T | _dataHitWriteBus_x3_T_1
          ? writeL2BeatCnt_value
          : io_in_bits_req_addr[5:3]}),	// src/main/scala/bus/simplebus/SimpleBus.scala:78:27, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:258:31, :279:32, :286:{35,51,88}
    .io_in_0_bits_data_data (io_in_bits_req_wdata & wordMask | dataRead & ~wordMask),	// src/main/scala/nutcore/mem/Cache.scala:275:21, :276:21, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
    .io_in_0_bits_waymask   (io_in_bits_waymask),
    .io_in_1_valid          (dataRefillWriteBus_x9),	// src/main/scala/nutcore/mem/Cache.scala:404:39
    .io_in_1_bits_setIdx    ({io_in_bits_req_addr[14:6], readBeatCnt_value}),	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:258:31, :404:72
    .io_in_1_bits_data_data (dataRefill),	// src/main/scala/utils/BitUtils.scala:34:26
    .io_in_1_bits_waymask   (io_in_bits_waymask),
    .io_out_valid           (io_dataWriteBus_req_valid),
    .io_out_bits_setIdx     (io_dataWriteBus_req_bits_setIdx),
    .io_out_bits_data_data  (io_dataWriteBus_req_bits_data_data),
    .io_out_bits_waymask    (io_dataWriteBus_req_bits_waymask)
  );
  assign io_in_ready = ~(|state) & ~hitReadBurst & ~miss & ~probe;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :261:26, :262:39, :263:26, :294:22, :343:31, :458:{55,73,79,82}
  assign io_out_valid = io_out_valid_0;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :445:31
  assign io_out_bits_cmd =
    _GEN_0
      ? {1'h0, _io_out_bits_cmd_T, 2'h2}
      : _GEN_1 ? {1'h0, respToL1Last, 2'h2} : io_in_bits_req_cmd;	// src/main/scala/bus/simplebus/SimpleBus.scala:76:27, :91:24, src/main/scala/chisel3/util/Counter.scala:117:24, :118:{16,23}, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:235:14, :252:14, :297:18, :422:{57,79}, :425:23, :426:75, :430:{30,54}, :433:23, :436:23
  assign io_out_bits_rdata =
    _GEN_0
      ? dataRefill
      : _dataHitWriteBus_x3_T_1 | _dataHitWriteBus_x3_T
          ? (hit ? dataRead : inRdataRegDemand)
          : _GEN_1 ? _dataHitWay_T_10 : hit ? dataRead : inRdataRegDemand;	// src/main/scala/bus/simplebus/SimpleBus.scala:78:27, src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/mem/Cache.scala:235:14, :260:25, :275:21, :279:32, :339:35, :422:{57,79}, :424:25, :426:{35,75}, :428:{25,31}, :430:{30,54}, :432:25, :435:{25,31}, src/main/scala/utils/BitUtils.scala:34:26
  assign io_isFinish =
    probe
      ? io_cohResp_valid & (miss ? ~(|state) : _io_dataReadRespToL1_T_2 & releaseLast)
      : hit | io_in_bits_req_cmd[0]
          ? io_out_valid_0
          : _io_isFinish_T_9 & (io_out_valid_0 | alreadyOutFire);	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/chisel3/util/Counter.scala:117:24, :118:{16,23}, src/main/scala/nutcore/mem/Cache.scala:235:14, :260:25, :261:26, :262:39, :294:22, :306:66, :337:33, :343:{31,53}, :445:31, :446:48, :454:{21,45,51,98}, :455:{8,13,68,84}
  assign io_dataReadBus_req_valid = io_dataReadBus_req_valid_0;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :306:81
  assign io_dataReadBus_req_bits_setIdx =
    {io_in_bits_req_addr[14:6],
     _io_dataReadRespToL1_T_2 ? readBeatCnt_value : writeBeatCnt_value};	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/mem/Cache.scala:235:14, :258:31, :306:66, :307:{17,33}
  assign io_mem_req_valid = io_mem_req_valid_0;	// src/main/scala/nutcore/mem/Cache.scala:235:14, :329:48
  assign io_mem_req_bits_addr =
    _io_mem_req_valid_T
      ? {io_in_bits_req_addr[31:3], 3'h0}
      : {metaHitWriteBus_x8_tag, io_in_bits_req_addr[14:6], 6'h0};	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/mem/Cache.scala:235:14, :258:31, :318:{35,44}, :321:18, :322:23, :324:35
  assign io_mem_req_bits_cmd = {1'h0, cmd};	// src/main/scala/bus/simplebus/SimpleBus.scala:65:14, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:235:14, :252:14, :297:18, :322:16
  assign io_mem_req_bits_wdata = _dataHitWay_T_10;	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/mem/Cache.scala:235:14
  assign io_dataReadRespToL1 =
    hitReadBurst & (~(|state) | _io_dataReadRespToL1_T_2 & _io_dataReadRespToL1_T_3);	// src/main/scala/nutcore/mem/Cache.scala:235:14, :263:26, :294:22, :306:66, :329:89, :343:31, :459:{39,76,99}
endmodule

