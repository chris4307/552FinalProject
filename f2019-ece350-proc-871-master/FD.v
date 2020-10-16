module FD(PC, Instruction, clk, reset, enable, Instruction_out, Target_out, PC_out, Rs1_FD, Rs2_FD, Rt_out, Rs_out, Rd_out, Opcode_FD, RdC_out, BEXC_out, RsC_out, SwC_out, SETXC_out, JC_out);

	
	input [31:0] PC, Instruction;
	input clk, reset, enable;
	
	output [31:0] Instruction_out, PC_out;
	output [26:0] Target_out;
	output [4:0] Rs1_FD, Rs2_FD, Rt_out, Rs_out, Rd_out, Opcode_FD;
	output RdC_out, BEXC_out, RsC_out, SwC_out, SETXC_out, JC_out;
	
	wire [16:0] Immediate;
	wire [26:0] Target;
	wire [1:0] Zeros;
	wire [4:0] ALUop, Shamt, Rt, Rs, Rd, Opcode;
	
	// set up registers
	register r_PC(clk, enable, 1'b1, 1'b1, reset, PC, PC_out);
	register r_instruct(clk, enable, 1'b1, 1'b1, reset, Instruction, Instruction_out);
	
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
	// module control(Opcode, ALUop, Rwe, ALUinB, RstatusC, JalC, DMwe, DMld, MEMwrite, RdC, PConeNC, PCTC, PCRdC, BNEC, BLTC, BEXC, RsC, ALUopAddC, SwC, SETXC);
	control_processor my_control(Opcode, ALUop, Rwe, ALUinB, RstatusC, JalC, DMwe, DMld, MEMwrite, RdC, PConeNC, PCTC, PCRdC, BNEC, BLTC, BEXC, RsC, ALUopAddC, SwC, SETXC, JC);
	
	// set up output values
	assign Rt_out = Rt;
	assign Rd_out = Rd;
	assign Rs_out = Rs;
	assign Opcode_FD = Opcode;
	
	wire [4:0] uno;
	wire dos;
	mux_2_5 my_uno(RdC, Rs, Rd, uno);
	or my_dos(dos, BEXC, SETXC);
	mux_2_5 my_rs1_fd(dos, uno, 5'b11110, Rs1_FD);
	
	wire [4:0] tres, quatro;
	mux_2_5 my_tres(RsC, Rt, Rs, tres);
	mux_2_5 my_quatro(SwC, tres, Rd, quatro);
	mux_2_5 my_rs2_fd(BEXC, quatro, 5'b00000, Rs2_FD);
	
	assign RdC_out = RdC;
	assign BEXC_out = BEXC;
	assign RsC_out = RsC;
	assign SwC_out = SwC;
	assign SETXC_out = SETXC;
	assign JC_out = JC;
	assign Target_out = Target;
		
endmodule