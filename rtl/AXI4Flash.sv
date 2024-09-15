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

module AXI4Flash(	// src/main/scala/device/AXI4Flash.scala:25:7
  input         clock,	// src/main/scala/device/AXI4Flash.scala:25:7
                reset,	// src/main/scala/device/AXI4Flash.scala:25:7
  output        io_in_awready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_awvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_wready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_wvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
                io_in_bready,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_bvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
                io_in_arready,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_arvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [31:0] io_in_araddr,	// src/main/scala/device/AXI4Slave.scala:28:14
  input         io_in_rready,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_in_rvalid,	// src/main/scala/device/AXI4Slave.scala:28:14
  output [63:0] io_in_rdata	// src/main/scala/device/AXI4Slave.scala:28:14
);

  reg         r_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  wire        io_in_arready_0 = io_in_rready | ~r_busy;	// src/main/scala/device/AXI4Slave.scala:71:{29,32}, src/main/scala/utils/StopWatch.scala:24:20
  reg         ren_REG;	// src/main/scala/device/AXI4Slave.scala:73:17
  reg         io_in_rvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  reg         w_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  wire        io_in_wready_0 = io_in_awvalid | w_busy;	// src/main/scala/device/AXI4Slave.scala:95:30, src/main/scala/utils/StopWatch.scala:24:20
  reg         io_in_bvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  reg  [63:0] io_in_rdata_REG;	// src/main/scala/device/AXI4Flash.scala:41:38
  reg  [63:0] io_in_rdata_r;	// src/main/scala/device/AXI4Flash.scala:41:30
  always @(posedge clock) begin	// src/main/scala/device/AXI4Flash.scala:25:7
    automatic logic [24:0] _rdata_T_6 =
      {4'h0, io_in_araddr[12:0] == 13'h0 ? 21'h10029B : 21'h0}
      | (io_in_araddr[12:0] == 13'h4 ? 25'h1F29293 : 25'h0);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/device/AXI4Flash.scala:35:35, src/main/scala/utils/LookupTree.scala:24:34
    automatic logic [17:0] _GEN =
      _rdata_T_6[17:0] | (io_in_araddr[12:0] == 13'h8 ? 18'h28067 : 18'h0);	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/device/AXI4Flash.scala:35:35, src/main/scala/utils/LookupTree.scala:24:34
    if (reset) begin	// src/main/scala/device/AXI4Flash.scala:25:7
      r_busy <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      ren_REG <= 1'h0;	// src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/utils/StopWatch.scala:24:20
      io_in_rvalid_r <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      w_busy <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      io_in_bvalid_r <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
    end
    else begin	// src/main/scala/device/AXI4Flash.scala:25:7
      automatic logic _io_in_rvalid_T = io_in_arready_0 & io_in_arvalid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:71:29
      automatic logic _io_in_rvalid_T_3;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
      automatic logic _io_in_bvalid_T_2;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
      _io_in_rvalid_T_3 = io_in_rready & io_in_rvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20
      _io_in_bvalid_T_2 = io_in_bready & io_in_bvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20
      r_busy <= _io_in_rvalid_T | ~_io_in_rvalid_T_3 & r_busy;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      ren_REG <= _io_in_rvalid_T;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:73:17
      io_in_rvalid_r <=
        ren_REG & (_io_in_rvalid_T | r_busy) | ~_io_in_rvalid_T_3 & io_in_rvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:73:17, :74:{35,50}, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      w_busy <= ~w_busy & io_in_awvalid | ~_io_in_bvalid_T_2 & w_busy;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      io_in_bvalid_r <=
        io_in_wready_0 & io_in_wvalid | ~_io_in_bvalid_T_2 & io_in_bvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:95:30, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
    end
    io_in_rdata_REG <=
      {7'h0, _rdata_T_6[24:18], _GEN, 7'h0, _rdata_T_6[24:18], _GEN};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/device/AXI4Flash.scala:41:{38,43,52}
    if (ren_REG)	// src/main/scala/device/AXI4Slave.scala:73:17
      io_in_rdata_r <= io_in_rdata_REG;	// src/main/scala/device/AXI4Flash.scala:41:{30,38}
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/device/AXI4Flash.scala:25:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4Flash.scala:25:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4Flash.scala:25:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/device/AXI4Flash.scala:25:7
      automatic logic [31:0] _RANDOM[0:4];	// src/main/scala/device/AXI4Flash.scala:25:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4Flash.scala:25:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4Flash.scala:25:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/device/AXI4Flash.scala:25:7
        for (logic [2:0] i = 3'h0; i < 3'h5; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/device/AXI4Flash.scala:25:7
        end	// src/main/scala/device/AXI4Flash.scala:25:7
        r_busy = _RANDOM[3'h0][0];	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/utils/StopWatch.scala:24:20
        ren_REG = _RANDOM[3'h0][1];	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/utils/StopWatch.scala:24:20
        io_in_rvalid_r = _RANDOM[3'h0][2];	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/utils/StopWatch.scala:24:20
        w_busy = _RANDOM[3'h0][3];	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/utils/StopWatch.scala:24:20
        io_in_bvalid_r = _RANDOM[3'h0][4];	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/utils/StopWatch.scala:24:20
        io_in_rdata_REG = {_RANDOM[3'h0][31:5], _RANDOM[3'h1], _RANDOM[3'h2][4:0]};	// src/main/scala/device/AXI4Flash.scala:25:7, :41:38, src/main/scala/utils/StopWatch.scala:24:20
        io_in_rdata_r = {_RANDOM[3'h2][31:5], _RANDOM[3'h3], _RANDOM[3'h4][4:0]};	// src/main/scala/device/AXI4Flash.scala:25:7, :41:{30,38}
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4Flash.scala:25:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4Flash.scala:25:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_awready = ~w_busy;	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_wready = io_in_wready_0;	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/device/AXI4Slave.scala:95:30
  assign io_in_bvalid = io_in_bvalid_r;	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_arready = io_in_arready_0;	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/device/AXI4Slave.scala:71:29
  assign io_in_rvalid = io_in_rvalid_r;	// src/main/scala/device/AXI4Flash.scala:25:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_rdata = io_in_rdata_r;	// src/main/scala/device/AXI4Flash.scala:25:7, :41:30
endmodule

