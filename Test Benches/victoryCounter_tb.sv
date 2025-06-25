module victoryCounter_tb();

	logic clock, reset, win, lose;
	logic [3:0] count;
	
	victoryCounter dut (.clock, .reset, .win, .lose, .count);
	
	parameter CLOCK_PERIOD=100;
	initial begin
	 clock <= 0;
	 forever #(CLOCK_PERIOD/2) clock <= ~clock;
	end
	
	initial begin
		reset <= 1; win <= 0; lose <= 0; @(posedge clock);
		reset <= 0; @(posedge clock);
		win <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		win <= 0; @(posedge clock);
		@(posedge clock);
		lose <= 1; @(posedge clock);
		lose <= 0; @(posedge clock);
		@(posedge clock);
		win <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock); 
		@(posedge clock);
		@(posedge clock);
		
		$stop;
	end

endmodule 