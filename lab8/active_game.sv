module active_game (clk, reset, ctrl, out);
	input clk, reset, ctrl;
	output out;
	
	reg ps, ns;
	
	always @(*)
		ns = ps | ctrl;
	
	assign out = ps;
	
	always @(posedge clk)
		if (reset)
			ps <= 0;
		else
			ps <= ns;
endmodule

module active_game_testbench();
	reg clk, reset;
	reg ctrl;
	wire out;
	
	active_game dut (clk, reset, ctrl, out);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
		reset <= 1;	ctrl <= 1;	@(posedge clk);
						ctrl <= 0;	@(posedge clk);
		reset <= 0;					@(posedge clk);
										@(posedge clk);
						ctrl <= 1;	@(posedge clk);
						ctrl <= 0;	@(posedge clk);
		reset <= 1;					@(posedge clk);
										@(posedge clk);
		$stop;
	end
endmodule
