module multdiv(data_operandA, data_operandB, ctrl_MULT, ctrl_DIV,
clock, data_result, data_exception, data_resultRDY);
	
	
	input [31:0] data_operandA, data_operandB;
	input ctrl_MULT, ctrl_DIV, clock;
	output [31:0] data_result;
	output data_exception, data_resultRDY;
	
	
	wire [31:0] data_result_div;
	wire [63:0] data_result_mult;
	wire data_exception_mult, data_exception_div;
	wire data_result_rdy_mult, data_result_rdy_div;
	wire mult_overflow, div_overflow;

	wire ctrl_ALL;
	or my_ctrl_all(ctrl_ALL, ctrl_MULT, ctrl_DIV);
	wire nclock;
	not my_nclock(nclock, clock);

	wire [31:0] ready_data_DIV, ctrl_DIV_data;
	wire pre_ready_div;
	assign ctrl_DIV_data[31:1] = 31'b0;
	assign ctrl_DIV_data[0] = ctrl_DIV;
	register activate_divider(clock, ctrl_DIV, 1'b1, 1'b1, ctrl_MULT, ctrl_DIV_data, ready_data_DIV);
	divider my_divider_1(data_operandA, data_operandB, ctrl_DIV, clock, data_result_div, data_exception_div, pre_ready_div, div_overflow, ctrl_MULT);
	and my_result_rdy_div(data_result_rdy_div, ready_data_DIV[0], pre_ready_div);
	
	wire [31:0] ready_data_MULT, ctrl_MULT_data;
	wire pre_ready_mult;
	assign ctrl_MULT_data[31:1] = 31'b0;
	assign ctrl_MULT_data[0] = ctrl_MULT;
	register activate_multiplier(clock, ctrl_MULT, 1'b1, 1'b1, ctrl_DIV, ctrl_MULT_data, ready_data_MULT);
	multiplier my_multiplier_1(data_operandA, data_operandB, ctrl_MULT, clock, data_result_mult, data_exception_mult, pre_ready_mult, mult_overflow, ctrl_DIV);
	and my_result_rdy_mult(data_result_rdy_mult, ready_data_MULT[0], pre_ready_mult);
	
	//assign data_result = data_result_div;
	assign data_result = ready_data_DIV[0] ? data_result_div : 32'bz;
	assign data_result = ready_data_MULT[0] ? data_result_mult[32:1] : 32'bz;
	//mux_2 my_mux_2_data_result(ready_data_DIV[0], data_result_mult, data_result_div, data_result);

	or my_data_result(data_resultRDY, data_result_rdy_div, data_result_rdy_mult);
	//assign data_resultRDY = data_result_rdy_div ? data_result_rdy_div : 1'bz;
	//assign data_resultRDY = data_result_rdy_mult ? data_result_rdy_mult : 1'bz;
	

	// divider overflow
	wire div_overflow_real;
	wire divisor_equal_zero;
	equalToZero my_divisor_equal_zero(data_operandB, divisor_equal_zero);

	// another overflow case: if -2^31 (a) / -1 (b), then will get 2^31 which is overflow
	//wire check_a, check_b, check_c;
	//equal my_equal_one(data_operandA, 32'h80000000, check_a);
	//equal my_equal_two(data_operandB, 32'hffffffff, check_b);
	//and my_check_c(check_c, check_a, check_b);
	//or my_div_overflow(div_overflow_real, divisor_equal_zero, check_c);
	assign div_overflow_real = divisor_equal_zero;


	
	// multiplier overflow
	wire mult_overflow_real;
	// just check if MSB are coinciding, and check if those bits are equal to the MSB of result
	wire part_zero_overflow_pre, part_zero_overflow;
	coincidence_detector_32 my_coincidence(data_result_mult[63:31], part_zero_overflow_pre);
	not my_final_overflow_not(part_zero_overflow, part_zero_overflow_pre);
	
	wire part_two_overflow;
	// part two: 33rd bit: does it make sense?
	wire not_mc_one, not_ml_one, not_out_one;
	not my_not_mc_one(not_mc_one, data_operandA[31]);
	not my_not_ml_one(not_ml_one, data_operandB[31]);
	not my_not_out_one(not_out_one, data_result_mult[32]);

	wire one, two, three, four;
	and my_and_one(one, data_operandA[31], data_operandB[31], data_result_mult[32]); // 1 1 1
	and my_and_two(two, data_operandA[31], not_ml_one, not_out_one); // 1 0 0
	and my_and_three(three, not_mc_one, data_operandB[31], not_out_one); // 0 1 0
	and my_and_four(four, not_mc_one, not_ml_one, data_result_mult[32]); // 0 0 1
	or my_part_two_overflow(part_two_overflow, one, two, three, four);

	// part three: if multiplying by zero: NO OVERFLOW
	// account for edge case: when either are zero
	wire mc_zero, ml_zero, not_mc_zero, not_ml_zero, mc_ml_zero_not;
	equalToZero my_mc_eq_zero(data_operandA, mc_zero);
	equalToZero my_ml_eq_zero(data_operandB, ml_zero);
	not my_mc_eq_zero_not(not_mc_zero, mc_zero);
	not my_ml_eq_zero_not(not_ml_zero, ml_zero);
	and my_mc_ml_zero_not(mc_ml_zero_not, not_mc_zero, not_ml_zero);
	
	wire pre_mult_overflow;
	or my_mult_overflow_or(pre_mult_overflow, part_zero_overflow, part_two_overflow);
	and my_final_overflow(mult_overflow_real, pre_mult_overflow, mc_ml_zero_not);
	
	
	
	//assign data_exception = 1'b0;
	//mux_2_onebit my_mux_overflow(ready_data_DIV[0], mult_overflow, div_overflow, data_exception);
	assign data_exception = ready_data_DIV[0] ? div_overflow_real : 1'bz;
	//assign data_exception = ready_data_MULT[0] ? mult_overflow_real : 1'bz;
	//assign data_exception = data_result_rdy_div ? div_overflow_real : 1'bz;
	assign data_exception = data_result_rdy_mult ? mult_overflow : 1'bz;


	

endmodule