module DFFtri(d, clk, clr, in_enable, out_enable, out);
	
	input d, clk, clr, in_enable, out_enable;
	output out;
	wire q, clrn;
	
	assign clrn = ~clr;
	
	DFFE_real a_dff(.d(d), .clk(clk), .clrn(clrn), .in_enable(in_enable), .q(q));
	assign out = out_enable ? q : 1'bz;
	
endmodule