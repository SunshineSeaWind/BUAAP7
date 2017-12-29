`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:01 11/25/2016 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input [31:0] D1,
    input [31:0] D2,
    input [2:0] Br,
	 output isBranch
    );
	 wire S0,S1,S2,S3,S4,S5;
	 assign S0= D1==D2;//beq
	 assign S1= D1!=D2;//bne
	 assign S2= (D1[31]==1 || D1==0);//blez
	 assign S3= (D1[31]==0 && D1!=0);//bgtz
	 assign S4= D1[31]==1;//bltz
	 assign S5= D1[31]==0;//bgez
	 mux_1_8_1 mux(.A(1'b0),.B(S0),.C(S1),.D(S2),.E(S3),.F(S4),.G(S5),.H(),.S(Br),.Out(isBranch)); 

endmodule
