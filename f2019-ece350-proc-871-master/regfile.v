module regfile (
    nclock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input nclock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	
	/*
	d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24,
										d25, d26, d27, d28, d29, d30, d31
	output [31:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24,
										d25, d26, d27, d28, d29, d30, d31;
	*/
										

	wire clock;
	not my_clock(clock, nclock);
   /* YOUR CODE HERE */
   wire [31:0] ctrl_writeReg_solo;
   mux_32 my_mux_ctrl_writeReg(ctrl_writeReg, 32'h00000001, 32'h00000002, 32'h00000004, 32'h00000008, 
                               32'h00000010, 32'h00000020, 32'h00000040, 32'h00000080,
                               32'h00000100, 32'h00000200, 32'h00000400, 32'h00000800,
                               32'h00001000, 32'h00002000, 32'h00004000, 32'h00008000,
                               32'h00010000, 32'h00020000, 32'h00040000, 32'h00080000,
                               32'h00100000, 32'h00200000, 32'h00400000, 32'h00800000,
                               32'h01000000, 32'h02000000, 32'h04000000, 32'h08000000,
                               32'h10000000, 32'h20000000, 32'h40000000, 32'h80000000, ctrl_writeReg_solo);

  wire [31:0] ctrl_readRegA_solo;
  mux_32 my_mux_ctrl_writeRegA(ctrl_readRegA, 32'h00000001, 32'h00000002, 32'h00000004, 32'h00000008, 
                               32'h00000010, 32'h00000020, 32'h00000040, 32'h00000080,
                               32'h00000100, 32'h00000200, 32'h00000400, 32'h00000800,
                               32'h00001000, 32'h00002000, 32'h00004000, 32'h00008000,
                               32'h00010000, 32'h00020000, 32'h00040000, 32'h00080000,
                               32'h00100000, 32'h00200000, 32'h00400000, 32'h00800000,
                               32'h01000000, 32'h02000000, 32'h04000000, 32'h08000000,
                               32'h10000000, 32'h20000000, 32'h40000000, 32'h80000000, ctrl_readRegA_solo);
  wire [31:0] ctrl_readRegB_solo;
  mux_32 my_mux_ctrl_writeRegB(ctrl_readRegB, 32'h00000001, 32'h00000002, 32'h00000004, 32'h00000008, 
                               32'h00000010, 32'h00000020, 32'h00000040, 32'h00000080,
                               32'h00000100, 32'h00000200, 32'h00000400, 32'h00000800,
                               32'h00001000, 32'h00002000, 32'h00004000, 32'h00008000,
                               32'h00010000, 32'h00020000, 32'h00040000, 32'h00080000,
                               32'h00100000, 32'h00200000, 32'h00400000, 32'h00800000,
                               32'h01000000, 32'h02000000, 32'h04000000, 32'h08000000,
                               32'h10000000, 32'h20000000, 32'h40000000, 32'h80000000, ctrl_readRegB_solo);

  wire [31:0] temp_readReg0, temp_readReg1, temp_readReg2, temp_readReg3, temp_readReg4,
              temp_readReg5, temp_readReg6, temp_readReg7, temp_readReg8, temp_readReg9,
              temp_readReg10, temp_readReg11, temp_readReg12, temp_readReg13, temp_readReg14, temp_readReg15, temp_readReg16, temp_readReg17, temp_readReg18, temp_readReg19, temp_readReg20, temp_readReg21,
              temp_readReg22, temp_readReg23, temp_readReg24, temp_readReg25, 
              temp_readReg26, temp_readReg27, temp_readReg28, temp_readReg29,
              temp_readReg30, temp_readReg31;
	
  // registerfile for regA
  // register(clock, ctrl_writeEnable, ctrl_writeReg, ctrl_readReg, reset, data, output);
  register my_register_0_a(clock, 1'b0, ctrl_writeReg_solo[0], 1'b1, ctrl_reset, 32'h00000000, temp_readReg0);
  register my_register_1_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[1], 1'b1, ctrl_reset, data_writeReg, temp_readReg1);
  register my_register_2_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[2], 1'b1, ctrl_reset, data_writeReg, temp_readReg2);
  register my_register_3_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[3], 1'b1, ctrl_reset, data_writeReg, temp_readReg3);
  register my_register_4_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[4], 1'b1, ctrl_reset, data_writeReg, temp_readReg4);
  register my_register_5_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[5], 1'b1, ctrl_reset, data_writeReg, temp_readReg5);
  register my_register_6_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[6], 1'b1, ctrl_reset, data_writeReg, temp_readReg6);
  register my_register_7_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[7], 1'b1, ctrl_reset, data_writeReg, temp_readReg7);
  register my_register_8_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[8], 1'b1, ctrl_reset, data_writeReg, temp_readReg8);
  register my_register_9_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[9], 1'b1, ctrl_reset, data_writeReg, temp_readReg9);
  register my_register_10_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[10], 1'b1, ctrl_reset, data_writeReg, temp_readReg10);
  register my_register_11_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[11], 1'b1, ctrl_reset, data_writeReg, temp_readReg11);
  register my_register_12_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[12], 1'b1, ctrl_reset, data_writeReg, temp_readReg12);
  register my_register_13_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[13], 1'b1, ctrl_reset, data_writeReg, temp_readReg13);
  register my_register_14_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[14], 1'b1, ctrl_reset, data_writeReg, temp_readReg14);
  register my_register_15_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[15], 1'b1, ctrl_reset, data_writeReg, temp_readReg15);
  register my_register_16_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[16], 1'b1, ctrl_reset, data_writeReg, temp_readReg16);
  register my_register_17_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[17], 1'b1, ctrl_reset, data_writeReg, temp_readReg17);
  register my_register_18_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[18], 1'b1, ctrl_reset, data_writeReg, temp_readReg18);
  register my_register_19_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[19], 1'b1, ctrl_reset, data_writeReg, temp_readReg19);
  register my_register_20_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[20], 1'b1, ctrl_reset, data_writeReg, temp_readReg20);
  register my_register_21_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[21], 1'b1, ctrl_reset, data_writeReg, temp_readReg21);
  register my_register_22_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[22], 1'b1, ctrl_reset, data_writeReg, temp_readReg22);
  register my_register_23_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[23], 1'b1, ctrl_reset, data_writeReg, temp_readReg23);
  register my_register_24_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[24], 1'b1, ctrl_reset, data_writeReg, temp_readReg24);
  register my_register_25_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[25], 1'b1, ctrl_reset, data_writeReg, temp_readReg25);
  register my_register_26_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[26], 1'b1, ctrl_reset, data_writeReg, temp_readReg26);
  register my_register_27_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[27], 1'b1, ctrl_reset, data_writeReg, temp_readReg27);
  register my_register_28_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[28], 1'b1, ctrl_reset, data_writeReg, temp_readReg28);
  register my_register_29_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[29], 1'b1, ctrl_reset, data_writeReg, temp_readReg29);
  register my_register_30_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[30], 1'b1, ctrl_reset, data_writeReg, temp_readReg30);
  register my_register_31_a(clock, ctrl_writeEnable, ctrl_writeReg_solo[31], 1'b1, ctrl_reset, data_writeReg, temp_readReg31);
  
	
  // write: registers 20, 22
  // write: 

  assign data_readRegA = ctrl_readRegA_solo[0] ? temp_readReg0 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[1] ? temp_readReg1 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[2] ? temp_readReg2 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[3] ? temp_readReg3 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[4] ? temp_readReg4 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[5] ? temp_readReg5 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[6] ? temp_readReg6 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[7] ? temp_readReg7 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[8] ? temp_readReg8 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[9] ? temp_readReg9 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[10] ? temp_readReg10 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[11] ? temp_readReg11 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[12] ? temp_readReg12 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[13] ? temp_readReg13 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[14] ? temp_readReg14 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[15] ? temp_readReg15 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[16] ? temp_readReg16 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[17] ? temp_readReg17 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[18] ? temp_readReg18 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[19] ? temp_readReg19 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[20] ? temp_readReg20 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[21] ? temp_readReg21 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[22] ? temp_readReg22 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[23] ? temp_readReg23 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[24] ? temp_readReg24 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[25] ? temp_readReg25 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[26] ? temp_readReg26 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[27] ? temp_readReg27 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[28] ? temp_readReg28 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[29] ? temp_readReg29 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[30] ? temp_readReg30 : 32'hzzzzzzzz;
  assign data_readRegA = ctrl_readRegA_solo[31] ? temp_readReg31 : 32'hzzzzzzzz;

  assign data_readRegB = ctrl_readRegB_solo[0] ? temp_readReg0 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[1] ? temp_readReg1 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[2] ? temp_readReg2 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[3] ? temp_readReg3 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[4] ? temp_readReg4 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[5] ? temp_readReg5 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[6] ? temp_readReg6 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[7] ? temp_readReg7 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[8] ? temp_readReg8 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[9] ? temp_readReg9 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[10] ? temp_readReg10 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[11] ? temp_readReg11 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[12] ? temp_readReg12 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[13] ? temp_readReg13 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[14] ? temp_readReg14 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[15] ? temp_readReg15 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[16] ? temp_readReg16 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[17] ? temp_readReg17 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[18] ? temp_readReg18 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[19] ? temp_readReg19 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[20] ? temp_readReg20 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[21] ? temp_readReg21 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[22] ? temp_readReg22 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[23] ? temp_readReg23 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[24] ? temp_readReg24 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[25] ? temp_readReg25 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[26] ? temp_readReg26 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[27] ? temp_readReg27 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[28] ? temp_readReg28 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[29] ? temp_readReg29 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[30] ? temp_readReg30 : 32'hzzzzzzzz;
  assign data_readRegB = ctrl_readRegB_solo[31] ? temp_readReg31 : 32'hzzzzzzzz;

endmodule
