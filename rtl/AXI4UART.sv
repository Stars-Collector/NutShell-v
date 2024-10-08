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

module AXI4UART(	// src/main/scala/device/AXI4UART.scala:26:7
  input         clock,	// src/main/scala/device/AXI4UART.scala:26:7
                reset,	// src/main/scala/device/AXI4UART.scala:26:7
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
  output        io_extra_out_valid,	// src/main/scala/device/AXI4Slave.scala:28:14
  output [7:0]  io_extra_out_ch,	// src/main/scala/device/AXI4Slave.scala:28:14
  output        io_extra_in_valid,	// src/main/scala/device/AXI4Slave.scala:28:14
  input  [7:0]  io_extra_in_ch	// src/main/scala/device/AXI4Slave.scala:28:14
);

  reg         io_in_rvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  wire        _io_extra_in_valid_T_2 = io_in_rready & io_in_rvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20
  reg         r_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  wire        io_in_arready_0 = io_in_rready | ~r_busy;	// src/main/scala/device/AXI4Slave.scala:71:{29,32}, src/main/scala/utils/StopWatch.scala:24:20
  reg         ren_REG;	// src/main/scala/device/AXI4Slave.scala:73:17
  reg         w_busy;	// src/main/scala/utils/StopWatch.scala:24:20
  wire        io_in_wready_0 = io_in_awvalid | w_busy;	// src/main/scala/device/AXI4Slave.scala:95:30, src/main/scala/utils/StopWatch.scala:24:20
  wire        _io_extra_out_valid_T_2 = io_in_wready_0 & io_in_wvalid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:95:30
  reg         io_in_bvalid_r;	// src/main/scala/utils/StopWatch.scala:24:20
  reg  [31:0] txfifo;	// src/main/scala/device/AXI4UART.scala:29:19
  reg  [31:0] stat;	// src/main/scala/device/AXI4UART.scala:30:21
  reg  [31:0] ctrl;	// src/main/scala/device/AXI4UART.scala:31:21
  always @(posedge clock) begin	// src/main/scala/device/AXI4UART.scala:26:7
    automatic logic [7:0]  _GEN = io_in_wstrb >> io_in_awaddr[2:0];	// src/main/scala/device/AXI4UART.scala:45:{77,85}
    automatic logic [31:0] _GEN_0;	// src/main/scala/device/AXI4UART.scala:45:92
    _GEN_0 = {{8{_GEN[3]}}, {8{_GEN[2]}}, {8{_GEN[1]}}, {8{_GEN[0]}}};	// src/main/scala/device/AXI4UART.scala:45:{77,92}, src/main/scala/utils/BitUtils.scala:27:{29,45}
    if (reset) begin	// src/main/scala/device/AXI4UART.scala:26:7
      r_busy <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      ren_REG <= 1'h0;	// src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/utils/StopWatch.scala:24:20
      io_in_rvalid_r <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      w_busy <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      io_in_bvalid_r <= 1'h0;	// src/main/scala/utils/StopWatch.scala:24:20
      stat <= 32'h1;	// src/main/scala/device/AXI4UART.scala:30:21
      ctrl <= 32'h0;	// src/main/scala/device/AXI4UART.scala:28:23, :31:21
    end
    else begin	// src/main/scala/device/AXI4UART.scala:26:7
      automatic logic _io_in_rvalid_T = io_in_arready_0 & io_in_arvalid;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:71:29
      automatic logic _io_in_bvalid_T_2;	// src/main/scala/chisel3/util/Decoupled.scala:51:35
      _io_in_bvalid_T_2 = io_in_bready & io_in_bvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20
      r_busy <= _io_in_rvalid_T | ~_io_extra_in_valid_T_2 & r_busy;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      ren_REG <= _io_in_rvalid_T;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:73:17
      io_in_rvalid_r <=
        ren_REG & (_io_in_rvalid_T | r_busy) | ~_io_extra_in_valid_T_2 & io_in_rvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:73:17, :74:{35,50}, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      w_busy <= ~w_busy & io_in_awvalid | ~_io_in_bvalid_T_2 & w_busy;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      io_in_bvalid_r <= _io_extra_out_valid_T_2 | ~_io_in_bvalid_T_2 & io_in_bvalid_r;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :26:{19,23}, :27:{20,24}
      if (_io_extra_out_valid_T_2 & io_in_awaddr[3:0] == 4'h8)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4UART.scala:33:35, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:32:{32,41}
        stat <= io_in_wdata[31:0] & _GEN_0 | stat & ~_GEN_0;	// src/main/scala/device/AXI4UART.scala:30:21, :45:{42,92}, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
      if (_io_extra_out_valid_T_2 & io_in_awaddr[3:0] == 4'hC)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4UART.scala:33:35, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:32:{32,41}
        ctrl <= io_in_wdata[31:0] & _GEN_0 | ctrl & ~_GEN_0;	// src/main/scala/device/AXI4UART.scala:31:21, :45:{42,92}, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
    end
    if (_io_extra_out_valid_T_2 & io_in_awaddr[3:0] == 4'h4)	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4UART.scala:33:{35,41}, src/main/scala/utils/RegMap.scala:32:{32,41}
      txfifo <= io_in_wdata[31:0] & _GEN_0 | txfifo & ~_GEN_0;	// src/main/scala/device/AXI4UART.scala:29:19, :45:{42,92}, src/main/scala/utils/BitUtils.scala:34:{14,26,37,39}
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/device/AXI4UART.scala:26:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4UART.scala:26:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/device/AXI4UART.scala:26:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/device/AXI4UART.scala:26:7
      automatic logic [31:0] _RANDOM[0:4];	// src/main/scala/device/AXI4UART.scala:26:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4UART.scala:26:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/device/AXI4UART.scala:26:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/device/AXI4UART.scala:26:7
        for (logic [2:0] i = 3'h0; i < 3'h5; i += 3'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/device/AXI4UART.scala:26:7
        end	// src/main/scala/device/AXI4UART.scala:26:7
        r_busy = _RANDOM[3'h0][0];	// src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
        ren_REG = _RANDOM[3'h0][1];	// src/main/scala/device/AXI4Slave.scala:73:17, src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
        io_in_rvalid_r = _RANDOM[3'h0][2];	// src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
        w_busy = _RANDOM[3'h0][3];	// src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
        io_in_bvalid_r = _RANDOM[3'h0][4];	// src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
        txfifo = {_RANDOM[3'h1][31:5], _RANDOM[3'h2][4:0]};	// src/main/scala/device/AXI4UART.scala:26:7, :29:19
        stat = {_RANDOM[3'h2][31:5], _RANDOM[3'h3][4:0]};	// src/main/scala/device/AXI4UART.scala:26:7, :29:19, :30:21
        ctrl = {_RANDOM[3'h3][31:5], _RANDOM[3'h4][4:0]};	// src/main/scala/device/AXI4UART.scala:26:7, :30:21, :31:21
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4UART.scala:26:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/device/AXI4UART.scala:26:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_awready = ~w_busy;	// src/main/scala/device/AXI4Slave.scala:94:18, src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_wready = io_in_wready_0;	// src/main/scala/device/AXI4Slave.scala:95:30, src/main/scala/device/AXI4UART.scala:26:7
  assign io_in_bvalid = io_in_bvalid_r;	// src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_arready = io_in_arready_0;	// src/main/scala/device/AXI4Slave.scala:71:29, src/main/scala/device/AXI4UART.scala:26:7
  assign io_in_rvalid = io_in_rvalid_r;	// src/main/scala/device/AXI4UART.scala:26:7, src/main/scala/utils/StopWatch.scala:24:20
  assign io_in_rdata =
    {32'h0,
     {24'h0, (|(io_in_araddr[3:0])) ? 8'h0 : io_extra_in_ch}
       | (io_in_araddr[3:0] == 4'h4 ? txfifo : 32'h0)
       | (io_in_araddr[3:0] == 4'h8 ? stat : 32'h0)
       | (io_in_araddr[3:0] == 4'hC ? ctrl : 32'h0)};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/device/AXI4UART.scala:26:7, :28:23, :29:19, :30:21, :31:21, :33:41, :35:{34,40}, src/main/scala/utils/BitUtils.scala:27:45, src/main/scala/utils/LookupTree.scala:24:34, src/main/scala/utils/RegMap.scala:30:11
  assign io_extra_out_valid = io_in_awaddr[3:0] == 4'h4 & _io_extra_out_valid_T_2;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4UART.scala:26:7, :33:{35,41,49}
  assign io_extra_out_ch = io_in_wdata[7:0];	// src/main/scala/device/AXI4UART.scala:26:7, :34:40
  assign io_extra_in_valid = ~(|(io_in_araddr[3:0])) & _io_extra_in_valid_T_2;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/device/AXI4UART.scala:26:7, :35:{34,40,48}
endmodule

