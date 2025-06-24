module topLevel(
	input logic CLOCK_50,
	output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	output logic [9:0]  LEDR,
   input  logic [3:0]  KEY,
   input  logic [9:0]  SW,
   output logic [35:0] GPIO_1
);

	logic [31:0] div_clock;
	clock_divider clockdiv (.clock(CLOCK_50), .divided_clocks(div_clock));
	frogger game (.HEX0, .LEDR, .KEY, .SW, .GPIO_1, .clock(div_clock[15]), .ledclock(CLOCK_50));
	
	assign HEX5 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	
endmodule 