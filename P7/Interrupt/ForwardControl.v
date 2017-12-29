`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:22 11/24/2016 
// Design Name: 
// Module Name:    ForwardControl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//save类
`define SB 6'b101000
`define SH 6'b101001
`define SW 6'b101011
//load类
`define LB 6'b100000
`define LBU 6'b100100
`define LH 6'b100001
`define LHU 6'b100101
`define LW 6'b100011
//b类型
`define BEQ 6'b000100
`define BNE 6'b000101
`define BLEZ 6'b000110
`define BGTZ 6'b000111
`define BLTZ 11'b00000100000
`define BGEZ 11'b00000100001
//j类型
`define J 6'b000010
`define JAL 6'b000011
`define JR 12'b000000001000
`define JALR 12'b000000001001
//R类型
`define ADD 12'b000000100000
`define ADDU 12'b000000100001
`define SUB 12'b000000100010
`define SUBU 12'b000000100011
`define SLL 12'b000000000000
`define SRL 12'b000000000010
`define SRA 12'b000000000011
`define SLLV 12'b000000000100
`define SRLV 12'b000000000110
`define SRAV 12'b000000000111
`define AND 12'b000000100100
`define OR 12'b000000100101
`define XOR 12'b000000100110
`define NOR 12'b000000100111
`define SLT 12'b000000101010
`define SLTU 12'b000000101011
//MF类型
`define MFHI 12'b000000010000
`define MFLO 12'b000000010010
//MT类型
`define MTHI 12'b000000010001
`define MTLO 12'b000000010011
//I类型
`define ADDI 6'b001000
`define ADDIU 6'b001001
`define ANDI 6'b001100
`define ORI 6'b001101
`define XORI 6'b001110
`define LUI 6'b001111
`define SLTI 6'b001010
`define SLTIU 6'b001011
//MULT/DIV类型
`define MULT 12'b000000011000
`define MULTU 12'b000000011001
`define DIV 12'b000000011010
`define DIVU 12'b000000011011
//CP0相关指令
`define MFC0 11'b01000000000
`define MTC0 11'b01000000100
`define ERET 12'b010000011000

`define Opcode 31:26
`define Funct 5:0 
`define rs 25:21
`define rt 20:16
`define rd 15:11
module ForwardControl(
	input [31:0] D,
	input [31:0] E,
	input [31:0] M,
	input [31:0] W,
	output [1:0] ForwardRSD,
	output [1:0] ForwardRTD,
	output [1:0] ForwardRSE,
	output [1:0] ForwardRTE,
	output ForwardRTM
    );
	 //横行判断
	 wire is_jal_E,is_jalr_E;
	 wire is_cal_r_M,is_MULTDIV_M,is_MT_M,is_MF_M,is_cal_i_M,is_jal_M,is_jalr_M;
	 wire is_cal_r_W,is_MULTDIV_W,is_MT_W,is_MF_W,is_cal_i_W,is_load_W,is_jal_W,is_jalr_W;
	 wire is_mfc0_W;
	 
	 wire RSD,RTD,RSE,RTE,RTM;
	 
	 //竖行判断
	 wire is_jandb_D,is_b_D;
	 wire is_cal_r_E,is_cal_i_E,is_load_E,is_save_E,is_MULTDIV_E,is_MT_E,is_mtc0_E;
	 wire is_mtc0_M;
	 wire is_save_M;
	 
	 assign is_jal_E= E[`Opcode]==`JAL; //jal
	 assign is_jalr_E= {E[`Opcode],E[`Funct]}==`JALR;//jalr
	 assign is_cal_r_M= {M[`Opcode],M[`Funct]}==`ADD || {M[`Opcode],M[`Funct]}==`ADDU || {M[`Opcode],M[`Funct]}==`SUB || {M[`Opcode],M[`Funct]}==`SUBU ||
 {M[`Opcode],M[`Funct]}==`SLL || {M[`Opcode],M[`Funct]}==`SRL || {M[`Opcode],M[`Funct]}==`SRA || {M[`Opcode],M[`Funct]}==`SLLV || {M[`Opcode],M[`Funct]}==`SRLV ||
 {M[`Opcode],M[`Funct]}==`SRAV || {M[`Opcode],M[`Funct]}==`AND || {M[`Opcode],M[`Funct]}==`OR || {M[`Opcode],M[`Funct]}==`XOR || {M[`Opcode],M[`Funct]}==`NOR
  || {M[`Opcode],M[`Funct]}==`SLT || {M[`Opcode],M[`Funct]}==`SLTU;//R类型
	 assign is_MULTDIV_M= {M[`Opcode],M[`Funct]}==`MULT || {M[`Opcode],M[`Funct]}==`MULTU || {M[`Opcode],M[`Funct]}==`DIV || {M[`Opcode],M[`Funct]}==`DIVU ;//mult or div
	 assign is_MT_M= {M[`Opcode],M[`Funct]}==`MTHI || {M[`Opcode],M[`Funct]}==`MTLO ;//MT
	 assign is_MF_M= {M[`Opcode],M[`Funct]}==`MFHI || {M[`Opcode],M[`Funct]}==`MFLO ;//MF
	 assign is_cal_i_M= M[`Opcode]==`ADDI || M[`Opcode]==`ADDIU || M[`Opcode]==`ANDI || M[`Opcode]==`ORI || M[`Opcode]==`XORI || 
	 M[`Opcode]==`LUI || M[`Opcode]==`SLTI || M[`Opcode]==`SLTIU ;//I类型
	 assign is_jal_M= M[`Opcode]==`JAL;
	 assign is_jalr_M= {M[`Opcode],M[`Funct]}==`JALR;
	 assign is_cal_r_W= {W[`Opcode],W[`Funct]}==`ADD || {W[`Opcode],W[`Funct]}==`ADDU || {W[`Opcode],W[`Funct]}==`SUB || {W[`Opcode],W[`Funct]}==`SUBU ||
 {W[`Opcode],W[`Funct]}==`SLL || {W[`Opcode],W[`Funct]}==`SRL || {W[`Opcode],W[`Funct]}==`SRA || {W[`Opcode],W[`Funct]}==`SLLV || {W[`Opcode],W[`Funct]}==`SRLV ||
 {W[`Opcode],W[`Funct]}==`SRAV || {W[`Opcode],W[`Funct]}==`AND || {W[`Opcode],W[`Funct]}==`OR || {W[`Opcode],W[`Funct]}==`XOR || {W[`Opcode],W[`Funct]}==`NOR
  || {W[`Opcode],W[`Funct]}==`SLT || {W[`Opcode],W[`Funct]}==`SLTU;//R类型
	 assign is_MULTDIV_W= {W[`Opcode],W[`Funct]}==`MULT || {W[`Opcode],W[`Funct]}==`MULTU || {W[`Opcode],W[`Funct]}==`DIV || {W[`Opcode],W[`Funct]}==`DIVU ;//mult or div
	 assign is_MT_W= {W[`Opcode],W[`Funct]}==`MTHI || {W[`Opcode],W[`Funct]}==`MTLO ;//MT
	 assign is_MF_W= {W[`Opcode],W[`Funct]}==`MFHI || {W[`Opcode],W[`Funct]}==`MFLO ;//MF 
	 assign is_cal_i_W= W[`Opcode]==`ADDI || W[`Opcode]==`ADDIU || W[`Opcode]==`ANDI || W[`Opcode]==`ORI || W[`Opcode]==`XORI || 
	 W[`Opcode]==`LUI || W[`Opcode]==`SLTI || W[`Opcode]==`SLTIU ;//I类型
	 assign is_load_W= W[`Opcode]==`LB || W[`Opcode]==`LBU || W[`Opcode]==`LH || W[`Opcode]==`LHU || W[`Opcode]==`LW ; //load
	 assign is_jal_W= W[`Opcode]==`JAL; //jal
	 assign is_jalr_W= {W[`Opcode],W[`Funct]}==`JALR; //jalr
	 assign is_mfc0_W= {W[`Opcode],W[25:21]}==`MFC0; //MFC0
	 
	 assign is_jandb_D= D[`Opcode]==`BLEZ || D[`Opcode]==`BGTZ || {D[`Opcode],D[20:16]}==`BLTZ || {D[`Opcode],D[20:16]}==`BGEZ ||
	 {D[`Opcode],D[`Funct]}==`JR || {D[`Opcode],D[`Funct]}==`JALR ;//jandb
	 assign is_b_D= D[`Opcode]==`BEQ || D[`Opcode]==`BNE ;//beq or bne
	 assign is_cal_r_E= {E[`Opcode],E[`Funct]}==`ADD || {E[`Opcode],E[`Funct]}==`ADDU || {E[`Opcode],E[`Funct]}==`SUB || {E[`Opcode],E[`Funct]}==`SUBU ||
 {E[`Opcode],E[`Funct]}==`SLL || {E[`Opcode],E[`Funct]}==`SRL || {E[`Opcode],E[`Funct]}==`SRA || {E[`Opcode],E[`Funct]}==`SLLV || {E[`Opcode],E[`Funct]}==`SRLV ||
 {E[`Opcode],E[`Funct]}==`SRAV || {E[`Opcode],E[`Funct]}==`AND || {E[`Opcode],E[`Funct]}==`OR || {E[`Opcode],E[`Funct]}==`XOR || {E[`Opcode],E[`Funct]}==`NOR
  || {E[`Opcode],E[`Funct]}==`SLT || {E[`Opcode],E[`Funct]}==`SLTU;//R类型
	 assign is_cal_i_E= E[`Opcode]==`ADDI || E[`Opcode]==`ADDIU || E[`Opcode]==`ANDI || E[`Opcode]==`ORI || E[`Opcode]==`XORI || 
	 E[`Opcode]==`LUI || E[`Opcode]==`SLTI || E[`Opcode]==`SLTIU ;//I类型
	 assign is_load_E= E[`Opcode]==`LB || E[`Opcode]==`LBU || E[`Opcode]==`LH || E[`Opcode]==`LHU || E[`Opcode]==`LW ; //load
	 assign is_save_E= E[`Opcode]==`SB || E[`Opcode]==`SH || E[`Opcode]==`SW ;//save
	 assign is_mtc0_E={E[`Opcode],E[25:21]}==`MTC0; //MTC0
	 assign is_MULTDIV_E= {E[`Opcode],E[`Funct]}==`MULT || {E[`Opcode],E[`Funct]}==`MULTU || {E[`Opcode],E[`Funct]}==`DIV || {E[`Opcode],E[`Funct]}==`DIVU ;//mult or div
	 assign is_MT_E= {E[`Opcode],E[`Funct]}==`MTHI || {E[`Opcode],E[`Funct]}==`MTLO ;//MT
	 assign is_mtc0_M={M[`Opcode],M[25:21]}==`MTC0; //MTC0
	 assign is_save_M= M[`Opcode]==`SB || M[`Opcode]==`SH || M[`Opcode]==`SW ;//save
	 
	 assign RSD= is_b_D || is_jandb_D;
	 assign RTD= is_b_D;
	 assign RSE= is_cal_r_E || is_cal_i_E || is_load_E || is_save_E || is_MULTDIV_E || is_MT_E;
	 assign RTE= is_cal_r_E || is_MULTDIV_E || is_save_E || is_mtc0_E;
	 assign RTM= is_save_M || is_mtc0_M;
	 
	 assign ForwardRSD=
	 ( RSD && is_jal_E && D[`rs]==5'b11111 ) ? 2'b01 : 
	 ( RSD && is_jalr_E && D[`rs]==E[`rd] && E[`rd]!=5'b00000) ? 2'b01 : 
	 ( RSD && is_cal_r_M && D[`rs]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b10 :
	 ( RSD && is_cal_i_M && D[`rs]==M[`rt] && M[`rt]!=5'b00000 ) ? 2'b10 :
	 ( RSD && is_MF_M && D[`rs]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b10 :
	 ( RSD && is_jal_M && D[`rs]==5'b11111 ) ? 2'b11 :
	 ( RSD && is_jalr_M && D[`rs]==M[`rd] && M[`rd]!=5'b00000) ? 2'b11 : 2'b00;
	 
	 assign ForwardRTD=
	 ( RTD && is_jal_E && D[`rt]==5'b11111 ) ? 2'b01 : 
	 ( RTD && is_jalr_E && D[`rt]==E[`rd] && E[`rd]!=5'b00000) ? 2'b01 : 
	 ( RTD && is_cal_r_M && D[`rt]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b10 :
	 ( RTD && is_cal_i_M && D[`rt]==M[`rt] && M[`rt]!=5'b00000 ) ? 2'b10 :
	 ( RTD && is_MF_M && D[`rt]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b10 :
	 ( RTD && is_jal_M && D[`rt]==5'b11111 ) ? 2'b11 :
	 ( RTD && is_jalr_M && D[`rt]==M[`rd] && M[`rd]!=5'b00000) ? 2'b11 : 2'b00;
	 
	 assign ForwardRSE= 
	 ( RSE && is_cal_r_M && E[`rs]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b01 :
	 ( RSE && is_cal_i_M && E[`rs]==M[`rt]  && M[`rt]!=5'b00000 ) ? 2'b01 :
	 ( RSE && is_MF_M && E[`rs]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b01 :
	 ( RSE && is_jal_M && E[`rs]==5'b11111 ) ? 2'b10 :
	 ( RSE && is_jalr_M && E[`rs]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b10 :
	 ( RSE && is_cal_r_W && E[`rs]==W[`rd] && W[`rd]!=5'b00000 ) ? 2'b11 :
	 ( RSE && is_cal_i_W && E[`rs]==W[`rt] && W[`rt]!=5'b00000 ) ? 2'b11 :
	 ( RSE && is_MF_W && E[`rs]==W[`rd] && W[`rd]!=5'b00000 ) ? 2'b11 :
	 ( RSE && is_load_W && E[`rs]==W[`rt] && W[`rt]!=5'b00000 ) ? 2'b11 :
	 ( RSE && is_jal_W && E[`rs]==5'b11111 ) ? 2'b11 : 
	 ( RSE && is_jalr_W && E[`rs]==W[`rd] && W[`rd]!=5'b00000) ? 2'b11 : 
	 ( RSE && is_mfc0_W && E[`rs]==W[`rt] && W[`rt]!=5'b00000) ? 2'b11 : 2'b00;
	 
	 assign ForwardRTE= 
	 ( RTE && is_cal_r_M && E[`rt]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b01 :
	 ( RTE && is_cal_i_M && E[`rt]==M[`rt]  && M[`rt]!=5'b00000 ) ? 2'b01 :
	 ( RTE && is_MF_M && E[`rt]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b01 :
	 ( RTE && is_jal_M && E[`rt]==5'b11111 ) ? 2'b10 :
	 ( RTE && is_jalr_M && E[`rt]==M[`rd] && M[`rd]!=5'b00000 ) ? 2'b10 :
	 ( RTE && is_cal_r_W && E[`rt]==W[`rd] && W[`rd]!=5'b00000 ) ? 2'b11 :
	 ( RTE && is_cal_i_W && E[`rt]==W[`rt] && W[`rt]!=5'b00000 ) ? 2'b11 :
	 ( RTE && is_MF_W && E[`rt]==W[`rd] && W[`rd]!=5'b00000 ) ? 2'b11 :
	 ( RTE && is_load_W && E[`rt]==W[`rt] && W[`rt]!=5'b00000 ) ? 2'b11 :
	 ( RTE && is_jal_W && E[`rt]==5'b11111 ) ? 2'b11 : 
	 ( RTE && is_jalr_W && E[`rt]==W[`rd] && W[`rd]!=5'b00000) ? 2'b11 : 
	 ( RTE && is_mfc0_W && E[`rt]==W[`rt] && W[`rt]!=5'b00000) ? 2'b11 : 2'b00;
	 
	 assign ForwardRTM=
	 ( RTM && is_cal_r_W && M[`rt]==W[`rd] && W[`rd]!=5'b00000 ) ? 1'b1 :
	 ( RTM && is_cal_i_W && M[`rt]==W[`rt] && W[`rt]!=5'b00000 ) ? 1'b1 :
	 ( RTM && is_MF_W && M[`rt]==W[`rd] && W[`rd]!=5'b00000 ) ? 1'b1 :
	 ( RTM && is_load_W  && M[`rt]==W[`rt] && W[`rt]!=5'b00000 ) ? 1'b1 :
	 ( RTM && is_jal_W && M[`rt]==5'b11111 ) ? 1'b1 : 
	 ( RTM && is_jalr_W && M[`rt]==W[`rd] && W[`rd]!=5'b00000 ) ? 1'b1 : 
	 ( RTM && is_mfc0_W && M[`rt]==W[`rt] && W[`rt]!=5'b00000 ) ? 1'b1 : 1'b0;
	 
endmodule
