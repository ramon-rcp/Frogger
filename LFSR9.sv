module LFSR9(
	input logic clock, reset,
	output logic [8:0] random
);
	
	always_ff @(posedge clock) 
		if(reset)
			random <= 9'b000000000;
		else
			random <= {random[7:0], ~(random[8] ^ random[4])};
		
endmodule 