`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:23 12/13/2016 
// Design Name: 
// Module Name:    Bridge 
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
`define DEBUG_DEV_DATA 32'habcdffff
module Bridge(
    input [31:0] PrAddr,
    input [31:0] PrWD,
	 input PrWe,
	 input [31:0] DEV0_RD,
	 input [31:0] DEV1_RD,
    output [31:0] PrRD,//给CPU
    output [31:0] DEV_Addr,//下面的给DEV
    output [31:0] DEV_WD,
	 output WeDEV0,
	 output WeDEV1
    );
	wire HitDEV0,HitDEV1;//DEV0 0x0000_7F00-0x0000_7F0B  DEV1 0x0000_7F10-0x0000_7F1B  
	assign HitDEV0=PrAddr[31:4]==28'h0000_7F0;
	assign HitDEV1=PrAddr[31:4]==28'h0000_7F1;
	assign PrRD= HitDEV0? DEV0_RD : HitDEV1? DEV1_RD : `DEBUG_DEV_DATA ;
	assign WeDEV0=PrWe && HitDEV0;
	assign WeDEV1=PrWe && HitDEV1;
	assign DEV_WD=PrWD;
	assign DEV_Addr=PrAddr;
endmodule
