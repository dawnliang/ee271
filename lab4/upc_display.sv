module upc_display (upc, HEX3, HEX2, HEX1, HEX0);
	input			[2:0]	upc;
	output reg	[6:0]	HEX3, HEX2, HEX1, HEX0;
	
	always @(*) begin
		case (upc)
			3'b000: begin // siamese
				HEX3 = 7'b1111111;
				HEX2 = 7'b0010010;
				HEX1 = 7'b1001111;
				HEX0 = 7'b0001000;
			end
			3'b001: begin // persian
				HEX3 = 7'b0001100;
				HEX2 = 7'b0000110;
				HEX1 = 7'b1001110;
				HEX0 = 7'b0010010;
			end
			3'b011: begin // coon
				HEX3 = 7'b1000110;
				HEX2 = 7'b1000000;
				HEX1 = 7'b1000000;
				HEX0 = 7'b1001000;
			end
			3'b100: begin // fold
				HEX3 = 7'b0001110;
				HEX2 = 7'b1000000;
				HEX1 = 7'b1000111;
				HEX0 = 7'b0100001;
			end
			3'b101: begin // bengal
				HEX3 = 7'b0000011;
				HEX2 = 7'b0000110;
				HEX1 = 7'b1001000;
				HEX0 = 7'b0010000;
			end
			3'b110: begin // ragdoll
				HEX3 = 7'b1111111;
				HEX2 = 7'b1001110;
				HEX1 = 7'b0001000;
				HEX0 = 7'b0010000;
			end
			default begin // not a cat
				HEX3 = 7'bX;
				HEX2 = 7'bX;
				HEX1 = 7'bX;
				HEX0 = 7'bX;
			end
		endcase
	end
endmodule

module upc_display_testbench();
	wire  [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	reg   [2:0] SW;
		
	upc_display dut (.upc(SW[2:0]), .HEX3, .HEX2, .HEX1, .HEX0);

	integer i;
	initial begin
		for(i = 0; i < 8; i++) begin
			SW[2:0] = i; #10;
		end
	end
endmodule
