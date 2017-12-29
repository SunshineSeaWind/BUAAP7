`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:08 12/06/2016 
// Design Name: 
// Module Name:    LData 
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
//load¿‡
`define LB 6'b100000
`define LBU 6'b100100
`define LH 6'b100001
`define LHU 6'b100101
`define LW 6'b100011
module LData(
    input [31:0] Ins,
    input [31:0] Addr,
    input [31:0] Data,
    output [31:0] Out
    );
	 reg [31:0] out;
	 assign Out=out;
	 always @ ( Addr or Ins) begin
	case(Ins[31:26])
	`LB:begin
	case(Addr[1:0])
	2'b00:begin
		out<={{24{Data[7]}},Data[7:0]};
	end
	2'b01:begin
		out<={{24{Data[15]}},Data[15:8]};
	end
	2'b10:begin
		out<={{24{Data[23]}},Data[23:16]};
	end
	2'b11:begin
		out<={{24{Data[31]}},Data[31:24]};
	end
	default:
		;
	endcase	
	end
	`LBU:begin
	case(Addr[1:0])
	2'b00:begin
		out<={{24{1'b0}},Data[7:0]};
	end
	2'b01:begin
		out<={{24{1'b0}},Data[15:8]};
	end
	2'b10:begin
		out<={{24{1'b0}},Data[23:16]};
	end
	2'b11:begin
		out<={{24{1'b0}},Data[31:24]};
	end
	default:
		;
	endcase	
	end
	`LH:begin
	case(Addr[1])
	1'b0:begin
		out<={{16{Data[15]}},Data[15:0]};
	end
	1'b1:begin
		out<={{16{Data[31]}},Data[31:16]};
	end
	default:
		;
	endcase	
	end
	`LHU:begin
	case(Addr[1])
	1'b0:begin
		out<={{16{1'b0}},Data[15:0]};
	end
	1'b1:begin
		out<={{16{1'b0}},Data[31:16]};
	end
	default:
		;
	endcase	
	end
	`LW:begin
		out<=Data;
	end
	default:
		;
	endcase
	end

endmodule
