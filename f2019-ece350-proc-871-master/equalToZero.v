module equalToZero(in0, out);

	input [31:0] in0;
	output out;

	wire a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31;
	
	assign a0 = in0[0] ? 1'b0 : 1'b1;
	assign a1 = in0[1] ? 1'b0 : 1'b1;
	assign a2 = in0[2] ? 1'b0 : 1'b1;
	assign a3 = in0[3] ? 1'b0 : 1'b1;
	assign a4 = in0[4] ? 1'b0 : 1'b1;
	assign a5 = in0[5] ? 1'b0 : 1'b1;
	assign a6 = in0[6] ? 1'b0 : 1'b1;
	assign a7 = in0[7] ? 1'b0 : 1'b1;
	assign a8 = in0[8] ? 1'b0 : 1'b1;
	assign a9 = in0[9] ? 1'b0 : 1'b1;
	assign a10 = in0[10] ? 1'b0 : 1'b1;
	assign a11 = in0[11] ? 1'b0 : 1'b1;
	assign a12 = in0[12] ? 1'b0 : 1'b1;
	assign a13 = in0[13] ? 1'b0 : 1'b1;
	assign a14 = in0[14] ? 1'b0 : 1'b1;
	assign a15 = in0[15] ? 1'b0 : 1'b1;
	assign a16 = in0[16] ? 1'b0 : 1'b1;
	assign a17 = in0[17] ? 1'b0 : 1'b1;
	assign a18 = in0[18] ? 1'b0 : 1'b1;
	assign a19 = in0[19] ? 1'b0 : 1'b1;
	assign a20 = in0[20] ? 1'b0 : 1'b1;
	assign a21 = in0[21] ? 1'b0 : 1'b1;
	assign a22 = in0[22] ? 1'b0 : 1'b1;
	assign a23 = in0[23] ? 1'b0 : 1'b1;
	assign a24 = in0[24] ? 1'b0 : 1'b1;
	assign a25 = in0[25] ? 1'b0 : 1'b1;
	assign a26 = in0[26] ? 1'b0 : 1'b1;
	assign a27 = in0[27] ? 1'b0 : 1'b1;
	assign a28 = in0[28] ? 1'b0 : 1'b1;
	assign a29 = in0[29] ? 1'b0 : 1'b1;
	assign a30 = in0[30] ? 1'b0 : 1'b1;
	assign a31 = in0[31] ? 1'b0 : 1'b1;

	and my_out(out, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31);

endmodule