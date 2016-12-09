`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:49:40 12/08/2016 
// Design Name: 
// Module Name:    Channel_Accumulator 
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
module Channel_Accumulator(
	input wire clk, rst,	
	
	
	output [`mult_bits-1:0] mult_out,///added for testbench
	output mult_rd_en,///added for testbench

	input wire [`matrix_val_bits-1:0] matrix_val,
	input wire matrix_val_empty,
	output wire matrix_val_rd_en,

	input wire [`vec_val_bits-1:0] vec_val,
	input wire vec_val_empty,
	output wire vec_val_rd_en,

	input wire [`row_id_bits-1:0] row_id_out,
	input wire row_id_empty,
	output wire row_id_rd_en,

	  
	output wire [`mult_bits-1:0] wr_data,
	output wire [`row_id_bits-1:0] wr_addr,
	output wire wr_en
	);

 
	wire mult_rd_en;
	wire mult_empty;
	wire [`mult_bits-1:0] mult_out;
	
	Channel CH0(.clk(clk), 
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
					
	Accumulator A0(.Clk(clk), 
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
	
	
	

endmodule
