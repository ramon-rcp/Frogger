module frogger_tb();
	
	logic clock, ledclock;
	logic [6:0]  HEX0;
	logic [9:0]  LEDR;
   logic [3:0]  KEY;
   logic [9:0]  SW;
   logic [35:0] GPIO_1;
	
	frogger dut (.HEX0, .LEDR, .KEY, .SW, .GPIO_1, .clock, .ledclock);
	
	// Set up the clock
	parameter CLOCK_PERIOD=100;
	initial begin
	 clock <= 0;
	 forever #(CLOCK_PERIOD/2) clock <= ~clock;
	end
	
	initial begin
	 ledclock <= 0;
	 forever #(5) ledclock <= ~ledclock;
	end
	
	assign SW[8:0] = 9'b011101010;
	
	initial begin
		SW[9] <= 1; @(posedge clock);
		SW[9] <= 0; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		
		
		$stop;
	end

endmodule 