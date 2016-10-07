// Top-level module that defines the I/Os for the DE-1 SoC board

module upc_check (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
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
	
	// definitions
	// wire D = LEDR[0], S = LEDR[1];
	wire M = SW[3],
		  U = SW[2],
		  P = SW[1],
		  C = SW[0];
	wire notM, notP;
	
	not n1 (notM, M);
	not n2 (notP, P);
	
	// discounted: D = P + UC to LEDR[0]
	wire UandC;
	and dg1 (UandC, U, C);
	or dg2 (LEDR[0], UandC, P);
	
	// expensive: E = UP* + (U + C)* to wire
	wire E, UandnotP, UnorC;
	and eg1 (UandnotP, notP, U);
	nor eg2 (UnorC, U, C);
	or eg3 (E, UandnotP, UnorC);
	
	// stolen: S = EM* to LEDR[1]
	and sg1 (LEDR[1], notM, E);
endmodule

module upc_check_testbench();
	wire  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire  [9:0] LEDR;
	reg   [3:0] KEY;
	reg   [9:0] SW;
		
	upc_check dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);

	// Try all combinations of inputs.
	integer i;
	initial begin
		SW[9:4] = 1'b0;
		for(i = 0; i < 16; i++) begin
			SW[3:0] = i; #10;
		end
	end
endmodule
