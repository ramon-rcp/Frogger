module victoryCounter(
	input logic clock, reset, win, lose,
	output logic [3:0] count
);

	always_ff @(posedge clock)
		if(reset | lose | count==10)
			count <= 0;
		else if(win)
			count <= count + 1;
		else 
			count <= count;
	
endmodule 