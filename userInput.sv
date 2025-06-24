module userInput(
	input logic clock, reset,
	
	input logic in, //the user input
	output logic edgeup //whether it's an edge or not
	);
	
	logic temp; //holds the output of first flipflop
	logic flippedIn; //input after handling metastability
	
	flipflop ff1 (.q(temp), .d(in), .clk(clock));
	flipflop ff2 (.q(flippedIn), .d(temp), .clk(clock));
	
	enum logic {noChangeUp = 1'b0, changeUp = 1'b1} ps, ns;
	logic prevFin;
  
   always_comb 
	 case (ps)
		0: if(flippedIn & ~prevFin) ns = changeUp;
			else ns = noChangeUp;
		1: ns = noChangeUp;
	endcase //noChangeUply output 1 if the input changes from 0 to 1 (edge going up)
		
   always_ff @(posedge clock)
	 if(reset) begin
		ps <= noChangeUp;
		prevFin <= flippedIn;
		end
	 else begin
		ps <= ns;
		prevFin <= flippedIn;
		end

		
   assign edgeup = ps;


endmodule 