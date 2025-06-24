module carShifter(
	input logic clock, reset,
	input logic addCar, shift,
	output logic [15:0] carRow
);

	always_ff @(posedge clock)
		if(reset)
			carRow <= 0;
		else if(shift)
			carRow <= {carRow[14:0], addCar};
		else
			carRow <= carRow;
			
endmodule 