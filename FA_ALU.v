`timescale 1ns / 1ps
module FA_ALU(
		input [31:0] read_data1,
		input [31:0] read_data2,
		input [2:0] operation,
		output is_zero,
		output reg [31:0] resul_out
    );
	 
	always @(operation or read_data1 or read_data2)
	begin
		case(operation)
			3'b000: resul_out = read_data1 + read_data2;
			3'b001: resul_out = read_data1 - read_data2;
			3'b010: resul_out = read_data1 * read_data2;
			3'b011: resul_out = read_data1 / read_data2;
			3'b100: resul_out = read_data1 & read_data2;
		endcase
	end
	assign is_zero = (read_data1 == read_data2);
	
endmodule
