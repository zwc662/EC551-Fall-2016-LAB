`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:52:52 12/08/2016
// Design Name:   FIFO
// Module Name:   X:/EC551/FIFO/fifo_test.v
// Project Name:  FIFO
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FIFO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fifo_test;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] din;
	reg wr_en;
	reg rd_en;

	// Outputs
	wire [15:0] dout;
	wire full;
	wire empty;

	// Instantiate the Unit Under Test (UUT)
	FIFO uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.wr_en(wr_en), 
		.rd_en(rd_en), 
		.dout(dout), 
		.full(full), 
		.empty(empty)
	);
	always #1 clk=~clk;
	initial #1000 $finish;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		din = 0;
		wr_en = 0;
		rd_en = 0;

		// Wait 100 ns for global reset to finish
		#20 rst=1;
		#20 rst=0;
		#25;
		#2 wr_en=1; din=1;
		#2 din=din+1;
      #2 din=din+1;
      #2 din=din+1;
      #2 din=din+1;
      #2 din=din+1;
		#2 wr_en=0; 
		#2 rd_en=1;
		
		// Add stimulus here

	end
      
endmodule

