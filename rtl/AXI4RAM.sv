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

module AXI4RAM(	// src/main/scala/device/AXI4RAM.scala:26:7
  input         clock,	// src/main/scala/device/AXI4RAM.scala:26:7
                reset,	// src/main/scala/device/AXI4RAM.scala:26:7
  output        io_in_awready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_awvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [31:0] io_in_awaddr,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_wready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_wvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [63:0] io_in_wdata,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_wlast,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_bvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_arvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [31:0] io_in_araddr,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [7:0]  io_in_arlen,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_rvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  output [63:0] io_in_rdata,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_rlast	// src/main/scala/device/AXI4Slave.scala:28:14
);

  wire        io_in_wready_0;	// src/main/scala/device/AXI4Slave.scala:95:30
  reg         w_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  reg         io_in_rvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  wire [63:0] _rdata_mem_read_data_0;	// difftest/src/main/scala/common/Mem.scala:322:36
  reg  [7:0]  c_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg  [7:0]  readBeatCnt;	// src/main/scala/chisel3/util/Counter.scala:61:40
  reg  [7:0]  len_r;	// src/main/scala/utils/Hold.scala:23:65
  wire [7:0]  len = io_in_arvalid ? io_in_arlen : len_r;	// src/main/scala/utils/Hold.scala:23:{48,65}
  reg  [1:0]  burst_r;	// src/main/scala/utils/Hold.scala:23:65
  wire [31:0] _GEN = {21'h1FFFFF, ~io_in_arlen, 3'h7} & io_in_araddr;	// src/main/scala/device/AXI4Slave.scala:45:{40,42}
  reg  [38:0] raddr_r;	// src/main/scala/utils/Hold.scala:23:65
  wire        io_in_rlast_0 = c_value == len;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4Slave.scala:47:36, src/main/scala/utils/Hold.scala:23:48
  `ifndef SYNTHESIS	// src/main/scala/device/AXI4Slave.scala:59:17
    always @(posedge clock) begin	// src/main/scala/device/AXI4Slave.scala:59:17
      if (io_in_arvalid & (|io_in_arlen) & ~reset
          & ~(io_in_arlen == 8'h1 | io_in_arlen == 8'h3
              | io_in_arlen == 8'h7 | io_in_arlen == 8'hF)) begin	// src/main/scala/device/AXI4Slave.scala:58:32, :59:{17,35,63}, :60:{30,38,58}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/device/AXI4Slave.scala:59:17
          $error("Assertion failed\n    at AXI4Slave.scala:59 assert(axi4.ar.bits.len === 1.U || axi4.ar.bits.len === 3.U ||\n");	// src/main/scala/device/AXI4Slave.scala:59:17
        if (`STOP_COND_)	// src/main/scala/device/AXI4Slave.scala:59:17
          $fatal;	// src/main/scala/device/AXI4Slave.scala:59:17
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg         r_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  reg         ren_REG;	// src/main/scala/device/AXI4Slave.scala:73:17
  wire        ren = ren_REG | io_in_rvalid_r & ~io_in_rlast_0;	// src/main/scala/device/AXI4Slave.scala:47:36, :73:{17,44,58,61}, src/main/scala/utils/StopWatch.scala:24:20
  reg  [7:0]  writeBeatCnt;	// src/main/scala/chisel3/util/Counter.scala:61:40
  wire        _io_in_buser_T = ~w_busy & io_in_awvalid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/utils/StopWatch.scala:24:20
  reg  [31:0] waddr_r;	// src/main/scala/utils/Hold.scala:23:65
  wire        wen = io_in_wready_0 & io_in_wvalid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:95:30
  assign io_in_wready_0 = io_in_awvalid | w_busy;	// src/main/scala/device/AXI4Slave.scala:95:30, src/main/scala/utils/StopWatch.scala:24:20
  reg         io_in_bvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  reg         rdata_REG;	// difftest/src/main/scala/common/Mem.scala:238:16
  reg         rdata_REG_1;	// difftest/src/main/scala/common/Mem.scala:238:61
  reg  [63:0] rdata_r0;	// difftest/src/main/scala/common/Mem.scala:238:42
  always @(posedge clock) begin	// src/main/scala/device/AXI4RAM.scala:26:7
    if (reset) begin	// src/main/scala/device/AXI4RAM.scala:26:7
      c_value <= 8'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/utils/BitUtils.scala:27:45
      readBeatCnt <= 8'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/utils/BitUtils.scala:27:45
      len_r <= 8'h0;	// src/main/scala/utils/BitUtils.scala:27:45, src/main/scala/utils/Hold.scala:23:65
      burst_r <= 2'h0;	// src/main/scala/device/AXI4Slave.scala:72:18, src/main/scala/utils/Hold.scala:23:65
      raddr_r <= 39'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      r_busy <= 1'h0;	// src/main/scala/utils/Hold.scala:23:81, src/main/scala/utils/StopWatch.scala:24:20
      ren_REG <= 1'h0;	// src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/utils/Hold.scala:23:81
      io_in_rvalid_r <= 1'h0;	// src/main/scala/utils/Hold.scala:23:81, src/main/scala/utils/StopWatch.scala:24:20
      writeBeatCnt <= 8'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/utils/BitUtils.scala:27:45
      waddr_r <= 32'h0;	// src/main/scala/utils/Hold.scala:23:{65,81}
      w_busy <= 1'h0;	// src/main/scala/utils/Hold.scala:23:81, src/main/scala/utils/StopWatch.scala:24:20
      io_in_bvalid_r <= 1'h0;	// src/main/scala/utils/Hold.scala:23:81, src/main/scala/utils/StopWatch.scala:24:20
    end
    else begin	// src/main/scala/device/AXI4RAM.scala:26:7
      if (io_in_rvalid_r) begin	// src/main/scala/utils/StopWatch.scala:24:20
        if (io_in_rlast_0)	// src/main/scala/device/AXI4Slave.scala:47:36
          c_value <= 8'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/utils/BitUtils.scala:27:45
        else	// src/main/scala/device/AXI4Slave.scala:47:36
          c_value <= c_value + 8'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/device/AXI4Slave.scala:59:35
      end
      if (io_in_arvalid) begin	// src/main/scala/device/AXI4Slave.scala:28:14
        readBeatCnt <= io_in_araddr[10:3] & io_in_arlen;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4Slave.scala:57:67
        len_r <= io_in_arlen;	// src/main/scala/utils/Hold.scala:23:65
        burst_r <= 2'h2;	// src/main/scala/device/AXI4Slave.scala:28:14, src/main/scala/utils/Hold.scala:23:65
        raddr_r <= {7'h0, _GEN};	// src/main/scala/device/AXI4Slave.scala:45:40, src/main/scala/utils/Hold.scala:23:65
      end
      else if (ren) begin	// src/main/scala/device/AXI4Slave.scala:73:44
        if ((io_in_arvalid ? 2'h2 : burst_r) == 2'h2 & readBeatCnt == len)	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4Slave.scala:28:14, :50:{21,51,68}, src/main/scala/utils/Hold.scala:23:{48,65}
          readBeatCnt <= 8'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/utils/BitUtils.scala:27:45
        else	// src/main/scala/device/AXI4Slave.scala:50:51
          readBeatCnt <= readBeatCnt + 8'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/device/AXI4Slave.scala:59:35
      end
      r_busy <= io_in_arvalid | ~(io_in_rvalid_r & io_in_rlast_0) & r_busy;	// src/main/scala/device/AXI4Slave.scala:47:36, :70:52, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      ren_REG <= io_in_arvalid;	// src/main/scala/device/AXI4Slave.scala:73:17
      io_in_rvalid_r <= ren & (io_in_arvalid | r_busy);	// src/main/scala/device/AXI4Slave.scala:73:44, :74:{35,50}, src/main/scala/utils/StopWatch.scala:24:20
      if (wen) begin	// src/main/scala/chisel3/util/Decoupled.scala:51:35
        if (io_in_wlast)	// src/main/scala/device/AXI4Slave.scala:28:14
          writeBeatCnt <= 8'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/utils/BitUtils.scala:27:45
        else	// src/main/scala/device/AXI4Slave.scala:28:14
          writeBeatCnt <= writeBeatCnt + 8'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/device/AXI4Slave.scala:59:35
      end
      if (_io_in_buser_T)	// src/main/scala/chisel3/util/Decoupled.scala:51:35
        waddr_r <= io_in_awaddr;	// src/main/scala/utils/Hold.scala:23:65
      w_busy <= _io_in_buser_T | ~io_in_bvalid_r & w_busy;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      io_in_bvalid_r <= wen & io_in_wlast;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:97:41, src/main/scala/utils/StopWatch.scala:24:20
    end
    rdata_REG <= ren;	// difftest/src/main/scala/common/Mem.scala:238:16, src/main/scala/device/AXI4Slave.scala:73:44
    rdata_REG_1 <= ren;	// difftest/src/main/scala/common/Mem.scala:238:61, src/main/scala/device/AXI4Slave.scala:73:44
    if (rdata_REG_1)	// difftest/src/main/scala/common/Mem.scala:238:61
      rdata_r0 <= _rdata_mem_read_data_0;	// difftest/src/main/scala/common/Mem.scala:238:42, :322:36
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/device/AXI4RAM.scala:26:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4RAM.scala:26:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4RAM.scala:26:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/device/AXI4RAM.scala:26:7
      automatic logic [31:0] _RANDOM[0:5];	// src/main/scala/device/AXI4RAM.scala:26:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4RAM.scala:26:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4RAM.scala:26:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/device/AXI4RAM.scala:26:7
        for (logic [2:0] i = 3'h0; i < 3'h6; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/device/AXI4RAM.scala:26:7
        end	// src/main/scala/device/AXI4RAM.scala:26:7
        c_value = _RANDOM[3'h0][7:0];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4RAM.scala:26:7
        readBeatCnt = _RANDOM[3'h0][15:8];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4RAM.scala:26:7
        len_r = _RANDOM[3'h0][23:16];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
        burst_r = _RANDOM[3'h0][25:24];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
        raddr_r = {_RANDOM[3'h0][31:26], _RANDOM[3'h1], _RANDOM[3'h2][0]};	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
        r_busy = _RANDOM[3'h2][1];	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/StopWatch.scala:24:20
        ren_REG = _RANDOM[3'h2][2];	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/utils/Hold.scala:23:65
        io_in_rvalid_r = _RANDOM[3'h2][3];	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/StopWatch.scala:24:20
        writeBeatCnt = _RANDOM[3'h2][11:4];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
        waddr_r = {_RANDOM[3'h2][31:12], _RANDOM[3'h3][11:0]};	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
        w_busy = _RANDOM[3'h3][12];	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/StopWatch.scala:24:20
        io_in_bvalid_r = _RANDOM[3'h3][13];	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65, src/main/scala/utils/StopWatch.scala:24:20
        rdata_REG = _RANDOM[3'h3][18];	// difftest/src/main/scala/common/Mem.scala:238:16, src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
        rdata_REG_1 = _RANDOM[3'h3][19];	// difftest/src/main/scala/common/Mem.scala:238:61, src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
        rdata_r0 = {_RANDOM[3'h3][31:20], _RANDOM[3'h4], _RANDOM[3'h5][19:0]};	// difftest/src/main/scala/common/Mem.scala:238:42, src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/Hold.scala:23:65
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4RAM.scala:26:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4RAM.scala:26:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  DifftestMem1P rdata_mem (	// difftest/src/main/scala/common/Mem.scala:322:36
    .clock        (clock),
    .reset        (reset),
    .read_valid   (ren),	// src/main/scala/device/AXI4Slave.scala:73:44
    .read_index
      ({36'h0, (io_in_arvalid ? _GEN[30:3] : raddr_r[30:3]) + {20'h0, readBeatCnt}}),	// difftest/src/main/scala/common/Mem.scala:237:16, :243:17, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/device/AXI4RAM.scala:32:27, :33:27, src/main/scala/device/AXI4Slave.scala:45:40, src/main/scala/utils/Hold.scala:23:{48,65}
    .read_data_0  (_rdata_mem_read_data_0),
    .write_valid  (wen),	// src/main/scala/chisel3/util/Decoupled.scala:51:35
    .write_index
      ({36'h0,
        (_io_in_buser_T ? io_in_awaddr[30:3] : waddr_r[30:3])
          + {20'h0, writeBeatCnt}}),	// difftest/src/main/scala/common/Mem.scala:243:17, src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4RAM.scala:32:27, src/main/scala/device/AXI4Slave.scala:28:14, src/main/scala/utils/Hold.scala:23:{48,65}
    .write_data_0 (io_in_wdata)
  );
  assign io_in_awready = ~w_busy;	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_wready = io_in_wready_0;	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/device/AXI4Slave.scala:95:30
  assign io_in_bvalid = io_in_bvalid_r;	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_rvalid = io_in_rvalid_r;	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_rdata = rdata_REG ? _rdata_mem_read_data_0 : rdata_r0;	// difftest/src/main/scala/common/Mem.scala:238:{8,16,42}, :322:36, src/main/scala/device/AXI4RAM.scala:26:7
  assign io_in_rlast = io_in_rlast_0;	// src/main/scala/device/AXI4RAM.scala:26:7, src/main/scala/device/AXI4Slave.scala:47:36
endmodule

