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

module SRAMTemplate_2(	// src/main/scala/utils/SRAMTemplate.scala:68:7
  input         clock,	// src/main/scala/utils/SRAMTemplate.scala:68:7
  output        io_rreq_ready,	// src/main/scala/utils/SRAMTemplate.scala:70:14
  input         io_rreq_valid,	// src/main/scala/utils/SRAMTemplate.scala:70:14
  input  [9:0]  io_rreq_bits_setIdx,	// src/main/scala/utils/SRAMTemplate.scala:70:14
  output [63:0] io_rresp_data_0_data,	// src/main/scala/utils/SRAMTemplate.scala:70:14
                io_rresp_data_1_data,	// src/main/scala/utils/SRAMTemplate.scala:70:14
                io_rresp_data_2_data,	// src/main/scala/utils/SRAMTemplate.scala:70:14
                io_rresp_data_3_data,	// src/main/scala/utils/SRAMTemplate.scala:70:14
  input         io_wreq_valid,	// src/main/scala/utils/SRAMTemplate.scala:70:14
  input  [9:0]  io_wreq_bits_setIdx,	// src/main/scala/utils/SRAMTemplate.scala:70:14
  input  [63:0] io_wreq_bits_data_data,	// src/main/scala/utils/SRAMTemplate.scala:70:14
  input  [3:0]  io_wreq_bits_waymask	// src/main/scala/utils/SRAMTemplate.scala:70:14
);

  wire         realRen;	// src/main/scala/utils/SRAMTemplate.scala:89:38
  wire [255:0] _array_ext_RW0_rdata;	// src/main/scala/utils/SRAMTemplate.scala:76:26
  assign realRen = io_rreq_valid & ~io_wreq_valid;	// src/main/scala/utils/SRAMTemplate.scala:89:{38,41}
  array_1024x256 array_ext (	// src/main/scala/utils/SRAMTemplate.scala:76:26
    .RW0_addr  (io_wreq_valid ? io_wreq_bits_setIdx : io_rreq_bits_setIdx),	// src/main/scala/utils/SRAMTemplate.scala:76:26
    .RW0_en    (realRen | io_wreq_valid),	// src/main/scala/utils/SRAMTemplate.scala:76:26, :89:38
    .RW0_clk   (clock),
    .RW0_wmode (io_wreq_valid),
    .RW0_wdata ({4{io_wreq_bits_data_data}}),	// src/main/scala/utils/SRAMTemplate.scala:76:26
    .RW0_rdata (_array_ext_RW0_rdata),
    .RW0_wmask (io_wreq_bits_waymask)
  );
  assign io_rreq_ready = ~io_wreq_valid;	// src/main/scala/utils/SRAMTemplate.scala:68:7, :89:41
  assign io_rresp_data_0_data = _array_ext_RW0_rdata[63:0];	// src/main/scala/utils/SRAMTemplate.scala:68:7, :76:26
  assign io_rresp_data_1_data = _array_ext_RW0_rdata[127:64];	// src/main/scala/utils/SRAMTemplate.scala:68:7, :76:26
  assign io_rresp_data_2_data = _array_ext_RW0_rdata[191:128];	// src/main/scala/utils/SRAMTemplate.scala:68:7, :76:26
  assign io_rresp_data_3_data = _array_ext_RW0_rdata[255:192];	// src/main/scala/utils/SRAMTemplate.scala:68:7, :76:26
endmodule

