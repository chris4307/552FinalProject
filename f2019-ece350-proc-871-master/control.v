module control(c2, c1, c0, a, b, c);
	
	input c2, c1, c0;
	output a, b, c;

	// c2, c1, c0 are MSB - LSB bits of end of 65 bit output - following modified booths algorithm
	// a: controls whether to add/subtract; 0 add, 1 subtract
	// b: controls whether to additional left shift mutiplicand; 0 leave as is, 1 left shift
	// c: controls whether to feed in 32'b0 into final adder; 0 don't, 1 use 32'b0

	wire nc2, nc1, nc0;
	not my_not_c2(nc2, c2);
	not my_not_c1(nc1, c1);
	not my_not_c0(nc0, c0);

	wire a_1, a_2, a_3;
	and my_a1(a_1, c2, nc1, nc0);
	and my_a2(a_2, c2, nc1, c0);
	and my_a3(a_3, c2, c1, nc0);
	or my_a(a, a_1, a_2, a_3);

	wire b_1, b_2;
	and my_b1(b_1, nc2, c1, c0);
	and my_b2(b_2, c2, nc1, nc0);
	or my_b(b, b_1, b_2);

	wire c_1, c_2;
	and my_c1(c_1, nc2, nc1, nc0);
	and my_c2(c_2, c2, c1, c0);
	or my_c(c, c_1, c_2);

endmodule