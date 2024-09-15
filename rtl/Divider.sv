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

module Divider(	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
  input          clock,	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
                 reset,	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
  output         io_in_ready,	// src/main/scala/nutcore/backend/fu/MDU.scala:69:14
  input          io_in_valid,	// src/main/scala/nutcore/backend/fu/MDU.scala:69:14
  input  [63:0]  io_in_bits_0,	// src/main/scala/nutcore/backend/fu/MDU.scala:69:14
                 io_in_bits_1,	// src/main/scala/nutcore/backend/fu/MDU.scala:69:14
  input          io_sign,	// src/main/scala/nutcore/backend/fu/MDU.scala:69:14
  output         io_out_valid,	// src/main/scala/nutcore/backend/fu/MDU.scala:69:14
  output [127:0] io_out_bits	// src/main/scala/nutcore/backend/fu/MDU.scala:69:14
);

  reg  [2:0]   state;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22
  wire         io_in_ready_0 = state == 3'h0;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :78:23
  reg  [128:0] shiftReg;	// src/main/scala/nutcore/backend/fu/MDU.scala:83:21
  reg          aSignReg;	// src/main/scala/nutcore/backend/fu/MDU.scala:89:27
  reg          qSignReg;	// src/main/scala/nutcore/backend/fu/MDU.scala:90:27
  reg  [63:0]  bReg;	// src/main/scala/nutcore/backend/fu/MDU.scala:91:23
  reg  [64:0]  aValx2Reg;	// src/main/scala/nutcore/backend/fu/MDU.scala:92:28
  reg  [5:0]   cnt_value;	// src/main/scala/chisel3/util/Counter.scala:61:40
  always @(posedge clock) begin	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
    automatic logic newReq;	// src/main/scala/nutcore/backend/fu/MDU.scala:78:35
    automatic logic _GEN;	// src/main/scala/nutcore/backend/fu/MDU.scala:97:22
    automatic logic _GEN_0;	// src/main/scala/nutcore/backend/fu/MDU.scala:111:22
    automatic logic _GEN_1;	// src/main/scala/nutcore/backend/fu/MDU.scala:114:22
    newReq = io_in_ready_0 & io_in_valid;	// src/main/scala/nutcore/backend/fu/MDU.scala:78:{23,35}
    _GEN = state == 3'h1;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :96:11, :97:22
    _GEN_0 = state == 3'h2;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :110:11, :111:22
    _GEN_1 = state == 3'h3;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :113:11, :114:22
    if (reset) begin	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
      state <= 3'h0;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22
      cnt_value <= 6'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40
    end
    else if (newReq)	// src/main/scala/nutcore/backend/fu/MDU.scala:78:35
      state <= 3'h1;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :96:11
    else if (_GEN) begin	// src/main/scala/nutcore/backend/fu/MDU.scala:97:22
      automatic logic [6:0] _canSkipShift_T_223;	// src/main/scala/nutcore/backend/fu/MDU.scala:105:45
      _canSkipShift_T_223 =
        {1'h1,
         |(bReg[63:32]),
         (|(bReg[63:32]))
           ? {|(bReg[63:48]),
              (|(bReg[63:48]))
                ? {|(bReg[63:56]),
                   (|(bReg[63:56]))
                     ? {|(bReg[63:60]),
                        (|(bReg[63:60]))
                          ? (bReg[63] ? 2'h3 : bReg[62] ? 2'h2 : {1'h0, bReg[61]})
                          : bReg[59] ? 2'h3 : bReg[58] ? 2'h2 : {1'h0, bReg[57]}}
                     : {|(bReg[55:52]),
                        (|(bReg[55:52]))
                          ? (bReg[55] ? 2'h3 : bReg[54] ? 2'h2 : {1'h0, bReg[53]})
                          : bReg[51] ? 2'h3 : bReg[50] ? 2'h2 : {1'h0, bReg[49]}}}
                : {|(bReg[47:40]),
                   (|(bReg[47:40]))
                     ? {|(bReg[47:44]),
                        (|(bReg[47:44]))
                          ? (bReg[47] ? 2'h3 : bReg[46] ? 2'h2 : {1'h0, bReg[45]})
                          : bReg[43] ? 2'h3 : bReg[42] ? 2'h2 : {1'h0, bReg[41]}}
                     : {|(bReg[39:36]),
                        (|(bReg[39:36]))
                          ? (bReg[39] ? 2'h3 : bReg[38] ? 2'h2 : {1'h0, bReg[37]})
                          : bReg[35] ? 2'h3 : bReg[34] ? 2'h2 : {1'h0, bReg[33]}}}}
           : {|(bReg[31:16]),
              (|(bReg[31:16]))
                ? {|(bReg[31:24]),
                   (|(bReg[31:24]))
                     ? {|(bReg[31:28]),
                        (|(bReg[31:28]))
                          ? (bReg[31] ? 2'h3 : bReg[30] ? 2'h2 : {1'h0, bReg[29]})
                          : bReg[27] ? 2'h3 : bReg[26] ? 2'h2 : {1'h0, bReg[25]}}
                     : {|(bReg[23:20]),
                        (|(bReg[23:20]))
                          ? (bReg[23] ? 2'h3 : bReg[22] ? 2'h2 : {1'h0, bReg[21]})
                          : bReg[19] ? 2'h3 : bReg[18] ? 2'h2 : {1'h0, bReg[17]}}}
                : {|(bReg[15:8]),
                   (|(bReg[15:8]))
                     ? {|(bReg[15:12]),
                        (|(bReg[15:12]))
                          ? (bReg[15] ? 2'h3 : bReg[14] ? 2'h2 : {1'h0, bReg[13]})
                          : bReg[11] ? 2'h3 : bReg[10] ? 2'h2 : {1'h0, bReg[9]}}
                     : {|(bReg[7:4]),
                        (|(bReg[7:4]))
                          ? (bReg[7] ? 2'h3 : bReg[6] ? 2'h2 : {1'h0, bReg[5]})
                          : bReg[3] ? 2'h3 : bReg[2] ? 2'h2 : {1'h0, bReg[1]}}}}}
        - {aValx2Reg[64],
           aValx2Reg[64]
             ? 6'h0
             : {|(aValx2Reg[63:32]),
                (|(aValx2Reg[63:32]))
                  ? {|(aValx2Reg[63:48]),
                     (|(aValx2Reg[63:48]))
                       ? {|(aValx2Reg[63:56]),
                          (|(aValx2Reg[63:56]))
                            ? {|(aValx2Reg[63:60]),
                               (|(aValx2Reg[63:60]))
                                 ? (aValx2Reg[63]
                                      ? 2'h3
                                      : aValx2Reg[62] ? 2'h2 : {1'h0, aValx2Reg[61]})
                                 : aValx2Reg[59]
                                     ? 2'h3
                                     : aValx2Reg[58] ? 2'h2 : {1'h0, aValx2Reg[57]}}
                            : {|(aValx2Reg[55:52]),
                               (|(aValx2Reg[55:52]))
                                 ? (aValx2Reg[55]
                                      ? 2'h3
                                      : aValx2Reg[54] ? 2'h2 : {1'h0, aValx2Reg[53]})
                                 : aValx2Reg[51]
                                     ? 2'h3
                                     : aValx2Reg[50] ? 2'h2 : {1'h0, aValx2Reg[49]}}}
                       : {|(aValx2Reg[47:40]),
                          (|(aValx2Reg[47:40]))
                            ? {|(aValx2Reg[47:44]),
                               (|(aValx2Reg[47:44]))
                                 ? (aValx2Reg[47]
                                      ? 2'h3
                                      : aValx2Reg[46] ? 2'h2 : {1'h0, aValx2Reg[45]})
                                 : aValx2Reg[43]
                                     ? 2'h3
                                     : aValx2Reg[42] ? 2'h2 : {1'h0, aValx2Reg[41]}}
                            : {|(aValx2Reg[39:36]),
                               (|(aValx2Reg[39:36]))
                                 ? (aValx2Reg[39]
                                      ? 2'h3
                                      : aValx2Reg[38] ? 2'h2 : {1'h0, aValx2Reg[37]})
                                 : aValx2Reg[35]
                                     ? 2'h3
                                     : aValx2Reg[34] ? 2'h2 : {1'h0, aValx2Reg[33]}}}}
                  : {|(aValx2Reg[31:16]),
                     (|(aValx2Reg[31:16]))
                       ? {|(aValx2Reg[31:24]),
                          (|(aValx2Reg[31:24]))
                            ? {|(aValx2Reg[31:28]),
                               (|(aValx2Reg[31:28]))
                                 ? (aValx2Reg[31]
                                      ? 2'h3
                                      : aValx2Reg[30] ? 2'h2 : {1'h0, aValx2Reg[29]})
                                 : aValx2Reg[27]
                                     ? 2'h3
                                     : aValx2Reg[26] ? 2'h2 : {1'h0, aValx2Reg[25]}}
                            : {|(aValx2Reg[23:20]),
                               (|(aValx2Reg[23:20]))
                                 ? (aValx2Reg[23]
                                      ? 2'h3
                                      : aValx2Reg[22] ? 2'h2 : {1'h0, aValx2Reg[21]})
                                 : aValx2Reg[19]
                                     ? 2'h3
                                     : aValx2Reg[18] ? 2'h2 : {1'h0, aValx2Reg[17]}}}
                       : {|(aValx2Reg[15:8]),
                          (|(aValx2Reg[15:8]))
                            ? {|(aValx2Reg[15:12]),
                               (|(aValx2Reg[15:12]))
                                 ? (aValx2Reg[15]
                                      ? 2'h3
                                      : aValx2Reg[14] ? 2'h2 : {1'h0, aValx2Reg[13]})
                                 : aValx2Reg[11]
                                     ? 2'h3
                                     : aValx2Reg[10] ? 2'h2 : {1'h0, aValx2Reg[9]}}
                            : {|(aValx2Reg[7:4]),
                               (|(aValx2Reg[7:4]))
                                 ? (aValx2Reg[7]
                                      ? 2'h3
                                      : aValx2Reg[6] ? 2'h2 : {1'h0, aValx2Reg[5]})
                                 : aValx2Reg[3]
                                     ? 2'h3
                                     : aValx2Reg[2] ? 2'h2 : {1'h0, aValx2Reg[1]}}}}}};	// src/main/scala/chisel3/util/CircuitMath.scala:28:8, :30:{10,12}, :33:17, :34:17, :35:22, :36:{10,21}, src/main/scala/chisel3/util/Counter.scala:61:40, :77:24, src/main/scala/nutcore/backend/fu/MDU.scala:73:16, :91:23, :92:28, :105:45
      state <= 3'h2;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :110:11
      cnt_value <=
        (|io_in_bits_1)
          ? (_canSkipShift_T_223 > 7'h3E ? 6'h3F : _canSkipShift_T_223[5:0])
          : 6'h0;	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/backend/fu/MDU.scala:81:18, :105:45, :109:{21,38,52}
    end
    else begin	// src/main/scala/nutcore/backend/fu/MDU.scala:97:22
      if (_GEN_0)	// src/main/scala/nutcore/backend/fu/MDU.scala:111:22
        state <= 3'h3;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :113:11
      else if (_GEN_1) begin	// src/main/scala/nutcore/backend/fu/MDU.scala:114:22
        if (&cnt_value)	// src/main/scala/chisel3/util/Counter.scala:61:40, :73:24
          state <= 3'h4;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :118:44
      end
      else if (state == 3'h4)	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22, :118:44, :119:22
        state <= 3'h0;	// src/main/scala/nutcore/backend/fu/MDU.scala:77:22
      if (_GEN_0 | ~_GEN_1) begin	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/backend/fu/MDU.scala:111:{22,35}, :114:{22,37}
      end
      else	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/backend/fu/MDU.scala:111:35, :114:37
        cnt_value <= cnt_value + 6'h1;	// src/main/scala/chisel3/util/Counter.scala:61:40, :77:24
    end
    if (~(newReq | _GEN)) begin	// src/main/scala/nutcore/backend/fu/MDU.scala:78:35, :83:21, :95:17, :97:{22,34}, :111:35
      if (_GEN_0)	// src/main/scala/nutcore/backend/fu/MDU.scala:111:22
        shiftReg <= {1'h0, {63'h0, aValx2Reg} << cnt_value};	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/backend/fu/MDU.scala:73:16, :83:21, :92:28, :112:{14,27}
      else if (_GEN_1) begin	// src/main/scala/nutcore/backend/fu/MDU.scala:114:22
        automatic logic enough;	// src/main/scala/nutcore/backend/fu/MDU.scala:115:28
        enough = shiftReg[128:64] >= {1'h0, bReg};	// src/main/scala/nutcore/backend/fu/MDU.scala:73:16, :83:21, :84:20, :91:23, :115:28
        shiftReg <=
          {enough ? shiftReg[127:64] - bReg : shiftReg[127:64], shiftReg[63:0], enough};	// src/main/scala/nutcore/backend/fu/MDU.scala:83:21, :84:20, :85:20, :91:23, :115:28, :116:{20,24,36}
      end
    end
    if (newReq) begin	// src/main/scala/nutcore/backend/fu/MDU.scala:78:35
      automatic logic aSign = io_in_bits_0[63] & io_sign;	// src/main/scala/nutcore/backend/fu/MDU.scala:72:{14,24}
      automatic logic bSign = io_in_bits_1[63] & io_sign;	// src/main/scala/nutcore/backend/fu/MDU.scala:72:{14,24}
      aSignReg <= aSign;	// src/main/scala/nutcore/backend/fu/MDU.scala:72:24, :89:27
      qSignReg <= (aSign ^ bSign) & (|io_in_bits_1);	// src/main/scala/nutcore/backend/fu/MDU.scala:72:24, :81:18, :90:{27,35,44}
      bReg <= bSign ? 64'h0 - io_in_bits_1 : io_in_bits_1;	// src/main/scala/nutcore/backend/fu/MDU.scala:72:24, :73:{12,16}, :81:18, :91:23
      aValx2Reg <= {aSign ? 64'h0 - io_in_bits_0 : io_in_bits_0, 1'h0};	// src/main/scala/nutcore/backend/fu/MDU.scala:72:24, :73:{12,16}, :81:18, :92:{28,32}
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
      automatic logic [31:0] _RANDOM[0:8];	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
        for (logic [3:0] i = 4'h0; i < 4'h9; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
        end	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
        state = _RANDOM[4'h0][2:0];	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :77:22
        shiftReg =
          {_RANDOM[4'h0][31:3],
           _RANDOM[4'h1],
           _RANDOM[4'h2],
           _RANDOM[4'h3],
           _RANDOM[4'h4][3:0]};	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :77:22, :83:21
        aSignReg = _RANDOM[4'h4][4];	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :83:21, :89:27
        qSignReg = _RANDOM[4'h4][5];	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :83:21, :90:27
        bReg = {_RANDOM[4'h4][31:6], _RANDOM[4'h5], _RANDOM[4'h6][5:0]};	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :83:21, :91:23
        aValx2Reg = {_RANDOM[4'h6][31:6], _RANDOM[4'h7], _RANDOM[4'h8][6:0]};	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :91:23, :92:28
        cnt_value = _RANDOM[4'h8][12:7];	// src/main/scala/chisel3/util/Counter.scala:61:40, src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :92:28
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_in_ready = io_in_ready_0;	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :78:23
  assign io_out_valid = state == 3'h4;	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :77:22, :118:44, :128:39
  assign io_out_bits =
    {aSignReg ? 64'h0 - shiftReg[128:65] : shiftReg[128:65],
     qSignReg ? 64'h0 - shiftReg[63:0] : shiftReg[63:0]};	// src/main/scala/nutcore/backend/fu/MDU.scala:68:7, :73:16, :81:18, :83:21, :84:20, :85:20, :89:27, :90:27, :123:13, :124:{17,28}, :125:{17,28}, :126:21
endmodule

