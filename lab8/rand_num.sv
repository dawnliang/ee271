// generates a random 3-bit number
module rand_num3 #(parameter WIDTH=9) (clk, reset, active, out);
	input clk, reset, active;
	output reg [2:0] out;
	
	reg [2:0] ps, ns;
	reg [WIDTH-1:0] count = 0;
	
	// uses lfsr's to generate random 3 bits
	wire seed;
	xnor x (seed, ns[2], ns[1]);
	lfsr l0(clk, reset, seed, ns[0]);
	lfsr l1(clk, reset, ns[0], ns[1]);
	lfsr l2(clk, reset, ns[1], ns[2]);
	
	always @(posedge clk)
		if (reset | ~active) begin
			out <= 3'b000;
			count <= 0;
		end
		else begin
			if (count == 1) out <= ns;
			count <= count + 1;
		end
endmodule

module rand_num3_testbench();
	reg clk, reset, active;
	wire [2:0] r;
	
	rand_num3 #(.WIDTH(2)) dut (clk, reset, active, r);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
		reset <= 1; active <= 0;	@(posedge clk);
		reset <= 0;						@(posedge clk);
						active <= 1;	@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
											@(posedge clk);
		reset <= 1;						@(posedge clk);
		reset <= 0;						@(posedge clk);
											@(posedge clk);
		$stop;
	end
endmodule

// lfsr unit: data copier
module lfsr(clk, reset, d, q);
	input clk, reset, d;
	output q;
	
	reg ps;
	
	// output logic
	assign q = ps;
	
	// DFF's
	always @(posedge clk)
		if (reset)
			ps <= 1'b0;
		else
			ps <= d;
endmodule

module lfsr_testbench();
	reg clk, reset, d;
	wire q;
	
	lfsr dut (clk, reset, d, q);
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
									@(posedge clk);
		reset <= 1;	d <= 0;	@(posedge clk);
						d <= 1;	@(posedge clk);
		reset <= 0;	d <= 0;	@(posedge clk);
						d <= 1;	@(posedge clk);
									@(posedge clk);
									@(posedge clk);
						d <= 0;	@(posedge clk);
									@(posedge clk);
									@(posedge clk);
						d <= 1;	@(posedge clk);
						d <= 0;	@(posedge clk);
						d <= 1;	@(posedge clk);
						d <= 0;	@(posedge clk);
									@(posedge clk);
									@(posedge clk);
		$stop;
	end
endmodule
