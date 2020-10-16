module control_decoder(Opcode, ALUop, j, bne, jal, jr, blt, addi, sw, lw, setx, bex, add, sub, and_c, or_c, sll, sra, mul, div);

	input [4:0] Opcode, ALUop;
	output j, bne, jal, jr, blt, addi, sw, lw, setx, bex, add, sub, and_c, or_c, sll, sra, mul, div;
	
	wire alu_operation, e9, e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e20, e23, e24, e25, e26, e27, e28, e29, e30, e31;
	decoder_5_32 my_decoder_1(Opcode, alu_operation, j, bne, jal, jr, addi, blt, sw, lw, e9, e10, e11, e12, e13, e14, e15, e16, e17, 
					e18, e19, e20, setx, bex, e23, e24, e25, e26, e27, e28, e29, e30, e31);
	
	wire and_add, and_sub, and_and_c, and_or_c, and_sll, and_sra, and_mul, and_div, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18,
			f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31;
	decoder_5_32 my_decoder_2(ALUop, and_add, and_sub, and_and_c, and_or_c, and_sll, and_sra, and_mul, and_div, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18,
			f19, f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, f31);
	and my_and_add(add, and_add, alu_operation);
	and my_and_sub(sub, and_sub, alu_operation);
	and my_and_and_c(and_c, and_and_c, alu_operation);
	and my_and_or_c(or_c, and_or_c, alu_operation);
	and my_and_sll(sll, and_sll, alu_operation);
	and my_and_sra(sra, and_sra, alu_operation);
	and my_and_mul(mul, and_mul, alu_operation);
	and my_and_div(div, and_div, alu_operation);
	

endmodule