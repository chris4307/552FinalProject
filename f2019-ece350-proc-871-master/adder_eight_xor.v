module adder_eight_xor(in0, in1, c_in, sum, P, G, extra_cout);

	input [7:0] in0, in1;
	input c_in;

	output [7:0] sum;
	output P, G, extra_cout;

	// create p/g constants
	wire g_0, p_0, g_1, p_1, g_2, p_2, g_3, p_3, g_4, p_4, 
		g_5, p_5, g_6, p_6, g_7, p_7;
	and my_g_0(g_0, in0[0], in1[0]);
	or my_p_0(p_0, in0[0], in1[0]);
	and my_g_1(g_1, in0[1], in1[1]);
	or my_p_1(p_1, in0[1], in1[1]);
	and my_g_2(g_2, in0[2], in1[2]);
	or my_p_2(p_2, in0[2], in1[2]);
	and my_g_3(g_3, in0[3], in1[3]);
	or my_p_3(p_3, in0[3], in1[3]);
	and my_g_4(g_4, in0[4], in1[4]);
	or my_p_4(p_4, in0[4], in1[4]);
	and my_g_5(g_5, in0[5], in1[5]);
	or my_p_5(p_5, in0[5], in1[5]);
	and my_g_6(g_6, in0[6], in1[6]);
	or my_p_6(p_6, in0[6], in1[6]);
	and my_g_7(g_7, in0[7], in1[7]);
	or my_p_7(p_7, in0[7], in1[7]);

	wire c1, c2, c3, c4, c5, c6, c7;

	// c1 = g_0 + p_0c_0
	wire temp1;
	and my_temp1_and(temp1, p_0, c_in);
	or my_temp1_null(c1, g_0, temp1);

	// c2 = g_1 + p_1g_0 + p_1p_0c_0
	wire temp2_a, temp2_b; 
	and my_temp2_a(temp2_a, p_1, g_0);
	and my_temp2_b(temp2_b, p_1, p_0, c_in);
	or my_temp2_null(c2, g_1, temp2_a, temp2_b);

	// c3 = g_2 + p_2g_1 + p_2p_1g_0 + p_2p_1p_0c_0
	wire temp3_a, temp3_b, temp3_c;
	and my_temp3_a(temp3_a, p_2, g_1);
	and my_temp3_b(temp3_b, p_2, p_1, g_0);
	and my_temp3_c(temp3_c, p_2, p_1, p_0, c_in);
	or my_temp3_null(c3, g_2, temp3_a, temp3_b, temp3_c);

	// c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c_in
	wire temp4_a, temp4_b, temp4_c, temp4_d;
	and my_temp4_a(temp4_a, p_3, g_2);
	and my_temp4_b(temp4_b, p_3, p_2, g_1);
	and my_temp4_c(temp4_c, p_3, p_2, p_1, g_0);
	and my_temp4_d(temp4_d, p_3, p_2, p_1, p_0, c_in);
	or my_temp4_null(c4, g_3, temp4_a, temp4_b, temp4_c, temp4_d);

	// c5 = g4 + p4g3 + p4p3g2 + p4p3p2g1 + p4p3p2p1g0 + p4p3p2p1p0c_in
	wire temp5_a, temp5_b, temp5_c, temp5_d, temp5_e;
	and my_temp5_a(temp5_a, p_4, g_3);
	and my_temp5_b(temp5_b, p_4, p_3, g_2);
	and my_temp5_c(temp5_c, p_4, p_3, p_2, g_1);
	and my_temp5_d(temp5_d, p_4, p_3, p_2, p_1, g_0);
	and my_temp5_e(temp5_e, p_4, p_3, p_2, p_1, p_0, c_in);
	or my_temp5_null(c5, g_4, temp5_a, temp5_b, temp5_c, temp5_d, temp5_e);

	// c6 = g5 + p5g4 + p5p4g3 + p5p4p3g2 + p5p4p3p2g1 + p5p4p3p2p1g0 
	//      + p5p4p3p2p1p0c_in
	wire temp6_a, temp6_b, temp6_c, temp6_d, temp6_e, temp6_f;
	and my_temp6_a(temp6_a, p_5, g_4);
	and my_temp6_b(temp6_b, p_5, p_4, g_3);
	and my_temp6_c(temp6_c, p_5, p_4, p_3, g_2);
	and my_temp6_d(temp6_d, p_5, p_4, p_3, p_2, g_1);
	and my_temp6_e(temp6_e, p_5, p_4, p_3, p_2, p_1, g_0);
	and my_temp6_f(temp6_f, p_5, p_4, p_3, p_2, p_1, p_0, c_in);
	or my_temp6_null(c6, g_5, temp6_a, temp6_b, temp6_c, temp6_d, temp6_e, temp6_f);

	// c7 = g6 + p6g5 + p6p5g4 + p6p5p4g3 + p6p5p4p3g2 + 
	//      p6p5p4p3p2g1 + p6p5p4p3p2p1g0 + p6p5p4p3p2p1p0c_in
	wire temp7_a, temp7_b, temp7_c, temp7_d, temp7_e, temp7_f, temp7_g;
	and my_temp7_a(temp7_a, p_6, g_5);
	and my_temp7_b(temp7_b, p_6, p_5, g_4);
	and my_temp7_c(temp7_c, p_6, p_5, p_4, g_3);
	and my_temp7_d(temp7_d, p_6, p_5, p_4, p_3, g_2);
	and my_temp7_e(temp7_e, p_6, p_5, p_4, p_3, p_2, g_1);
	and my_temp7_f(temp7_f, p_6, p_5, p_4, p_3, p_2, p_1, g_0);
	and my_temp7_g(temp7_g, p_6, p_5, p_4, p_3, p_2, p_1, p_0, c_in);
	or my_temp7_null(c7, g_6, temp7_a, temp7_b, temp7_c, temp7_d, temp7_e,
					temp7_f, temp7_g);
	assign extra_cout = c7;

	// c_out (i.e: c8) composed of G and P
	// G = g7 + p7g6 + p7p6g5 + p7p6p5g4 + p7p6p5p4g3 + 
	//	   p7p6p5p4p3g2 + p7p6p5p4p3p2g1 + p7p6p5p4p3p2p1g0
	// P = p7p6p5p4p3p2p1p0
	// Note: P/G are only input dependent! 
	wire temp8_a, temp8_b, temp8_c, temp8_d, temp8_e, temp8_f, temp8_g;
	and my_temp8_a(temp8_a, p_7, g_6);
	and my_temp8_b(temp8_b, p_7, p_6, g_5);
	and my_temp8_c(temp8_c, p_7, p_6, p_5, g_4);
	and my_temp8_d(temp8_d, p_7, p_6, p_5, p_4, g_3);
	and my_temp8_e(temp8_e, p_7, p_6, p_5, p_4, p_3, g_2);
	and my_temp8_f(temp8_f, p_7, p_6, p_5, p_4, p_3, p_2, g_1);
	and my_temp8_g(temp8_g, p_7, p_6, p_5, p_4, p_3, p_2, p_1, g_0);
	or my_temp8_null(G, g_7, temp8_a, temp8_b, temp8_c, temp8_d, temp8_e, 
					temp8_f, temp8_g);
	and my_temp8_null_2(P, p_7, p_6, p_5, p_4, p_3, p_2, p_1, p_0);

	// calculate sum 
	xor my_xor_0(sum[0], in0[0], in1[0], c_in);
	xor my_xor_1(sum[1], in0[1], in1[1], c1);
	xor my_xor_2(sum[2], in0[2], in1[2], c2);
	xor my_xor_3(sum[3], in0[3], in1[3], c3);
	xor my_xor_4(sum[4], in0[4], in1[4], c4);
	xor my_xor_5(sum[5], in0[5], in1[5], c5);
	xor my_xor_6(sum[6], in0[6], in1[6], c6);
	xor my_xor_7(sum[7], in0[7], in1[7], c7);

endmodule




