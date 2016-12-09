`include "definitions.vh"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:11:47 12/08/2016
// Design Name:   Channel_Accumulator
// Module Name:   X:/EC551/FIFO/Channel_Accumulator_test.v
// Project Name:  FIFO
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Channel_Accumulator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Channel_Accumulator_test;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] matrix_val;
	reg matrix_val_empty;
	reg [7:0] vec_val;
	reg vec_val_empty;
	wire [7:0] row_id_out;
	wire row_id_empty;

	// Outputs
	wire matrix_val_rd_en;
	wire vec_val_rd_en;
	wire row_id_rd_en;
	wire [15:0] wr_data;
	wire [7:0] wr_addr;
	wire wr_en;
	
	wire [`mult_bits-1:0] mult_out;
	wire mult_rd_en;


	// Instantiate the Unit Under Test (UUT)
	Channel_Accumulator uut (
		.clk(clk), 
		.rst(rst), 					.mult_out(mult_out), .mult_rd_en(mult_rd_en),
		.matrix_val(matrix_val), 
		.matrix_val_empty(matrix_val_empty), 
		.matrix_val_rd_en(matrix_val_rd_en), 
		.vec_val(vec_val), 
		.vec_val_empty(vec_val_empty), 
		.vec_val_rd_en(vec_val_rd_en), 
		.row_id_out(row_id_out), 
		.row_id_empty(row_id_empty), 
		.row_id_rd_en(row_id_rd_en), 
		.wr_data(wr_data), 
		.wr_addr(wr_addr), 
		.wr_en(wr_en)
	);
	
	reg [15:0] din;
	reg col_wr_en;
	// Outputs
	wire full;

	// Instantiate the Unit Under Test (UUT)
	FIFO row_id_FIFO (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.wr_en(col_wr_en), 
		.rd_en(row_id_rd_en), 
		.dout(row_id_out), 
		.full(full), 
		.empty(row_id_empty)
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
		din=0;
		col_wr_en=0;
		

		// Wait 100 ns for global reset to finish
		#9 rst=0;
		
		#10 matrix_val=1;	vec_val=1; din=1; col_wr_en=1;
      #2 matrix_val=1; vec_val=2; din=1; col_wr_en=1;
		#2 matrix_val=1; vec_val=3; din=1; col_wr_en=1;
		#2 matrix_val=1; vec_val=4; din=1; col_wr_en=1;
		#2 matrix_val=1; vec_val=5; din=1; col_wr_en=1;
		#2 matrix_val=1; vec_val=6; din=1; col_wr_en=1;
		#2 matrix_val=1; vec_val=1; din=2; col_wr_en=1;
      #2 matrix_val=1; vec_val=2; din=2; col_wr_en=1;
		#2 matrix_val=1; vec_val=3; din=2; col_wr_en=1;		
		// Add stimulus here

	end
      
endmodule

