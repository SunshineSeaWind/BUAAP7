`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:46 11/23/2016 
// Design Name: 
// Module Name:    NPC 
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
`define J 6'b000010
`define JAL 6'b000011
module NPC(
    input [31:0] PC4,
    input [25:0] Imm_26,
	 input [31:0] Ins,
	 input Branch,
    output [31:0] NPC
    );
	 wire [31:0] PC,S0,S1,S2;
	 wire [31:0] Imm_32;
	 assign Imm_32={{16{Imm_26[15]}},Imm_26[15:0]};
	 assign PC=PC4-4;
	 assign S0=PC4+4;// b类指令条件不成立，考虑延迟槽，则PC=PC+8
	 assign S1=PC4+4*Imm_32;
	 assign S2={PC[31:28],Imm_26,2'b00};
	 assign NPC= Branch ? S1 : //B类指令 可以执行
	 (Ins[31:26]==`J || Ins[31:26]==`JAL ) ? S2 : S0;//J JAL 执行 

endmodule
