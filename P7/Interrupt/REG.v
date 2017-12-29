`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:04 11/24/2016 
// Design Name: 
// Module Name:    REG 
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
module reg_32(
	input clk, 
	input en,
	input reset,
	input clr,
	input [31:0] In,
	output [31:0] Out
    );
	 reg [31:0] out;
	 assign Out=out;
	always @ (posedge clk)
		if(reset || clr)
			out<=32'h0000_0000;
		else if(en)
			out<=In;
endmodule



