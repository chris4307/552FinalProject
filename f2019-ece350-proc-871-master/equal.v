module equal(in0, in1, out);

	input [31:0] in0, in1;
	output out;

	wire a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31;
	
    xnor my_a0(a0, in0[0], in1[0]);
    xnor my_a1(a1, in0[1], in1[1]);
    xnor my_a2(a2, in0[2], in1[2]);
    xnor my_a3(a3, in0[3], in1[3]);
    xnor my_a4(a4, in0[4], in1[4]);
    xnor my_a5(a5, in0[5], in1[5]);
    xnor my_a6(a6, in0[6], in1[6]);
    xnor my_a7(a7, in0[7], in1[7]);
    xnor my_a8(a8, in0[8], in1[8]);
    xnor my_a9(a9, in0[9], in1[9]);
    xnor my_a10(a10, in0[10], in1[10]);
    xnor my_a11(a11, in0[11], in1[11]);
    xnor my_a12(a12, in0[12], in1[12]);
    xnor my_a13(a13, in0[13], in1[13]);
    xnor my_a14(a14, in0[14], in1[14]);
    xnor my_a15(a15, in0[15], in1[15]);
    xnor my_a16(a16, in0[16], in1[16]);
    xnor my_a17(a17, in0[17], in1[17]);
    xnor my_a18(a18, in0[18], in1[18]);
    xnor my_a19(a19, in0[19], in1[19]);
    xnor my_a20(a20, in0[20], in1[20]);
    xnor my_a21(a21, in0[21], in1[21]);
    xnor my_a22(a22, in0[22], in1[22]);
    xnor my_a23(a23, in0[23], in1[23]);
    xnor my_a24(a24, in0[24], in1[24]);
    xnor my_a25(a25, in0[25], in1[25]);
    xnor my_a26(a26, in0[26], in1[26]);
    xnor my_a27(a27, in0[27], in1[27]);
    xnor my_a28(a28, in0[28], in1[28]);
    xnor my_a29(a29, in0[29], in1[29]);
    xnor my_a30(a30, in0[30], in1[30]);
    xnor my_a31(a31, in0[31], in1[31]);

    and my_out(out, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31);

endmodule
