`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:38:43 12/08/2016
// Design Name:   Channel
// Module Name:   X:/EC551/Project/Channel_Test.v
// Project Name:  Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Channel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

	module Channel_Test;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] matrix_val;
	reg matrix_val_empty;
	reg [7:0] vec_val;
	reg vec_val_empty;
	reg mult_rd_en;

	// Outputs
	wire matrix_val_rd_en;
	wire vec_val_rd_en;
	wire mult_empty;
	wire [15:0] mult_out;
	


	// Instantiate the Unit Under Test (UUT)
	Channel uut (
		.clk(clk), 
		.rst(rst), 
		.matrix_val(matrix_val), 
		.matrix_val_empty(matrix_val_empty), 
		.matrix_val_rd_en(matrix_val_rd_en), 
		.vec_val(vec_val), 
		.vec_val_empty(vec_val_empty), 
		.vec_val_rd_en(vec_val_rd_en), 
		.mult_rd_en(mult_rd_en), 
		.mult_empty(mult_empty), 
		.mult_out(mult_out)
	);
	always #1 clk=~clk;
	initial #1000 $finish;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		matrix_val = 0;
		matrix_val_empty = 0;
		vec_val = 0;
		vec_val_empty = 0;
		mult_rd_en = 0;

		// Wait 100 ns for global reset to finish
		#20 rst<=0; 
		#1 matrix_val<=1;	vec_val<=1;
      #2 matrix_val<=1; vec_val<=2;
		#2 matrix_val<=1; vec_val<=3;
		#2 matrix_val<=1; vec_val<=4;
		#2 matrix_val<=1; vec_val<=5;
		#2 matrix_val<=1; vec_val<=6;
		#2 matrix_val<=1; vec_val<=7;
		#2 matrix_val<=1; vec_val<=7;
		#6 mult_rd_en<=1;
		
		// Add stimulus here

	end
      
endmodule

