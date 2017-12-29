`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:25:38 11/25/2016 
// Design Name: 
// Module Name:    DM 
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
//save¿‡
`define SB 6'b101000
`define SH 6'b101001
`define SW 6'b101011
module DM(
	 input clk,
    input reset,
	 input MemWrite,
	 input [31:0] Ins,
    input [31:0] A,
    input [31:0] WD,
    output [31:0] RD
    );
	reg [31:0] DM[2047:0];
	integer i;
	assign RD=DM[A[12:2]];
	always @(posedge clk)begin
	if(reset)
	begin
	for(i=0;i<2048;i=i+1)
		DM[i]=32'h0000_0000;
	end
	else if(MemWrite) begin
	case(Ins[31:26])
		`SB:begin //sb
		case(A[1:0])
		2'b00: begin
			DM[A[12:2]]<={DM[A[12:2]][31:8],WD[7:0]};
			$display("*%h <= %h",A,WD[7:0]);
		end
		2'b01: begin
			DM[A[12:2]]<={DM[A[12:2]][31:16],WD[7:0],DM[A[12:2]][7:0]};
			$display("*%h <= %h",A,WD[7:0]);
		end
		2'b10: begin
			DM[A[12:2]]<={DM[A[12:2]][31:24],WD[7:0],DM[A[12:2]][15:0]};
			$display("*%h <= %h",A,WD[7:0]);
		end
		2'b11: begin
			DM[A[12:2]]<={WD[7:0],DM[A[12:2]][23:0]};
			$display("*%h <= %h",A,WD[7:0]);
		end
		default:
			;
		endcase
		end
		`SH:begin//sh
		case(A[1])
		1'b0:begin
			DM[A[12:2]]<={DM[A[12:2]][31:16],WD[15:0]};
			$display("*%h <= %h",A,WD[15:0]);
		end
		1'b1:
		begin
			DM[A[12:2]]<={WD[15:0],DM[A[12:2]][15:0]};
			$display("*%h <= %h",A,WD[15:0]);
		end 
		default:
			;
		endcase
		end
		`SW:begin //sw
			DM[A[12:2]]<=WD;
			$display("*%h <= %h",A,WD);
		end
		default:
			;
		endcase
	end
	end

endmodule
