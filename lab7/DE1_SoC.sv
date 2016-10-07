// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	input CLOCK_50; // 50MHz clock.
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output [9:0] LEDR;
	input [3:0] KEY;
	input [9:0] SW;
	
	// Default turn all HEX off
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	
	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire [31:0] clk;
	parameter whichClock = 15;
	clock_divider cdiv (CLOCK_50, clk);
	
	wire off = 0, on = 1;	// on/off constants
	
	wire reset;					// reset signal = SW[9]
	assign reset = SW[9];
	wire againL, againR, playAgain;
	or o (playAgain, againL, againR, reset);
	
	// cyberplayer: if SW[8:0] + lfsr9 >= 512 (i.e. sum[9] = 1), count as button press
	wire [8:0] num;
	wire [9:0] sum;
	lfsr9 r (clk[whichClock], reset, num[8:0]);
	adder comp (sum[9:0], num[8:0], SW[8:0]);
	
	wire bpress;				//			9876543210
	assign bpress = sum[9];	// 512 = 1000000000
	
	// handles user input through DFF
	wire L, R;
	user_input p1L (clk[whichClock], reset, bpress, L);
	user_input p2R (clk[whichClock], reset, ~KEY[0], R);
	
	// playfield
	normalLight n1 (clk[whichClock], playAgain, L, R, LEDR[2], off, off, LEDR[1]);
	normalLight n2 (clk[whichClock], playAgain, L, R, LEDR[3], LEDR[1], off, LEDR[2]);
	normalLight n3 (clk[whichClock], playAgain, L, R, LEDR[4], LEDR[2], off, LEDR[3]);
	normalLight n4 (clk[whichClock], playAgain, L, R, LEDR[5], LEDR[3], off, LEDR[4]);
	normalLight n5 (clk[whichClock], playAgain, L, R, LEDR[6], LEDR[4], on, LEDR[5]);
	normalLight n6 (clk[whichClock], playAgain, L, R, LEDR[7], LEDR[5], off, LEDR[6]);
	normalLight n7 (clk[whichClock], playAgain, L, R, LEDR[8], LEDR[6], off, LEDR[7]);
	normalLight n8 (clk[whichClock], playAgain, L, R, LEDR[9], LEDR[7], off, LEDR[8]);
	normalLight n9 (clk[whichClock], playAgain, L, R, off, LEDR[8], off, LEDR[9]);
	
	// checks for victory
	victory vl (clk[whichClock], reset, LEDR[9], L, R, HEX5, againL);
	victory vr (clk[whichClock], reset, LEDR[1], R, L, HEX0, againR);
endmodule

module DE1_SoC_testbench ();
	reg			clock;
	wire  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire  [9:0] LEDR;
	reg   [3:0] KEY;
	reg   [9:0] SW;
		
	DE1_SoC dut (clock, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clock=1;
	always begin
		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end

	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
														@(posedge clock);
		SW[9] <= 1;	SW[8:0] <= 9'b010000000;@(posedge clock); // reset check
														@(posedge clock);
		SW[9] <= 0;	KEY[0] <= 0;				@(posedge clock);			
														@(posedge clock); // lfsr check
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
						KEY[0] <= 1;				@(posedge clock); // user input
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 1;				@(posedge clock);
														@(posedge clock);
						KEY[0] <= 0;				@(posedge clock);
														@(posedge clock);
		SW[9] <= 1;			  		  				@(posedge clock); // reset
														@(posedge clock);
		SW[9] <= 0;									@(posedge clock);
														@(posedge clock);
		$stop; // End the simulation.
	end
endmodule

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;
	
	initial
		divided_clocks = 0;
		
	always @(posedge clock)
		divided_clocks = divided_clocks + 1;
endmodule
