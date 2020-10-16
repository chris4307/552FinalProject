module leftLogicalShiftTwo(in0, out);
	
	input [31:0] in0;
	output [31:0] out;
	
	assign out[0] = 1'b0;
	assign out[1] = 1'b0;
	assign out[2] = in0[0];
	assign out[3] = in0[1];
	assign out[4] = in0[2];
	assign out[5] = in0[3];
	assign out[6] = in0[4];
	assign out[7] = in0[5];
	assign out[8] = in0[6];
	assign out[9] = in0[7];
	assign out[10] = in0[8];
	assign out[11] = in0[9];
	assign out[12] = in0[10];
	assign out[13] = in0[11];
	assign out[14] = in0[12];
	assign out[15] = in0[13];
	assign out[16] = in0[14];
	assign out[17] = in0[15];
	assign out[18] = in0[16];
	assign out[19] = in0[17];
	assign out[20] = in0[18];
	assign out[21] = in0[19];
	assign out[22] = in0[20];
	assign out[23] = in0[21];
	assign out[24] = in0[22];
	assign out[25] = in0[23];
	assign out[26] = in0[24];
	assign out[27] = in0[25];
	assign out[28] = in0[26];
	assign out[29] = in0[27];
	assign out[30] = in0[28];
	assign out[31] = in0[29];
	
	/*
	wire temp_0_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[0], 1'b0, temp_0_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_0_a, 1'b0, out[0]);
	
	wire temp_1_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[1], in0[0], temp_1_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_1_a, 1'b0, out[1]);
	
	wire temp_2_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[2], in0[1], temp_2_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_2_a, in0[0], out[2]);
	
	wire temp_3_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[3], in0[2], temp_3_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_3_a, in0[1], out[3]);
	
	wire temp_4_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[4], in0[3], temp_4_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_4_a, in0[2], out[4]);
	
	wire temp_5_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[5], in0[4], temp_5_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_5_a, in0[3], out[5]);
	
	wire temp_6_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[6], in0[5], temp_6_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_6_a, in0[4], out[6]);


	wire temp_7_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[7], in0[6], temp_7_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_7_a, in0[5], out[7]);


	wire temp_8_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[8], in0[7], temp_8_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_8_a, in0[6], out[8]);


	wire temp_9_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[9], in0[8], temp_9_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_9_a, in0[7], out[9]);


	wire temp_10_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[10], in0[9], temp_10_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_10_a, in0[8], out[10]);


	wire temp_11_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[11], in0[10], temp_11_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_11_a, in0[9], out[11]);


	wire temp_12_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[12], in0[11], temp_12_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_12_a, in0[10], out[12]);


	wire temp_13_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[13], in0[12], temp_13_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_13_a, in0[11], out[13]);


	wire temp_14_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[14], in0[13], temp_14_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_14_a, in0[12], out[14]);


	wire temp_15_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[15], in0[14], temp_15_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_15_a, in0[13], out[15]);


	wire temp_16_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[16], in0[15], temp_16_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_16_a, in0[14], out[16]);


	wire temp_17_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[17], in0[16], temp_17_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_17_a, in0[15], out[17]);


	wire temp_18_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[18], in0[17], temp_18_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_18_a, in0[16], out[18]);


	wire temp_19_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[19], in0[18], temp_19_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_19_a, in0[17], out[19]);


	wire temp_20_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[20], in0[19], temp_20_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_20_a, in0[18], out[20]);


	wire temp_21_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[21], in0[20], temp_21_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_21_a, in0[19], out[21]);


	wire temp_22_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[22], in0[21], temp_22_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_22_a, in0[20], out[22]);


	wire temp_23_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[23], in0[22], temp_23_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_23_a, in0[21], out[23]);


	wire temp_24_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[24], in0[23], temp_24_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_24_a, in0[22], out[24]);


	wire temp_25_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[25], in0[24], temp_25_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_25_a, in0[23], out[25]);


	wire temp_26_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[26], in0[25], temp_26_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_26_a, in0[24], out[26]);


	wire temp_27_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[27], in0[26], temp_27_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_27_a, in0[25], out[27]);


	wire temp_28_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[28], in0[27], temp_28_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_28_a, in0[26], out[28]);


	wire temp_29_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[29], in0[28], temp_29_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_29_a, in0[27], out[29]);


	wire temp_30_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[30], in0[29], temp_30_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_30_a, in0[28], out[30]);


	wire temp_31_a;
	mux_2_onebit(ctrl_shiftamt[0], in0[31], in0[30], temp_31_a);
	mux_2_onebit(ctrl_shiftamt[1], temp_31_a, in0[29], out[31]);	
	*/

endmodule