// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC2 (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	output	[6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output	[9:0]	LEDR;
	input		[3:0]	KEY;
	input		[9:0]	SW;
	
	assign HEX5 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	
	upc_check	G1 (SW[3:0], LEDR[1], LEDR[0]);
	upc_display	G2 (SW[2:0], HEX3, HEX2, HEX1, HEX0);
endmodule

module DE1_SoC2_testbench();
	wire  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire  [9:0] LEDR;
	reg   [3:0] KEY;
	reg   [9:0] SW;
		
	DE1_SoC2 dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);

	// Try all combinations of inputs.
	integer i;
	initial begin
		SW[9:4] = 1'b0;
		for(i = 0; i < 16; i++) begin
			SW[3:0] = i; #10;
		end
	end
endmodule
