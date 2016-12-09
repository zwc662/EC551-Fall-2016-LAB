`include "definitions.vh"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:12 12/09/2016 
// Design Name: 
// Module Name:    Big_Channel 
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
module Big_Channel( 
	input wire clk, rst,	
	
	input wire [`matrix_val_bits * `channel_num -1 :0] matrix_val,
	input wire [`channel_num - 1 : 0] matrix_val_empty,
	output wire [`channel_num - 1 : 0] matrix_val_rd_en,

	input wire [`vec_val_bits * `channel_num - 1 : 0] vec_val,
	input wire [`channel_num-1:0]	vec_val_empty,
	output wire [`channel_num-1:0] vec_val_rd_en,

	input wire [`row_id_bits * `channel_num -1:0] row_id_out,
	input wire [`channel_num-1:0] row_id_empty,
	output wire [`channel_num-1:0] row_id_rd_en,

	  
	output wire [`mult_bits * `channel_num -1:0] wr_data,
	output wire [`row_id_bits * `channel_num -1:0] wr_addr,
	output wire [`channel_num-1:0]wr_en
	);
	
	generate 
	genvar i;
	for(i=`channel_num-1; i>=0; i=i-1) begin: channels
		Channel_Accumulator CH (
		.clk(clk), 
		.rst(rst), 		
		.matrix_val(matrix_val[`matrix_val_bits * (i+1) -1:  `matrix_val_bits * i]), 
		.matrix_val_empty(matrix_val_empty[i]), 
		.matrix_val_rd_en(matrix_val_rd_en[i]), 
		.vec_val(vec_val[`vec_val_bits *  (i+1)-1 : `vec_val_bits * i]), 
		.vec_val_empty(vec_val_empty[i]), 
		.vec_val_rd_en(vec_val_rd_en[i]), 
		.row_id_out(row_id_out[`row_id_bits*(i+1)-1 : `row_id_bits*i]), 
		.row_id_empty(row_id_empty[i]), 
		.row_id_rd_en(row_id_rd_en[i]), 
		.wr_data(wr_data[`mult_bits*(i+1)-1 : `mult_bits*i]), 
		.wr_addr(wr_addr[`row_id_bits*(i+1)-1 : `row_id_bits*i]), 
		.wr_en(wr_en[i])
	);
  end	
  endgenerate


endmodule
