`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:02 11/23/2016 
// Design Name: 
// Module Name:    MUX 
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
module mux_32_2_1(
    input [31:0] A,
    input [31:0] B,
    input S,
    output [31:0] Out
    );
	assign Out= S? B : A;
endmodule

module mux_32_4_1(
    input [31:0] A,
    input [31:0] B,
	 input [31:0] C,
    input [31:0] D,
    input [1:0] S,
    output [31:0] Out
    );
	assign Out= S[1]? (S[0]? D : C) : (S[0]? B : A);
endmodule

module mux_1_8_1(
    input A,
    input B,
	 input C,
    input D,
	 input E,
    input F,
	 input G,
    input H,
    input [2:0] S,
    output Out
    );
	assign Out= S==3'b000 ? A : S==3'b001 ? B :  S==3'b010 ? C :S==3'b011 ? D :S==3'b100 ? E :S==3'b101 ? F : S==3'b110 ? G : H ;
endmodule

module mux_32_16_1(
    input [31:0] A,
    input [31:0] B,
	 input [31:0] C,
    input [31:0] D,
	 input [31:0] E,
    input [31:0] F,
	 input [31:0] G,
    input [31:0] H,
	 input [31:0] I,
    input [31:0] J,
	 input [31:0] K,
    input [31:0] L,
	 input [31:0] M,
    input [31:0] N,
	 input [31:0] O,
    input [31:0] P,
    input [3:0] S,
    output [31:0] Out
    );
	assign Out= S==4'b0000 ? A : S==4'b0001 ? B :  S==4'b0010 ? C :S==4'b0011 ? D : S==4'b0100 ? E :S==4'b0101 ? F :S==4'b0110 ? G :
	S==4'b0111 ? H :S==4'b1000 ? I :S==4'b1001 ? J :S==4'b1010 ? K :S==4'b1011 ? L :S==4'b1100 ? M :S==4'b1101 ? N :S==4'b1110 ? O : P;
endmodule

module mux_5_2_1(
    input [4:0] A,
    input [4:0] B,
    input S,
    output [4:0] Out
    );
	assign Out= S? B : A;
endmodule

module mux_5_4_1(
	input [4:0] A,
   input [4:0] B,
	input [4:0] C,
   input [4:0] D,
   input [1:0] S,
   output [4:0] Out
	);
	assign Out= S[1]? (S[0]? D : C) : (S[0]? B : A);
endmodule
