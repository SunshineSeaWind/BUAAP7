`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:54 11/22/2016 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input clk,
    input reset,
	 input en,//加入使能端
    input [31:0] PCIn,
    output [31:0] PCOut
    );
	 reg [31:0] PC;
	 assign PCOut=PC;
	 always @ (posedge clk)begin
		if(reset)
		  PC<=32'h0000_3000;
		else if(en)
		  PC<=PCIn;
	end

endmodule
