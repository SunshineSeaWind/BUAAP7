`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:13 11/24/2016 
// Design Name: 
// Module Name:    mips 
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
`include "Datapath.v"

module mips(
    input clk,
    input reset,
	 input [31:0] PrRD,
	 input [7:2] HWInt,
	 input [6:2] ExcCode,
	 output [31:0] PrAddr,
	 output [31:0] PrWD,
	 output PrWe
    );
   
	//Datapath
	Datapath datapath(.clk(clk),.reset(reset),.HWInt(HWInt),.PrRD(PrRD),.ExcCode(ExcCode),.PrAddr(PrAddr),.PrWD(PrWD),.PrWe(PrWe));
	
endmodule
