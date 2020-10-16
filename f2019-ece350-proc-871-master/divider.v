module divider(dividend_original, divisor_original, ctrl_DIV, clock, data_result, data_exception, data_resultRDY, div_overflow, other_ctrl);

	
	input [31:0] dividend_original;
	input [31:0] divisor_original;
	input other_ctrl;
	input ctrl_DIV, clock;
	
	output [31:0] data_result;
	output data_exception, data_resultRDY, div_overflow;

	wire [63:0] to_register, from_register;
	wire [31:0] dividend, divisor;
	
	wire notclock;
	not my_not_clock(notclock, clock);
	wire not_other_ctrl;
	not my_other_ctrl_not(not_other_ctrl, other_ctrl);

	
	// create positives of dividend/divisor, as necessary
	wire [31:0] not_dividend_original, not_divisor_original, pos_dividend_original, pos_divisor_original;
	wire c70, o70, c71, o71;
	alu_not my_not_dividend_original(dividend_original, not_dividend_original);
	alu_not my_not_divisor_original(divisor_original, not_divisor_original);
	adder_thirtytwo my_adder_70(not_dividend_original, 32'b1, 1'b0, c70, pos_dividend_original, o70);
	adder_thirtytwo my_adder_71(not_divisor_original, 32'b1, 1'b0, c71, pos_divisor_original, o71);

	mux_2 my_dividend_pos(dividend_original[31], dividend_original, pos_dividend_original, dividend);
	mux_2 my_divisor_pos(divisor_original[31], divisor_original, pos_divisor_original, divisor);


	// create initial dividend, muxed with ctrlDIV
	wire [63:0] dividend_padded, to_pre_register;
	assign dividend_padded[63:32] = 32'b0;
	assign dividend_padded[31:0] = dividend;
	
	wire [63:0] dividend_padded_shifted_one;
	assign dividend_padded_shifted_one = dividend_padded << 1;
	
	
	mux_2_64 my_mux2_reset_dividend(ctrl_DIV, to_pre_register, dividend_padded_shifted_one, to_register);

	// create register to hold value
	//module register_64(clock, ctrl_writeEnable, ctrl_writeReg, ctrl_readReg, reset, data, out);
	register_64 my_register_quotient(clock, 1'b1, 1'b1, 1'b1, 1'b0, to_register, from_register);
	
	// parse output, negate if necessary
	wire [31:0] pre_data_result;
	assign pre_data_result[31:0] = from_register[31:0];
	// if 0, 1 -> 1, 1, 0 -> 1: xor
	wire c72, o72;
	wire [31:0] not_pre_data_result, neg_data_result;
	alu_not my_alu_not_72(pre_data_result, not_pre_data_result);
	adder_thirtytwo my_adder_72(not_pre_data_result, 32'b1, 1'b0, c72, neg_data_result, o72);

	wire selector_final_result;
	xor my_xor_final_result(selector_final_result, dividend_original[31], divisor_original[31]);
	mux_2 my_mux_72(selector_final_result, pre_data_result, neg_data_result, data_result);

	
	// create bit extended divisor (negated)
	wire [31:0] not_divisor, not_divisor_one;
	wire c_out_1, overflow_1;
	wire [63:0] not_divisor_one_extended;
	alu_not my_not_divisor(divisor, not_divisor); 
	adder_thirtytwo my_adder_not_divisor(not_divisor, 32'b0, 1'b1, c_out_1, not_divisor_one, overflow_1);
	assign not_divisor_one_extended[63:32] = not_divisor_one;
	assign not_divisor_one_extended[31:0] = 32'b0;
	
	
	// create adder to "subtract" upper half of data result with divisor (bit extended)
	wire c_out_2, overflow_2;
	wire [63:0] from_subtract;
	assign from_subtract[31:0] = from_register[31:0];
	adder_thirtytwo my_adder_subtract(from_register[63:32], not_divisor_one_extended[63:32], 1'b0, c_out_2, from_subtract[63:32], overflow_2);
	
	
	// create either: (1) LSS from register if result is negative, (2) LSS from sum w/ LSB = 1 if positive
	wire [63:0] option_one, option_two;
	wire [63:0] option_two_prior;
	assign option_one = from_register << 1;
	assign option_two_prior = from_subtract << 1;
	assign option_two[63:1] = option_two_prior[63:1];
	assign option_two[0] = 1'b1;
	mux_2_64 my_mux_64_options(from_subtract[63], option_two, option_one, to_pre_register);
	
	/*
	// activate divider
	wire [31:0] ready_data, ctrl_DIV_data;
	wire ready;
	assign ctrl_DIV_data[31:1] = 31'b0;
	assign ctrl_DIV_data[0] = ctrl_DIV;
		
	wire not_enabled_now, activater_enable_control;
	not my_not_enabled_now(not_enabled_now, ready_data[0]);
	and my_activater_enable_control(activater_enable_control, not_enabled_now, ctrl_DIV);
	//wire activate_resetter;
	//or my_activate_resetter(activate_resetter, data_resultRDY, other_ctrl);
	register activate_divider(clock, activater_enable_control, 1'b1, 1'b1, other_ctrl, ctrl_DIV_data, ready_data);
	assign ready = ready_data[0];
	*/
	
	// data ready Counter
	wire [31:0] data_from_register, data_to_register;
	wire c_out_3, overflow_3;
	adder_thirtytwo data_rdy_adder(data_from_register, 32'b0, 1'b1, c_out_3, data_to_register, overflow_3);
	//wire reset_rdy_counter;
	//or my_reset_rdy_counter(reset_rdy_counter, ctrl_DIV, other_ctrl);
	register data_rdy_counter(clock, 1'b1, 1'b1, 1'b1, ctrl_DIV, data_to_register, data_from_register);

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
	
	//
	//and my_data_ready_not(data_resultRDY, data_from_register[0], data_from_register[1], data_from_register[2], data_from_register[3], data_from_register[4], d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31);
	and my_data_ready_not(data_resultRDY, d0, d1, d2, d3, d4, data_from_register[5], d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31);

	// overflow
	wire divisor_equal_zero;
	equalToZero my_divisor_equal_zero(divisor_original, divisor_equal_zero);

	// another overflow case: if -2^31 (a) / -1 (b), then will get 2^31 which is overflow
	//wire check_a, check_b, check_c;
	//equal my_equal_one(dividend_original, 32'h80000000, check_a);
	//equal my_equal_two(divisor_original, 32'hffffffff, check_b);
	//and my_check_c(check_c, check_a, check_b);
	//or my_div_overflow(div_overflow, divisor_equal_zero, check_c);
	assign div_overflow = divisor_equal_zero;

endmodule
