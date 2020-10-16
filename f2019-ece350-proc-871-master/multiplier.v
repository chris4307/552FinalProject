module multiplier(multiplicand, multiplier_original, ctrl_MULT, clock, data_result, data_exception, data_resultRDY, mult_overflow, other_ctrl);

	
	input [31:0] multiplicand;
	input [31:0] multiplier_original;
	wire [32:0] multiplier;
	assign multiplier[32:1] = multiplier_original;
	assign multiplier[0] = 1'b0; 
	input ctrl_MULT, clock, other_ctrl;

	output [63:0] data_result;
	output data_exception, data_resultRDY;
	output mult_overflow;

	wire [64:0] register_data_output;

	wire not_other_ctrl;
	not my_not_other_ctrl(not_other_ctrl, other_ctrl);
	
	// create controller
	wire c0, c1, c2, a, b, c;
	control my_control(c2, c1, c0, a, b, c);


	// create multiplicand modification mux
	wire [31:0] multiplicand_sll_one, multiplicand_modified;
	leftLogicalShiftOne my_sll_one(multiplicand, multiplicand_sll_one);
	mux_2 my_mux2_1(b, multiplicand, multiplicand_sll_one, multiplicand_modified);

	wire [31:0] multiplicand_modified_not, multiplicand_modified_not_modified;
	alu_not my_not_1(multiplicand_modified, multiplicand_modified_not);
	mux_2 my_mux2_2(a, multiplicand_modified, multiplicand_modified_not, multiplicand_modified_not_modified);

	wire [31:0] multiplicand_modified_reset;
	mux_2 my_mux2_3(c, multiplicand_modified_not_modified, 32'b0, multiplicand_modified_reset);
	

	// create adder
	wire c_in, c_out_1, overflow_1;
	wire [31:0] sum;
	mux_2_onebit my_mux2_onebit_1(a, 1'b0, 1'b1, c_in);
	adder_thirtytwo my_adder(multiplicand_modified_reset, register_data_output[64:33], c_in, c_out_1, sum, overflow_1);

	// create ctrlMULT resetter MUXes
	wire [31:0] sum_MULT;
	wire [32:0] multiplier_MULT;
	mux_2 my_mux2_4(ctrl_MULT, sum, 32'b0, sum_MULT);
	mux_2_33bit my_mux2_5(ctrl_MULT, register_data_output[32:0], multiplier, multiplier_MULT);

	// create SHIFTER >> 2 for final product
	wire [64:0] pre_ras, post_ras, register_data_input;
	assign pre_ras[32:0] = multiplier_MULT;
	assign pre_ras[64:33] = sum_MULT;
	rightArithmeticShiftTwo65bit my_ras_2(pre_ras, post_ras);

	wire nclk, nctrl_MULT, shifter_control;
	not my_not_16(nclk, clock);
	not my_not_2(nctrl_MULT, ctrl_MULT);
	and my_and_1(shifter_control, nclk, nctrl_MULT);
	mux_2_65bit my_mux2_65bit_1(shifter_control, pre_ras, post_ras, register_data_input);

	// create {multiplicand,multiplier} register

	register_65 my_register_65(clock, 1'b1, 1'b1, 1'b1, 1'b0, register_data_input, register_data_output);
	assign c0 = register_data_output[0];
	assign c1 = register_data_output[1];
	assign c2 = register_data_output[2];

	//assign data_result = register_data_output[32:1];
	assign data_result = register_data_output;

	/*
	// activate multiplier
	wire [31:0] ready_data, ctrl_MULT_data;
	wire ready;
	assign ctrl_MULT_data[31:1] = 31'b0;
	assign ctrl_MULT_data[0] = ctrl_MULT;

	wire not_enabled_now, activater_enable_control;
	not my_not_enabled_now(not_enabled_now, ready_data[0]);
	and my_activater_enable_control(activater_enable_control, not_enabled_now, ctrl_MULT);
	wire activate_resetter;
	or my_activate_resetter(activate_resetter, data_resultRDY, other_ctrl);
	register activate_multiplier(clock, ctrl_MULT, 1'b1, 1'b1, data_resultRDY, ctrl_MULT_data, ready_data);
	assign ready = ready_data[0];
	*/
	
	// data ready counter
	wire [31:0] data_from_register, data_to_register;
	wire c_out_2, overflow_2;
	adder_thirtytwo data_rdy_adder(data_from_register, 32'b0, 1'b1, c_out_2, data_to_register, overflow_2);
	//wire reset_rdy_counter;
	//or my_reset_rdy_counter(reset_rdy_counter, ctrl_MULT, other_ctrl);
	register data_rdy_counter(clock, 1'b1, 1'b1, 1'b1, ctrl_MULT, data_to_register, data_from_register);

	wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, 
		d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, 
		d26, d27, d28, d29, d30, d31;
	not data_from_register_0(d0, data_from_register[0]);
	not data_from_register_1(d1, data_from_register[1]);
	not data_from_register_2(d2, data_from_register[2]);
	not data_from_register_3(d3, data_from_register[3]);
	not data_from_register_4(d4, data_from_register[4]);
	not data_from_register_5(d5, data_from_register[5]);
	not data_from_register_6(d6, data_from_register[6]);
	not data_from_register_7(d7, data_from_register[7]);
	not data_from_register_8(d8, data_from_register[8]);
	not data_from_register_9(d9, data_from_register[9]);
	not data_from_register_10(d10, data_from_register[10]);
	not data_from_register_11(d11, data_from_register[11]);
	not data_from_register_12(d12, data_from_register[12]);
	not data_from_register_13(d13, data_from_register[13]);
	not data_from_register_14(d14, data_from_register[14]);
	not data_from_register_15(d15, data_from_register[15]);
	not data_from_register_16(d16, data_from_register[16]);
	not data_from_register_17(d17, data_from_register[17]);
	not data_from_register_18(d18, data_from_register[18]);
	not data_from_register_19(d19, data_from_register[19]);
	not data_from_register_20(d20, data_from_register[20]);
	not data_from_register_21(d21, data_from_register[21]);
	not data_from_register_22(d22, data_from_register[22]);
	not data_from_register_23(d23, data_from_register[23]);
	not data_from_register_24(d24, data_from_register[24]);
	not data_from_register_25(d25, data_from_register[25]);
	not data_from_register_26(d26, data_from_register[26]);
	not data_from_register_27(d27, data_from_register[27]);
	not data_from_register_28(d28, data_from_register[28]);
	not data_from_register_29(d29, data_from_register[29]);
	not data_from_register_30(d30, data_from_register[30]);
	not data_from_register_31(d31, data_from_register[31]);

	//and my_data_ready_not(data_resultRDY, data_from_register[0], data_from_register[1], data_from_register[2], data_from_register[3], d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31);
	and my_data_ready_not(data_resultRDY, d0, d1, d2, d3, data_from_register[4], d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31);


	// overflow detector
	// just check if MSB are coinciding, and check if those bits are equal to the MSB of result
	wire part_zero_overflow_pre, part_zero_overflow;
	coincidence_detector_32 my_coincidence(register_data_output[64:32], part_zero_overflow_pre);
	not my_final_overflow_not(part_zero_overflow, part_zero_overflow_pre);
	


	wire part_two_overflow;
	// part two: 33rd bit: does it make sense?
	wire not_mc_one, not_ml_one, not_out_one;
	not my_not_mc_one(not_mc_one, multiplicand[31]);
	not my_not_ml_one(not_ml_one, multiplier_original[31]);
	not my_not_out_one(not_out_one, register_data_output[32]);

	wire one, two, three, four;
	and my_and_one(one, multiplicand[31], multiplier_original[31], register_data_output[32]); // 1 1 1
	and my_and_two(two, multiplicand[31], not_ml_one, not_out_one); // 1 0 0
	and my_and_three(three, not_mc_one, multiplier_original[31], not_out_one); // 0 1 0
	and my_and_four(four, not_mc_one, not_ml_one, register_data_output[32]); // 0 0 1
	or my_part_two_overflow(part_two_overflow, one, two, three, four);


	/*

	// part 2.5: if there's ever an overflow in the adder, then the result is an overflow. 
	//overflow_1
	wire part_twofive_overflow_pre, part_twofive_overflow;
	wire [31:0] data_from_overflow_register, data_to_overflow_register;
	wire c_out_3, overflow_3;
	
	adder_thirtytwo data_overflow_adder(data_from_overflow_register, 32'b0, overflow_1, c_out_3, data_to_overflow_register, overflow_3);
	
	register data_overflow_counter(clock, 1'b1, 1'b1, 1'b1, ctrl_MULT, data_to_overflow_register, data_from_overflow_register);	
	equalToZero my_overflow_25_pre(data_from_overflow_register, part_twofive_overflow_pre);
	not my_overflow_25_pre_not(part_twofive_overflow, part_twofive_overflow_pre);
	*/



	// part three: if multiplying by zero: NO OVERFLOW
	// account for edge case: when either are zero
	wire mc_zero, ml_zero, not_mc_zero, not_ml_zero, mc_ml_zero_not;
	equalToZero my_mc_eq_zero(multiplicand, mc_zero);
	equalToZero my_ml_eq_zero(multiplier_original, ml_zero);
	not my_mc_eq_zero_not(not_mc_zero, mc_zero);
	not my_ml_eq_zero_not(not_ml_zero, ml_zero);
	and my_mc_ml_zero_not(mc_ml_zero_not, not_mc_zero, not_ml_zero);
	


	wire pre_mult_overflow;
	or my_mult_overflow_or(pre_mult_overflow, part_zero_overflow, part_two_overflow);
	and my_final_overflow(mult_overflow, pre_mult_overflow, mc_ml_zero_not);
	

endmodule