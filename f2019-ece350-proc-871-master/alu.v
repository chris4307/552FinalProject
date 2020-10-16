module alu(data_operandA, data_operandB, ctrl_ALUopcode,
ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;
	
	wire signed [31:0] add, subtract, alu_and, alu_or, alu_sll, alu_sra, 
					neg_data_operandB;
	wire overflowAdd, overflowSub, coutAdd, coutSub;
					
	// adder
	adder_thirtytwo my_adder(data_operandA, data_operandB, 1'b0, coutAdd, add, overflowAdd);
	//assign {overflowAdd, add} = $signed(data_operandA) + $signed(data_operandB);

	// subtractor
	alu_not my_not(data_operandB, neg_data_operandB);
	adder_thirtytwo my_subtractor(data_operandA, neg_data_operandB, 1'b1, coutSub, subtract, overflowSub);
	//adder_thirtytwo_xor my_subtractor(data_operandA, data_operandB, 1'b1, coutSub, subtract, overflowSub);

	// overflow
	assign overflow = ctrl_ALUopcode[0] ? overflowSub : overflowAdd;


	// less than
	assign isLessThanPre = subtract[31] ? 1 : 0;
	
	wire a, aa;
	not my_aa(aa, data_operandB[31]);
	and my_a(a, data_operandA[31], aa);
	
	assign isLessThan = overflowSub ? aa : isLessThanPre; 

	// isNotEqual
	notEqual my_notequal(data_operandA, data_operandB, isNotEqual);

	// and or
	alu_and my_and(data_operandA, data_operandB, alu_and);
	alu_or my_or(data_operandA, data_operandB, alu_or);

	// logical left shift
	wire [31:0] sixteen_dataA, eight_dataA, four_dataA, two_dataA, one_dataA;
	wire [31:0] sixteen_eight, eight_four, four_two, two_one;

	leftLogicalShiftSixteen my_logical_sixteen(data_operandA, sixteen_dataA);
	mux_2 my_sixteen_mux(ctrl_shiftamt[4], data_operandA, sixteen_dataA, sixteen_eight);
	
	leftLogicalShiftEight my_logical_eight(sixteen_eight, eight_dataA);
	mux_2 my_eight_mux(ctrl_shiftamt[3], sixteen_eight, eight_dataA, eight_four);
	
	leftLogicalShiftFour my_logical_four(eight_four, four_dataA);
	mux_2 my_four_mux(ctrl_shiftamt[2], eight_four, four_dataA, four_two);

	leftLogicalShiftTwo my_logical_two(four_two, two_dataA);
	mux_2 my_two_mux(ctrl_shiftamt[1], four_two, two_dataA, two_one);

	leftLogicalShiftOne my_logical_one(two_one, one_dataA);
	mux_2 my_one_mux(ctrl_shiftamt[0], two_one, one_dataA, alu_sll);

	// arithmetic right shift
	wire [31:0] sixteen_dataA_r, eight_dataA_r, four_dataA_r, two_dataA_r, one_dataA_r;
	wire [31:0] sixteen_eight_r, eight_four_r, four_two_r, two_one_r;

	rightArithmeticShiftSixteen my_logical_sixteen_r(data_operandA, sixteen_dataA_r);
	mux_2 my_sixteen_mux_r(ctrl_shiftamt[4], data_operandA, sixteen_dataA_r, sixteen_eight_r);
	
	rightArithmeticShiftEight my_logical_eight_r(sixteen_eight_r, eight_dataA_r);
	mux_2 my_eight_mux_r(ctrl_shiftamt[3], sixteen_eight_r, eight_dataA_r, eight_four_r);
	
	rightArithmeticShiftFour my_logical_four_r(eight_four_r, four_dataA_r);
	mux_2 my_four_mux_r(ctrl_shiftamt[2], eight_four_r, four_dataA_r, four_two_r);

	rightArithmeticShiftTwo my_logical_two_r(four_two_r, two_dataA_r);
	mux_2 my_two_mux_r(ctrl_shiftamt[1], four_two_r, two_dataA_r, two_one_r);
	
	wire [31:0] alu_sra_pre;
	rightArithmeticShiftOne my_logical_one_r(two_one_r, one_dataA_r);
	mux_2 my_one_mux_r(ctrl_shiftamt[0], two_one_r, one_dataA_r, alu_sra);

	mux_32 my_mux32(ctrl_ALUopcode, add, subtract, alu_and, alu_or, alu_sll, alu_sra, add, add, 
					add, add, add, add, add, add, add, add, 
					add, add, add, add, add, add, add, add,
					add, add, add, add, add, add, add, add, data_result);
	
	
endmodule