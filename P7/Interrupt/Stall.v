`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:36 11/26/2016 
// Design Name: 
// Module Name:    Stall 
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
module Stall(
	input [31:0] D,
	input [31:0] E,
	input [31:0] M,
	input Busy,
	input Start,
	output Stall
    );
	 //横行判断
	 wire is_cal_r_E,is_cal_i_E,is_load_E,is_MULTDIV_E,is_MT_E,is_MF_E,is_mfc0_E,is_mtc0_E;
	 wire is_load_M,is_mfc0_M,is_mtc0_M;
	 
	 //竖行判断
	 wire is_b_D,is_jandb_D,is_save_D,is_load_D,is_cal_r_D,is_cal_i_D,is_MT_D,is_MF_D,is_MULTDIV_D,is_eret_D;
	 
	 wire stall_b,stall_cal_r,stall_cal_i,stall_load,stall_save,stall_jandb,stall_MT,stall_MF,stall_MULTDIV,stall_ERET;
	 
	 assign is_cal_r_E= {E[`Opcode],E[`Funct]}==`ADD || {E[`Opcode],E[`Funct]}==`ADDU || {E[`Opcode],E[`Funct]}==`SUB || {E[`Opcode],E[`Funct]}==`SUBU ||
 {E[`Opcode],E[`Funct]}==`SLL || {E[`Opcode],E[`Funct]}==`SRL || {E[`Opcode],E[`Funct]}==`SRA || {E[`Opcode],E[`Funct]}==`SLLV || {E[`Opcode],E[`Funct]}==`SRLV ||
 {E[`Opcode],E[`Funct]}==`SRAV || {E[`Opcode],E[`Funct]}==`AND || {E[`Opcode],E[`Funct]}==`OR || {E[`Opcode],E[`Funct]}==`XOR || {E[`Opcode],E[`Funct]}==`NOR
  || {E[`Opcode],E[`Funct]}==`SLT || {E[`Opcode],E[`Funct]}==`SLTU;//R类型
	 assign is_cal_i_E= E[`Opcode]==`ADDI || E[`Opcode]==`ADDIU || E[`Opcode]==`ANDI || E[`Opcode]==`ORI || E[`Opcode]==`XORI || 
	 E[`Opcode]==`LUI || E[`Opcode]==`SLTI || E[`Opcode]==`SLTIU ;//I类型
	 assign is_load_E= E[`Opcode]==`LB || E[`Opcode]==`LBU || E[`Opcode]==`LH || E[`Opcode]==`LHU || E[`Opcode]==`LW ; //load
	 assign is_MULTDIV_E= {E[`Opcode],E[`Funct]}==`MULT || {E[`Opcode],E[`Funct]}==`MULTU || {E[`Opcode],E[`Funct]}==`DIV || {E[`Opcode],E[`Funct]}==`DIVU ;//mult or div
	 assign is_MT_E= {E[`Opcode],E[`Funct]}==`MTHI || {E[`Opcode],E[`Funct]}==`MTLO ;//MT
	 assign is_MF_E= {E[`Opcode],E[`Funct]}==`MFHI || {E[`Opcode],E[`Funct]}==`MFLO ;//MF
	 assign is_mfc0_E= {E[`Opcode],E[25:21]}==`MFC0; //MFC0
	 assign is_mtc0_E={E[`Opcode],E[25:21]}==`MTC0; //MTC0
	 assign is_load_M= M[`Opcode]==`LB || M[`Opcode]==`LBU || M[`Opcode]==`LH || M[`Opcode]==`LHU || M[`Opcode]==`LW ; //load
	 assign is_mfc0_M= {M[`Opcode],M[25:21]}==`MFC0; //MFC0
	 assign is_mtc0_M={M[`Opcode],M[25:21]}==`MTC0; //MTC0
	 assign is_b_D= D[`Opcode]==`BEQ || D[`Opcode]==`BNE ;//beq or bne
	 assign is_jandb_D= D[`Opcode]==`BLEZ || D[`Opcode]==`BGTZ || {D[`Opcode],D[20:16]}==`BLTZ || {D[`Opcode],D[20:16]}==`BGEZ ||
	 {D[`Opcode],D[`Funct]}==`JR || {D[`Opcode],D[`Funct]}==`JALR ;//jandb
	 assign is_save_D= D[`Opcode]==`SB || D[`Opcode]==`SH || D[`Opcode]==`SW ;//save
	 assign is_load_D= D[`Opcode]==`LB || D[`Opcode]==`LBU || D[`Opcode]==`LH || D[`Opcode]==`LHU || D[`Opcode]==`LW ; //load
	 assign is_cal_r_D= {D[`Opcode],D[`Funct]}==`ADD || {D[`Opcode],D[`Funct]}==`ADDU || {D[`Opcode],D[`Funct]}==`SUB || {D[`Opcode],D[`Funct]}==`SUBU ||
 {D[`Opcode],D[`Funct]}==`SLL || {D[`Opcode],D[`Funct]}==`SRL || {D[`Opcode],D[`Funct]}==`SRA || {D[`Opcode],D[`Funct]}==`SLLV || {D[`Opcode],D[`Funct]}==`SRLV ||
 {D[`Opcode],D[`Funct]}==`SRAV || {D[`Opcode],D[`Funct]}==`AND || {D[`Opcode],D[`Funct]}==`OR || {D[`Opcode],D[`Funct]}==`XOR || {D[`Opcode],D[`Funct]}==`NOR
  || {D[`Opcode],D[`Funct]}==`SLT || {D[`Opcode],D[`Funct]}==`SLTU;//R类型
	 assign is_cal_i_D= D[`Opcode]==`ADDI || D[`Opcode]==`ADDIU || D[`Opcode]==`ANDI || D[`Opcode]==`ORI || D[`Opcode]==`XORI || 
	 D[`Opcode]==`LUI || D[`Opcode]==`SLTI || D[`Opcode]==`SLTIU ;//I类型
	 assign is_MT_D= {D[`Opcode],D[`Funct]}==`MTHI || {D[`Opcode],D[`Funct]}==`MTLO ;//MT
	 assign is_MF_D= {D[`Opcode],D[`Funct]}==`MFHI || {D[`Opcode],D[`Funct]}==`MFLO ;//MF
	 assign is_MULTDIV_D= {D[`Opcode],D[`Funct]}==`MULT || {D[`Opcode],D[`Funct]}==`MULTU || {D[`Opcode],D[`Funct]}==`DIV || {D[`Opcode],D[`Funct]}==`DIVU ;//mult or div
	 assign is_eret_D= {D[`Opcode],D[`Funct]}==`ERET;//ERET
	 
	 //对于b指令，如果比较的两个寄存器编号相同，则不需要暂停
	 assign stall_b= is_b_D && D[`rs]!=D[`rt] && ( (is_cal_r_E && (D[`rs]==E[`rd] || D[`rt]==E[`rd]) && E[`rd]!=5'b00000 ) || 
	 (is_cal_i_E && (D[`rs]==E[`rt] || D[`rt]==E[`rt]) && E[`rt]!=5'b00000 ) || (is_load_E && (D[`rs]==E[`rt] || D[`rt]==E[`rt]) && E[`rt]!=5'b00000 ) ||
	 (is_MF_E && (D[`rs]==E[`rd] || D[`rt]==E[`rd]) && E[`rd]!=5'b00000 ) || (is_mfc0_E && (D[`rs]==E[`rt] || D[`rt]==E[`rt]) && E[`rt]!=5'b00000 ) || 
	 (is_load_M && (D[`rs]==M[`rt] || D[`rt]==M[`rt]) && M[`rt]!=5'b00000 ) || (is_mfc0_M && (D[`rs]==M[`rt] || D[`rt]==M[`rt]) && M[`rt]!=5'b00000 ) );
	 assign stall_cal_r= is_cal_r_D && ( (is_load_E && (D[`rs]==E[`rt] || D[`rt]==E[`rt]) && E[`rt]!=5'b00000) || (is_mfc0_E && (D[`rs]==E[`rt] || D[`rt]==E[`rt]) && E[`rt]!=5'b00000 )) ;
	 assign stall_cal_i= is_cal_i_D && ( (is_load_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000) || (is_mfc0_E && D[`rs]==E[`rt]  && E[`rt]!=5'b00000 ));
	 assign stall_load= is_load_D && ( (is_load_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000) || (is_mfc0_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000 ));
	 assign stall_save= is_save_D && ( (is_load_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000) || (is_mfc0_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000 ));
	 assign stall_jandb= is_jandb_D && ( (is_cal_r_E && D[`rs]==E[`rd] && E[`rd]!=5'b00000) ||
	 (is_cal_i_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000 ) || (is_load_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000 ) || 
	 (is_mfc0_E && D[`rs]==E[`rt]  && E[`rt]!=5'b00000 ) || (is_load_M && D[`rs]==M[`rt] && M[`rt]!=5'b00000 ) || 
	 (is_MF_E && D[`rs]==E[`rd] && E[`rd]!=5'b00000) || (is_mfc0_M && D[`rs]==M[`rt] && M[`rt]!=5'b00000 ) );
	 assign stall_MT= is_MT_D && ( (is_load_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000) || (is_mfc0_E && D[`rs]==E[`rt] && E[`rt]!=5'b00000) || ( Busy || Start));
	 assign stall_MF= is_MF_D && (Busy || Start);//判断与Busy和Start有关,不要写is_MULTDIV_E判断
	 assign stall_MULTDIV= is_MULTDIV_D && ( (is_load_E && (D[`rs]==E[`rt] || D[`rt]==E[`rt]) && E[`rt]!=5'b00000) || (is_mfc0_E && (D[`rs]==E[`rt] || D[`rt]==E[`rt]) && E[`rt]!=5'b00000) 
	 || ( Busy || Start) );
	 assign stall_ERET=is_eret_D && ( (is_mtc0_E && E[`rd]==5'b01110 ) || (is_mtc0_M && M[`rd]==5'b01110 ) );//这种情况应该不会出现
	 assign Stall=stall_b || stall_cal_r || stall_cal_i || stall_load || stall_save || stall_jandb || stall_MT || stall_MF || stall_MULTDIV || stall_ERET;
		
endmodule
