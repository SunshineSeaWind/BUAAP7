`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:50 12/12/2016 
// Design Name: 
// Module Name:    CP0 
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
`define SR 12 
`define CAUSE 13 
`define EPC 14
`define PrID 15
module CP0(
    input [4:0] A1,//读取寄存器编号
    input [4:0] A2,//写入寄存器编号
    input [31:0] DIn,
    input [31:0] PC,
    input [6:2] ExcCode,//异常/中断部件判断,在这个模块好像没有用到？？？
    input [7:2] HWInt,//6个设备中断位
    input We,
    input EXLSet,//置位EXL，流水线M阶段产生
    input EXLClr,//执行eret时置位
    input clk,
    input reset,
	 input EPCWrite,
    output IntReq,
    output [31:0] EPC,
    output [31:0] DOut,
	 output EXL
    );//12 SR 13 CAUSE 14 EPC 15 PrID
	integer i;
	//SR
	reg [15:10] im;
	reg exl,ie;//SR整体表示为：{16’b0, im, 8’b0,exl, ie}
	//Cause
	reg [15:10] hwint_pend;//Cause整体表示为：{16’b0, hwint_pend, 10’b0}
	//EPC
	reg [32:0] epc;
	reg [31:0] CP0REG [31:0];
	always @ (posedge clk)begin
		hwint_pend<=HWInt;//不断的锁存外部6个中断(HWInt[7:2])
		if(reset)begin
			for(i=0;i<32;i=i+1)begin
				CP0REG[i]<=32'h0000_0000;
			end
			im<=0;
			exl<=0;
			ie<=0;
			hwint_pend<=0;
			epc<=0;
		end
		else begin
		if(EPCWrite)
			epc<=PC;
		if(We)begin
			if(A2==`SR)begin
				{im,exl,ie}<={DIn[15:10],DIn[1],DIn[0]};
				CP0REG[A2]<=DIn;
				end
			else if(A2==`CAUSE)begin
				hwint_pend<={DIn[15:10]};
				CP0REG[A2]<=DIn;
				end
			else if(A2==`EPC)begin
				epc<=DIn;
				CP0REG[A2]<=DIn;
				end
			else if(A2==`PrID) begin
				CP0REG[A2]<=DIn;
			end
			else 
				CP0REG[A2]<=32'h0000_0000;//CP0REG[A2]<=DIn;
		end
		if(EXLSet)//考虑We和EXLSet，EXLClr的优先级
			exl<=1'b1;
		if(EXLClr)
			exl<=1'b0;	
		end
	end
	assign EPC=epc;
	assign EXL=exl;
	assign DOut= A1==`SR ? {16'h0000,im,8'h00,exl,ie} : A1==`CAUSE? {16'h0000,hwint_pend,10'b0000000000} : 
	A1==`EPC? epc : A1==`PrID ? 32'h1234_5678 : 32'h0000_0000 ; 
	assign IntReq = (ExcCode==0) && (|(HWInt & im )) && ie && !exl;//IntReq=(|(hwint_pend & im )) && ie && !exl ;
endmodule
