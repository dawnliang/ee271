// shift pipes one column over

module pipe_shifter #(parameter WIDTH=8) (clk, reset, active, over, nr, pipes);
	input clk, reset, active, over;
	input [7:0] nr;
	output reg [7:0] pipes;
	
	reg [WIDTH-1:0] count = 0;
	reg [7:0] ps, ns;
	
	always @(*)
		if(over)
			ns = ps;
		else
			ns = nr;
			
	assign pipes = ps;
	
	always @(posedge clk)
		if (reset | ~active) begin
			ps[7:0] <= 8'b00000000;
			count <= 0;
		end
		else begin
			if (count == 0) ps[7:0] <= ns;
			count <= count + 1;
		end
endmodule

module pipe_shifter_testbench();
	reg clk, reset, active, over;
	reg [7:0] nr;
	wire [7:0] pipes;
	
	pipe_shifter dut(clk, reset, active, over, nr, pipes);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
		reset <= 1;	active <= 0;	nr <= 8'b10100110;	@(posedge clk);
		reset <= 0;													@(posedge clk);
						active <= 1;								@(posedge clk);
											nr <= 8'b11010101;	@(posedge clk);
						over <= 1;		nr <= 8'b11010111;	@(posedge clk);
																		@(posedge clk);
		$stop;
	end
endmodule
