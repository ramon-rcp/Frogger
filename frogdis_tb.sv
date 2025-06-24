module frogdis_tb();

	logic clock, reset, l, d, r, u;
	logic [3:0] col;
	logic [3:0] row;
	
	frogdis dut (.clock, .reset, .l, .d, .u, .r, .col, .row);
	
	// Set up the clock
	parameter CLOCK_PERIOD=100;
	initial begin
	 clock <= 0;
	 forever #(CLOCK_PERIOD/2) clock <= ~clock;
	end
	
	initial begin
		reset <= 1; l <= 0; d <= 0; u <= 0; r <= 0; @(posedge clock);
		reset <= 0; @(posedge clock);
		l <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		l <= 0; u <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		u <= 0; r <= 1; @(posedge clock);
		d <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		d <= 0; u <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		r <= 0; @(posedge clock);
		
		$stop;
	end
	
endmodule 