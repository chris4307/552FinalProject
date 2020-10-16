module leftLogicalShiftOne(in0, out);

	input [31:0] in0;
	output [31:0] out;
	
	assign out[0] = 1'b0;
	assign out[1] = in0[0];
	assign out[2] = in0[1];
	assign out[3] = in0[2];
	assign out[4] = in0[3];
	assign out[5] = in0[4];
	assign out[6] = in0[5];
	assign out[7] = in0[6];
	assign out[8] = in0[7];
	assign out[9] = in0[8];
	assign out[10] = in0[9];
	assign out[11] = in0[10];
	assign out[12] = in0[11];
	assign out[13] = in0[12];
	assign out[14] = in0[13];
	assign out[15] = in0[14];
	assign out[16] = in0[15];
	assign out[17] = in0[16];
	assign out[18] = in0[17];
	assign out[19] = in0[18];
	assign out[20] = in0[19];
	assign out[21] = in0[20];
	assign out[22] = in0[21];
	assign out[23] = in0[22];
	assign out[24] = in0[23];
	assign out[25] = in0[24];
	assign out[26] = in0[25];
	assign out[27] = in0[26];
	assign out[28] = in0[27];
	assign out[29] = in0[28];
	assign out[30] = in0[29];
	assign out[31] = in0[30];
	
	/*
	mux_2_onebit(ctrl_shiftamt, in0[0], 1'b0, out[0]);
	mux_2_onebit(ctrl_shiftamt, in0[1], in0[0], out[1]);
	mux_2_onebit(ctrl_shiftamt, in0[2], in0[1], out[2]);
	mux_2_onebit(ctrl_shiftamt, in0[3], in0[2], out[3]);
	mux_2_onebit(ctrl_shiftamt, in0[4], in0[3], out[4]);
	
	mux_2_onebit(ctrl_shiftamt, in0[5], in0[4], out[5]);
	mux_2_onebit(ctrl_shiftamt, in0[6], in0[5], out[6]);
	mux_2_onebit(ctrl_shiftamt, in0[7], in0[6], out[7]);
	mux_2_onebit(ctrl_shiftamt, in0[8], in0[7], out[8]);
	
	mux_2_onebit(ctrl_shiftamt, in0[9], in0[8], out[9]);
	mux_2_onebit(ctrl_shiftamt, in0[10], in0[9], out[10]);
	mux_2_onebit(ctrl_shiftamt, in0[11], in0[10], out[11]);
	mux_2_onebit(ctrl_shiftamt, in0[12], in0[11], out[12]);
	
	mux_2_onebit(ctrl_shiftamt, in0[13], in0[12], out[13]);
	mux_2_onebit(ctrl_shiftamt, in0[14], in0[13], out[14]);
	mux_2_onebit(ctrl_shiftamt, in0[15], in0[14], out[15]);
	mux_2_onebit(ctrl_shiftamt, in0[16], in0[15], out[16]);
	
	mux_2_onebit(ctrl_shiftamt, in0[17], in0[16], out[17]);
	mux_2_onebit(ctrl_shiftamt, in0[18], in0[17], out[18]);
	mux_2_onebit(ctrl_shiftamt, in0[19], in0[18], out[19]);
	mux_2_onebit(ctrl_shiftamt, in0[20], in0[19], out[20]);
	
	mux_2_onebit(ctrl_shiftamt, in0[21], in0[20], out[21]);
	mux_2_onebit(ctrl_shiftamt, in0[22], in0[21], out[22]);
	mux_2_onebit(ctrl_shiftamt, in0[23], in0[22], out[23]);
	mux_2_onebit(ctrl_shiftamt, in0[24], in0[23], out[24]);
	
	mux_2_onebit(ctrl_shiftamt, in0[25], in0[24], out[25]);
	mux_2_onebit(ctrl_shiftamt, in0[26], in0[25], out[26]);
	mux_2_onebit(ctrl_shiftamt, in0[27], in0[26], out[27]);
	mux_2_onebit(ctrl_shiftamt, in0[28], in0[27], out[28]);
	
	mux_2_onebit(ctrl_shiftamt, in0[29], in0[28], out[29]);
	mux_2_onebit(ctrl_shiftamt, in0[30], in0[29], out[30]);
	mux_2_onebit(ctrl_shiftamt, in0[31], in0[30], out[31]);	
	*/

endmodule