`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:01 11/30/2016 
// Designame: 
// Moduleame:    Channel 
// Projectame: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Channel(clk, rst, 	
					matrix_val, matrix_val_empty, matrix_val_rd_en,
					vec_val, vec_val_empty, vec_val_rd_en,
					mult_rd_en, mult_empty, mult_out 
    );


input wire clk, rst;

input wire [`matrix_val_bits-1:0] matrix_val;
input wire matrix_val_empty;
output reg matrix_val_rd_en;

input wire [`vec_val_bits-1:0] vec_val;
input wire vec_val_empty;
output reg vec_val_rd_en;

input wire mult_rd_en;
output wire mult_empty;
output wire [`mult_bits-1:0] mult_out;

//just collect the fifo from one module to another module, nothing changed

wire [`mult_bits-1:0] mult=vec_val * matrix_val;//product of vector element and matrix element 
wire wr_en=vec_val_rd_en && matrix_val_rd_en;//multiplier fifo write enable signal
wire full; // multiplier fifo full signal

FIFO fifo_mult_(.clk(clk),
					.rst(rst),
					.din(mult),
					.wr_en(wr_en),
					.full(full),
					.dout(mult_out),
					.rd_en(mult_rd_en),
					.empty(mult_empty)
					);//don't know if the fifo is working. Somehow can't test it by now

initial begin
	matrix_val_rd_en<=1; //begin reading matrix element
	vec_val_rd_en<=1; //begin reading vector element
end

always@(posedge clk) begin
	if(rst==0) begin
		if(~vec_val_empty && ~matrix_val_empty) begin //if the BVB and matrix value fifo both are not empty
			if(full) begin //if the multiplier fifo is full, stop writing and stop reading from vector and matrix
				vec_val_rd_en<=0;
				matrix_val_rd_en<=0;
			end else begin //if the multiplier fifo is not full, read from vector and matrix 
				vec_val_rd_en<=1; 
				matrix_val_rd_en<=1;
			end
		end else begin //if the vector and matrix value fifo is empty, stop reading and writing
			vec_val_rd_en<=0;
			matrix_val_rd_en<=0;
		end
		
	end else begin 
		matrix_val_rd_en<=0;
		vec_val_rd_en<=0;
	end
end

endmodule
