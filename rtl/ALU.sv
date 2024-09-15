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

module ALU(	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
  input         clock,	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
                reset,	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
                io_in_valid,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  input  [63:0] io_in_bits_src1,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
                io_in_bits_src2,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  input  [6:0]  io_in_bits_func,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  output        io_out_valid,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  output [63:0] io_out_bits,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  input  [63:0] io_cfIn_instr,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  input  [38:0] io_cfIn_pc,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
                io_cfIn_pnpc,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  input  [3:0]  io_cfIn_brIdx,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  output [38:0] io_redirect_target,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  output        io_redirect_valid,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  input  [63:0] io_offset,	// src/main/scala/nutcore/backend/fu/ALU.scala:76:14
  output        _WIRE_8__bore,
                _WIRE_9__bore,
                _WIRE_16__bore,
                _WIRE_7__bore,
                _WIRE_10__bore,
                _WIRE_6__bore,
                _WIRE_11__bore,
                _WIRE_1__bore,
                _WIRE_5__bore,
                _WIRE_12__bore,
                _WIRE_2__bore,
                _WIRE_4__bore,
                _WIRE_13__bore,
                _WIRE_3__bore,
                _WIRE_14__bore,
                _WIRE_15__bore,
                REG__bore_valid,
  output [38:0] REG__bore_pc,
  output        REG__bore_isMissPredict,
  output [38:0] REG__bore_actualTarget,
  output        REG__bore_actualTaken,
  output [6:0]  REG__bore_fuOpType,
  output [1:0]  REG__bore_btbType,
  output        REG__bore_isRVC
);

  wire [38:0]  io_redirect_target_0;	// src/main/scala/nutcore/backend/fu/ALU.scala:124:28
  wire [63:0]  _LogPerfHelper_timer;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire         _LogPerfHelper_logEnable;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
  wire [64:0]  _adderRes_T_3 =
    {1'h0, io_in_bits_src1} + {1'h0, io_in_bits_src2 ^ {64{~(io_in_bits_func[6])}}}
    + {64'h0, ~(io_in_bits_func[6])};	// src/main/scala/nutcore/backend/fu/ALU.scala:60:31, :87:20, :88:{24,33,39,60}
  wire [63:0]  xorRes = io_in_bits_src1 ^ io_in_bits_src2;	// src/main/scala/nutcore/backend/fu/ALU.scala:89:21
  wire         slt = xorRes[63] ^ ~(_adderRes_T_3[64]);	// src/main/scala/nutcore/backend/fu/ALU.scala:88:60, :89:21, :90:{14,23}, :91:{19,28}
  wire [63:0]  shsrc1 =
    io_in_bits_func == 7'h2D
      ? {{32{io_in_bits_src1[31]}}, io_in_bits_src1[31:0]}
      : io_in_bits_func == 7'h25 ? {32'h0, io_in_bits_src1[31:0]} : io_in_bits_src1;	// src/main/scala/nutcore/backend/fu/ALU.scala:94:35, src/main/scala/utils/BitUtils.scala:41:20, :42:{41,46}, :49:41, src/main/scala/utils/LookupTree.scala:29:28
  wire [5:0]   shamt =
    io_in_bits_func[5] ? {1'h0, io_in_bits_src2[4:0]} : io_in_bits_src2[5:0];	// src/main/scala/nutcore/backend/fu/ALU.scala:45:34, :87:20, :97:{18,49,77}
  wire [126:0] _res_T_1 = {63'h0, shsrc1} << shamt;	// src/main/scala/nutcore/backend/fu/ALU.scala:97:18, :99:33, src/main/scala/utils/BitUtils.scala:49:41, src/main/scala/utils/LookupTree.scala:29:28
  wire [63:0]  _GEN = {58'h0, shamt};	// src/main/scala/nutcore/backend/fu/ALU.scala:97:18, :103:32
  wire [63:0]  res =
    io_in_bits_func[3:0] == 4'hD
      ? $signed($signed(shsrc1) >>> _GEN)
      : io_in_bits_func[3:0] == 4'h7
          ? io_in_bits_src1 & io_in_bits_src2
          : io_in_bits_func[3:0] == 4'h6
              ? io_in_bits_src1 | io_in_bits_src2
              : io_in_bits_func[3:0] == 4'h5
                  ? shsrc1 >> _GEN
                  : io_in_bits_func[3:0] == 4'h4
                      ? xorRes
                      : io_in_bits_func[3:0] == 4'h3
                          ? {63'h0, ~(_adderRes_T_3[64])}
                          : io_in_bits_func[3:0] == 4'h2
                              ? {63'h0, slt}
                              : io_in_bits_func[3:0] == 4'h1
                                  ? _res_T_1[63:0]
                                  : _adderRes_T_3[63:0];	// src/main/scala/nutcore/backend/fu/ALU.scala:88:60, :89:21, :90:{14,23}, :91:28, :98:35, :99:{33,42}, :103:32, :104:30, :105:30, :106:39, src/main/scala/utils/BitUtils.scala:49:41, src/main/scala/utils/LookupTree.scala:29:28
  wire         taken =
    (io_in_bits_func[2:1] == 2'h0 & xorRes == 64'h0 | io_in_bits_func[2:1] == 2'h2 & slt
     | (&(io_in_bits_func[2:1])) & ~(_adderRes_T_3[64])) ^ io_in_bits_func[0];	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/backend/fu/ALU.scala:65:39, :66:40, :75:7, :88:{39,60}, :89:21, :90:{14,23}, :91:28, :111:56, :118:72, src/main/scala/utils/LookupTree.scala:24:34
  wire [38:0]  bpuUpdateReq_actualTarget =
    io_in_bits_func[3] ? {_adderRes_T_3[38:1], 1'h0} : io_cfIn_pc + io_offset[38:0];	// src/main/scala/nutcore/backend/fu/ALU.scala:63:35, :76:14, :87:20, :88:60, :119:{19,41,57}
  wire         _GEN_0 = taken | io_in_bits_func[3];	// src/main/scala/nutcore/backend/fu/ALU.scala:63:35, :118:72, :120:25
  wire         predictWrong =
    _GEN_0
      ? ~(io_cfIn_brIdx[0]) | io_redirect_target_0 != io_cfIn_pnpc
      : io_cfIn_brIdx[0];	// src/main/scala/nutcore/backend/fu/ALU.scala:120:{25,59,64,82,105}, :124:28
  assign io_redirect_target_0 =
    _GEN_0
      ? bpuUpdateReq_actualTarget
      : (&(io_cfIn_instr[1:0])) ? io_cfIn_pc + 39'h4 : io_cfIn_pc + 39'h2;	// src/main/scala/nutcore/backend/fu/ALU.scala:119:19, :120:25, :121:{29,35}, :124:{28,52,71,89}
  wire         bpuUpdateReq_valid = io_in_valid & io_in_bits_func[4];	// src/main/scala/nutcore/backend/fu/ALU.scala:62:31, :126:30
  wire         io_redirect_valid_0 = bpuUpdateReq_valid & predictWrong;	// src/main/scala/nutcore/backend/fu/ALU.scala:120:25, :126:{30,39}
  wire         _GEN_1 = io_in_bits_func == 7'h58 | io_in_bits_func == 7'h5C;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:{162,180,188}
  wire         _GEN_2 = io_in_bits_func == 7'h5A;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:214
  wire         _GEN_3 = io_in_bits_func == 7'h5E;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:239
  wire         _bpuUpdateReq_btbType_T_7 = io_in_bits_func == 7'h5E;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:239, src/main/scala/utils/LookupTree.scala:24:34
  wire         _bpuUpdateReq_btbType_T_18 = io_in_bits_func == 7'h58;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:162, src/main/scala/utils/LookupTree.scala:24:34
  wire         _bpuUpdateReq_btbType_T_9 = io_in_bits_func == 7'h5A;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:214, src/main/scala/utils/LookupTree.scala:24:34
  wire [1:0]   _GEN_4 = {1'h0, io_in_bits_func == 7'h5C};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/backend/fu/ALU.scala:87:20, :136:188, src/main/scala/utils/LookupTree.scala:24:34
  `ifndef SYNTHESIS	// src/main/scala/nutcore/backend/fu/ALU.scala:122:9
    always @(posedge clock) begin	// src/main/scala/nutcore/backend/fu/ALU.scala:122:9
      automatic logic _GEN_5 =
        (`PRINTF_COND_) & bpuUpdateReq_valid & _LogPerfHelper_logEnable & ~reset;	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/nutcore/backend/fu/ALU.scala:122:9, :126:30, src/main/scala/utils/Debug.scala:49:26
      if (~reset
          & ~((&(io_cfIn_instr[1:0])) | ~(&(io_cfIn_instr[1:0])) | ~io_in_valid)) begin	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :122:{9,29,50,53}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/nutcore/backend/fu/ALU.scala:122:9
          $error("Assertion failed\n    at ALU.scala:122 assert(io.cfIn.instr(1,0) === \"b11\".U || isRVC || !valid)\n");	// src/main/scala/nutcore/backend/fu/ALU.scala:122:9
        if (`STOP_COND_)	// src/main/scala/nutcore/backend/fu/ALU.scala:122:9
          $fatal;	// src/main/scala/nutcore/backend/fu/ALU.scala:122:9
      end
      if ((`PRINTF_COND_) & io_in_valid
          & (&(io_cfIn_instr[1:0])) != (&(io_cfIn_instr[1:0])) & _LogPerfHelper_logEnable
          & ~reset) begin	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :122:{9,29}, :123:51, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] ALU: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[ERROR] pc %x inst %x rvc %x\n", io_cfIn_pc, io_cfIn_instr,
                ~(&(io_cfIn_instr[1:0])));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, src/main/scala/utils/Debug.scala:49:26, :50:15
      end
      if (_GEN_5) begin	// src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] ALU: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "tgt %x, valid:%d, npc: %x, pdwrong: %x\n",
                io_redirect_target_0, io_redirect_valid_0, io_cfIn_pnpc, predictWrong);	// src/main/scala/nutcore/backend/fu/ALU.scala:120:25, :124:28, :126:39, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] ALU: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "taken:%d addrRes:%x src1:%x src2:%x func:%x\n", taken,
                _adderRes_T_3, io_in_bits_src1, io_in_bits_src2, io_in_bits_func);	// src/main/scala/nutcore/backend/fu/ALU.scala:88:60, :118:72, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] ALU: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "[BPW] pc %x tgt %x, npc: %x, pdwrong: %x type: %x%x%x%x\n",
                io_cfIn_pc, io_redirect_target_0, io_cfIn_pnpc, predictWrong,
                ~(io_in_bits_func[3]), _GEN_1, _GEN_2, _GEN_3);	// src/main/scala/nutcore/backend/fu/ALU.scala:63:{30,35}, :120:25, :124:28, :136:{180,214,239}, src/main/scala/utils/Debug.scala:49:26, :50:15
      end
      if ((`PRINTF_COND_) & _LogPerfHelper_logEnable & ~reset) begin	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/nutcore/backend/fu/ALU.scala:122:9, src/main/scala/utils/Debug.scala:49:26, :50:15
        $fwrite(32'h80000002, "[%d] ALU: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002, "valid:%d isBru:%d isBranch:%d \n", io_in_valid,
                io_in_bits_func[4], ~(io_in_bits_func[3]));	// src/main/scala/nutcore/backend/fu/ALU.scala:62:31, :63:{30,35}, src/main/scala/utils/Debug.scala:49:26, :50:15
      end
      if (_GEN_5) begin	// src/main/scala/utils/Debug.scala:49:26, :50:15
        automatic logic [1:0] _GEN_6 = _GEN_4 | {2{_bpuUpdateReq_btbType_T_7}};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/utils/LookupTree.scala:24:34
        $fwrite(32'h80000002, "[%d] ALU: ", _LogPerfHelper_timer);	// difftest/src/main/scala/common/LogPerfControl.scala:60:79, src/main/scala/utils/Debug.scala:49:26
        $fwrite(32'h80000002,
                " bpuUpdateReq: valid:%d pc:%x isMissPredict:%d actualTarget:%x actualTaken:%x fuOpType:%x btbType:%x isRVC:%d \n",
                bpuUpdateReq_valid, io_cfIn_pc, predictWrong, bpuUpdateReq_actualTarget,
                taken, io_in_bits_func,
                {_GEN_6[1] | _bpuUpdateReq_btbType_T_9,
                 _GEN_6[0] | _bpuUpdateReq_btbType_T_18}, ~(&(io_cfIn_instr[1:0])));	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/backend/fu/ALU.scala:118:72, :119:19, :120:25, :121:{29,35}, :126:30, src/main/scala/utils/Debug.scala:49:26, :50:15, src/main/scala/utils/LookupTree.scala:24:34
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg          REG_valid;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  reg  [38:0]  REG_pc;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  reg          REG_isMissPredict;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  reg  [38:0]  REG_actualTarget;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  reg          REG_actualTaken;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  reg  [6:0]   REG_fuOpType;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  reg  [1:0]   REG_btbType;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  reg          REG_isRVC;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
  wire         right = bpuUpdateReq_valid & ~predictWrong;	// src/main/scala/nutcore/backend/fu/ALU.scala:120:25, :126:30, :161:{32,35}
  wire         wrong = bpuUpdateReq_valid & predictWrong;	// src/main/scala/nutcore/backend/fu/ALU.scala:120:25, :126:30, :162:32
  wire         _GEN_7 = right & ~(io_in_bits_func[3]);	// src/main/scala/nutcore/backend/fu/ALU.scala:63:{30,35}, :161:32, :163:{35,42}
  wire         _GEN_8 = wrong & ~(io_in_bits_func[3]);	// src/main/scala/nutcore/backend/fu/ALU.scala:63:{30,35}, :162:32, :164:{35,42}
  wire         _GEN_9 = _GEN_8 & io_cfIn_pc[2:0] == 3'h0;	// src/main/scala/nutcore/backend/fu/ALU.scala:164:35, :165:{54,67,72}, src/main/scala/utils/LookupTree.scala:29:28
  wire         _GEN_10 = _GEN_9 & ~(&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :165:{35,54,82}
  wire         _GEN_11 = _GEN_9 & (&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :165:54, :166:{35,82}
  wire         _GEN_12 = _GEN_8 & io_cfIn_pc[2:0] == 3'h2;	// src/main/scala/nutcore/backend/fu/ALU.scala:164:35, :165:67, :167:{54,72}
  wire         _GEN_13 = _GEN_12 & ~(&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :167:{35,54,82}
  wire         _GEN_14 = _GEN_12 & (&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :167:54, :168:{35,82}
  wire         _GEN_15 = _GEN_8 & io_cfIn_pc[2:0] == 3'h4;	// src/main/scala/nutcore/backend/fu/ALU.scala:164:35, :165:67, :169:{54,72}, src/main/scala/utils/LookupTree.scala:29:28
  wire         _GEN_16 = _GEN_15 & ~(&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :169:{35,54,82}
  wire         _GEN_17 = _GEN_15 & (&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :169:54, :170:{35,82}
  wire         _GEN_18 = _GEN_8 & io_cfIn_pc[2:0] == 3'h6;	// src/main/scala/nutcore/backend/fu/ALU.scala:164:35, :165:67, :171:{54,72}, src/main/scala/utils/LookupTree.scala:29:28
  wire         _GEN_19 = _GEN_18 & ~(&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :171:{35,54,82}
  wire         _GEN_20 = _GEN_18 & (&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :171:54, :172:{35,82}
  wire         _GEN_21 = right & _GEN_1;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:180, :161:32, :173:{35,42}
  wire         _GEN_22 = wrong & _GEN_1;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:180, :162:32, :174:{35,42}
  wire         _GEN_23 = right & _GEN_2;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:214, :161:32, :175:{35,42}
  wire         _GEN_24 = wrong & _GEN_2;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:214, :162:32, :176:{35,42}
  wire         _GEN_25 = right & _GEN_3;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:239, :161:32, :177:{35,42}
  wire         _GEN_26 = wrong & _GEN_3;	// src/main/scala/nutcore/backend/fu/ALU.scala:136:239, :162:32, :178:{35,42}
  always @(posedge clock) begin	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
    automatic logic [1:0] _bpuUpdateReq_btbType_T_26 =
      _GEN_4 | {2{_bpuUpdateReq_btbType_T_7}};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/utils/LookupTree.scala:24:34
    REG_valid <= bpuUpdateReq_valid;	// src/main/scala/nutcore/backend/fu/ALU.scala:126:30, :159:34
    REG_pc <= io_cfIn_pc;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
    REG_isMissPredict <= predictWrong;	// src/main/scala/nutcore/backend/fu/ALU.scala:120:25, :159:34
    REG_actualTarget <= bpuUpdateReq_actualTarget;	// src/main/scala/nutcore/backend/fu/ALU.scala:119:19, :159:34
    REG_actualTaken <= taken;	// src/main/scala/nutcore/backend/fu/ALU.scala:118:72, :159:34
    REG_fuOpType <= io_in_bits_func;	// src/main/scala/nutcore/backend/fu/ALU.scala:159:34
    REG_btbType <=
      {_bpuUpdateReq_btbType_T_26[1] | _bpuUpdateReq_btbType_T_9,
       _bpuUpdateReq_btbType_T_26[0] | _bpuUpdateReq_btbType_T_18};	// src/main/scala/chisel3/util/Mux.scala:30:73, src/main/scala/nutcore/backend/fu/ALU.scala:159:34, src/main/scala/utils/LookupTree.scala:24:34
    REG_isRVC <= ~(&(io_cfIn_instr[1:0]));	// src/main/scala/nutcore/backend/fu/ALU.scala:121:{29,35}, :159:34
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
      automatic logic [31:0] _RANDOM[0:2];	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
        for (logic [1:0] i = 2'h0; i < 2'h3; i += 2'h1) begin
          _RANDOM[i] = `RANDOM;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
        end	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
        REG_valid = _RANDOM[2'h0][0];	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
        REG_pc = {_RANDOM[2'h0][31:1], _RANDOM[2'h1][7:0]};	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
        REG_isMissPredict = _RANDOM[2'h1][8];	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
        REG_actualTarget = {_RANDOM[2'h1][31:9], _RANDOM[2'h2][15:0]};	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
        REG_actualTaken = _RANDOM[2'h2][16];	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
        REG_fuOpType = _RANDOM[2'h2][23:17];	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
        REG_btbType = _RANDOM[2'h2][25:24];	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
        REG_isRVC = _RANDOM[2'h2][26];	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  LogPerfHelper LogPerfHelper (	// difftest/src/main/scala/common/LogPerfControl.scala:60:79
    .timer     (_LogPerfHelper_timer),
    .logEnable (_LogPerfHelper_logEnable),
    .clean     (/* unused */),
    .dump      (/* unused */)
  );
  assign io_out_valid = io_in_valid;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7
  assign io_out_bits =
    io_in_bits_func[4]
      ? ((&(io_cfIn_instr[1:0]))
           ? {{25{io_cfIn_pc[38]}}, io_cfIn_pc} + 64'h4
           : {{25{io_cfIn_pc[38]}}, io_cfIn_pc} + 64'h2)
      : io_in_bits_func[5] ? {{32{res[31]}}, res[31:0]} : res;	// src/main/scala/nutcore/backend/fu/ALU.scala:45:34, :62:31, :75:7, :108:{19,57}, :121:{29,35}, :132:{21,32,71,108}, src/main/scala/utils/BitUtils.scala:41:20, :42:46, src/main/scala/utils/LookupTree.scala:29:28
  assign io_redirect_target = io_redirect_target_0;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :124:28
  assign io_redirect_valid = io_redirect_valid_0;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :126:39
  assign _WIRE_8__bore = _GEN_17;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :170:35
  assign _WIRE_9__bore = _GEN_19;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :171:35
  assign _WIRE_16__bore = _GEN_26;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :178:35
  assign _WIRE_7__bore = _GEN_16;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :169:35
  assign _WIRE_10__bore = _GEN_20;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :172:35
  assign _WIRE_6__bore = _GEN_14;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :168:35
  assign _WIRE_11__bore = _GEN_21;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :173:35
  assign _WIRE_1__bore = _GEN_7;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :163:35
  assign _WIRE_5__bore = _GEN_13;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :167:35
  assign _WIRE_12__bore = _GEN_22;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :174:35
  assign _WIRE_2__bore = _GEN_8;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :164:35
  assign _WIRE_4__bore = _GEN_11;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :166:35
  assign _WIRE_13__bore = _GEN_23;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :175:35
  assign _WIRE_3__bore = _GEN_10;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :165:35
  assign _WIRE_14__bore = _GEN_24;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :176:35
  assign _WIRE_15__bore = _GEN_25;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :177:35
  assign REG__bore_valid = REG_valid;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
  assign REG__bore_pc = REG_pc;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
  assign REG__bore_isMissPredict = REG_isMissPredict;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
  assign REG__bore_actualTarget = REG_actualTarget;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
  assign REG__bore_actualTaken = REG_actualTaken;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
  assign REG__bore_fuOpType = REG_fuOpType;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
  assign REG__bore_btbType = REG_btbType;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
  assign REG__bore_isRVC = REG_isRVC;	// src/main/scala/nutcore/backend/fu/ALU.scala:75:7, :159:34
endmodule

