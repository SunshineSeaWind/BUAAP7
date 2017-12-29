`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:40 11/23/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	 input [31:0] Ins,
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUCtr,
    output [31:0] ALUOut
    );
	wire [31:0] S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13;
	assign S0=A+B;//add
	assign S1=A-B;//sub
	assign S2=B<<Ins[10:6];//sll
	assign S3=B>>Ins[10:6];//srl
	assign S4={{31{B[31]}},B}>>Ins[10:6];//sra
	assign S5=B<<A[4:0];//sllv
	assign S6=B>>A[4:0];//srlv
	assign S7={{31{B[31]}},B}>>A[4:0];//srav
	assign S8=A & B;//and
	assign S9=A | B;//or
	assign S10=A^B;//xor “ÏªÚ
	assign S11=~(A | B);//nor ªÚ∑«
	assign S12= (A[31]==B[31]) ? A<B : (A[31]==1'b1) ? 1 : 0;//slt
	assign S13= A<B ? 32'h0000_0001 : 32'h0000_0000 ;//sltu
	mux_32_16_1 mux(.A(S0),.B(S1),.C(S2),.D(S3),.E(S4),.F(S5),.G(S6),.H(S7),.I(S8),.J(S9),.K(S10),.L(S11),
	.M(S12),.N(S13),.O(),.P(),.S(ALUCtr),.Out(ALUOut));
endmodule
