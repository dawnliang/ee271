// controls 8x8 LED array by cycling through rows/columns (requires <= 1 MHz clk)

module led_matrix_driver (clk, red_array, green_array, red_driver, green_driver, row_sink);
	input clk;
	input [7:0][7:0] red_array, green_array;
	output reg [7:0] red_driver, green_driver, row_sink;
	
	reg [2:0] count = 3'b000;
	
	// set drivers & sinks
	always @(*)
		case(count)
			3'b000:	row_sink = 8'b11111110;
			3'b001:	row_sink = 8'b11111101;
			3'b010:	row_sink = 8'b11111011;
			3'b011:	row_sink = 8'b11110111;
			3'b100:	row_sink = 8'b11101111;
			3'b101:	row_sink = 8'b11011111;
			3'b110:	row_sink = 8'b10111111;
			3'b111:	row_sink = 8'b01111111;
			default:	row_sink = 8'bX;
		endcase
	
	assign red_driver[7:0] = red_array[count];
	assign green_driver[7:0] = green_array[count];
	
	// 3-bit counter @ every posedge clk
	always @(posedge clk)
		count <= count + 3'b001;
endmodule

module led_matrix_driver_testbench();
	reg clk;
	reg [7:0][7:0] red_array, green_array;
	wire [7:0] red_driver, green_driver, row_sink;
	
	parameter EIGHT_OFF = 8'b00000000;
	
	led_matrix_driver dut (clk, red_array, green_array, red_driver, green_driver, row_sink);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
		red_array[7][7:0] <= EIGHT_OFF;		green_array[7][7:0] <= EIGHT_OFF;
		red_array[6][7:0] <= EIGHT_OFF;		green_array[6][7:0] <= EIGHT_OFF;
		red_array[5][7:0] <= EIGHT_OFF;		green_array[5][7:0] <= EIGHT_OFF;
		red_array[4][7:0] <= EIGHT_OFF;		green_array[4][7:0] <= EIGHT_OFF;
		red_array[3][7:0] <= EIGHT_OFF;		green_array[3][7:0] <= EIGHT_OFF;
		red_array[2][7:0] <= EIGHT_OFF;		green_array[2][7:0] <= EIGHT_OFF;
		red_array[1][7:0] <= EIGHT_OFF;		green_array[1][7:0] <= EIGHT_OFF;
		red_array[0][7:0] <= EIGHT_OFF;		green_array[0][7:0] <= EIGHT_OFF;	@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
		
		red_array[7][7:0] <= EIGHT_OFF;		green_array[7][7:0] <= EIGHT_OFF;
		red_array[6][7:0] <= 8'b11001111;	green_array[6][7:0] <= EIGHT_OFF;
		red_array[5][7:0] <= EIGHT_OFF;		green_array[5][7:0] <= EIGHT_OFF;
		red_array[4][7:0] <= 8'b11111001;	green_array[4][7:0] <= EIGHT_OFF;
		red_array[3][7:0] <= 8'b11001111;	green_array[3][7:0] <= EIGHT_OFF;
		red_array[2][7:0] <= 8'b11111001;	green_array[2][7:0] <= EIGHT_OFF;
		red_array[1][7:0] <= EIGHT_OFF;		green_array[1][7:0] <= EIGHT_OFF;
		red_array[0][7:0] <= EIGHT_OFF;		green_array[0][7:0] <= EIGHT_OFF;	@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
																										@(posedge clk);
		
		red_array[7][7:0] <= EIGHT_OFF;		green_array[7][7:0] <= 8'b10111110;
		red_array[6][7:0] <= EIGHT_OFF;		green_array[6][7:0] <= 8'b10111011;
		red_array[5][7:0] <= EIGHT_OFF;		green_array[5][7:0] <= 8'b11101110;
		red_array[4][7:0] <= EIGHT_OFF;		green_array[4][7:0] <= EIGHT_OFF;
		red_array[3][7:0] <= EIGHT_OFF;		green_array[3][7:0] <= 8'b11111010;
		red_array[2][7:0] <= EIGHT_OFF;		green_array[2][7:0] <= 8'b11011101;
		red_array[1][7:0] <= EIGHT_OFF;		green_array[1][7:0] <= EIGHT_OFF;
		red_array[0][7:0] <= EIGHT_OFF;		green_array[0][7:0] <= EIGHT_OFF;	@(posedge clk);
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
