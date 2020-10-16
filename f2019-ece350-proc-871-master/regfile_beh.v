module regfile_beh(
	clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA,
	data_readRegB, d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24,
										d25, d26, d27, d28, d29, d30, d31
);
	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;
	output [31:0] data_readRegA, data_readRegB;

	reg[31:0] registers[31:0];
	
	always @(negedge clock or posedge ctrl_reset)
	begin
		if(ctrl_reset)
			begin
				integer i;
				for(i = 0; i < 32; i = i + 1)
					begin
						registers[i] = 32'd0;
					end
			end
		else
			if(ctrl_writeEnable && ctrl_writeReg != 5'd0)
				registers[ctrl_writeReg] = data_writeReg;
	end
	
	assign data_readRegA = ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegA) ? 32'bz : registers[ctrl_readRegA];
	assign data_readRegB = ctrl_writeEnable && (ctrl_writeReg == ctrl_readRegB) ? 32'bz : registers[ctrl_readRegB];
	
	output [31:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24,
										d25, d26, d27, d28, d29, d30, d31;
	assign d0 = registers[0];
	assign d1 = registers[1];
	assign d2 = registers[2];
	assign d3 = registers[3];
	assign d4 = registers[4];
	assign d5 = registers[5];
	assign d6 = registers[6];
	assign d7 = registers[7];
	assign d8 = registers[8];
	assign d9 = registers[9];
	assign d10 = registers[10];
	assign d11 = registers[11];
	assign d12 = registers[12];
	assign d13 = registers[13];
	assign d14 = registers[14];
	assign d15 = registers[15];
	assign d16 = registers[16];
	assign d17 = registers[17];
	assign d18 = registers[18];
	assign d19 = registers[19];
	assign d20 = registers[20];
	assign d21 = registers[21];
	assign d22 = registers[22];
	assign d23 = registers[23];
	assign d24 = registers[24];
	assign d25 = registers[25];
	assign d26 = registers[26];
	assign d27 = registers[27];
	assign d28 = registers[28];
	assign d29 = registers[29];
	assign d30 = registers[30];
	assign d31 = registers[31];
	
endmodule
