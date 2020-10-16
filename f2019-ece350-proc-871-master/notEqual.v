module notEqual(in0, in1, out);

	input [31:0] in0, in1;
	output out;

	wire temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24, temp25, temp26, temp27, temp28, temp29, temp30, temp31;

	xnor my_xnor_0(temp0, in0[0], in1[0]);
	xnor my_xnor_1(temp1, in0[1], in1[1]);
	xnor my_xnor_2(temp2, in0[2], in1[2]);
	xnor my_xnor_3(temp3, in0[3], in1[3]);
	xnor my_xnor_4(temp4, in0[4], in1[4]);
	xnor my_xnor_5(temp5, in0[5], in1[5]);
	xnor my_xnor_6(temp6, in0[6], in1[6]);
	xnor my_xnor_7(temp7, in0[7], in1[7]);
	xnor my_xnor_8(temp8, in0[8], in1[8]);
	xnor my_xnor_9(temp9, in0[9], in1[9]);
	xnor my_xnor_10(temp10, in0[10], in1[10]);
	xnor my_xnor_11(temp11, in0[11], in1[11]);
	xnor my_xnor_12(temp12, in0[12], in1[12]);
	xnor my_xnor_13(temp13, in0[13], in1[13]);
	xnor my_xnor_14(temp14, in0[14], in1[14]);
	xnor my_xnor_15(temp15, in0[15], in1[15]);
	xnor my_xnor_16(temp16, in0[16], in1[16]);
	xnor my_xnor_17(temp17, in0[17], in1[17]);
	xnor my_xnor_18(temp18, in0[18], in1[18]);
	xnor my_xnor_19(temp19, in0[19], in1[19]);
	xnor my_xnor_20(temp20, in0[20], in1[20]);
	xnor my_xnor_21(temp21, in0[21], in1[21]);
	xnor my_xnor_22(temp22, in0[22], in1[22]);
	xnor my_xnor_23(temp23, in0[23], in1[23]);
	xnor my_xnor_24(temp24, in0[24], in1[24]);
	xnor my_xnor_25(temp25, in0[25], in1[25]);
	xnor my_xnor_26(temp26, in0[26], in1[26]);
	xnor my_xnor_27(temp27, in0[27], in1[27]);
	xnor my_xnor_28(temp28, in0[28], in1[28]);
	xnor my_xnor_29(temp29, in0[29], in1[29]);
	xnor my_xnor_30(temp30, in0[30], in1[30]);
	xnor my_xnor_31(temp31, in0[31], in1[31]); 

	wire notOut;
	and my_out(notOut, temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10,
				temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20,
				temp21, temp22, temp23, temp24, temp25, temp26, temp27, temp28, temp29, temp30, 
				temp31);

	not my_not_out(out, notOut);
endmodule