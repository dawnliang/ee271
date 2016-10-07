// Top-level DE1-SoC module

module DE1_SoC(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	input CLOCK_50; // 50MHz clock.
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output [9:0] LEDR;
	output [35:0] GPIO_0;
	input [3:0] KEY;
	input [9:0] SW;
	
	// Default turn all HEX off
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	
	wire OFF = 0, ON = 1;						// on/off constants
	
	wire [31:0] clk;
	parameter whichClock = 16;
	clock_divider cdiv (CLOCK_50, clk);
	wire clk0;										// main clock
	assign clk0 = clk[whichClock];
	
	wire reset = SW[9];							// reset
	wire gameOver;
	
	// user input
	wire ctrl;
	user_input ui (clk0, reset, ~KEY[0], ctrl);
	
	// starting the game
	wire active;
	active_game a (clk0, reset, ctrl, active);
	
	// playfield
	wire [7:0][7:0] red_array, green_array;
	parameter CC_DELAY = 7, PIPE_DELAY = 8;
	
	// cc: cc_light l(clk, reset, active, ctrl, dv, nu, nd, ul, out)
	cc_light #(.WIDTH(CC_DELAY)) l0 (clk0, reset, active, gameOver, ctrl, OFF, OFF, red_array[0][6], ON, red_array[0][7]);
	cc_light #(.WIDTH(CC_DELAY)) l1 (clk0, reset, active, gameOver, ctrl, OFF, red_array[0][7], red_array[0][5], OFF, red_array[0][6]);
	cc_light #(.WIDTH(CC_DELAY)) l2 (clk0, reset, active, gameOver, ctrl, OFF, red_array[0][6], red_array[0][4], OFF, red_array[0][5]);
	cc_light #(.WIDTH(CC_DELAY)) l3 (clk0, reset, active, gameOver, ctrl, ON, red_array[0][5], red_array[0][3], OFF, red_array[0][4]);
	cc_light #(.WIDTH(CC_DELAY)) l4 (clk0, reset, active, gameOver, ctrl, OFF, red_array[0][4], red_array[0][2], OFF, red_array[0][3]);
	cc_light #(.WIDTH(CC_DELAY)) l5 (clk0, reset, active, gameOver, ctrl, OFF, red_array[0][3], red_array[0][1], OFF, red_array[0][2]);
	cc_light #(.WIDTH(CC_DELAY)) l6 (clk0, reset, active, gameOver, ctrl, OFF, red_array[0][2], red_array[0][0], OFF, red_array[0][1]);
	cc_light #(.WIDTH(CC_DELAY)) l7 (clk0, reset, active, gameOver, ctrl, OFF, red_array[0][1], OFF, OFF, red_array[0][0]);
	
	// all other red columns off
	assign red_array[7][7:0] = 8'b00000000;
	assign red_array[6][7:0] = 8'b00000000;
	assign red_array[5][7:0] = 8'b00000000;
	assign red_array[4][7:0] = 8'b00000000;
	assign red_array[3][7:0] = 8'b00000000;
	assign red_array[2][7:0] = 8'b00000000;
	assign red_array[1][7:0] = 8'b00000000;
	
	// pipes
	wire [2:0] r; // random number
	rand_num3 #(.WIDTH(PIPE_DELAY+1)) r4 (clk0, reset, active, r);
	// pipe_generator #(parameter WIDTH=8) (clk, reset, active, index, pattern);
	pipe_generator #(.WIDTH(PIPE_DELAY+1)) pip0 (clk0, reset, active, gameOver, r, green_array[7][7:0]);
	pipe_shifter #(.WIDTH(PIPE_DELAY)) pip1 (clk0, reset, active, gameOver, green_array[7][7:0], green_array[6][7:0]);
	pipe_shifter #(.WIDTH(PIPE_DELAY)) pip2 (clk0, reset, active, gameOver, green_array[6][7:0], green_array[5][7:0]);
	pipe_shifter #(.WIDTH(PIPE_DELAY)) pip3 (clk0, reset, active, gameOver, green_array[5][7:0], green_array[4][7:0]);
	pipe_shifter #(.WIDTH(PIPE_DELAY)) pip4 (clk0, reset, active, gameOver, green_array[4][7:0], green_array[3][7:0]);
	pipe_shifter #(.WIDTH(PIPE_DELAY)) pip5 (clk0, reset, active, gameOver, green_array[3][7:0], green_array[2][7:0]);
	pipe_shifter #(.WIDTH(PIPE_DELAY)) pip6 (clk0, reset, active, gameOver, green_array[2][7:0], green_array[1][7:0]);
	pipe_shifter #(.WIDTH(PIPE_DELAY)) pip7 (clk0, reset, active, gameOver, green_array[1][7:0], green_array[0][7:0]);
	
	// led display driver
	led_matrix_driver mega (clk0, red_array, green_array, GPIO_0[27:20], GPIO_0[35:28], GPIO_0[19:12]);
	
	// status checker
	wire addPoint;
	status_checker stat (clk0, reset, active, red_array[0], green_array[0], gameOver, addPoint);
	
	// score display on hex
	wire lp0, lp1, lp2;
	single_hex d0(clk0, reset, active, 7'b1000000, addPoint, HEX0, lp0);
	single_hex d1(clk0, reset, active, 7'b1111111, lp0, HEX1, lp1);
	single_hex d2(clk0, reset, active, 7'b1111111, lp1, HEX2, lp2);
endmodule

module DE1_SoC_testbench();
	reg	clk;
	wire  [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire  [9:0] LEDR;
	reg   [3:0] KEY;
	reg   [9:0] SW;
	wire	[35:0] GPIO_0;
	
	DE1_SoC dut (clk, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, GPIO_0);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
		SW[9] <= 1;	KEY[0] <= 1;	@(posedge clk);
						KEY[0] <= 0;	@(posedge clk);
		SW[9] <= 0;						@(posedge clk);
						KEY[0] <= 1;	@(posedge clk);
											@(posedge clk);
						KEY[0] <= 0;	@(posedge clk);
						KEY[0] <= 1;	@(posedge clk);
						KEY[0] <= 0;	@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		$stop;
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
