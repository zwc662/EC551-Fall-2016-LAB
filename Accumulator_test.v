`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:42 12/08/2016
// Design Name:   Accumulator
// Module Name:   X:/EC551/Project/Accumulator_test.v
// Project Name:  Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Accumulator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Accumulator_test;

	// Inputs
	reg Clk;
	reg Reset;
	reg [7:0] row_id_out;
	reg row_id_empty;
	reg mult_empty;
	reg [15:0] mult_out;
	wire [15:0] wr_data;

	// Outputs
	wire row_id_rd_en;
	wire mult_rd_en;
	wire [7:0] wr_addr;
	wire wr_en;

	// Instantiate the Unit Under Test (UUT)
	Accumulator uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.row_id_out(row_id_out), 
		.row_id_empty(row_id_empty), 
		.row_id_rd_en(row_id_rd_en), 
		.mult_rd_en(mult_rd_en), 
		.mult_empty(mult_empty), 
		.mult_out(mult_out), 
		.wr_addr(wr_addr), 
		.wr_data(wr_data), 
		.wr_en(wr_en)
	);
	
	always #1 Clk=~Clk;
	initial #1000 $finish;

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 1;
		row_id_out = 0;
		row_id_empty = 0;
		mult_empty = 0;
		mult_out = 0;

		// Wait 100 ns for global reset to finish
		#100 Reset=0;
		#2 row_id_out=1; mult_out=1;
		#2 row_id_out=1; mult_out=1;
		#2 row_id_out=1; mult_out=1;
		#2 row_id_out=1; mult_out=1;
		#2 row_id_out=1; mult_out=1;
		#2 row_id_out=1; mult_out=1;
		#2 row_id_out=1; mult_out=1;
		// Add stimulus here

	end
      
endmodule

