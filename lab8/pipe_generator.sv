// picks one out of seven pipe patterns based on 3-bit input

module pipe_generator #(parameter WIDTH=9) (clk, reset, active, over, index, pattern);
	input clk, reset, active, over;
	input [2:0] index;
	output reg [7:0] pattern;
	
	reg [WIDTH-1:0] count = 0;
	reg gap = 1'b0;
	reg [7:0] ps, ns;
	
	always @(*)
		if (over)
			ns = pattern;
		else
			if (gap == 0)
				case(index)
					3'b000:	ns = 8'b10011111;
					3'b001:	ns = 8'b11001111;
					3'b010:	ns = 8'b11100111;
					3'b011:	ns = 8'b11110011;
					3'b100:	ns = 8'b11111001;
					3'b101:	ns = 8'b11001111;
					3'b110:	ns = 8'b11100111;
					3'b111:	ns = 8'b11000111; // forbidden case by lfsr
					default:	ns = 8'b00000000;
				endcase
			else
				ns = 8'b00000000;
				
	assign pattern = ps;
		
	always @(posedge clk)
		if (reset | ~active) begin
			ps <= 8'b00000000;
			count <= 0;
			gap <= 1'b0;
		end
		else begin
			if (count == 0) begin
				ps <= ns;
				gap <= gap + 1'b1;
			end
			count <= count + 1;
		end
endmodule

module pipe_generator_testbench();
	reg clk, reset, active, over;
	reg [2:0] j;
	wire [7:0] leds;
	
	pipe_generator #(.WIDTH(3)) dut(clk, reset, active, over, j, leds);
	
	// Set up the clock
	parameter CLOCK_PERIOD=100;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial begin
		reset <= 1;	active <= 0;	j <= 3'b010;	@(posedge clk);
		reset <= 0;											@(posedge clk);
						active <= 1;						@(posedge clk);
											j <= 3'b000;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
											j <= 3'b001;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
											j <= 3'b010;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
											j <= 3'b011;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
											j <= 3'b100;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
											j <= 3'b101;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
											j <= 3'b110;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
											j <= 3'b111;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
						over <= 1;		j <= 3'b110;	@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
		$stop;
	end
endmodule
