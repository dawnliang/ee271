module upc_check (mupc, D, S);
	output	D, S;
	input		[3:0]	mupc;
	
	// definitions
	wire M = mupc[3],
		  U = mupc[2],
		  P = mupc[1],
		  C = mupc[0];
	wire notM, notP;
	
	not n1 (notM, M);
	not n2 (notP, P);
	
	// discounted: D = P + UC
	wire UandC;
	and dg1 (UandC, U, C);
	or dg2 (D, UandC, P);
	
	// expensive: E = UP* + (U + C)*
	wire E, UandnotP, UnorC;
	and eg1 (UandnotP, notP, U);
	nor eg2 (UnorC, U, C);
	or eg3 (E, UandnotP, UnorC);
	
	// stolen: S = EM*
	and sg1 (S, notM, E);
endmodule

module upc_check_testbench();
	wire  [1:0] LEDR;
	reg   [3:0] SW;
		
	upc_check dut (SW[3:0], LEDR[0], LEDR[1]);

	integer i;
	initial begin
		for(i = 0; i < 16; i++) begin
			SW[3:0] = i; #10;
		end
	end
endmodule
