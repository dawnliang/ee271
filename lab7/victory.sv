// monitors tug-of-war victory

module victory (clk, reset, side, control, oppose, disp, playAgain);
	input clk, reset;				// clock + reset
	input side, control, oppose;			// input L/R edge lights + L/R user inputs
	output playAgain;				// restart game/new round
	output [6:0] disp;	// HEX0 display outputs
	
	// sequential logic circuit
	reg [6:0] ps, ns;

	// state encoding
	parameter 	zero		= 7'b1000000,
					one		= 7'b1111001,
					two		= 7'b0100100,
					three		= 7'b0110000,
					four		= 7'b0011001,
					five		= 7'b0010010,
					six		= 7'b0000010,
					seven		= 7'b1111000;
	parameter	on = 1'b1, off = 1'b0;
	
	// next state logic
	always @(*) begin
		if (side & control & ~oppose)			// win
			case(ps)
				zero: ns[6:0] = one;
				one: ns[6:0] = two;
				two: ns[6:0] = three;
				three: ns[6:0] = four;
				four: ns[6:0] = five;
				five: ns[6:0] = six;
				six: ns[6:0] = seven;
				default: ns[6:0] = 7'bX;
			endcase
		else											// not win
			ns[6:0] = ps[6:0];
	end
	
	// output logic
	assign disp[6:0] = ps[6:0];
	assign playAgain = ~(ps == ns);
	
	// DFF
	always @(posedge clk) begin
		if (reset)
			ps <= zero;
		else
			ps <= ns;
	end
endmodule

module victory_testbench();
	reg	clock, reset;
	reg	E;
	reg	[1:0] C;
	wire	again;
	wire  [6:0] hex;
	
	wire [1:0] on = 2'b11, l = 2'b10, r = 2'b01, off = 2'b00;
		
	victory dut (clock, reset, E, C[1], C[0], hex, again);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clock=1;
	always begin
		#(CLOCK_PERIOD/2);
		clock = ~clock;
	end

	initial begin
		reset <= 1;										@(posedge clock); // reset
															@(posedge clock);
		reset <= 0;										@(posedge clock);
						E <= off;	C[1:0] <= off;	@(posedge clock);	// no victory possible
															@(posedge clock);
										C[1:0] <= l;	@(posedge clock);
															@(posedge clock);
										C[1:0] <= r;	@(posedge clock);
															@(posedge clock);
										C[1:0] <= on;	@(posedge clock);
															@(posedge clock);
		reset <= 1;										@(posedge clock); // reset
															@(posedge clock);
		reset <= 0;										@(posedge clock);
						E <= 1;							@(posedge clock); // left victory
															@(posedge clock);
										C[1:0] <= l;	@(posedge clock);
															@(posedge clock);
										C[1:0] <= r;	@(posedge clock);
															@(posedge clock);
										C[1:0] <= off;	@(posedge clock);
															@(posedge clock);
		reset <= 1;										@(posedge clock); // reset
															@(posedge clock);
		reset <= 0;										@(posedge clock);
						E <= 0;		C[1:0] <= off;	@(posedge clock); // right victory
															@(posedge clock);
										C[1:0] <= l;	@(posedge clock);
															@(posedge clock);
										C[1:0] <= r;	@(posedge clock);
															@(posedge clock);
										C[1:0] <= on;	@(posedge clock);
															@(posedge clock);
		$stop;
	end
endmodule
