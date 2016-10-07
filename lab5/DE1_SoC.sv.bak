// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output	[6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]	LEDR;
	input		[3:0]	KEY;
	input		[9:0]	SW;
	
	// Default values, turns off the HEX displays
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	seg7 S1 (SW[3:0], HEX0);
	seg7 S2 (SW[7:4], HEX1);
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
		SW[9:8] = 1'b0;
		for(i = 0; i < 10; i++) begin
			SW[3:0] = i; #10;
			SW[7:4] = i; #10;
		end
	end
endmodule
