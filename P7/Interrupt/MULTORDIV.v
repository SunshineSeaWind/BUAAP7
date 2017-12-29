`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:30 12/07/2016 
// Design Name: 
// Module Name:    MULTORDIV 
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
//MULT/DIV类型
`define MULT 12'b000000011000
`define MULTU 12'b000000011001
`define DIV 12'b000000011010
`define DIVU 12'b000000011011
module MULTORDIV(
	 input reset,
	 input clk,
    input [31:0] UD1,
    input [31:0] UD2,
	 input signed [31:0] D1,
	 input signed [31:0] D2,
    input [2:0] Op,
	 input [31:0] Ins,
    output Busy,
	 output Start,
    output [31:0] LO,
    output [31:0] HI
    );
	reg [31:0] lo,hi,lO,hI;
	wire [63:0] R,UR;
	wire [31:0] S0,S1,S2,S3,S4,S5,S6,S7;
	wire start;//运算开始计算延迟
	reg busy;//计算器处于计算状态
	reg [3:0] count;//计数器
	reg mult,div;
	assign HI=hI;
	assign LO=lO;
	assign Start= start;
	assign start= {Ins[31:26],Ins[5:0]}==`MULT || {Ins[31:26],Ins[5:0]}==`MULTU || {Ins[31:26],Ins[5:0]}==`DIV || {Ins[31:26],Ins[5:0]}==`DIVU ;
	assign Busy=busy;
	assign R=D1*D2;
	assign UR=UD1*UD2;
	assign S0=R[63:32];//有符号乘法HI
	assign S1=R[31:0];//有符号乘法LO
	assign S2=(D2==0)? 0 : D1/D2;//有符号除法LO
	assign S3=(D2==0)? 0 : D1%D2;//有符号取余HI
	assign S4=UR[63:32];//无符号乘法HI
	assign S5=UR[31:0];//无符号乘法LO
	assign S6=(UD2==0)? 0 : UD1/UD2;//无符号除法LO
	assign S7=(UD2==0)? 0 : UD1%UD2;//无符号取余HI
	always @ (posedge clk)begin
	if(reset)begin
		count<=0;
		busy<=0;
		hI<=32'h0000_0000;
		lO<=32'h0000_0000;
		mult<=0;
		div<=0;
	end
	else if(Op==3'b101)begin//mtlo
			lO<=UD1;
			//$display("$%d <= %h",34,UD1);
	end
	else if(Op==3'b110)begin//mthi
			hI<=UD1;
			//$display("$%d <= %h",33,UD1);
	end
	else if(start)begin//进行运算
		busy<=1;
		count<=1;
		case(Op)
		3'b001:begin//有符号乘法
			hi<=S0;
			lo<=S1;
			mult<=1;
		end
		3'b010:begin//无符号乘法
			hi<=S4;
			lo<=S5;
			mult<=1;
		end
		3'b011:begin//有符号除法
		if(D2!=0)begin
			hi<=S3;
			lo<=S2;
			div<=1;
			end
		end
		3'b100:begin//无符号除法
		if(UD2!=0)begin
			hi<=S7;
			lo<=S6;
			div<=1;
			end
		end
		default:
			;
		endcase
	end
	else if(count==4 && busy==1 && mult==1)begin//mult 延迟
		busy<=0;
		mult<=0;
		hI<=hi;
		lO<=lo;
		count<=0;
		//$display("$%d <= %h",33,hi);
		//$display("$%d <= %h",34,lo);
	end
	else if(count==9 && busy==1 && div==1)begin//div 延迟
		busy<=0;
		div<=0;
		hI<=hi;
		lO<=lo;
		count<=0;
		//$display("$%d <= %h",33,hi);
		//$display("$%d <= %h",34,lo);
	end
	else 
		count<=count+1;
	end
endmodule
