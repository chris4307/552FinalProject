module equality_32(in0, in1, out);

	input [31:0] in0, in1;
	output out;
	
	wire o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25, o26, o27, o28, o29, o30, o31;
	xnor my_o0(o0, in0[0], in1[0]);
	xnor my_o1(o1, in0[1], in1[1]);
	xnor my_o2(o2, in0[2], in1[2]);
	xnor my_o3(o3, in0[3], in1[3]);
	xnor my_o4(o4, in0[4], in1[4]);
	xnor my_o5(o5, in0[5], in1[5]);
	xnor my_o6(o6, in0[6], in1[6]);
	xnor my_o7(o7, in0[7], in1[7]);
	xnor my_o8(o8, in0[8], in1[8]);
	xnor my_o9(o9, in0[9], in1[9]);
	xnor my_o10(o10, in0[10], in1[10]);
	xnor my_o11(o11, in0[11], in1[11]);
	xnor my_o12(o12, in0[12], in1[12]);
	xnor my_o13(o13, in0[13], in1[13]);
	xnor my_o14(o14, in0[14], in1[14]);
	xnor my_o15(o15, in0[15], in1[15]);
	xnor my_o16(o16, in0[16], in1[16]);
	xnor my_o17(o17, in0[17], in1[17]);
	xnor my_o18(o18, in0[18], in1[18]);
	xnor my_o19(o19, in0[19], in1[19]);
	xnor my_o20(o20, in0[20], in1[20]);
	xnor my_o21(o21, in0[21], in1[21]);
	xnor my_o22(o22, in0[22], in1[22]);
	xnor my_o23(o23, in0[23], in1[23]);
	xnor my_o24(o24, in0[24], in1[24]);
	xnor my_o25(o25, in0[25], in1[25]);
	xnor my_o26(o26, in0[26], in1[26]);
	xnor my_o27(o27, in0[27], in1[27]);
	xnor my_o28(o28, in0[28], in1[28]);
	xnor my_o29(o29, in0[29], in1[29]);
	xnor my_o30(o30, in0[30], in1[30]);
	xnor my_o31(o31, in0[31], in1[31]);
	
	and my_out(out, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25, o26, o27, o28, o29, o30, o31);

endmodule