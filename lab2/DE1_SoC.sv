// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output	[6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]	LEDR;
	input		[3:0]	KEY;
	input		[9:0]	SW;
	
	// Default values, turns off the HEX displays
	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	// Logic to check if SW[3]..SW[0] match your bottom digit
	// and SW[7]..SW[4] match the next.
	// Result should drive LEDR[0].
	wire ldresult, ndresult;
	
	// last digit (SW3-0 0011)
	wire ldand, ldnor;
	and g1 (ldand, SW[1], SW[0]);
	nor g2 (ldnor, SW[3], SW[2]);
	and ldfinal (ldresult, ldand, ldnor);
	
	// next digit (SW7-4 0000)
	nor ndnor (ndresult, SW[7], SW[6], SW[5], SW[4]);
	
	and endresult (LEDR[0], ldresult, ndresult);
endmodule

module DE1_SoC_testbench();
	wire  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire  [9:0] LEDR;
	reg   [3:0] KEY;
	reg   [9:0] SW;
		
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);

	// Try all combinations of inputs.
	integer i;
	initial begin
		SW[9] = 1'b0;
		SW[8] = 1'b0;
		for(i = 0; i <256; i++) begin
			SW[7:0] = i; #10;
		end
	end
endmodule
