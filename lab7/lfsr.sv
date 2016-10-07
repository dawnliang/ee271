// LFSR unit

module lfsr(clk, reset, d, q);
	input clk, reset, d;
	output q;
	
	// sequential logic
	reg ps, ns;
	
	// state encoding
	parameter on = 1'b1, off = 1'b0;
	
	// combinational logic
	always @(*)
		ns = d;
	
	// output logic
	assign q = ps;
	
	// DFFr
	always @(posedge clk)
		if (reset)
			ps <= off;
		else
			ps <= ns;
endmodule

module lfsr_testbench();
	reg clock, reset, d;
	wire q;
	
	lfsr dut (clock, reset, d, q);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clock=1;
	always begin
		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end
	
	initial begin
		reset <= 1;				@(posedge clock);
									@(posedge clock);
		reset <= 0;	d <= 0;	@(posedge clock);
									@(posedge clock);
						d <= 1;	@(posedge clock);
									@(posedge clock);
						d <= 0;	@(posedge clock);
						d <= 1;	@(posedge clock);
						d <= 0;	@(posedge clock);
									@(posedge clock);
		$stop;	// end simulation
	end
endmodule
