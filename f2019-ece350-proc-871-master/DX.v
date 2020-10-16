module DX(PC, Instruction, clk, reset, enable, r1d, r2d, PC_out, Instruction_out, r1d_out, r2d_out, Rs1_DX, Rs2_DX, Rd_DX_bypass, ALUop_out, Shamt_out, Opcode_DX, Immediate_out, Target_out, ALUinB_out, PConeNC_out, PCTC_out, PCRdC_out, BNEC_out, BLTC_out, ALUopAddC_out, SETXC_out, BEXC_X_out);

	input [31:0] PC, Instruction, r1d, r2d;
	input clk, reset, enable;
	
	output [31:0] PC_out, Instruction_out, r1d_out, r2d_out;
	output [4:0] Rs1_DX, Rs2_DX, Rd_DX_bypass, ALUop_out, Shamt_out, Opcode_DX;
	output [16:0] Immediate_out;
	output [26:0] Target_out;
	output ALUinB_out, PConeNC_out, PCTC_out, PCRdC_out, BNEC_out, BLTC_out, ALUopAddC_out, SETXC_out, BEXC_X_out;
	
	wire [16:0] Immediate;
	wire [26:0] Target;
	wire [1:0] Zeros;
	wire [4:0] ALUop, Shamt, Rt, Rs, Rd, Opcode;
	
	// set up registers
	register r_PC(clk, enable, 1'b1, 1'b1, reset, PC, PC_out);
	register r_instruction(clk, enable, 1'b1, 1'b1, reset, Instruction, Instruction_out);
	register r_r1d(clk, enable, 1'b1, 1'b1, reset, r1d, r1d_out);
	register r_r2d(clk, enable, 1'b1, 1'b1, reset, r2d, r2d_out);
	
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
	
	// set up outputs
	assign ALUop_out = ALUop;
	assign Shamt_out = Shamt;
	assign Opcode_DX = Opcode;
	
	wire [4:0] uno;
	wire dos;
	mux_2_5 my_uno(RdC, Rs, Rd, uno);
	or my_dos(dos, BEXC, SETXC);
	mux_2_5 my_rs1_dx(dos, uno, 5'b11110, Rs1_DX);
	
	wire [4:0] tres, quatro;
	mux_2_5 my_tres(RsC, Rt, Rs, tres);
	mux_2_5 my_quatro(SwC, tres, Rd, quatro);
	mux_2_5 my_rs2_dx(BEXC, quatro, 5'b00000, Rs2_DX);
	
	wire [4:0] cinco;
	mux_2_5 my_cinco(RstatusC, Rd, 5'b11110, cinco);
	mux_2_5 my_rd_dx_bypass(JalC, cinco, 5'b11111, Rd_DX_bypass);

	assign Immediate_out = Immediate;
	assign Target_out = Target;
	
	assign ALUinB_out = ALUinB;
	assign PConeNC_out = PConeNC;
	assign PCTC_out = PCTC;
	assign PCRdC_out = PCRdC;
	assign BNEC_out = BNEC;
	assign BLTC_out = BLTC;
	assign ALUopAddC_out = ALUopAddC;
	assign SETXC_out = SETXC;
	assign BEXC_X_out = BEXC;
	
endmodule