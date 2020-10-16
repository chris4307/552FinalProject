module coincidence_detector_32(in0, out);
	
	input [32:0] in0;
	output out;

	wire [32:0] in0_not;
	alu_not_33 my_alu_not_33(in0, in0_not);


	wire all_zeros;
	and my_all_zeros(all_zeros, in0_not[32], in0_not[31], in0_not[30], in0_not[29], in0_not[28], in0_not[27], in0_not[26], in0_not[25], in0_not[24], in0_not[23], in0_not[22], in0_not[21], in0_not[20], in0_not[19], in0_not[18], in0_not[17], in0_not[16], in0_not[15], in0_not[14], in0_not[13], in0_not[12], in0_not[11], in0_not[10], in0_not[9], in0_not[8], in0_not[7], in0_not[6], in0_not[5], in0_not[4], in0_not[3], in0_not[2], in0_not[1], in0_not[0]);

	wire all_ones;
	and my_all_ones(all_ones, in0[32], in0[31], in0[30], in0[29], in0[28], in0[27], in0[26], in0[25], in0[24], in0[23], in0[22], in0[21], in0[20], in0[19], in0[18], in0[17], in0[16], in0[15], in0[14], in0[13], in0[12], in0[11], in0[10], in0[9], in0[8], in0[7], in0[6], in0[5], in0[4], in0[3], in0[2], in0[1], in0[0]);

	or my_out(out, all_zeros, all_ones);

endmodule