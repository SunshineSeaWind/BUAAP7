`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:28 11/23/2016 
// Design Name: 
// Module Name:    Controller 
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
`define Opcode 31:26
`define Funct 5:0 
//CP0相关指令
`define MFC0 11'b01000000000
`define MTC0 11'b01000000100
`define ERET 12'b010000011000

module Controller(
	 input [31:0] Ins,
    output [1:0] RegDst,
    output ALUSrc,
	 output [1:0] MemtoReg,
    output RegWrite,
	 output MemWrite,
	 output [2:0] Br,
    output [1:0] ExtOp,
    output [3:0] ALUCtr,
	 output [1:0] JPC,
	 output [2:0] MULTDIV,
	 output [1:0] HIorLO,
	 output CP0Write
	// output Exception
    );
	 wire add,addu,sub,subu,sll,srl,sra,sllv,srlv,srav,Rand,Ror,Rxor,Rnor,slt,sltu,mfhi,mflo,mthi,mtlo,addi,addiu,andi,ori,xori,
	 lui,slti,sltiu,lb,lbu,lh,lhu,lw,sb,sh,sw,beq,bne,blez,bgtz,bltz,bgez,j,jal,jr,jalr,mult,multu,div,divu,mfc0,mtc0,eret;
	 assign add= {Ins[`Opcode],Ins[`Funct]}==`ADD;
	 assign addu= {Ins[`Opcode],Ins[`Funct]}==`ADDU;
	 assign sub= {Ins[`Opcode],Ins[`Funct]}==`SUB;
	 assign subu= {Ins[`Opcode],Ins[`Funct]}==`SUBU;
	 assign sll= {Ins[`Opcode],Ins[`Funct]}==`SLL;
	 assign srl= {Ins[`Opcode],Ins[`Funct]}==`SRL;
	 assign sra= {Ins[`Opcode],Ins[`Funct]}==`SRA;
	 assign sllv= {Ins[`Opcode],Ins[`Funct]}==`SLLV;
	 assign srlv= {Ins[`Opcode],Ins[`Funct]}==`SRLV;
	 assign srav= {Ins[`Opcode],Ins[`Funct]}==`SRAV;
	 assign Rand= {Ins[`Opcode],Ins[`Funct]}==`AND;
	 assign Ror= {Ins[`Opcode],Ins[`Funct]}==`OR;
	 assign Rxor= {Ins[`Opcode],Ins[`Funct]}==`XOR;
	 assign Rnor= {Ins[`Opcode],Ins[`Funct]}==`NOR;
	 assign slt= {Ins[`Opcode],Ins[`Funct]}==`SLT;
	 assign sltu= {Ins[`Opcode],Ins[`Funct]}==`SLTU;
	 assign mfhi= {Ins[`Opcode],Ins[`Funct]}==`MFHI;
	 assign mflo= {Ins[`Opcode],Ins[`Funct]}==`MFLO;
	 assign mthi= {Ins[`Opcode],Ins[`Funct]}==`MTHI;
	 assign mtlo= {Ins[`Opcode],Ins[`Funct]}==`MTLO;
	 
	 assign addi= Ins[`Opcode]==`ADDI;
	 assign addiu= Ins[`Opcode]==`ADDIU;
	 assign andi= Ins[`Opcode]==`ANDI;
	 assign ori= Ins[`Opcode]==`ORI;
	 assign xori= Ins[`Opcode]==`XORI;
	 assign lui= Ins[`Opcode]==`LUI;
	 assign slti= Ins[`Opcode]==`SLTI;
	 assign sltiu= Ins[`Opcode]==`SLTIU;
	 
	 assign mult= {Ins[`Opcode],Ins[`Funct]}==`MULT;
	 assign multu= {Ins[`Opcode],Ins[`Funct]}==`MULTU;
	 assign div= {Ins[`Opcode],Ins[`Funct]}==`DIV;
	 assign divu= {Ins[`Opcode],Ins[`Funct]}==`DIVU;
	 
	 assign lb= Ins[`Opcode]==`LB;
	 assign lbu= Ins[`Opcode]==`LBU;
	 assign lh= Ins[`Opcode]==`LH;
	 assign lhu= Ins[`Opcode]==`LHU;
	 assign lw= Ins[`Opcode]==`LW;
	 
	 assign sb= Ins[`Opcode]==`SB;
	 assign sh= Ins[`Opcode]==`SH;
	 assign sw= Ins[`Opcode]==`SW;
	 
	 assign beq= Ins[`Opcode]==`BEQ;
	 assign bne= Ins[`Opcode]==`BNE;
	 assign blez= Ins[`Opcode]==`BLEZ;
	 assign bgtz= Ins[`Opcode]==`BGTZ;
	 assign bltz= {Ins[`Opcode],Ins[20:16]}==`BLTZ;
	 assign bgez= {Ins[`Opcode],Ins[20:16]}==`BGEZ;
	 
	 assign j= Ins[`Opcode]==`J;
	 assign jal= Ins[`Opcode]==`JAL;
	 assign jr= {Ins[`Opcode],Ins[`Funct]}==`JR;
	 assign jalr= {Ins[`Opcode],Ins[`Funct]}==`JALR;
	 
	 assign mfc0={Ins[`Opcode],Ins[25:21]}==`MFC0;
	 assign mtc0={Ins[`Opcode],Ins[25:21]}==`MTC0;
	 assign eret= {Ins[`Opcode],Ins[`Funct]}==`ERET;
	 
	assign RegDst={jal,add || addu || sub || subu || sll || srl ||	sra || sllv || srlv || srav  || Rand || Ror
	|| Rxor || Rnor || slt || sltu || mfhi || mflo || jalr};
	
	assign ALUSrc= addi || addiu || andi || ori || xori || lui || slti || sltiu || lb || lbu || lh || lhu || lw || sb || sh || sw;
	
	assign MemtoReg={jal || jalr || mfc0, lb || lbu || lh || lhu || lw || mfc0};
	
	assign RegWrite=add || addu || sub || subu || sll || srl || sra || sllv || srlv || srav || Rand || Ror
	|| Rxor || Rnor || slt || sltu || mfhi || mflo || addi || addiu || andi || ori || xori || lui || slti || sltiu
	|| lb || lbu || lh || lhu || lw || jal || jalr || mfc0;
	
	assign MemWrite=sb || sh || sw;
	
	assign Br={bgtz || bltz || bgez, bne || blez || bgez, beq || blez || bltz};
	
	assign ExtOp={lui, andi || ori || xori};
	
	assign ALUCtr={Rand || Ror || Rxor || Rnor || slt || sltu || andi || ori || xori || lui || slti || sltiu , sra || sllv || srlv || srav || slt || sltu || slti || sltiu,
	sll || srl || srlv || srav || Rxor || Rnor || xori, sub || subu || srl || sllv || srav || Ror || Rnor || sltu || ori || lui || sltiu };
	
	
	assign JPC={jr || jalr || eret, beq || bne || blez || bgtz || bltz || bgez || j || jal || eret};
	
	assign MULTDIV={mthi || mtlo || divu, mthi || multu || div, mtlo || mult || div};
	
	assign HIorLO={mflo, mfhi};
	
	assign CP0Write=mtc0;

endmodule
