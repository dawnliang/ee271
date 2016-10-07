// 10-bit adder circuit

module adder #(parameter WIDTH=9)(out, a, b);
	output reg	[WIDTH:0] out;
	input			[WIDTH-1:0] a, b;
	
	always @(*)
		out = a + b;
endmodule

module adder_testbench();
	reg 	[8:0]	a, b;
	wire 	[9:0]	out;
	
	adder dut (out, a, b);
	
	initial begin
		a = 9'b000000000;	b = 9'b000000001;	#10;
		a = 9'b111111110;							#10;
		a = 9'b111111111;							#10;
														#10;
	end
endmodule
