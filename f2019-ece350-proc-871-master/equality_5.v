module equality_5(in0, in1, out);

	input [4:0] in0, in1;
	output out;
	
	wire o0, o1, o2, o3, o4;
	xnor my_o0(o0, in0[0], in1[0]);
	xnor my_o1(o1, in0[1], in1[1]);
	xnor my_o2(o2, in0[2], in1[2]);
	xnor my_o3(o3, in0[3], in1[3]);
	xnor my_o4(o4, in0[4], in1[4]);
	
	and my_out(out, o0, o1, o2, o3, o4);

endmodule