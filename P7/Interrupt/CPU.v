`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:06 12/13/2016 
// Design Name: 
// Module Name:    CPU 
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
`include "mips.v"//mips文件代表包含CP0的cpu
`include "Bridge.v"
`include "DEV_0.v"
`include "DEV_1.v"
module CPU(
    input clk,
    input reset
    );
	//mips
	wire [31:0] PrAddr,PrWD;
	wire PrWe;
	wire [7:2] HWInt;
	wire [6:2] ExcCode;
	//Bridge 
	wire [31:0] PrRD;
	wire [31:0] DEV_Addr,DEV_WD;
	wire WeDEV0,WeDEV1;
	
	//DEV
	wire IntReq_dev_0,IntReq_dev_1;
	wire [31:0] DEV0_DataOut,DEV1_DataOut;
	
	mips CP0CPU(.reset(reset),.clk(clk),.PrRD(PrRD),.HWInt(HWInt),.ExcCode(ExcCode),.PrAddr(PrAddr),.PrWD(PrWD),.PrWe(PrWe));
	
	Bridge bridge(.PrAddr(PrAddr),.PrWD(PrWD),.PrWe(PrWe),.DEV0_RD(DEV0_DataOut),.DEV1_RD(DEV1_DataOut),.PrRD(PrRD),.DEV_Addr(DEV_Addr),.DEV_WD(DEV_WD),.WeDEV0(WeDEV0),.WeDEV1(WeDEV1));
	
	DEV_0 dev_0(.clk(clk),.reset(reset),.Addr(DEV_Addr),.DataIn(DEV_WD),.We(WeDEV0),.DataOut(DEV0_DataOut),.IntReq(IntReq_dev_0));
	
	DEV_1 dev_1(.clk(clk),.reset(reset),.Addr(DEV_Addr),.DataIn(DEV_WD),.We(WeDEV1),.DataOut(DEV1_DataOut),.IntReq(IntReq_dev_1));
	
	assign HWInt={4'b0000,IntReq_dev_1,IntReq_dev_0};
	assign ExcCode= (IntReq_dev_1 || IntReq_dev_0) ? 5'b00000 : 5'b11111; 
endmodule
