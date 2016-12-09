You must generate the IP CORES. 
The name of the ip core you generate should be the same with the one called in the module!!!!


I added some comments on the ports of accumulator and channel, so that you can read the signals more comfortably.

There is a parameter definitions.vh file in the project folder I put on slack. I also attached it here. All the parameters I called are from this file. 
Especially, the parameter `row_id_bits is the row ID number bit length. 
Parameter `mult_out_bits is the bit length of the product of vector value and matrix value.
`matrix_val_bits and ` vec_val_bits are the bit lengths of one single matrix and vector element value.
