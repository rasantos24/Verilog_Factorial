`timescale 1ns / 1ps
module RegFile(
		input clk, 
		input writeEn,
		input [1:0] read_add1, 
		input [1:0] read_add2, 
		input [1:0] write_add,
		input [31:0] write_data, 
		output [31:0] read_data1, 
		output [31:0] read_data2
	);
	
	reg [3:0] reg_file [0:31];
	
	assign read_data1 = reg_file[read_add1];
	assign read_data2 = reg_file[read_add2];
	
	always@(posedge clk)
	begin
		if(writeEn)
			reg_file[write_add] = write_data;
	end		 
 
endmodule
