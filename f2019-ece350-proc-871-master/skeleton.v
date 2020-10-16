/**
 * NOTE: you should not need to change this file! This file will be swapped out for a grading
 * "skeleton" for testing. We will also remove your imem and dmem file.
 *
 * NOTE: skeleton should be your top-level module!
 *
 * This skeleton file serves as a wrapper around the processor to provide certain control signals
 * and interfaces to memory elements. This structure allows for easier testing, as it is easier to
 * inspect which signals the processor tries to assert when.
 */

module skeleton(clock, reset, d0, d1, d2, d3, d4, d5);
//d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d30) ;
//d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, 
//										d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24,
//										d25, d26, d27, d28, d29, d30, d31,
//					address, 
//					Rwe_o, store_is_DIV, Immediate32, ALUinB_o, ovf, Instruct_FD, Instruct_DX, Instruct_XM, Instruct_MW, PC, PC_D, PC_X, PC_M, PC_W,
//					wdata, alu_out, aluop, readRegA, readRegB, data_readRegA_o, data_readRegB_o,
//					Rs, Rt, Rd, writeReg, Shamt, r1d_out_real, bypass_select,
//					Rs1_DX_bypass, Rs2_DX_bypass, Rd_XM_bypass, Rd_MW_bypass, 
//					multdiv_ovf_o, div_progress_o, mult_progress_o, ctrl_DIV_o, ctrl_MULT_o, data_resultRDY_o);
    input clock, reset;
	 output [31:0] d0, d1, d2, d3, d4, d5;
	 //output [31:0]   d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25;
	 //output [31:0] d26, d27, d28, d29, d30, d31;
	 
	 //wire [31:0] d0, d1, d2, d3, d4, d5, d6, d7, d9, d10, d11, d12, d30, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d31, address, wdata, alu_out, r1d_out_real;
	 //wire Rwe_o, store_is_DIV, ALUinB_o, ovf;
	 //wire [31:0] Immediate32, Instruct_FD, Instruct_DX, Instruct_XM, Instruct_MW, PC, PC_D, PC_X, PC_M, PC_W, data_readRegA_o, data_readRegB_o;
	 //wire [4:0] aluop, readRegA, readRegB, Rs, Rt, Rd, writeReg, Shamt, Rs1_DX_bypass, Rs2_DX_bypass, Rd_XM_bypass, Rd_MW_bypass;
	 //wire [3:0] bypass_select;
	 
	 //wire multdiv_ovf_o, div_progress_o, mult_progress_o, ctrl_DIV_o, ctrl_MULT_o, data_resultRDY_o;
	 
    /** IMEM **/
    // Figure out how to generate a Quartus syncram component and commit the generated verilog file.
    // Make sure you configure it correctly!
    wire [11:0] address_imem;
    wire [31:0] q_imem;
    imem my_imem(
        .address    (address_imem),            // address of data
        .clock      (~clock),                  // you may need to invert the clock
        .q          (q_imem)                   // the raw instruction
    );
	 //assign address = q_imem;

    /** DMEM **/
    // Figure out how to generate a Quartus syncram component and commit the generated verilog file.
    // Make sure you configure it correctly!
    wire [11:0] address_dmem;
    wire [31:0] data;
    wire wren;
    wire [31:0] q_dmem;
    dmem my_dmem(
        .address    (address_dmem/* 12-bit wire */),       // address of data
        .clock      (clock),                  // may need to invert the clock
        .data	    (data/* 32-bit data in */),    // data you want to write
        .wren	    (wren/* 1-bit signal */),      // write enable
        .q          (q_dmem/* 32-bit data out */)    // data from dmem
    );

    /** REGFILE **/
    // Instantiate your regfile
    wire ctrl_writeEnable;
    wire [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    wire [31:0] data_writeReg;
    wire [31:0] data_readRegA, data_readRegB;
	 
    regfile my_regfile(
        clock,
        ctrl_writeEnable,
        reset,
        ctrl_writeReg,
        ctrl_readRegA,
        ctrl_readRegB,
        data_writeReg,
        data_readRegA,
        data_readRegB, d0, d1, d2, d3, d4, d5
    );

    /** PROCESSOR **/
    processor my_processor(
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
	 /*Rwe_o, store_is_DIV, Immediate32, ALUinB_o, ovf, Instruct_FD, Instruct_DX, Instruct_XM, Instruct_MW, PC, PC_D, PC_X, PC_M, PC_W, wdata, alu_out, aluop, readRegA, readRegB, data_readRegA_o, data_readRegB_o, Rs, Rt, Rd, writeReg, Shamt, r1d_out_real, bypass_select,
		  Rs1_DX_bypass, Rs2_DX_bypass, Rd_XM_bypass, Rd_MW_bypass, multdiv_ovf_o, div_progress_o, mult_progress_o, ctrl_DIV_o, ctrl_MULT_o, data_resultRDY_o*/

endmodule
