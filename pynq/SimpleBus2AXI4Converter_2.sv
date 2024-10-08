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

module SimpleBus2AXI4Converter_2(	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  input         clock,	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
                reset,	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  output        io_in_req_ready,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input         io_in_req_valid,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input  [31:0] io_in_req_bits_addr,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input  [3:0]  io_in_req_bits_cmd,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input  [7:0]  io_in_req_bits_wmask,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input  [63:0] io_in_req_bits_wdata,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input         io_in_resp_ready,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output        io_in_resp_valid,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output [63:0] io_in_resp_bits_rdata,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input         io_out_awready,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output        io_out_awvalid,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output [31:0] io_out_awaddr,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input         io_out_wready,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output        io_out_wvalid,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output [63:0] io_out_wdata,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output [7:0]  io_out_wstrb,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output        io_out_bready,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input         io_out_bvalid,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
                io_out_arready,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output        io_out_arvalid,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output [31:0] io_out_araddr,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  output        io_out_rready,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input         io_out_rvalid,	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
  input  [63:0] io_out_rdata	// src/main/scala/bus/simplebus/ToAXI4.scala:146:14
);

  wire io_out_wvalid_0;	// src/main/scala/bus/simplebus/ToAXI4.scala:194:31
  wire io_out_awvalid_0;	// src/main/scala/bus/simplebus/ToAXI4.scala:193:31
  `ifndef SYNTHESIS	// src/main/scala/bus/simplebus/ToAXI4.scala:153:9
    always @(posedge clock) begin	// src/main/scala/bus/simplebus/ToAXI4.scala:153:9
      if (~reset & io_in_req_valid & io_in_req_bits_cmd[1]) begin	// src/main/scala/bus/simplebus/SimpleBus.scala:75:22, src/main/scala/bus/simplebus/ToAXI4.scala:153:9
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/bus/simplebus/ToAXI4.scala:153:9
          $error("Assertion failed\n    at ToAXI4.scala:153 assert(toAXI4Lite || toAXI4)\n");	// src/main/scala/bus/simplebus/ToAXI4.scala:153:9
        if (`STOP_COND_)	// src/main/scala/bus/simplebus/ToAXI4.scala:153:9
          $fatal;	// src/main/scala/bus/simplebus/ToAXI4.scala:153:9
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire _wSend_T = io_out_awready & io_out_awvalid_0;	// src/main/scala/bus/simplebus/ToAXI4.scala:193:31, src/main/scala/chisel3/util/Decoupled.scala:51:35
  reg  awAck;	// src/main/scala/utils/StopWatch.scala:24:20
  wire _wSend_T_1 = io_out_wready & io_out_wvalid_0;	// src/main/scala/bus/simplebus/ToAXI4.scala:194:31, src/main/scala/chisel3/util/Decoupled.scala:51:35
  reg  wAck;	// src/main/scala/utils/StopWatch.scala:24:20
  wire wSend = _wSend_T & _wSend_T_1 | awAck & wAck;	// src/main/scala/bus/simplebus/ToAXI4.scala:189:{25,49,59}, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20
  reg  wen;	// src/main/scala/bus/simplebus/ToAXI4.scala:190:22
  assign io_out_awvalid_0 = io_in_req_valid & io_in_req_bits_cmd[0] & ~awAck;	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/bus/simplebus/ToAXI4.scala:193:{31,34}, src/main/scala/utils/StopWatch.scala:24:20
  assign io_out_wvalid_0 = io_in_req_valid & io_in_req_bits_cmd[0] & ~wAck;	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/bus/simplebus/ToAXI4.scala:194:{31,34}, src/main/scala/utils/StopWatch.scala:24:20
  wire io_in_req_ready_0 =
    io_in_req_bits_cmd[0] ? ~wAck & io_out_wready : io_out_arready;	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/bus/simplebus/ToAXI4.scala:194:34, :195:{24,55}, src/main/scala/utils/StopWatch.scala:24:20
  always @(posedge clock) begin	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
    if (reset) begin	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
      awAck <= 1'h0;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, src/main/scala/utils/StopWatch.scala:24:20
      wAck <= 1'h0;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, src/main/scala/utils/StopWatch.scala:24:20
    end
    else begin	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
      awAck <= ~wSend & (_wSend_T | awAck);	// src/main/scala/bus/simplebus/ToAXI4.scala:189:49, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :30:{20,24}, :31:{19,23}
      wAck <= ~wSend & (_wSend_T_1 | wAck);	// src/main/scala/bus/simplebus/ToAXI4.scala:189:49, src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/utils/StopWatch.scala:24:20, :30:{20,24}, :31:{19,23}
    end
    if (io_in_req_ready_0 & io_in_req_valid)	// src/main/scala/bus/simplebus/ToAXI4.scala:195:24, src/main/scala/chisel3/util/Decoupled.scala:51:35
      wen <= io_in_req_bits_cmd[0];	// src/main/scala/bus/simplebus/SimpleBus.scala:74:22, src/main/scala/bus/simplebus/ToAXI4.scala:190:22
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
      automatic logic [31:0] _RANDOM[0:0];	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
        awAck = _RANDOM[/*Zero width*/ 1'b0][0];	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, src/main/scala/utils/StopWatch.scala:24:20
        wAck = _RANDOM[/*Zero width*/ 1'b0][1];	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, src/main/scala/utils/StopWatch.scala:24:20
        wen = _RANDOM[/*Zero width*/ 1'b0][2];	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, :190:22, src/main/scala/utils/StopWatch.scala:24:20
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_req_ready = io_in_req_ready_0;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, :195:24
  assign io_in_resp_valid = wen ? io_out_bvalid : io_out_rvalid;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, :190:22, :199:25
  assign io_in_resp_bits_rdata = io_out_rdata;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  assign io_out_awvalid = io_out_awvalid_0;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, :193:31
  assign io_out_awaddr = io_in_req_bits_addr;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  assign io_out_wvalid = io_out_wvalid_0;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7, :194:31
  assign io_out_wdata = io_in_req_bits_wdata;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  assign io_out_wstrb = io_in_req_bits_wmask;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  assign io_out_bready = io_in_resp_ready;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  assign io_out_arvalid =
    io_in_req_valid & ~(io_in_req_bits_cmd[0]) & ~(io_in_req_bits_cmd[3]);	// src/main/scala/bus/simplebus/SimpleBus.scala:73:{18,29,33}, :74:22, :104:27, src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  assign io_out_araddr = io_in_req_bits_addr;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
  assign io_out_rready = io_in_resp_ready;	// src/main/scala/bus/simplebus/ToAXI4.scala:145:7
endmodule

