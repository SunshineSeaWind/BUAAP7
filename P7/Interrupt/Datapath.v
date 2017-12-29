`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:21 11/24/2016 
// Design Name: 
// Module Name:    Datapath 
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
//include
`include "PC.v"
`include "MUX.v"
`include "ADD4.v"
`include "ALU.v"
`include "EXT.v"
`include "GPR.v"
`include "IM.v"
`include "NPC.v"
`include "REG.v"
`include "CMP.v"
`include "DM.v"
`include "ForwardControl.v"
`include "Controller.v"
`include "Stall.v"
`include "LData.v"
`include "MULTORDIV.v"
`include "CP0.v"
//b类型
`define BEQ 6'b000100
`define BNE 6'b000101
`define BLEZ 6'b000110
`define BGTZ 6'b000111
`define BLTZ 11'b00000100000
`define BGEZ 11'b00000100001
`define LW 6'b100011

`define ERET 12'b010000011000
module Datapath(
    input clk,
    input reset,
	 input [7:2] HWInt,
	 input [31:0] PrRD,
	 input [6:2] ExcCode,
	 output [31:0] PrAddr,
	 output [31:0] PrWD,
	 output PrWe
    );
	 
	 //Controller
	 wire [1:0] JPC_F;
	 wire [1:0] ExtOp_D;
	 wire [2:0] Br_D;
	 wire ALUSrc_E;
	 wire [3:0] ALUCtr_E;
	 wire MemWrite_M;
	 wire [1:0] RegDst_W;
	 wire [1:0] MemtoReg_W;
	 wire RegWrite_W; 
	 wire [2:0] MULTDIV_E;
	 wire [1:0] HIorLO_E;
	 wire CP0Write_M;
	 
	 wire Exception_F;
	 //PC
	 wire [31:0] PCIn,PCOut,muxPC;
	 
	 //IM
	wire [31:0] Instruction;
	 
	//ADD4
	wire [31:0] PC4;
	wire [31:0] PC8;
	
	//IRReg
	wire [31:0] Ins_D;
	wire [31:0] Ins_E;
	wire [31:0] Ins_M;
	wire [31:0] Ins_W;
	
	//PCReg
	wire [31:0] PC4_D;
	wire [31:0] PC8_E;
	wire [31:0] PC8_M;
	wire [31:0] PC8_W;
	
	//EXT
	wire [31:0] EXT_32;
	
	//NPC
	wire [31:0] NPC;
	wire Branch;
	
	//GPR
	wire [31:0] WD_W,RD1,RD2;
	wire [4:0] WA_W;
	
	//RDReg
	wire [31:0] RD1_E,RD2_E,RD2_M;
	
	//EXTReg
	wire [31:0] EXT_E;
	
	//CMP
	wire [31:0] D1,D2;
	wire isBranch;
	
	//ALU 
	wire [31:0] ALUA,ALUB,ALUOut,muxALUOut;
	wire [31:0] B;
	wire [31:0] ALUOut_M,ALUOut_W;
	
	//MULTORDIV
	wire Busy,Start;
	wire [31:0] LO,HI;
	
	//DM
	wire [31:0] DMIn;
	wire [31:0] DMOut;
	wire isDMWrite;
	wire isDEVAddr;
	wire [31:0] muxDMorDEVOut;
	
	//DMReg
	wire [31:0] DR_W;
	
	//LData
	wire [31:0] LDataOut;
	
	//ForwardControl
	wire [1:0] ForwardRSD,ForwardRTD;
	wire [1:0] ForwardRSE,ForwardRTE;
	wire ForwardRTM;
	
	//Stall
	wire Stall; //禁止PC,清除ID/EX,冻结IF/ID
	
	//CP0
	wire [31:0] EPCIn,EPC;
	wire [31:0] CP0DOut;
	wire IntReq;
	wire EXLSet,EXLClr;
	wire EXL;
	wire CP0EPCWrite;
	
	//CP0reg
	wire [31:0] CP0Out_W;
	
	//clr
	wire D_CLR,E_CLR,M_CLR,W_CLR;
	
	//EN
	wire PCEN;
	wire IR_DEN;
	
	//PC 
	PC pc(.clk(clk),.reset(reset),.en(PCEN),.PCIn(PCIn),.PCOut(PCOut));

	//IM
	IM im(.PC(PCOut),.Instruction(Instruction));
	
	//ADD4
	ADD4 add4(.PCIn(PCOut),.PC4(PC4));
	
	//REG 16个
	reg_32 IR_D(.clk(clk),.en(IR_DEN),.reset(reset),.clr(D_CLR),.In(Instruction),.Out(Ins_D));
	reg_32 PC4RegD(.clk(clk),.en(IR_DEN),.reset(reset),/*.clr(D_CLR),*/.In(PC4),.Out(PC4_D));
	reg_32 IR_E(.clk(clk),.en(1'b1),.reset(reset),.clr(E_CLR),.In(Ins_D),.Out(Ins_E));
	reg_32 RS_E(.clk(clk),.en(1'b1),.reset(reset),.clr(E_CLR),.In(RD1),.Out(RD1_E));
	reg_32 RT_E(.clk(clk),.en(1'b1),.reset(reset),.clr(E_CLR),.In(RD2),.Out(RD2_E));
	reg_32 EXTRegE(.clk(clk),.en(1'b1),.reset(reset),.clr(E_CLR),.In(EXT_32),.Out(EXT_E));
	reg_32 PC4RegE(.clk(clk),.en(1'b1),.reset(reset),/*.clr(E_CLR),*/.In(PC8),.Out(PC8_E)); //PC+8 ! 
	reg_32 IR_M(.clk(clk),.en(1'b1),.reset(reset),.clr(M_CLR),.In(Ins_E),.Out(Ins_M));
	reg_32 AO_M(.clk(clk),.en(1'b1),.reset(reset),.clr(M_CLR),.In(muxALUOut),.Out(ALUOut_M));
	reg_32 PC4RegM(.clk(clk),.en(1'b1),.reset(reset),/*.clr(M_CLR),*/.In(PC8_E),.Out(PC8_M));
	reg_32 RT_M(.clk(clk),.en(1'b1),.reset(reset),.clr(M_CLR),.In(B),.Out(RD2_M)); //注意，RT_E的输入来自转发后的结果B，所以不能是RD2_E！
	reg_32 IR_W(.clk(clk),.en(1'b1),.reset(reset),.clr(W_CLR),.In(Ins_M),.Out(Ins_W));
	reg_32 AO_W(.clk(clk),.en(1'b1),.reset(reset),.clr(W_CLR),.In(ALUOut_M),.Out(ALUOut_W));
	reg_32 PC4RegW(.clk(clk),.en(1'b1),.reset(reset),/*.clr(W_CLR),*/.In(PC8_M),.Out(PC8_W));
	reg_32 DRRegW(.clk(clk),.en(1'b1),.reset(reset),.clr(W_CLR),.In(muxDMorDEVOut),.Out(DR_W));
	reg_32 CP0_W(.clk(clk),.en(1'b1),.reset(reset),.clr(W_CLR),.In(CP0DOut),.Out(CP0Out_W));
	
	//EXT
	EXT ext(.Imm_16(Ins_D[15:0]),.ExtOp(ExtOp_D),.EXT_32(EXT_32));
	
	//NPC
	NPC npc(.PC4(PC4_D),.Imm_26(Ins_D[25:0]),.Ins(Ins_D),.Branch(Branch),.NPC(NPC));
	
	//CMP
	mux_32_4_1 MFRSD(.A(RD1),.B(PC8_E),.C(ALUOut_M),.D(PC8_M),.S(ForwardRSD),.Out(D1));
	mux_32_4_1 MFRTD(.A(RD2),.B(PC8_E),.C(ALUOut_M),.D(PC8_M),.S(ForwardRTD),.Out(D2));
	CMP cmp(.D1(D1),.D2(D2),.Br(Br_D),.isBranch(isBranch));
	
	//GPR
	GPR gpr(.clk(clk),.reset(reset),.RegWrite(RegWrite_W),.A1(Ins_D[25:21]),.A2(Ins_D[20:16]),.WA(WA_W),.WD(WD_W),.RD1(RD1),.RD2(RD2));
	
	//ALU
	mux_32_4_1 MFRSE(.A(RD1_E),.B(ALUOut_M),.C(PC8_M),.D(WD_W),.S(ForwardRSE),.Out(ALUA));
	mux_32_4_1 MFRTE(.A(RD2_E),.B(ALUOut_M),.C(PC8_M),.D(WD_W),.S(ForwardRTE),.Out(B));
	mux_32_2_1 mux_ALUBSrc(.A(B),.B(EXT_E),.S(ALUSrc_E),.Out(ALUB));
	ALU alu(.Ins(Ins_E),.A(ALUA),.B(ALUB),.ALUCtr(ALUCtr_E),.ALUOut(ALUOut));//A B 可能来自于转发
	
	//MULTORDIV
	MULTORDIV multordiv(.clk(clk),.reset(reset),.UD1(ALUA),.UD2(B),.D1(ALUA),.D2(B),.Op(MULTDIV_E),.Ins(Ins_E),.Busy(Busy),.Start(Start),.LO(LO),.HI(HI));
	
	//mux_HIorLO
	mux_32_4_1 mux_HIorLO(.A(ALUOut),.B(HI),.C(LO),.D(),.S(HIorLO_E),.Out(muxALUOut));
	
	//DM
	mux_32_2_1 MFRTM(.A(RD2_M),.B(WD_W),.S(ForwardRTM),.Out(DMIn));
	DM dm(.clk(clk),.reset(reset),.MemWrite(isDMWrite),.Ins(Ins_M),.A(ALUOut_M),.WD(DMIn),.RD(DMOut));
	mux_32_2_1 mux_DMorDEV(.A(DMOut),.B(PrRD),.S(isDEVAddr),.Out(muxDMorDEVOut));
	
	//CP0
	CP0 cp0(.A1(Ins_M[15:11]),.A2(Ins_M[15:11]),.DIn(DMIn),.PC(EPCIn),.ExcCode(ExcCode),.HWInt(HWInt),.We(CP0Write_M),.EXLSet(EXLSet),
	.EXLClr(EXLClr),.clk(clk),.reset(reset),.EPCWrite(CP0EPCWrite),.IntReq(IntReq),.EPC(EPC),.DOut(CP0DOut),.EXL(EXL));
	
	//LData
	LData ldata(.Ins(Ins_W),.Addr(ALUOut_W),.Data(DR_W),.Out(LDataOut));
	
	//MUX_RFWA_W
	mux_5_4_1 mux_RFWA_W(.A(Ins_W[20:16]),.B(Ins_W[15:11]),.C(5'b11111),.S(RegDst_W),.Out(WA_W));
	
	//MUX_RFWD_W
	mux_32_4_1 mux_RFWD_W(.A(ALUOut_W),.B(LDataOut),.C(PC8_W),.D(CP0Out_W),.S(MemtoReg_W),.Out(WD_W));
	
	//MUX_PC_F
	mux_32_4_1 mux_PC_F(.A(PC4),.B(NPC),.C(D1),.D(EPC),.S(JPC_F),.Out(muxPC));
	mux_32_2_1 mux_HandlerPC(.A(muxPC),.B(32'h0000_4180),.S(Exception_F),.Out(PCIn));
	
	//ForwardControl
	ForwardControl forwardcontrol(.D(Ins_D),.E(Ins_E),.M(Ins_M),.W(Ins_W),.ForwardRSD(ForwardRSD),.ForwardRTD(ForwardRTD),.ForwardRSE(ForwardRSE),.ForwardRTE(ForwardRTE),.ForwardRTM(ForwardRTM));
	
	//Controller
	Controller controller_F(.Ins(Ins_D),.JPC(JPC_F));
	Controller controller_D(.Ins(Ins_D),.ExtOp(ExtOp_D),.Br(Br_D));
	Controller controller_E(.Ins(Ins_E),.ALUSrc(ALUSrc_E),.ALUCtr(ALUCtr_E),.MULTDIV(MULTDIV_E),.HIorLO(HIorLO_E));
	Controller controller_M(.Ins(Ins_M),.MemWrite(MemWrite_M),.CP0Write(CP0Write_M));
	Controller controller_W(.Ins(Ins_W),.RegDst(RegDst_W),.RegWrite(RegWrite_W),.MemtoReg(MemtoReg_W));
	
	//Stall
	Stall stall(.D(Ins_D),.E(Ins_E),.M(Ins_M),.Busy(Busy),.Start(Start),.Stall(Stall));
	
	assign D_CLR=(IntReq && EXL==0) || (EXLClr && !Stall) ;//在D阶段执行ETER必须保证不是暂停阶段！，之后要进行一次清除，清除后面的一条无关指令/////////////////////////
	assign E_CLR=Stall || (IntReq && EXL==0);
	assign M_CLR= IntReq && EXL==0;
	assign W_CLR= IntReq && EXL==0;
	assign PCEN=!Stall || Exception_F; //////////////////
	assign IR_DEN=!Stall;
	
	assign Branch=((Ins_D[31:26]==`BEQ || Ins_D[31:26]==`BNE || Ins_D[31:26]==`BLEZ || Ins_D[31:26]==`BGTZ || 
	{Ins_D[31:26],Ins_D[20:16]}==`BLTZ || {Ins_D[31:26],Ins_D[20:16]}==`BGEZ )&& isBranch) ;
	assign PC8=PC4_D+4;
	assign Exception_F=IntReq && EXL==0;
	//assign EPCIn=(PC8_M-PC8_E)==4? PC8_M-8 : PC8_E-8;
	assign EPCIn={Ins_M[31:26],Ins_M[5:0]}==12'b000000_000000 || (Ins_W[31:26]==`BEQ || Ins_W[31:26]==`BNE || Ins_W[31:26]==`BLEZ || Ins_W[31:26]==`BGTZ || 
	{Ins_W[31:26],Ins_W[20:16]}==`BLTZ || {Ins_W[31:26],Ins_W[20:16]}==`BGEZ )/*||  (PC8_M-PC8_E)!=4*/ ? PC8_E-8 : PC8_M-8;//是nop就存储下一条指令/////////////////
	assign EXLSet=IntReq && EXL==0 ;
	assign PrAddr=ALUOut_M;
	assign PrWD=DMIn;
	assign isDMWrite= (ALUOut_M[15:12]==4'h0 || ALUOut_M[15:12]==4'h1 || ALUOut_M[15:12]==4'h2) && MemWrite_M;
	assign PrWe= (ALUOut_M[15:8]==8'h7f && (ALUOut_M[7:4]==4'h0 || ALUOut_M[7:4]==4'h1)) && MemWrite_M;
	assign isDEVAddr=(ALUOut_M[15:8]==8'h7f && (ALUOut_M[7:4]==4'h0 || ALUOut_M[7:4]==4'h1) && Ins_M[31:26]==`LW) ;//外部设备lw时候有效
	assign EXLClr={Ins_D[31:26],Ins_D[5:0]}==`ERET;
	assign CP0EPCWrite=IntReq && EXL==0;
endmodule
