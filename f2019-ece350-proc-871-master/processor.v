/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
	 
	);
	// Control signals
	input clock, reset;
	
	/*
	Rwe_in, store_is_DIV_o, Immediate32_o, ALUinB_in, ovf_o, Instruct_FD_o, Instruct_DX_o, Instruct_XM_o, Instruct_MW_o, PC_o, PC_D_o, PC_X_o, PC_M_o, PC_W_o,
	 wdata_o, alu_o, aluop_o, readRegA_o, readRegB_o, data_readRegA_o, data_readRegB_o, Rs_o, Rt_o, Rd_o, writeReg_o, Shamt_o, r1d_out_real_o, bypass_select,
	 Rs1_DX_bypass_o, Rs2_DX_bypass_o, Rd_XM_bypass_o, Rd_MW_bypass_o, 
	 multdiv_ovf_o, div_progress_o, mult_progress_o, ctrl_DIV_o, ctrl_MULT_o, data_resultRDY_o
	 */
	/*
	output Rwe_in, store_is_DIV_o, ALUinB_in, ovf_o;
	output [31:0] Immediate32_o, Instruct_FD_o, Instruct_DX_o, Instruct_XM_o, Instruct_MW_o, PC_o, PC_D_o, PC_X_o, PC_M_o, PC_W_o, 
						wdata_o, alu_o, r1d_out_real_o, data_readRegA_o, data_readRegB_o;
	output [4:0] aluop_o, readRegA_o, readRegB_o, Rs_o, Rt_o, Rd_o, writeReg_o, Shamt_o;
	output [3:0] bypass_select;
	output [4:0] Rs1_DX_bypass_o, Rs2_DX_bypass_o, Rd_XM_bypass_o, Rd_MW_bypass_o;
	
	output multdiv_ovf_o, div_progress_o, mult_progress_o, ctrl_DIV_o, ctrl_MULT_o, data_resultRDY_o;
	*/
	
	// Imem
	output [11:0] address_imem;
	input [31:0] q_imem;

	// Dmem
	output [11:0] address_dmem;
	output [31:0] data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

	/* YOUR CODE STARTS HERE */
	wire nclock;
	not my_nclock(nclock, clock);
	
	/***
		Program Counter and stuff
	***/
	
	wire [4:0] Rd_DX_bypass, Opcode_DX, Rs1_FD_bypass, Rs2_FD_bypass, Opcode_FD;
	
	// create temporary 0 to adder, due to clock inherently starting at rising edge
	wire [31:0] to_temp_register, from_temp_register;
	wire temp_register_cout, temp_register_ovf;
	adder_thirtytwo my_temp_register_adder(from_temp_register, 32'd1, 1'b0, temp_register_cout, to_temp_register, temp_register_ovf);
	register temp_register(clock, 1'b1, 1'b1, 1'b1, reset, to_temp_register, from_temp_register);
	wire pc_add_control;
	equality_32 my_equality_32_temp_register(32'd1, to_temp_register, pc_add_control);
	wire [31:0] PC_add;
	mux_2 my_mux2_pcadd(1'b0, 32'd1, 32'd0, PC_add); // signal : pc_add_control
		
	wire not_stall;
	wire [31:0] to_PC, PC, PC_1, instruct;
	wire pc1_cout, pc1_ovf;
	register pc_register(clock, not_stall, 1'b1, 1'b1, reset, to_PC, PC);
	adder_thirtytwo pc_1(PC, PC_add, 1'b0, pc1_cout, PC_1, pc1_ovf);
	
	assign address_imem = PC[11:0];
	assign instruct = q_imem;
	
	wire [31:0] PC_X, from_PC_X, PC_D;
	wire pcx_cout, pcx_ovf;
	adder_thirtytwo pc_x(PC_X, 32'd1, 1'b0, pcx_cout, from_PC_X, pcx_ovf);
	wire [31:0] Immediate32, from_PConeNCR_result;
	wire pconencr_cout, pconencr_ovf;
	adder_thirtytwo pconencr(from_PC_X, Immediate32, 1'b0, pconencr_cout, from_PConeNCR_result, pconencr_ovf);
	
	// some logic for jumping in instructions
	wire BNEC, BNE, BLT, BLTC, BEXC_X, PConeNC, PCTC, JC_D;
	wire and_bne_bnec, and_blt_bltc, and_bne_bexc_x;
	and my_and_bne_bnec(and_bne_bnec, BNE, BNEC);
	and my_and_blt_bltc(and_blt_bltc, BLT, BLTC);
	and my_and_bne_bexc_x(and_bne_bexc_x, BNE, BEXC_X);
	wire PConeNCR, PCTCR, PCRdC;
	or my_or_first_step_jump(PConeNCR, PConeNC, and_bne_bnec, and_blt_bltc);
	or my_or_second_step_jump(PCTCR, PCTC, and_bne_bexc_x);
	
	wire [31:0] r1d_out_real;
	wire [31:0] stage_one_mux, stage_onetwo_mux, stage_two_mux, stage_three_mux;
	wire [26:0] Target, Target_FD;
	wire [31:0] Target_extend, Target_extend_FD;
	assign Target_extend_FD[31:27] = 5'd0;
	assign Target_extend_FD[26:0] = Target_FD;
	mux_2_5 my_sign_extend_target(Target[26], 5'b00000, 5'b11111, Target_extend[31:27]);
	//assign Target_extend[31:27] = 5'd0;
	assign Target_extend[26:0] = Target;
	mux_2 my_stage_one_mux(PCTCR, PC_X, Target_extend, stage_one_mux);
	mux_2 my_stage_onetwo_mux(1'b0, stage_one_mux, Target_extend_FD, stage_onetwo_mux);
	mux_2 my_stage_two_mux(PConeNCR, stage_onetwo_mux, from_PConeNCR_result, stage_two_mux);
	mux_2 my_stage_three_mux(PCRdC, stage_two_mux, r1d_out_real, stage_three_mux);
	wire stage_four_mux_ctrl;
	or my_stage_four_mux_ctrl(stage_four_mux_ctrl, PCTCR, PConeNCR, PCRdC);
	mux_2 my_stage_four_mux(stage_four_mux_ctrl, PC_1, stage_three_mux, to_PC);
	
	// create flush signal
	wire stall_lw_bypass;
	or my_flush_signal(flush_signal, stage_four_mux_ctrl, stall_lw_bypass, reset);
	
	// create lw stall bypassing logic
	wire stall_lw_eq_1, stall_lw_eq_2, not_stall_lw_eq_3, stall_lw_eq_3, stall_lw_eq_4;
	equality_5 my_stall_lw_eq_1(Rs1_FD_bypass, Rd_DX_bypass, stall_lw_eq_1);
	equality_5 my_stall_lw_eq_2(Rs2_FD_bypass, Rd_DX_bypass, stall_lw_eq_2);
	equality_5 my_stall_lw_eq_3(Opcode_FD, 5'b00111, stall_lw_eq_3); //b00111
	not my_not_stall_lw_eq_3(not_stall_lw_eq_3, stall_lw_eq_3);
	equality_5 my_stall_lw_eq_4(Opcode_DX, 5'b01000, stall_lw_eq_4); //b01111
	wire stall_lw_eq23, stall_lw_eq123;
	and my_stall_lw_eq23(stall_lw_eq23, stall_lw_eq_2, not_stall_lw_eq_3);
	or my_stall_lw_eq123(stall_lw_eq123, stall_lw_eq_1, stall_lw_eq23);
	and my_stall_lw_bypass(stall_lw_bypass, stall_lw_eq_4, stall_lw_eq123);
	
	// create complete stall logic
	wire not_stall_DX, data_resultRDY, mult_progress, div_progress;
	//assign not_stall_DX = 1'b1; // for mult/div - fix later
	wire mult_div_progress;
	or my_mult_div_progress(mult_div_progress, mult_progress, div_progress);
	wire not_data_resultRDY;
	not my_not_data_resultrdy(not_data_resultRDY, data_resultRDY);
	wire stall_DX;
	and my_stall_DX(stall_DX, mult_div_progress, not_data_resultRDY);
	not my_not_stall_DX(not_stall_DX, stall_DX);
	
	wire stall_FD;
	or my_stall_fd(stall_FD, stall_lw_bypass);
	not my_not_stall_FD(not_stall_FD, stall_FD);
	
	and my_not_stall(not_stall, not_stall_FD, not_stall_DX);
	
	
	/***
		PIPELINE CHAINING
	***/
	wire [31:0] Instruct_FD;
	wire [4:0] Rt, Rs, Rd;
	wire RdC, BEXC, RsC, SwC, SETXC_D;
	wire [31:0] instruct_fd;
	//wire fd_flush_signal;
	//or my_fd_flush(fd_flush_signal, flush_signal, JC_D);
	mux_2 my_instruct_fd(flush_signal, instruct, 32'd0, instruct_fd);
	FD my_FD(PC, instruct_fd, clock, reset, not_stall, Instruct_FD, Target_FD, PC_D, Rs1_FD_bypass, Rs2_FD_bypass, Rt, Rs, Rd, Opcode_FD, RdC, BEXC, RsC, SwC, SETXC_D, JC_D);
	
	
	wire [31:0] Instruct_DX, r1d_out, r2d_out;
	wire [16:0] Immediate;
	wire [4:0] Rs1_DX_bypass, Rs2_DX_bypass, Shamt, ALUop;
	wire ALUinB, ALUopAddC, SETXC_X;
	wire [31:0] r1d, r2d, r1d_dx, r2d_dx, instruct_dx_2;
	mux_2 my_r1d_dx(flush_signal, r1d, 32'd0, r1d_dx);
	mux_2 my_r2d_dx(flush_signal, r2d, 32'd0, r2d_dx);
	mux_2 my_instruct_2(flush_signal, Instruct_FD, 32'd0, instruct_dx_2);
	DX my_DX(PC_D, instruct_dx_2, clock, reset, not_stall_DX, r1d_dx, r2d_dx, PC_X, Instruct_DX, r1d_out, r2d_out, Rs1_DX_bypass, Rs2_DX_bypass, Rd_DX_bypass, ALUop, Shamt, Opcode_DX, Immediate, Target, ALUinB, PConeNC, PCTC, PCRdC, BNEC, BLTC, ALUopAddC, SETXC_X, BEXC_X); 
	//instruct_dx_2
	
	wire [31:0] PC_M, Instruct_XM, alu_out, r2d_out_real, r2d_out_2, alu_out_out;
	wire [4:0] Rd_XM_bypass;
	wire ovf;
	wire DMwe, DMld, MEMwrite, SwC_XM;
	XM my_XM(PC_X, Instruct_DX, clock, reset, not_stall_DX, r2d_out_real, alu_out, ovf, PC_M, Instruct_XM, r2d_out_2, alu_out_out, Rd_XM_bypass, SwC_XM, DMwe, DMld, MEMwrite);
	
	wire [31:0] PC_W, Instruct_MW, wdata, wdata_out;
	wire [4:0] Rd_MW_bypass, Rd_MW;
	wire Rwe, JalC, RstatusC, SwC_MW;
	MW my_MW(PC_M, Instruct_XM, clock, reset, not_stall_DX, wdata, PC_W, Instruct_MW, wdata_out, Rd_MW_bypass, Rd_MW, SwC_MW, Rwe, JalC, RstatusC);

	// some bypassing
	//rs1_x_m bypassing
	
	wire not_SwC_MW;
	not my_not_swc_mw(not_SwC_MW, SwC_MW);
	
	wire rs1_dx_rd_xm_equal, rs1_dx_rd_mw_equal;
	equality_5 my_equality_one(Rs1_DX_bypass, Rd_XM_bypass, rs1_dx_rd_xm_equal);
	equality_5 my_equality_two(Rs1_DX_bypass, Rd_MW_bypass, rs1_dx_rd_mw_equal);
	wire and_rs1_xm, and_rs1_mw;
	wire not_SwC_XM;
	not my_not_swc_xm(not_SwC_XM, SwC_XM);
	and my_and_rs1_xm(and_rs1_xm, not_SwC_XM, rs1_dx_rd_xm_equal);
	and my_and_rs1_mw(and_rs1_mw, not_SwC_MW, rs1_dx_rd_mw_equal);
	wire [3:0] my_rs1_x_m_bypass_select;
	assign my_rs1_x_m_bypass_select[0] = 1'b0;
	assign my_rs1_x_m_bypass_select[1] = and_rs1_xm;
	assign my_rs1_x_m_bypass_select[2] = and_rs1_mw;
	assign my_rs1_x_m_bypass_select[3] = 1'b0;
	mux_16 my_rs1_x_m_bypass(my_rs1_x_m_bypass_select, r1d_out, 32'b0, alu_out_out, 32'b0, wdata_out, 32'b0, alu_out_out, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, r1d_out_real);
	
	
	//assign r1d_out_real = r1d_out;
	
	
	//rs2_x_m bypassing
	wire rs2_dx_rd_xm_equal, rs2_dx_rd_mw_equal;
	equality_5 my_equality_one_2(Rs2_DX_bypass, Rd_XM_bypass, rs2_dx_rd_xm_equal);
	equality_5 my_equality_two_2(Rs2_DX_bypass, Rd_MW_bypass, rs2_dx_rd_mw_equal);
	wire and_rs2_xm, and_rs2_mw;
	and my_and_rs2_xm(and_rs2_xm, not_SwC_XM, rs2_dx_rd_xm_equal);
	and my_and_rs2_mw(and_rs2_mw, not_SwC_MW, rs2_dx_rd_mw_equal);
	wire [3:0] my_rs2_x_m_bypass_select;
	assign my_rs2_x_m_bypass_select[0] = 1'b0;
	assign my_rs2_x_m_bypass_select[1] = and_rs2_xm;
	assign my_rs2_x_m_bypass_select[2] = and_rs2_mw;
	assign my_rs2_x_m_bypass_select[3] = 1'b0;
	mux_16 my_rs2_x_m_bypass(my_rs2_x_m_bypass_select, r2d_out, 32'b0, alu_out_out, 32'b0, wdata_out, 32'b0, alu_out_out, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0, r2d_out_real);
	
	
	//assign r2d_out_real = r2d_out;
	
	
	// mw bypassing
	wire [31:0] r2d_out_2_real;
	wire eq_mw_bypass, and_eq_mw_bypass;
	equality_5 my_equality_mw_bypassing(Rd_MW_bypass, Rd_XM_bypass, eq_mw_bypass);
	and my_and_eq_mw_bypass(and_eq_mw_bypass, not_SwC_MW, eq_mw_bypass);
	wire [1:0] my_mux4_mw_bypass_select;
	assign my_mux4_mw_bypass_select[0] = 1'b0;
	assign my_mux4_mw_bypass_select[1] = and_eq_mw_bypass;
	mux_4 my_mux4_mw_bypass(my_mux4_mw_bypass_select, r2d_out_2, 32'b0, wdata_out, 32'b0, r2d_out_2_real);
	
	//wire [31:0] r2d_out_2_real;
	//assign r2d_out_2_real = r2d_out_2;
	
	/***
		
		DECODE
		
	***/
	
	// create controls to RegisterFile: Decode Stage
	wire BEXC_or_SETXC_D;
	wire [4:0] RdC_mux_out, Rstatus_mux_out, RsC_mux_out, SwC_mux_out, BEXC_mux_out;
	
	mux_2_5 my_rdc_mux(RdC, Rs, Rd, RdC_mux_out);
	or my_bexc_or_setxc_d(BEXC_or_SETXC_D, BEXC, SETXC_D);
	mux_2_5 my_rstatus_mux(BEXC_or_SETXC_D, RdC_mux_out, 5'b11110, Rstatus_mux_out);
	assign ctrl_readRegA = Rstatus_mux_out;
	
	mux_2_5 my_rsc_mux(RsC, Rt, Rs, RsC_mux_out);
	mux_2_5 my_swc_mux(SwC, RsC_mux_out, Rd, SwC_mux_out);
	mux_2_5 my_bexc_mux(BEXC, SwC_mux_out, 5'b00000, BEXC_mux_out);
	assign ctrl_readRegB = BEXC_mux_out;
	
	assign r1d = data_readRegA;
	assign r2d = data_readRegB;
	
	/***
		
		EXECUTE
		
	***/
	
	wire alu_ovf;
	wire [31:0] r2d_out_real_alu, alu_out_temp;
	assign Immediate32[16:0] = Immediate;
	mux_2_15 my_sign_extend_immediate(Immediate[16], 15'b0, 15'b111111111111111, Immediate32[31:17]); 
	mux_2 my_r2d_out_real_alu(ALUinB, r2d_out_real, Immediate32, r2d_out_real_alu);
	wire [4:0] ALUop_real;
	mux_2_5 my_mux_aluop_real(ALUopAddC, ALUop, 5'b00000, ALUop_real);
	alu my_alu(r1d_out_real, r2d_out_real_alu, ALUop_real, Shamt, alu_out_temp, BNE, BLT, alu_ovf);
	// mult/div result empty for now - replace this comment when ready
	
	wire multdiv_ovf;
	wire [31:0] multdiv_res;
	wire ctrl_MULT, ctrl_DIV;
	wire is_MULT, is_DIV, store_is_MULT, store_is_DIV, not_store_is_MULT, not_store_is_DIV;
	wire nreset;
	not my_not_reset(nreset, reset);
	equality_5 my_eq_5_ctrl_mult(ALUop, 5'b00110, is_MULT);
	equality_5 my_eq_5_ctrl_div(ALUop, 5'b00111, is_DIV);
	wire dffe_multdiv_reset;
	or my_dffe_multdiv_reset(dffe_multdiv_reset, reset, not_data_resultRDY);
	DFFE_real my_dffe_mult(is_MULT, clock, dffe_multdiv_reset, 1'b1, store_is_MULT);	
	DFFE_real my_dffe_div(is_DIV, clock, dffe_multdiv_reset, 1'b1, store_is_DIV);
	not my_not_store_is_MULT(not_store_is_MULT, store_is_MULT);
	not my_not_store_is_DIV(not_store_is_DIV, store_is_DIV);
	and my_ctrl_MULT(ctrl_MULT, not_store_is_MULT, is_MULT, not_data_resultRDY);
	and my_ctrl_DIV(ctrl_DIV, not_store_is_DIV, is_DIV, not_data_resultRDY);
	or my_mult_progress(mult_progress, store_is_MULT, ctrl_MULT);
	or my_div_progress(div_progress, store_is_DIV, ctrl_DIV);
	multdiv_beh my_multdiv(r1d_out_real, r2d_out_real_alu, ctrl_MULT, ctrl_DIV, clock, multdiv_res, multdiv_ovf, data_resultRDY);

	
	or my_ovf(ovf, alu_ovf, multdiv_ovf);
	
	wire [31:0] alu_out_temp_temp;
	mux_2 my_multdiv_alu_select(data_resultRDY, alu_out_temp, multdiv_res, alu_out_temp_temp);
	mux_2 my_setxc_aluout(SETXC_X, alu_out_temp_temp, Target_extend, alu_out);
	
	/***
	
		MEMORY
	
	***/
	assign address_dmem = alu_out_out[11:0];
	assign data = r2d_out_2_real;
	assign wren = DMwe;
	// skip some RstatusWrite mux controls; replace comment here if implemented later
	mux_2 my_wdata_mux(MEMwrite, alu_out_out, q_dmem, wdata);
	//MEMwrite
	
	/***
		
		WRITE
	
	***/
	assign ctrl_writeEnable = Rwe;
	wire [4:0] write_stage_one;
	mux_2_5 my_mux_write_one(RstatusC, Rd_MW, 5'b11110, write_stage_one);
	mux_2_5 my_mux_write_two(JalC, write_stage_one, 5'b11111, ctrl_writeReg);
	
	wire [31:0] PC_W_1;
	wire pc_w1_cout, pc_w1_ovf;
	adder_thirtytwo pc_w_1(PC_W, 32'd1, 1'b0, pc_w1_cout, PC_W_1, pc_w1_ovf);
	mux_2 my_mux_write_three(JalC, wdata_out, PC_W_1, data_writeReg);
	
	
	/*
	// debugging
	assign ovf_o = multdiv_ovf;
	assign Rwe_in = PCTCR;
	assign store_is_DIV_o = ctrl_DIV;
	assign Immediate32_o = Immediate32;
	assign ALUinB_in = data_resultRDY;
	assign Instruct_FD_o = Instruct_FD;
	assign Instruct_DX_o = Instruct_DX;
	assign Instruct_XM_o = Instruct_XM;
	assign Instruct_MW_o = Instruct_MW;
	assign PC_o = PC;
	assign PC_D_o = PC_D;
	assign PC_X_o = PC_X;
	assign PC_M_o = PC_M;
	assign PC_W_o = PC_W;
	assign wdata_o = r2d_out_real_alu;
	assign alu_o = multdiv_res;
	assign aluop_o = ALUop;
	assign readRegA_o = ctrl_readRegA;
	assign readRegB_o = ctrl_readRegB;
	assign writeReg_o = ctrl_writeReg;
	assign Rs_o = Rs;
	assign Rd_o = Rd;
	assign Rt_o = Rt;
	assign Shamt_o = Rd_XM_bypass;
	assign r1d_out_real_o = r1d_out_real;
	assign data_readRegA_o = data_readRegA;
	assign data_readRegB_o = data_readRegB;
	assign bypass_select = my_rs1_x_m_bypass_select;
	assign Rs1_DX_bypass_o = Rs1_DX_bypass;
	assign Rs2_DX_bypass_o = Rs2_DX_bypass;
	assign Rd_XM_bypass_o = Rd_XM_bypass;
	assign Rd_MW_bypass_o = Rd_MW_bypass;
	assign multdiv_ovf_o = multdiv_ovf;
	assign div_progress_o = div_progress;
	assign mult_progress_o = mult_progress;
	assign ctrl_DIV_o = ctrl_DIV;
	assign ctrl_MULT_o = ctrl_MULT;
	assign data_resultRDY_o = data_resultRDY;
	*/
	
endmodule
