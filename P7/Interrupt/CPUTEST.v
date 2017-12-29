`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:02:15 12/14/2016
// Design Name:   CPU
// Module Name:   D:/Verilog/Interrupt/CPUTEST.v
// Project Name:  Interrupt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPUTEST;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.reset(reset)
	);
	always # 10 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#20 reset=0;

	end
      
endmodule

