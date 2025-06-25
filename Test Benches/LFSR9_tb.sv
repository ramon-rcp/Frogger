module LFSR9_tb();

	logic clock, reset;
	logic [8:0] random;
	logic [8:0] firstState;
	
	// Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clock <= 0;
    forever #(CLOCK_PERIOD/2) clock <= ~clock;
  end
	
	LFSR9 dut (.clock, .reset, .random);
	
	initial begin
		reset <= 1; @(posedge clock);
		reset <= 0; @(posedge clock);
		firstState <= random; @(posedge clock);
		firstState <= firstState; @(posedge clock);
		while(firstState != random)
			@(posedge clock);
		
		$stop;
	end
		
endmodule 