module frogger(
	output logic [6:0]  HEX0,
	 output logic [9:0]  LEDR,
    input  logic [3:0]  KEY,
    input  logic [9:0]  SW,
    output logic [35:0] GPIO_1,
    input logic clock,
	 input logic ledclock
);
	
	logic [8:0] r1;
	LFSR9 rand1 (.clock, .reset(SW[9]), .random(r1));
	
	logic [8:0] s;
	logic c;
	add10 rhigh (.a(r1), .b(SW[8:0]), .s, .c);
		
	logic [3:0] col;
	logic [3:0] row;
	logic [15:0][15:0] frog;
	
	logic l, d, u, r;

	logic [15:0][15:0] cars;
	assign cars[15:12] = 0;
	assign cars[10:8] = 0;
	assign cars[6:4] = 0;
	assign cars[2:0] = 0;
	logic carReset;
	assign carReset = SW[9] | row==15 | cars[row][col];

	logic [3:0] count;
	
	integer clockCount;
	clockCounter clkc (.clock, .reset(SW[9]), .amount(clockCount));
	
	carShifter carlvl1 (.clock, .reset(carReset), .addCar(c), .shift(clockCount==100), .carRow(cars[3]));
	carShifter carlvl2 (.clock, .reset(carReset), .addCar(s[8]), .shift(clockCount==150 | clockCount==300), .carRow(cars[7]));
	carShifter carlvl3 (.clock, .reset(carReset), .addCar(s[7]), .shift(clockCount==300 | clockCount==200 | clockCount==100), .carRow(cars[11]));
	
	userInput left (.clock, .reset(SW[9]), .in(~KEY[3]), .edgeup(l));
	userInput down (.clock, .reset(SW[9]), .in(~KEY[2]), .edgeup(d));
	userInput up (.clock, .reset(SW[9]), .in(~KEY[1]), .edgeup(u));
	userInput right (.clock, .reset(SW[9]), .in(~KEY[0]), .edgeup(r));
	
	frogdis fd (.clock, .reset(carReset), .l, .d, .u, .r, .col, .row);
	
	LEDDriver #(.FREQDIV(0)) Driver (.CLK(clock), .RST(carReset), .EnableCount(~carReset), .RedPixels(cars), .GrnPixels(frog), .GPIO_1);
		
	victoryCounter vc (.clock, .reset(SW[9]), .win(row==15), .lose(cars[row][col]), .count);
	
	always_comb
		case(count)
			default: HEX0 = 7'b1000000;
			1: HEX0 = 7'b1111001;
			2: HEX0 = 7'b0100100;
			3: HEX0 = 7'b0110000;
			4: HEX0 = 7'b0011001;
			5: HEX0 = 7'b0010010;
			6: HEX0 = 7'b0000010;
			7: HEX0 = 7'b1111000;
			8: HEX0 = 7'b0000000;
			9: HEX0 = 7'b0010000;
		endcase
				
	always_ff @(posedge clock) begin
		if(SW[9]) begin
			frog <= 0;
		end
		else begin
			frog <= 0;
			frog[row][col] <= 1;
		end
	end
	
endmodule 