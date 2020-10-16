module XM(PC, Instruction, clk, reset, enable, r2d, alu_out, ovf, PC_out, Instruction_out, r2d_out, alu_out_out, Rd_XM_bypass, SwC_XM_out, DMwe_out, DMld_out, MEMwrite_out);

	input [31:0] PC, Instruction, r2d, alu_out;
	input clk, reset, enable, ovf;
	
	output [31:0] PC_out, Instruction_out, r2d_out, alu_out_out;
	output [4:0] Rd_XM_bypass;
	output SwC_XM_out, DMwe_out, DMld_out, MEMwrite_out;
	
	wire [31:0] Instruction_out_temp;
	
	wire [31:0] alu_out_temp, rstatus_ovf;
	wire [16:0] Immediate;
	wire [26:0] Target;
	wire [1:0] Zeros;
	wire [4:0] ALUop, Shamt, Rt, Rs, Rd, Opcode;
	wire r_ovf, nreset;
	not my_nreset(nreset, reset);
	// set up registers
	register r_PC(clk, enable, 1'b1, 1'b1, reset, PC, PC_out);
	register r_instruction(clk, enable, 1'b1, 1'b1, reset, Instruction, Instruction_out_temp);
	register r_r2d(clk, enable, 1'b1, 1'b1, reset, r2d, r2d_out);
	register r_alu_out(clk, enable, 1'b1, 1'b1, reset, alu_out, alu_out_temp);
	DFFE_real my_r_ovf(ovf, clk, nreset, enable, r_ovf);
	
	assign Instruction_out[1:0] = Instruction_out_temp[1:0];
	assign Instruction_out[6:2] = Instruction_out_temp[6:2];
	assign Instruction_out[11:7] = Instruction_out_temp[11:7];
	assign Instruction_out[16:12] = Instruction_out_temp[16:12];
	assign Instruction_out[21:17] = Instruction_out_temp[21:17];
	mux_2_5 my_rd(r_ovf, Instruction_out_temp[26:22], 5'b11110, Instruction_out[26:22]);
	assign Instruction_out[31:27] = Instruction_out_temp[31:27];
	
	// set up wires
	assign Zeros = Instruction_out[1:0];
	assign ALUop = Instruction_out[6:2];
	assign Shamt = Instruction_out[11:7];
	assign Rt = Instruction_out[16:12];
	assign Rs = Instruction_out[21:17];
	assign Rd = Instruction_out[26:22];
	assign Opcode = Instruction_out[31:27];
	assign Immediate[1:0] = Zeros;
	assign Immediate[6:2] = ALUop;
	assign Immediate[11:7] = Shamt;
	assign Immediate[16:12] = Rt;
	assign Target[16:0] = Immediate;
	assign Target[21:17] = Rs;
	assign Target[26:22] = Rd;
	
	// set up signal controls
	wire Rwe, ALUinB, RstatusC, JalC, DMwe, DMld, MEMwrite, RdC, PConeNC, PCTC, PCRdC, BNEC, BLTC, BEXC, RsC, ALUopAddC, SwC, SETXC, JC;
	control_processor my_control(Opcode, ALUop, Rwe, ALUinB, RstatusC, JalC, DMwe, DMld, MEMwrite, RdC, PConeNC, PCTC, PCRdC, BNEC, BLTC, BEXC, RsC, ALUopAddC, SwC, SETXC, JC);
	
	// set up overflow status
	wire is_Opcode_ALU, is_add, is_addi, is_sub, is_mult, is_div;
	equality_5 my_equality_is_opcode_alu(Opcode, 5'b00000, is_Opcode_ALU);
	equality_5 my_equality_is_add(ALUop, 5'b0, is_add);
	equality_5 my_equality_is_addi(Opcode, 5'b00101, is_addi);
	equality_5 my_equality_is_sub(ALUop, 5'b00001, is_sub);
	equality_5 my_equality_is_mult(ALUop, 5'b00110, is_mult);
	equality_5 my_equality_is_div(ALUop, 5'b00111, is_div);
	
	wire [4:0] rstatus_ovf_selector;
	and my_rstatus_ovf_selector_zero(rstatus_ovf_selector[0], is_Opcode_ALU, is_add);
	assign rstatus_ovf_selector[1] = is_addi;
	and my_rstatus_ovf_selector_two(rstatus_ovf_selector[2], is_Opcode_ALU, is_sub);
	and my_rstatus_ovf_selector_three(rstatus_ovf_selector[3], is_Opcode_ALU, is_mult);
	and my_rstatus_ovf_selector_four(rstatus_ovf_selector[4], is_Opcode_ALU, is_div);
	
	mux_32 my_rstatus_ovf_mux(rstatus_ovf_selector, 32'd0, 32'd1, 32'd2, 32'd0, 32'd3, 32'd0, 32'd0, 32'd0, 32'd4, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd5, 
																	32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, rstatus_ovf);
	
	// set up outputs
	assign DMwe_out = DMwe;
	assign DMld_out = DMld;
	assign MEMwrite_out = MEMwrite;
	
	wire [4:0] cinco, seis;
	mux_2_5 my_cinco(RstatusC, Rd, 5'b11110, cinco);
	mux_2_5 my_seis(JalC, cinco, 5'b11111, seis);
	mux_2_5 my_rd_xm_bypass(r_ovf, seis, 5'b11110, Rd_XM_bypass);
	
	mux_2 my_mux_alu_out_out(r_ovf, alu_out_temp, rstatus_ovf, alu_out_out);
	
	wire is_rd_zero;
	equality_5 my_equality_5_zero(5'b00000, Rd_XM_bypass, is_rd_zero);
	or my_swc_xm(SwC_XM_out, SwC, BNEC, BEXC, BLTC, is_rd_zero);
	
endmodule