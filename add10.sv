module add10(
	input logic [8:0] a,
	input logic [8:0] b,

	output logic [8:0] s,
	output logic c
);

	assign {c, s} = a + b;
	
endmodule 