module leftLogicalShiftFour(in0, out);
	
	input [31:0] in0;
	output [31:0] out;
	
	assign out[0] = 1'b0;
	assign out[1] = 1'b0;
	assign out[2] = 1'b0;
	assign out[3] = 1'b0;
	assign out[4] = in0[0];
	assign out[5] = in0[1];
	assign out[6] = in0[2];
	assign out[7] = in0[3];
	assign out[8] = in0[4];
	assign out[9] = in0[5];
	assign out[10] = in0[6];
	assign out[11] = in0[7];
	assign out[12] = in0[8];
	assign out[13] = in0[9];
	assign out[14] = in0[10];
	assign out[15] = in0[11];
	assign out[16] = in0[12];
	assign out[17] = in0[13];
	assign out[18] = in0[14];
	assign out[19] = in0[15];
	assign out[20] = in0[16];
	assign out[21] = in0[17];
	assign out[22] = in0[18];
	assign out[23] = in0[19];
	assign out[24] = in0[20];
	assign out[25] = in0[21];
	assign out[26] = in0[22];
	assign out[27] = in0[23];
	assign out[28] = in0[24];
	assign out[29] = in0[25];
	assign out[30] = in0[26];
	assign out[31] = in0[27];
	
	/*
	wire temp_0_a, temp_0_b, temp_0_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[0], 1'b0, temp_0_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_0_a, 1'b0, temp_0_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_0_b, 1'b0, temp_0_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_0_c, 1'b0, out[0]);
	
	wire temp_1_a, temp_1_b, temp_1_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[1], in0[0], temp_1_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_1_a, 1'b0, temp_1_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_1_b, 1'b0, temp_1_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_1_c, 1'b0, out[1]);
	
	wire temp_2_a, temp_2_b, temp_2_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[2], in0[1], temp_2_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_2_a, in0[0], temp_2_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_2_b, 1'b0, temp_2_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_2_c, 1'b0, out[2]);
	
	wire temp_3_a, temp_3_b, temp_3_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[3], in0[2], temp_3_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_3_a, in0[1], temp_3_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_3_b, in0[0], temp_3_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_3_c, 1'b0, out[3]);
	
	wire temp_4_a, temp_4_b, temp_4_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[4], in0[3], temp_4_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_4_a, in0[2], temp_4_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_4_b, in0[1], temp_4_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_4_c, in0[0], out[4]);


	wire temp_5_a, temp_5_b, temp_5_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[5], in0[4], temp_5_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_5_a, in0[3], temp_5_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_5_b, in0[2], temp_5_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_5_c, in0[1], out[5]);


	wire temp_6_a, temp_6_b, temp_6_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[6], in0[5], temp_6_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_6_a, in0[4], temp_6_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_6_b, in0[3], temp_6_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_6_c, in0[2], out[6]);


	wire temp_7_a, temp_7_b, temp_7_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[7], in0[6], temp_7_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_7_a, in0[5], temp_7_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_7_b, in0[4], temp_7_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_7_c, in0[3], out[7]);


	wire temp_8_a, temp_8_b, temp_8_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[8], in0[7], temp_8_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_8_a, in0[6], temp_8_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_8_b, in0[5], temp_8_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_8_c, in0[4], out[8]);


	wire temp_9_a, temp_9_b, temp_9_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[9], in0[8], temp_9_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_9_a, in0[7], temp_9_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_9_b, in0[6], temp_9_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_9_c, in0[5], out[9]);


	wire temp_10_a, temp_10_b, temp_10_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[10], in0[9], temp_10_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_10_a, in0[8], temp_10_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_10_b, in0[7], temp_10_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_10_c, in0[6], out[10]);


	wire temp_11_a, temp_11_b, temp_11_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[11], in0[10], temp_11_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_11_a, in0[9], temp_11_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_11_b, in0[8], temp_11_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_11_c, in0[7], out[11]);


	wire temp_12_a, temp_12_b, temp_12_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[12], in0[11], temp_12_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_12_a, in0[10], temp_12_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_12_b, in0[9], temp_12_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_12_c, in0[8], out[12]);


	wire temp_13_a, temp_13_b, temp_13_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[13], in0[12], temp_13_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_13_a, in0[11], temp_13_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_13_b, in0[10], temp_13_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_13_c, in0[9], out[13]);


	wire temp_14_a, temp_14_b, temp_14_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[14], in0[13], temp_14_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_14_a, in0[12], temp_14_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_14_b, in0[11], temp_14_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_14_c, in0[10], out[14]);


	wire temp_15_a, temp_15_b, temp_15_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[15], in0[14], temp_15_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_15_a, in0[13], temp_15_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_15_b, in0[12], temp_15_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_15_c, in0[11], out[15]);


	wire temp_16_a, temp_16_b, temp_16_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[16], in0[15], temp_16_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_16_a, in0[14], temp_16_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_16_b, in0[13], temp_16_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_16_c, in0[12], out[16]);


	wire temp_17_a, temp_17_b, temp_17_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[17], in0[16], temp_17_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_17_a, in0[15], temp_17_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_17_b, in0[14], temp_17_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_17_c, in0[13], out[17]);


	wire temp_18_a, temp_18_b, temp_18_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[18], in0[17], temp_18_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_18_a, in0[16], temp_18_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_18_b, in0[15], temp_18_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_18_c, in0[14], out[18]);


	wire temp_19_a, temp_19_b, temp_19_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[19], in0[18], temp_19_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_19_a, in0[17], temp_19_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_19_b, in0[16], temp_19_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_19_c, in0[15], out[19]);


	wire temp_20_a, temp_20_b, temp_20_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[20], in0[19], temp_20_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_20_a, in0[18], temp_20_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_20_b, in0[17], temp_20_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_20_c, in0[16], out[20]);


	wire temp_21_a, temp_21_b, temp_21_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[21], in0[20], temp_21_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_21_a, in0[19], temp_21_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_21_b, in0[18], temp_21_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_21_c, in0[17], out[21]);


	wire temp_22_a, temp_22_b, temp_22_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[22], in0[21], temp_22_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_22_a, in0[20], temp_22_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_22_b, in0[19], temp_22_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_22_c, in0[18], out[22]);


	wire temp_23_a, temp_23_b, temp_23_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[23], in0[22], temp_23_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_23_a, in0[21], temp_23_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_23_b, in0[20], temp_23_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_23_c, in0[19], out[23]);


	wire temp_24_a, temp_24_b, temp_24_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[24], in0[23], temp_24_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_24_a, in0[22], temp_24_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_24_b, in0[21], temp_24_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_24_c, in0[20], out[24]);


	wire temp_25_a, temp_25_b, temp_25_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[25], in0[24], temp_25_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_25_a, in0[23], temp_25_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_25_b, in0[22], temp_25_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_25_c, in0[21], out[25]);


	wire temp_26_a, temp_26_b, temp_26_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[26], in0[25], temp_26_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_26_a, in0[24], temp_26_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_26_b, in0[23], temp_26_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_26_c, in0[22], out[26]);


	wire temp_27_a, temp_27_b, temp_27_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[27], in0[26], temp_27_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_27_a, in0[25], temp_27_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_27_b, in0[24], temp_27_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_27_c, in0[23], out[27]);


	wire temp_28_a, temp_28_b, temp_28_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[28], in0[27], temp_28_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_28_a, in0[26], temp_28_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_28_b, in0[25], temp_28_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_28_c, in0[24], out[28]);


	wire temp_29_a, temp_29_b, temp_29_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[29], in0[28], temp_29_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_29_a, in0[27], temp_29_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_29_b, in0[26], temp_29_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_29_c, in0[25], out[29]);


	wire temp_30_a, temp_30_b, temp_30_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[30], in0[29], temp_30_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_30_a, in0[28], temp_30_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_30_b, in0[27], temp_30_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_30_c, in0[26], out[30]);


	wire temp_31_a, temp_31_b, temp_31_c;
	mux_2_onebit(ctrl_shiftamt[0], in0[31], in0[30], temp_31_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_31_a, in0[29], temp_31_b);
	mux_2_onebit(ctrl_shiftamt[2], temp_31_b, in0[28], temp_31_c);
	mux_2_onebit(ctrl_shiftamt[3], temp_31_c, in0[27], out[31]);
	*/

endmodule