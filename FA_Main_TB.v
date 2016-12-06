`timescale 1ns / 1ps
module FA_Main_TB;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] result;

	// Instantiate the Unit Under Test (UUT)
	FA_Main uut (
		.clk(clk), 
		.reset(reset), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

