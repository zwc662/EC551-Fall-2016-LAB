`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:16 10/14/2016 
// Design Name: 
// Module Name:    Pipelined_Data_Path 
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

module Accumulator(
     input Clk, Reset,

	  input wire [`row_id_bits-1:0] row_id_out,
	  input wire row_id_empty,
	  output reg row_id_rd_en,

	  output reg mult_rd_en,
     input wire mult_empty,
     input wire [`mult_bits-1:0] mult_out,
	  
	  output reg [`row_id_bits-1:0] wr_addr,
	  output reg [`mult_bits-1:0] wr_data,
	  output reg wr_en

	);
	
	initial begin
		wr_addr<=0;
		wr_data<=0;
		wr_en<=0;
		row_id_rd_en<=0;
		mult_rd_en<=0;
	end

	always@(posedge Clk) begin
		if(Reset) begin
			wr_addr<=0;
			wr_data<=0;
			wr_en<=0;
			row_id_rd_en<=0;
			mult_rd_en<=0;
		end else begin
			if(~row_id_empty && ~mult_empty) begin			
				row_id_rd_en<=1;
				mult_rd_en<=1;
				if(row_id_rd_en && mult_rd_en) begin
					if(wr_en) begin
						wr_en<=0;
						wr_data<=mult_out;
						wr_addr<=row_id_out;
					end else begin
						if(row_id_out!=wr_addr) begin
							wr_en<=1; 
						end
						wr_data<=wr_data+mult_out;
					end
				end
			end else begin
				row_id_rd_en<=0;
				mult_rd_en<=0;
			end
		end
	end  
endmodule