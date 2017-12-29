`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:21 12/13/2016 
// Design Name: 
// Module Name:    DEV_1 
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
`define IDLE 2'b00
`define COUNTING 2'b01
`define INT 2'b10
module DEV_1(
	 input clk,
	 input reset,
    input [31:0] Addr,
    input [31:0] DataIn,
    input We,
    output [31:0] DataOut,
	 output IntReq
    );
	reg [1:0] State;
	reg [31:0] PRESET,COUNT;//COUNT只读！！！
	reg [2:1] Mode;
	reg im,enable;
	reg intreq;
	always @ (posedge clk)begin 
		if(reset)begin
			PRESET<=32'h0000_0000;
			COUNT<=32'h0000_0000;
			Mode<=2'b00;
			im<=0;
			enable<=0;
			State<=`IDLE;
			intreq<=0;
		end
		if(We)begin
			case(Addr)
			32'h0000_7f10:begin
			{im,Mode,enable}<=DataIn[3:0];
			if(State==`COUNTING)//在计数阶段的上升沿对CTRL进行了写入，此时应该放弃原来的count，直接进入一个新的计数循环
				COUNT<=PRESET;
			end
			32'h0000_7f14:
			PRESET<=DataIn;
			32'h0000_7f18:
				;//COUNT<=DataIn;//只读，不执行
			default:
				;
			endcase
		end
		else
		if(State==`IDLE && enable==1)begin
			COUNT<=PRESET;
			State<=`COUNTING;
			intreq<=0;
		end
		else if(State==`COUNTING && enable==1 && COUNT!=1)begin//避免PRESET一开始就是1
			COUNT<=COUNT-1;
			intreq<=0;
			end
		else if(State==`COUNTING && COUNT==1 && enable==1)begin
			State<=`INT;
			intreq<=0;
		end
		else if(State==`INT && enable==1)begin
			intreq<=1;
			if(Mode==2'b00)begin
				enable<=0;
				State<=`IDLE;
			end
			else if(Mode==2'b01)begin
				COUNT<=PRESET;
				State<=`COUNTING;
			end 
		end  		
		end
	assign IntReq=  (intreq && im);
	assign DataOut= (!We && Addr[3:0]==4'b0000) ? {28'h0000_000,im,Mode,enable} : 
						 (!We && Addr[3:0]==4'b0100) ? PRESET : (!We && Addr[3:0]==4'b1000) ? COUNT : 32'h0000_0000;
endmodule
