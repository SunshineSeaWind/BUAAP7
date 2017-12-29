`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:46 11/22/2016 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [31:0] PC,
    output [31:0] Instruction
    );
	 reg [31:0] IM [3071:1024];
	 reg [31:0] IMInt[312:96];
	 initial begin
		$readmemh("code.txt",IM);
		$readmemh("interrupt.txt",IMInt);
	 end
	assign Instruction= (PC<32'h0000_4180) ? IM[PC[12:2]] : IMInt[PC[12:2]] ;
endmodule
