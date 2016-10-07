module user_input(clk, reset, key, tug);
	input clk, reset, key;
	
	output reg tug;
	
	reg ps; // present state
	reg ns; // next state
	
	// state encoding.
	parameter OFF = 1'b0, ON = 1'b1;
	
	// next state logic
	always @(*)
		case (ps)
			ON: begin
				if (~key)
					ns = OFF;
				else
					ns = ON;
			end
			OFF: begin
				if (key)
					ns = ON;
				else
					ns = OFF;
			end
			default: ns = OFF;
		endcase
		
	// Output logic
	assign tug = key & ~ps;
	
	// DFFs
	always @(posedge clk)
		if (reset)
			ps <= OFF;
		else
			ps <= ns;
endmodule

module user_input_testbench();
	reg	clk, reset, key, tug;
	
	user_input dut (clk, reset, key, tug);
	
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
		reset <= 1;					@(posedge clk); // 200
		reset <= 0;					@(posedge clk); // 300
						key <= 0;	@(posedge clk); // 400
										@(posedge clk); // 500
										@(posedge clk); // 600
						key <= 1;	@(posedge clk); // 700
										@(posedge clk); // 800
										@(posedge clk); // 900
						key <= 0;	@(posedge clk); // 1000
										@(posedge clk); // 1100
										@(posedge clk); // 1200
		
		$stop; // End the simulation.
	end
endmodule
