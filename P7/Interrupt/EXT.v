`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:19 11/22/2016 
// Design Name: 
// Module Name:    EXT 
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
`include "MUX.v"
module EXT(
    input [15:0] Imm_16,
	 input [1:0] ExtOp,
    output [31:0] EXT_32  
    );
	wire [31:0] S0,S1,S2;
	assign S0={{16{Imm_16[15]}},Imm_16}; //·ûºÅÀ©Õ¹
	assign S1={16'h0000,Imm_16};//ÎÞ·ûºÅÀ©Õ¹
	assign S2={Imm_16,16'h0000}; //luiÀ©Õ¹
	mux_32_4_1 mux(.A(S0),.B(S1),.C(S2),.D(),.S(ExtOp),.Out(EXT_32));
endmodule
