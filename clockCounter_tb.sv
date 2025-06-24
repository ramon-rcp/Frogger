module clockCounter_tb();
	
	logic clock, reset;
	integer amount;
	
	clockCounter dut (.clock, .reset, .amount);
	
	parameter CLOCK_PERIOD=100;
	initial begin
	 clock <= 0;
	 forever #(CLOCK_PERIOD/2) clock <= ~clock;
	end
	
	initial begin
		reset <= 1; @(posedge clock);
		reset <= 0; @(posedge clock);
		for(integer i = 0; i < 400; i++) begin
			@(posedge clock);
		end
		
		$stop;
	end 
	
	
endmodule 