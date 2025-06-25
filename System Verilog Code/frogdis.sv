module frogdis(
	input logic clock, reset,
	input logic l, d, u, r,
	output logic [3:0] col,
	output logic [3:0] row
);
	
	enum logic [3:0] {s0 = 4'b000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0011, s4 = 4'b0100, s5 = 4'b0101, s6 = 4'b0110, s7 = 4'b0111, s8 = 4'b1000, s9 = 4'b1001, s10 = 4'b1010, s11 = 4'b1011, s12 = 4'b1100, s13 = 4'b1101, s14 = 4'b1110, s15 = 4'b1111} nc, pc, nr, pr;
		
	always_comb begin
		case(pc)
			s0: if(l) nc = s1;
				 else nc = pc;
			s1: if(l) nc = s2;
				 else if(r) nc = s0;
				 else nc = pc;
			s2: if(l) nc = s3;
				 else if(r) nc = s1;
				 else nc = pc;
			s3: if(l) nc = s4;
				 else if(r) nc = s2;
				 else nc = pc;
			s4: if(l) nc = s5;
				 else if(r) nc = s3;
				 else nc = pc;
			s5: if(l) nc = s6;
				 else if(r) nc = s4;
				 else nc = pc;
			s6: if(l) nc = s7;
				 else if(r) nc = s5;
				 else nc = pc;
			s7: if(l) nc = s8;
				 else if(r) nc = s6;
				 else nc = pc;
			s8: if(l) nc = s9;
				 else if(r) nc = s7;
				 else nc = pc;
			s9: if(l) nc = s10;
				 else if(r) nc = s8;
				 else nc = pc;
			s10: if(l) nc = s11;
				 else if(r) nc = s9;
				 else nc = pc;
			s11: if(l) nc = s12;
				 else if(r) nc = s10;
				 else nc = pc;
			s12: if(l) nc = s13;
				 else if(r) nc = s11;
				 else nc = pc;
			s13: if(l) nc = s14;
				 else if(r) nc = s12;
				 else nc = pc;
			s14: if(l) nc = s15;
				 else if(r) nc = s13;
				 else nc = pc;
			s15: if(r) nc = s14;
				 else nc = pc;
		endcase
		case(pr)
			s0: if(u) nr = s1;
				 else nr = pr;
			s1: if(u) nr = s2;
				 else if(d) nr = s0;
				 else nr = pr;
			s2: if(u) nr = s3;
				 else if(d) nr = s1;
				 else nr = pr;
			s3: if(u) nr = s4;
				 else if(d) nr = s2;
				 else nr = pr;
			s4: if(u) nr = s5;
				 else if(d) nr = s3;
				 else nr = pr;
			s5: if(u) nr = s6;
				 else if(d) nr = s4;
				 else nr = pr;
			s6: if(u) nr = s7;
				 else if(d) nr = s5;
				 else nr = pr;
			s7: if(u) nr = s8;
				 else if(d) nr = s6;
				 else nr = pr;
			s8: if(u) nr = s9;
				 else if(d) nr = s7;
				 else nr = pr;
			s9: if(u) nr = s10;
				 else if(d) nr = s8;
				 else nr = pr;
			s10: if(u) nr = s11;
				 else if(d) nr = s9;
				 else nr = pr;
			s11: if(u) nr = s12;
				 else if(d) nr = s10;
				 else nr = pr;
			s12: if(u) nr = s13;
				 else if(d) nr = s11;
				 else nr = pr;
			s13: if(u) nr = s14;
				 else if(d) nr = s12;
				 else nr = pr;
			s14: if(u) nr = s15;
				 else if(d) nr = s13;
				 else nr = pr;
			s15: if(d) nr = s14;
				 else nr = pr;
		endcase
	end
	
	assign col = pc;
	assign row = pr;
	
	
	always_ff @(posedge clock) begin
		if(reset) begin
			pc <= s7;
			pr <= s0;
		end
		else begin
			pc <= nc;
			pr <= nr;
		end
	end

endmodule 