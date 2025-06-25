module carShifter_tb();

	logic clock, reset, addCar, shift;
	logic [15:0] carRow;
	
	carShifter dut (.clock, .reset, .addCar, .shift, .carRow);
	
	parameter CLOCK_PERIOD=100;
	initial begin
	 clock <= 0;
	 forever #(CLOCK_PERIOD/2) clock <= ~clock;
	end
	
	initial begin
		reset <= 1; addCar <= 0; shift <= 1; @(posedge clock);
		reset <= 0; @(posedge clock);
		@(posedge clock);
		addCar <= 1; @(posedge clock);
		@(posedge clock);
		addCar <= 0; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		shift <= 0; @(posedge clock);
		addCar <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		shift <= 1; @(posedge clock);
		@(posedge clock);
		@(posedge clock);
		addCar <= 0; @(posedge clock);
		@(posedge clock);	
		@(posedge clock);
	
		$stop;
	end	

endmodule 