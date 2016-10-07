module normalLight (clk, reset, L, R, NL, NR, cent, lightOn);
	input clk, reset;

	// L is true when left key is pressed, R is true when the right key
	// is pressed, NL is true when the light on the left is on, and NR
	// is true when the light on the right is on.
	input L, R, NL, NR, cent;
	
   // when lightOn is true, the center light should be on.
   output reg lightOn;
	
	reg ps; // present State
	reg ns; // next State
	
	// state encoding.
	parameter OFF = 1'b0, ON = 1'b1;
	
	// next State logic
	always @(*)
		case (ps)
			OFF: begin
				// LO = (R(NL) + L(NR)) & ~(R & L)
				if ((R & NL & ~L) | (L & NR & ~R))
					ns = ON;
				else
					ns = OFF;
			end
			ON: begin
				// LO = L xor R
				if (L ^ R)
					ns = OFF;
				else
					ns = ON;
			end
			default: ns = 1'b0;
		endcase
		
	// Output logic
	assign lightOn = ps;
	
	// DFFs
	always @(posedge clk)
		if (reset)
			ps <= cent;
		else
			ps <= ns;
	
endmodule

module normalLight_testbench();
	reg	clk, reset, L, R, NL, NR, lightOn;
	
	normalLight dut (clk, reset, L, R, NL, NR, 0, lightOn);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
																			@(posedge clk); // 100
		reset <= 1;			  		  									@(posedge clk); // 100
																			@(posedge clk); // 100
		reset <= 0; L <= 1;	R <= 0;	NR <= 0; NL <= 0;		@(posedge clk); // 100
						L <= 0;											@(posedge clk); // 100
																			@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 1;					@(posedge clk); // 100
																			@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 0;	NL <= 1;		@(posedge clk); // 100
																			@(posedge clk); // 100
																			@(posedge clk); // 100
						L <= 0;	R <= 1;								@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 1; NL <= 0;		@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 0;					@(posedge clk); // 100
																			@(posedge clk); // 100
						L <= 1;	R <= 0;								@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 1;					@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 0;	NL <= 1;		@(posedge clk); // 100
																			@(posedge clk); // 100
						L <= 1;	R <= 1;								@(posedge clk); // 100
																			@(posedge clk); // 100
						L <= 0;											@(posedge clk); // 100
						L <= 1;											@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 1; NL <= 0;		@(posedge clk); // 100
																			@(posedge clk); // 100
												NR <= 0;					@(posedge clk); // 100
																			@(posedge clk); // 100
		
		$stop; // End the simulation.
	end
endmodule
