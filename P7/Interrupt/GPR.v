`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:10 11/22/2016 
// Design Name: 
// Module Name:    GPR 
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
module GPR(
    input clk,
    input reset,
    input RegWrite,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] WA,
    input [31:0] WD,
    output [31:0] RD1,
    output [31:0] RD2
    );
	reg [31:0] GPR [31:0];
	integer i;
	always @ (posedge clk) begin
	if(reset)
	  begin
	  for(i=0;i<32;i=i+1)
			GPR[i]<=32'h0000_0000;
	  end
	else if(RegWrite && WA!=0 )begin
		GPR[WA]<=WD;
		$display("$%d <= %h",WA,WD);
	end
	end
	assign RD1=(A1==0)? 32'h0000_0000: (A1==WA) && RegWrite ?  WD : GPR[A1];
	assign RD2=(A2==0)? 32'h0000_0000: (A2==WA) && RegWrite ?  WD : GPR[A2]; //改进GPR,增加内部转发
endmodule
