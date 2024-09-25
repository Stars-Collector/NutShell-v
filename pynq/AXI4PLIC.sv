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

module AXI4PLIC(	// src/main/scala/device/AXI4PLIC.scala:30:7
  input         clock,	// src/main/scala/device/AXI4PLIC.scala:30:7
                reset,	// src/main/scala/device/AXI4PLIC.scala:30:7
  output        io_in_awready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_awvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [31:0] io_in_awaddr,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_wready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_wvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [63:0] io_in_wdata,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [7:0]  io_in_wstrb,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_bready,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_bvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
                io_in_arready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_arvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [31:0] io_in_araddr,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_rready,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_rvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  output [63:0] io_in_rdata,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [2:0]  io_extra_intrVec,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_extra_meip_0,	// src/main/scala/device/AXI4Slave.scala:28:14
                io_extra_meip_0__bore
);

  reg         r_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  wire        io_in_arready_0 = io_in_rready | ~r_busy;	// src/main/scala/device/AXI4Slave.scala:71:{29,32}, src/main/scala/utils/StopWatch.scala:24:20
  reg         ren_REG;	// src/main/scala/device/AXI4Slave.scala:73:17
  reg         io_in_rvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  reg         w_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  wire        io_in_wready_0 = io_in_awvalid | w_busy;	// src/main/scala/device/AXI4Slave.scala:95:30, src/main/scala/utils/StopWatch.scala:24:20
  reg         io_in_bvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  reg  [31:0] priority_0;	// src/main/scala/device/AXI4PLIC.scala:37:39
  reg  [31:0] priority_1;	// src/main/scala/device/AXI4PLIC.scala:37:39
  reg  [31:0] priority_2;	// src/main/scala/device/AXI4PLIC.scala:37:39
  reg         pending_0_1;	// src/main/scala/device/AXI4PLIC.scala:43:46
  reg         pending_0_2;	// src/main/scala/device/AXI4PLIC.scala:43:46
  reg         pending_0_3;	// src/main/scala/device/AXI4PLIC.scala:43:46
  reg  [31:0] enable_0_0;	// src/main/scala/device/AXI4PLIC.scala:48:64
  reg  [31:0] threshold_0;	// src/main/scala/device/AXI4PLIC.scala:53:40
  reg         inHandle_1;	// src/main/scala/device/AXI4PLIC.scala:58:25
  reg         inHandle_2;	// src/main/scala/device/AXI4PLIC.scala:58:25
  reg         inHandle_3;	// src/main/scala/device/AXI4PLIC.scala:58:25
  reg  [31:0] claimCompletion_0;	// src/main/scala/device/AXI4PLIC.scala:64:46
  always @(posedge clock) begin	// src/main/scala/device/AXI4PLIC.scala:30:7
    automatic logic        _io_in_bvalid_T_1;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
    automatic logic [7:0]  _GEN = io_in_wstrb >> io_in_awaddr[2:0];	// src/main/scala/device/AXI4PLIC.scala:90:{31,39}
    automatic logic [31:0] _GEN_0;	// src/main/scala/device/AXI4PLIC.scala:90:45
    automatic logic        _GEN_1;	// src/main/scala/utils/RegMap.scala:32:32
    _io_in_bvalid_T_1 = io_in_wready_0 & io_in_wvalid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:95:30
    _GEN_0 = {{8{_GEN[3]}}, {8{_GEN[2]}}, {8{_GEN[1]}}, {8{_GEN[0]}}};	// src/main/scala/device/AXI4PLIC.scala:90:{31,45}, src/main/scala/utils/BitUtils.scala:27:{29,45}
    _GEN_1 = _io_in_bvalid_T_1 & io_in_awaddr[25:0] == 26'h200004;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4PLIC.scala:35:35, :68:44, src/main/scala/utils/RegMap.scala:32:{32,41}
    if (reset) begin	// src/main/scala/device/AXI4PLIC.scala:30:7
      r_busy <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      ren_REG <= 1'h0;	// src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/utils/StopWatch.scala:24:20
      io_in_rvalid_r <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      w_busy <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      io_in_bvalid_r <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      pending_0_1 <= 1'h0;	// src/main/scala/device/AXI4PLIC.scala:43:46, src/main/scala/utils/StopWatch.scala:24:20
      pending_0_2 <= 1'h0;	// src/main/scala/device/AXI4PLIC.scala:43:46, src/main/scala/utils/StopWatch.scala:24:20
      pending_0_3 <= 1'h0;	// src/main/scala/device/AXI4PLIC.scala:43:46, src/main/scala/utils/StopWatch.scala:24:20
      enable_0_0 <= 32'h0;	// src/main/scala/device/AXI4PLIC.scala:48:64
      inHandle_1 <= 1'h0;	// src/main/scala/device/AXI4PLIC.scala:58:25, src/main/scala/utils/StopWatch.scala:24:20
      inHandle_2 <= 1'h0;	// src/main/scala/device/AXI4PLIC.scala:58:25, src/main/scala/utils/StopWatch.scala:24:20
      inHandle_3 <= 1'h0;	// src/main/scala/device/AXI4PLIC.scala:58:25, src/main/scala/utils/StopWatch.scala:24:20
    end
    else begin	// src/main/scala/device/AXI4PLIC.scala:30:7
      automatic logic       _io_in_rvalid_T = io_in_arready_0 & io_in_arvalid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:71:29
      automatic logic       _claimCompletionMap_T;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
      automatic logic       _io_in_bvalid_T_2;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
      automatic logic       _claimCompletionMap_T_3;	// src/main/scala/device/AXI4PLIC.scala:68:23
      automatic logic [1:0] _GEN_2 = {2{_GEN[0]}};	// src/main/scala/device/AXI4PLIC.scala:90:{31,45}, src/main/scala/utils/BitUtils.scala:27:29
      automatic logic [1:0] _claimCompletion_0_T_69;	// src/main/scala/utils/BitUtils.scala:34:26
      _claimCompletionMap_T = io_in_rready & io_in_rvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20
      _io_in_bvalid_T_2 = io_in_bready & io_in_bvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20
      _claimCompletionMap_T_3 =
        _claimCompletionMap_T & io_in_araddr[25:0] == 26'h200004;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4PLIC.scala:35:35, :68:{23,44}
      _claimCompletion_0_T_69 =
        io_in_wdata[1:0] & _GEN_2 | claimCompletion_0[1:0] & ~_GEN_2;	// src/main/scala/device/AXI4PLIC.scala:64:46, :89:48, :90:45, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
      r_busy <= _io_in_rvalid_T | ~_claimCompletionMap_T & r_busy;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      ren_REG <= _io_in_rvalid_T;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:73:17
      io_in_rvalid_r <=
        ren_REG & (_io_in_rvalid_T | r_busy) | ~_claimCompletionMap_T & io_in_rvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:73:17, :74:{35,50}, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      w_busy <= ~w_busy & io_in_awvalid | ~_io_in_bvalid_T_2 & w_busy;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      io_in_bvalid_r <= _io_in_bvalid_T_1 | ~_io_in_bvalid_T_2 & io_in_bvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      pending_0_1 <= ~inHandle_1 & (io_extra_intrVec[0] | pending_0_1);	// src/main/scala/device/AXI4PLIC.scala:43:46, :58:25, :73:24, :75:{17,45}, :76:{25,53}
      pending_0_2 <= ~inHandle_2 & (io_extra_intrVec[1] | pending_0_2);	// src/main/scala/device/AXI4PLIC.scala:43:46, :58:25, :73:24, :75:{17,45}, :76:{25,53}
      pending_0_3 <= ~inHandle_3 & (io_extra_intrVec[2] | pending_0_3);	// src/main/scala/device/AXI4PLIC.scala:43:46, :58:25, :73:24, :75:{17,45}, :76:{25,53}
      if (_io_in_bvalid_T_1 & io_in_awaddr[25:0] == 26'h2000)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4PLIC.scala:35:35, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:32:{32,41}
        enable_0_0 <= io_in_wdata[31:0] & _GEN_0 | enable_0_0 & ~_GEN_0;	// src/main/scala/device/AXI4PLIC.scala:48:64, :89:48, :90:45, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
      inHandle_1 <=
        ~(_GEN_1 & _claimCompletion_0_T_69 == 2'h1)
        & (_claimCompletionMap_T_3 & claimCompletion_0[1:0] == 2'h1 | inHandle_1);	// <stdin>:20521:38, src/main/scala/device/AXI4PLIC.scala:58:25, :60:27, :64:46, :68:{23,57,71}, src/main/scala/utils/BitUtils.scala:34:26, src/main/scala/utils/RegMap.scala:32:{32,48}
      inHandle_2 <=
        ~(_GEN_1 & _claimCompletion_0_T_69 == 2'h2)
        & (_claimCompletionMap_T_3 & claimCompletion_0[1:0] == 2'h2 | inHandle_2);	// <stdin>:20521:38, src/main/scala/device/AXI4PLIC.scala:58:25, :60:27, :64:46, :68:{23,57,71}, src/main/scala/utils/BitUtils.scala:34:26, src/main/scala/utils/RegMap.scala:32:{32,48}
      inHandle_3 <=
        ~(_GEN_1 & (&_claimCompletion_0_T_69))
        & (_claimCompletionMap_T_3 & (&(claimCompletion_0[1:0])) | inHandle_3);	// <stdin>:20521:38, src/main/scala/device/AXI4PLIC.scala:58:25, :60:27, :64:46, :68:{23,57,71}, src/main/scala/utils/BitUtils.scala:34:26, src/main/scala/utils/RegMap.scala:32:{32,48}
    end
    if (_io_in_bvalid_T_1 & io_in_awaddr[25:0] == 26'h4)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4PLIC.scala:35:35, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:32:{32,41}
      priority_0 <= io_in_wdata[31:0] & _GEN_0 | priority_0 & ~_GEN_0;	// src/main/scala/device/AXI4PLIC.scala:37:39, :89:48, :90:45, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
    if (_io_in_bvalid_T_1 & io_in_awaddr[25:0] == 26'h8)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4PLIC.scala:35:35, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:32:{32,41}
      priority_1 <= io_in_wdata[31:0] & _GEN_0 | priority_1 & ~_GEN_0;	// src/main/scala/device/AXI4PLIC.scala:37:39, :89:48, :90:45, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
    if (_io_in_bvalid_T_1 & io_in_awaddr[25:0] == 26'hC)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4PLIC.scala:35:35, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:32:{32,41}
      priority_2 <= io_in_wdata[31:0] & _GEN_0 | priority_2 & ~_GEN_0;	// src/main/scala/device/AXI4PLIC.scala:37:39, :89:48, :90:45, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
    if (_io_in_bvalid_T_1 & io_in_awaddr[25:0] == 26'h200000)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4PLIC.scala:35:35, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:32:{32,41}
      threshold_0 <= io_in_wdata[31:0] & _GEN_0 | threshold_0 & ~_GEN_0;	// src/main/scala/device/AXI4PLIC.scala:53:40, :89:48, :90:45, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
    claimCompletion_0 <=
      _GEN_1
        ? 32'h0
        : {27'h0,
           ({pending_0_3, pending_0_2, pending_0_1} & enable_0_0[3:1]) == 3'h0
             ? 5'h0
             : pending_0_1 & enable_0_0[1]
                 ? 5'h1
                 : pending_0_2 & enable_0_0[2]
                     ? 5'h2
                     : pending_0_3 & enable_0_0[3] ? 5'h3 : 5'h1F};	// src/main/scala/chisel3/util/Mux.scala:50:70, src/main/scala/chisel3/util/OneHot.scala:48:45, src/main/scala/device/AXI4PLIC.scala:30:7, :43:46, :48:64, :64:46, :79:44, :81:31, :82:{7,13,23}, src/main/scala/utils/RegMap.scala:32:{32,48,52}
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/device/AXI4PLIC.scala:30:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4PLIC.scala:30:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4PLIC.scala:30:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/device/AXI4PLIC.scala:30:7
      automatic logic [31:0] _RANDOM[0:7];	// src/main/scala/device/AXI4PLIC.scala:30:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4PLIC.scala:30:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4PLIC.scala:30:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/device/AXI4PLIC.scala:30:7
        for (logic [3:0] i = 4'h0; i < 4'h8; i += 4'h1) begin
          _RANDOM[i[2:0]] = `RANDOM;	// src/main/scala/device/AXI4PLIC.scala:30:7
        end	// src/main/scala/device/AXI4PLIC.scala:30:7
        r_busy = _RANDOM[3'h0][0];	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/utils/StopWatch.scala:24:20
        ren_REG = _RANDOM[3'h0][1];	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/utils/StopWatch.scala:24:20
        io_in_rvalid_r = _RANDOM[3'h0][2];	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/utils/StopWatch.scala:24:20
        w_busy = _RANDOM[3'h0][3];	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/utils/StopWatch.scala:24:20
        io_in_bvalid_r = _RANDOM[3'h0][4];	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/utils/StopWatch.scala:24:20
        priority_0 = {_RANDOM[3'h0][31:5], _RANDOM[3'h1][4:0]};	// src/main/scala/device/AXI4PLIC.scala:30:7, :37:39, src/main/scala/utils/StopWatch.scala:24:20
        priority_1 = {_RANDOM[3'h1][31:5], _RANDOM[3'h2][4:0]};	// src/main/scala/device/AXI4PLIC.scala:30:7, :37:39
        priority_2 = {_RANDOM[3'h2][31:5], _RANDOM[3'h3][4:0]};	// src/main/scala/device/AXI4PLIC.scala:30:7, :37:39
        pending_0_1 = _RANDOM[3'h3][6];	// src/main/scala/device/AXI4PLIC.scala:30:7, :37:39, :43:46
        pending_0_2 = _RANDOM[3'h3][7];	// src/main/scala/device/AXI4PLIC.scala:30:7, :37:39, :43:46
        pending_0_3 = _RANDOM[3'h3][8];	// src/main/scala/device/AXI4PLIC.scala:30:7, :37:39, :43:46
        enable_0_0 = {_RANDOM[3'h4][31:5], _RANDOM[3'h5][4:0]};	// src/main/scala/device/AXI4PLIC.scala:30:7, :48:64
        threshold_0 = {_RANDOM[3'h5][31:5], _RANDOM[3'h6][4:0]};	// src/main/scala/device/AXI4PLIC.scala:30:7, :48:64, :53:40
        inHandle_1 = _RANDOM[3'h6][6];	// src/main/scala/device/AXI4PLIC.scala:30:7, :53:40, :58:25
        inHandle_2 = _RANDOM[3'h6][7];	// src/main/scala/device/AXI4PLIC.scala:30:7, :53:40, :58:25
        inHandle_3 = _RANDOM[3'h6][8];	// src/main/scala/device/AXI4PLIC.scala:30:7, :53:40, :58:25
        claimCompletion_0 = {_RANDOM[3'h6][31:9], _RANDOM[3'h7][8:0]};	// src/main/scala/device/AXI4PLIC.scala:30:7, :53:40, :64:46
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4PLIC.scala:30:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4PLIC.scala:30:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_awready = ~w_busy;	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_wready = io_in_wready_0;	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/device/AXI4Slave.scala:95:30
  assign io_in_bvalid = io_in_bvalid_r;	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_arready = io_in_arready_0;	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/device/AXI4Slave.scala:71:29
  assign io_in_rvalid = io_in_rvalid_r;	// src/main/scala/device/AXI4PLIC.scala:30:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_rdata =
    {2{(io_in_araddr[25:0] == 26'h2000 ? enable_0_0 : 32'h0)
         | (io_in_araddr[25:0] == 26'h8 ? priority_1 : 32'h0)
         | (io_in_araddr[25:0] == 26'h200004 ? claimCompletion_0 : 32'h0)
         | (io_in_araddr[25:0] == 26'hC ? priority_2 : 32'h0)
         | (io_in_araddr[25:0] == 26'h1000
              ? {28'h0, pending_0_3, pending_0_2, pending_0_1, 1'h0}
              : 32'h0) | (io_in_araddr[25:0] == 26'h4 ? priority_0 : 32'h0)
         | (io_in_araddr[25:0] == 26'h200000 ? threshold_0 : 32'h0)}};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/device/AXI4PLIC.scala:30:7, :35:35, :37:39, :43:46, :45:38, :48:64, :53:40, :64:46, :68:44, :93:25, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/StopWatch.scala:24:20
  assign io_extra_meip_0 = |claimCompletion_0;	// src/main/scala/device/AXI4PLIC.scala:30:7, :64:46, :95:87
  assign io_extra_meip_0__bore = |claimCompletion_0;	// src/main/scala/device/AXI4PLIC.scala:30:7, :64:46, :95:87
endmodule

