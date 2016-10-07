// 9-bit lfsr

module lfsr9(clk, reset, num);
	input clk, reset;
	output [8:0] num;
	
	wire [8:0] pattern;
	wire in;
	assign num[8:0] = pattern[8:0];
	
	xnor d (in, pattern[4], pattern[8]);
	
	lfsr l1 (clk, reset, in, pattern[0]);
	lfsr l2 (clk, reset, pattern[0], pattern[1]);
	lfsr l3 (clk, reset, pattern[1], pattern[2]);
	lfsr l4 (clk, reset, pattern[2], pattern[3]);
	lfsr l5 (clk, reset, pattern[3], pattern[4]);
	lfsr l6 (clk, reset, pattern[4], pattern[5]);
	lfsr l7 (clk, reset, pattern[5], pattern[6]);
	lfsr l8 (clk, reset, pattern[6], pattern[7]);
	lfsr l9 (clk, reset, pattern[7], pattern[8]);
endmodule

module lfsr9_testbench();
	reg clock, reset;
	wire [8:0] num;

	lfsr9 dut (clock, reset, num);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clock=1;
	always begin
		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end
	
	initial begin
		reset <= 1;	@(posedge clock);
						@(posedge clock);
		reset <= 0;	@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
						@(posedge clock);
		$stop; // end the simulation
	end
endmodule
