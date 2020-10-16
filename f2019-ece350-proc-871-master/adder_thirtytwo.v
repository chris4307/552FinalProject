module adder_thirtytwo(in0, in1, c_in, c_out, sum, overflow);
	
	input [31:0] in0, in1;
	input c_in;

	output [31:0] sum;
	output c_out, overflow;

	
	wire p_0, g_0, p_1, g_1, p_2, g_2, p_3, g_3;
	
	// you can use muxes to make this faster, since c8/16etc depend on 
	// c_in - just mux the c8/16 inputs in addition to sums...
	// update: theres a chance that muxing the c8/16 inputs won't do anything
	// 		  since c_in updates those values instantly anyways...
	
	// c8 = g_0 + p_0c_in
	wire c8, temp1_a;
	and my_temp1_a(temp1_a, p_0, c_in);
	or my_temp1_null(c8, g_0, temp1_a);
	
	//wire c8_0, c8_1, temp1_a_0, temp1_a_1;
	//and my_temp1_a_0(temp1_a_0, p_0, 1'b0);
	//or my_temp1_null_0(c8_0, g_0, temp1_a_0);
	//and my_temp1_a_1(temp1_a_1, p_0, 1'b1);
	//or my_temp1_null_1(c8_1, g_0, temp1_a_1);
	//mux_2_onebit my_mux_2_onebit_8(c_in, c8_0, c8_1, c8);
	
	// c16 = g1 + p1g0 + p1p0c_in
	wire c16, temp2_a, temp2_b;
	and my_temp2_a(temp2_a, p_1, g_0);
	and my_temp2_b(temp2_b, p_1, p_0, c_in);
	or my_temp2_null(c16, g_1, temp2_a, temp2_b);
	
	//wire c16_0, c16_1, temp2_a_0, temp2_a_1, temp2_b_0, temp2_b_1;
	//and my_temp2_a_0(temp2_a_0, p_1, g_0);
	//and my_temp2_b_0(temp2_b_0, p_1, p_0, 1'b0);
	//or my_temp2_null_0(c16_0, g_1, temp2_a_0, temp2_b_0);
	//and my_temp2_a_1(temp2_a_1, p_1, g_0);
	//and my_temp2_b_1(temp2_b_1, p_1, p_0, 1'b1);
	//or my_temp2_null_1(c16_1, g_1, temp2_a_1, temp2_b_1);
	//mux_2_onebit my_mux_2_onebit_16(c_in, c16_0, c16_1, c16);
	
	// c24 = g2 + p2g1 + p2p1g0 + p2p1p0c_in
	wire c24, temp3_a, temp3_b, temp3_c;
	and my_temp3_a(temp3_a, p_2, g_1);
	and my_temp3_b(temp3_b, p_2, p_1, g_0);
	and my_temp3_c(temp3_c, p_2, p_1, p_0, c_in);
	or my_temp3_null(c24, g_2, temp3_a, temp3_b, temp3_c);
	
	// c32 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c_in
	wire c32, temp4_a, temp4_b, temp4_c, temp4_d;
	and my_temp4_a(temp4_a, p_3, g_2);
	and my_temp4_b(temp4_b, p_3, p_2, g_1);
	and my_temp4_c(temp4_c, p_3, p_2, p_1, g_0);
	and my_temp4_d(temp4_d, p_3, p_2, p_1, p_0, c_in);
	or my_temp4_null(c_out, g_3, temp4_a, temp4_b, temp4_c, temp4_d);

	wire second_cout;
	adder_eight first_adder(in0[7:0], in1[7:0], c_in, sum[7:0], p_0, g_0);
	adder_eight second_adder(in0[15:8], in1[15:8], c8, sum[15:8], p_1, g_1);
	adder_eight third_adder(in0[23:16], in1[23:16], c16, sum[23:16], p_2, g_2);
	adder_eight_xor fourth_adder(in0[31:24], in1[31:24], c24, sum[31:24], p_3, g_3, second_cout);
	
	// checking overflow conditions - four cases
	wire ta, tb, tc, td, te;
	not my_not_ta(ta, in0[31]);
	not my_not_tb(tb, in1[31]);
	and my_and_tc(tc, ta, tb, sum[31]);
	not my_not_td(td, sum[31]);
	and my_and_te(te, in0[31], in1[31], td);
	
	//wire overflow_pre;
	//or my_or_finale(overflow, tc, te); //, c_out);
	xor my_xor_finale(overflow, c_out, second_cout);

	// stupid case where you have +/- 0's adding together. Then, you account for it separately
	

endmodule