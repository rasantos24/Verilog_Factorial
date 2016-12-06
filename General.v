`timescale 1ns / 1ps
module General(
		input clk,
		input wd_sele,
		input write_en,
		input read_imm,
		input [1:0] read_add1,
		input [1:0] read_add2,
		input [1:0] write_add,
		input [2:0] operation,
		input [31:0] imm,
		output is_zero,
		output [31:0] result
    );

	wire [31:0] w_result;
	wire [31:0] w_read_data1;
	wire [31:0] w_read_data2;
	wire [31:0] w_write_data;
	wire [31:0] w_read_data22;
	
	assign w_read_data22 = (read_imm) ? imm : w_read_data22;
	FA_ALU(operation, w_read_data1, w_read_data22, is_zero, w_result);
	
	assign result = w_read_data1;
	
	assign w_write_data = (wd_sele) ? imm : w_result;
	RegFile(clk, read_add1, read_add2, write_add, w_write_data, write_en, w_read_data1, w_read_data2);

endmodule
