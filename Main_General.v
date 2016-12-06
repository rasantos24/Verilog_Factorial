`timescale 1ns / 1ps
module Main_General(
		input clk,
		input wd_selec,
		input write_en,
		input read_imm,
		input [1:0] read_add1,
		input [1:0] read_add2,
		input [1:0] write_add,
		input [2:0] operation,
		input [31:0] imm,
		output [2:0] next_state,
		output is_zero,
		output [31:0] result
    );
	 
	 wire current_state;
	 
	 always @(current_state)
	 begin
		case(current_state)
			3'b000:
			begin
				write_en = 1;
				read_add1 = 2'bXX;
				read_add2 = 2'bXX;
				write_add = 2'b00;
				wd_selec = 1;
				imm = 5;
				operation = 3'bXXX;
				read_imm = 1'bX;
				next_state = 3'b001;
			end
			
			3'b001:
			begin
				write_en = 1;
				read_add1 = 2'bXX;
				read_add2 = 2'bXX;
				write_add = 2'b01;
				wd_selec = 1;
				imm = 1;
				operation = 3'bXXX;
				read_imm = 1'bX;
				next_state = 3'b010;
			end
			
			3'b010:
			begin
				write_en = 1;
				read_add1 = 2'b00;
				read_add2 = 2'b01;
				write_add = 2'b01;
				wd_selec = 0;
				imm = x;
				operation = 3'b010;
				read_imm = 1'bX;
				next_state = 3'b011;
			end
			
			3'b011:
			begin
				write_en = 1;
				read_add1 = 2'b00;
				read_add2 = 2'bXX;
				write_add = 2'b00;
				wd_selec = 0;
				imm = 1;
				operation = 3'b001;
				read_imm = 1'b0;
				next_state = 3'b100;
			end
			
			3'b100:
			begin
				write_en = 0;
				read_add1 = 2'b00;
				read_add2 = 2'bXX;
				write_add = 2'bXX;
				wd_selec = X;
				imm = 1;
				operation = 3'bXXX;
				read_imm = 1'b0;
				next_state = 3'b010;
			end
			
			3'bXXX:
			if(is_zero == 1)
			begin
				begin
					write_en = X;
					read_add1 = 2'b01;
					read_add2 = 2'bXX;
					write_add = 2'bXX;
					wd_selec = X;
					imm = X;
					operation = 3'bXXX;
					read_imm = 1'b0;
					next_state = 3'bXXX;
				end
			end
		endcase
	end

endmodule
