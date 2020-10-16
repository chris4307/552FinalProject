module adder_four(in0, in1, c_in, s, p, g);

	input [3:0] in0, in1;
	input c_in;
	
	output [3:0] s;
	output p, g;
	
	wire g0, g1, g2, g3;
	wire p0, p1, p2, p3;
	wire inter_0, inter_1, inter_2, inter_3;
	wire c1, c2, c3, c4;
	
	wire inter_finalg_0, inter_finalg_1, inter_finalg_2;
	
	xor my_sum_one(s[0], in0[0], in1[0], c_in);
	and my_g0(g0, in0[0], in1[0]);
	or my_p0(p0, in0[0], in1[0]);
	and my_inter0(inter_0, p0, c_in);
	or my_c1(c1, g0, inter_0);
	
	xor my_sum_two(s[1], in0[1], in1[1], c1);
	and my_g1(g1, in0[1], in1[1]);
	or my_p1(p1, in0[1], in1[1]);
	and my_inter1(inter_1, p1, c1);
	or my_c2(c2, g1, inter_1);
	
	xor my_sum_three(s[2], in0[2], in1[2], c2);
	and my_g2(g2, in0[2], in1[2]);
	or my_p2(p2, in0[2], in1[2]);
	and my_inter2(inter_2, p2, c2);
	or my_c3(c3, g2, inter_2);
	
	xor my_sum_four(s[3], in0[3], in1[3], c3);
	and my_g3(g3, in0[3], in1[3]);
	or my_p3(p3, in0[3], in1[3]);
	and my_inter3(inter_3, p3, c3);
	//or my_c4(c_out, g3, inter_3); // don't need to compute c_out here
	
	and my_final_p(p, p0, p1, p2, p3);
	and my_inter_finalg_0(inter_finalg_0, p3, p2, p1, g0); //g0 = two inputs both 1? px = carry exists? So, this expression = does lsb have 1+1, and rest have that carry onwards?
	and my_inter_finalg_1(inter_finalg_1, p3, p2, g1);
	and my_inter_finalg_2(inter_finalg_2, p3, g2);
	or my_final_g(g, g3, inter_finalg_2, inter_finalg_1, inter_finalg_0);
	
endmodule