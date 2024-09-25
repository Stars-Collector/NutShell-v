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

module CacheStage1_1(	// src/main/scala/nutcore/mem/Cache.scala:126:14
  output        io_in_ready,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input         io_in_valid,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input  [31:0] io_in_bits_addr,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input  [2:0]  io_in_bits_size,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input  [3:0]  io_in_bits_cmd,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input  [7:0]  io_in_bits_wmask,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input  [63:0] io_in_bits_wdata,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input         io_out_ready,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output        io_out_valid,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output [31:0] io_out_bits_req_addr,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output [2:0]  io_out_bits_req_size,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output [3:0]  io_out_bits_req_cmd,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output [7:0]  io_out_bits_req_wmask,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output [63:0] io_out_bits_req_wdata,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input         io_metaReadBus_req_ready,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output        io_metaReadBus_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output [6:0]  io_metaReadBus_req_bits_setIdx,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  input         io_dataReadBus_req_ready,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output        io_dataReadBus_req_valid,	// src/main/scala/nutcore/mem/Cache.scala:133:14
  output [9:0]  io_dataReadBus_req_bits_setIdx	// src/main/scala/nutcore/mem/Cache.scala:133:14
);

  wire readBusValid = io_in_valid & io_out_ready;	// src/main/scala/nutcore/mem/Cache.scala:139:34
  wire io_out_valid_0 = io_in_valid & io_metaReadBus_req_ready & io_dataReadBus_req_ready;	// src/main/scala/nutcore/mem/Cache.scala:144:59
  assign io_in_ready =
    (~io_in_valid | io_out_ready & io_out_valid_0) & io_metaReadBus_req_ready
    & io_dataReadBus_req_ready;	// src/main/scala/chisel3/util/Decoupled.scala:51:35, src/main/scala/nutcore/mem/Cache.scala:126:14, :144:59, :145:{19,32,76}
  assign io_out_valid = io_out_valid_0;	// src/main/scala/nutcore/mem/Cache.scala:126:14, :144:59
  assign io_out_bits_req_addr = io_in_bits_addr;	// src/main/scala/nutcore/mem/Cache.scala:126:14
  assign io_out_bits_req_size = io_in_bits_size;	// src/main/scala/nutcore/mem/Cache.scala:126:14
  assign io_out_bits_req_cmd = io_in_bits_cmd;	// src/main/scala/nutcore/mem/Cache.scala:126:14
  assign io_out_bits_req_wmask = io_in_bits_wmask;	// src/main/scala/nutcore/mem/Cache.scala:126:14
  assign io_out_bits_req_wdata = io_in_bits_wdata;	// src/main/scala/nutcore/mem/Cache.scala:126:14
  assign io_metaReadBus_req_valid = readBusValid;	// src/main/scala/nutcore/mem/Cache.scala:126:14, :139:34
  assign io_metaReadBus_req_bits_setIdx = io_in_bits_addr[12:6];	// src/main/scala/nutcore/mem/Cache.scala:77:45, :126:14
  assign io_dataReadBus_req_valid = readBusValid;	// src/main/scala/nutcore/mem/Cache.scala:126:14, :139:34
  assign io_dataReadBus_req_bits_setIdx = io_in_bits_addr[12:3];	// src/main/scala/nutcore/mem/Cache.scala:78:35, :126:14
endmodule

