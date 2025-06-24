module clockCounter(
	input logic clock, reset,
	output integer amount
);

	always_ff @(posedge clock)
		if(reset | amount==300)
			amount <= 0;
		else
			amount <= amount + 1;

endmodule 