`timescale 1ns / 1ps
module FA_Main(
		input clk,
		input reset,
		output [31:0] result
    );
	 
	wire [1:0] read_add1;
	wire [1:0] read_add2;
	wire [1:0] write_add;
	wire [2:0] operation;
	wire [31:0] write_data;
	wire wd_selec;
	wire write_en;
	wire read_imm;
	wire is_zero;
	 
	General(clk, read_add1, read_add2, write_add, wd_selec, write_en, operation, result);
	//FA_FMS(clk, reset, is_zero, read_add1, read_add2, write_add, wd_selec, write_en, result);

endmodule
