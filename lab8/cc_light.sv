// controls a single cc player led

module cc_light #(parameter WIDTH=7) (clk, reset, active, over, ctrl, dv, nu, nd, ul, light);
	input clk, reset, active, over;
	
	// ctrl is true if button pressed, false if not
	// dv is state upon reset
	// nu/nd are neighboring up/down lights
	// ul is true if the light is the upper limit
	input ctrl, dv, nu, nd, ul;
	output light;
	
	reg [WIDTH-1:0] count = 0;
	reg ps, ns = 1'b0;
	
	always @(*)
		if (over)
			ns = ps;
		else
			case(ps)
				1'b0: ns = (ctrl & nd)|(~ctrl & nu);	// turn on if told to move up & neighboring down is on
																	// or told to move down & neighboring up is on
																	// otherwise stay off
				1'b1: ns = ul & ctrl;						// stay on if told to move up & upper limit
																	// otherwise turn off
			endcase
	
	assign light = ps;
	
	always @(posedge clk)
		if (reset | ~active) begin
			ps <= dv;
			count <= 0;
		end
		else begin
			if (count == 0) ps <= ns;
			count <= count + 1;
		end
endmodule

module cc_light_testbench();
	reg clk, reset, active, over;
	reg ctrl, dv, nu, nd, ul;
	wire lightOn;
	
	cc_light dut(clk, reset, active, over, ctrl, dv, nu, nd, ul, lightOn);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
		reset <= 1;	active <= 0;
		ul <= 0;	over <= 0;		nu <= 0;	nd <= 0;
						dv <= 1;								@(posedge clk);
						dv <= 0;								@(posedge clk);
						ctrl <= 1;				nd <= 1;	@(posedge clk);
		
		reset <= 0;											@(posedge clk);
						ctrl <= 0;							@(posedge clk);
						ctrl <= 1;							@(posedge clk);
		active <= 1;										@(posedge clk);
													nd <= 0;	@(posedge clk);
										nu <= 1;				@(posedge clk);
						ctrl <= 0;							@(posedge clk);
										nu <= 0;				@(posedge clk);
													nd <= 1;	@(posedge clk);
													
			ul <= 1;	ctrl <= 1;							@(posedge clk);
													nd <= 0;	@(posedge clk);
			over <= 1;										@(posedge clk);
						ctrl <= 0;							@(posedge clk);
																@(posedge clk);
		$stop;
	end
endmodule
