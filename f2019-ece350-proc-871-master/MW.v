module MW(PC, Instruction, clk, reset, enable, wdata, PC_out, Instruction_out, wdata_out, Rd_MW_bypass, Rd_MW_out, SwC_MW_out, Rwe_out, JalC_out, RstatusC_out);

	input [31:0] PC, Instruction, wdata;
	input clk, reset, enable;
	
	output [31:0] PC_out, Instruction_out, wdata_out;
	output [4:0] Rd_MW_bypass, Rd_MW_out;
	output SwC_MW_out, Rwe_out, JalC_out, RstatusC_out;
	
	wire [16:0] Immediate;
	wire [26:0] Target;
	wire [1:0] Zeros;
	wire [4:0] ALUop, Shamt, Rt, Rs, Rd, Opcode;
	// set up registers
	register r_PC(clk, enable, 1'b1, 1'b1, reset, PC, PC_out);
	register r_instruction(clk, enable, 1'b1, 1'b1, reset, Instruction, Instruction_out);
	register r_wdata(clk, enable, 1'b1, 1'b1, reset, wdata, wdata_out);
	
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
	
	wire [4:0] cinco;
	mux_2_5 my_cinco(RstatusC, Rd, 5'b11110, cinco);
	mux_2_5 my_rd_mw_bypass(JalC, cinco, 5'b11111, Rd_MW_bypass);
	
	// set up outputs
	assign Rd_MW_out = Rd;
	assign Rwe_out = Rwe;
	assign JalC_out = JalC;
	assign RstatusC_out = RstatusC;
	
	wire is_rd_zero;
	equality_5 my_equality_5_zero(5'b00000, Rd_MW_bypass, is_rd_zero);
	or my_swc_mw(SwC_MW_out, SwC, BNEC, BEXC, BLTC, is_rd_zero);
	
endmodule 