module winddir(clk, reset, dir, pattern);
	input 		[1:0] dir;
	input			clk, reset;
	output reg	[2:0] pattern;
	
	reg [2:0] ps; // Present State
	reg [2:0] ns; // Next State
	
	// state + transition encoding.
	parameter [2:0] OUTER = 3'b101, INNER = 3'b010, LEFT = 3'b100, RIGHT = 3'b001;
	parameter [1:0] CALM = 2'b00, RTL = 2'b01, LTR = 2'b10;
	
	// Next State logic
	always @(*)
		case (ps)
			OUTER: ns = INNER;
			INNER: begin
				case(dir)
					CALM: ns = OUTER;
					RTL: ns = LEFT;
					LTR: ns = RIGHT;
					default: ns = INNER;
				endcase
			end
			LEFT: begin
				case(dir)
					CALM: ns = INNER;
					RTL: ns = RIGHT;
					LTR: ns = INNER;
					default: ns = INNER;
				endcase
			end
			RIGHT: begin
				case(dir)
					CALM: ns = INNER;
					RTL: ns = INNER;
					LTR: ns = LEFT;
					default: ns = INNER;
				endcase
			end
			default: ns = 3'bX;
		endcase
		
	// Output logic
	assign pattern = ps;
	
	// DFFs
	always @(posedge clk)
		if (reset)
			ps <= INNER;
		else
			ps <= ns;
endmodule

module winddir_testbench();
	reg	clk, reset;
	reg	[1:0] dir;
	wire	[2:0] pattern;
	
	winddir dut (clk, reset, dir, pattern);
	
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
		reset <= 1;			  		  @(posedge clk); // 200
		reset <= 0; 				  @(posedge clk); // 300
						dir <= 2'b00; @(posedge clk); // 400
										  @(posedge clk); // 500
										  @(posedge clk); // 600
						dir <= 2'b01; @(posedge clk); // 700
										  @(posedge clk); // 800
										  @(posedge clk); // 900
										  @(posedge clk); // 1000
										  @(posedge clk); // 1100
						dir <= 2'b10; @(posedge clk); // 1200
										  @(posedge clk); // 1300
										  @(posedge clk); // 1400
										  @(posedge clk); // 1500
										  @(posedge clk); // 1600
		$stop; // End the simulation.
	end
endmodule