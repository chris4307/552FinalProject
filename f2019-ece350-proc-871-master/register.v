module register(clock, ctrl_writeEnable, ctrl_writeReg, ctrl_readReg, reset, data, out);
	
	input clock, ctrl_writeEnable, reset, ctrl_writeReg, ctrl_readReg;
	input [31:0] data;
	output [31:0] out;


	wire enable_and_reg;
	wire clkn;
	not my_clc_n(clkn, clock);
	//assign enable_and_reg = ctrl_writeReg;
	and my_write_enable_reg_0(enable_and_reg, ctrl_writeEnable, ctrl_writeReg, clkn);

	//module DFFtri(d, clk, clr, pr, in_enable, out_enable, out);
	DFFtri my_dffe_0(.d(data[0]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[0]));
	DFFtri my_dffe_1(.d(data[1]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[1]));
	DFFtri my_dffe_2(.d(data[2]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[2]));
	DFFtri my_dffe_3(.d(data[3]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[3]));
	DFFtri my_dffe_4(.d(data[4]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[4]));
	DFFtri my_dffe_5(.d(data[5]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[5]));
	DFFtri my_dffe_6(.d(data[6]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[6]));
	DFFtri my_dffe_7(.d(data[7]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[7]));
	DFFtri my_dffe_8(.d(data[8]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[8]));
	DFFtri my_dffe_9(.d(data[9]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[9]));
	DFFtri my_dffe_10(.d(data[10]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[10]));
	DFFtri my_dffe_11(.d(data[11]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[11]));
	DFFtri my_dffe_12(.d(data[12]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[12]));
	DFFtri my_dffe_13(.d(data[13]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[13]));
	DFFtri my_dffe_14(.d(data[14]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[14]));
	DFFtri my_dffe_15(.d(data[15]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[15]));
	DFFtri my_dffe_16(.d(data[16]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[16]));
	DFFtri my_dffe_17(.d(data[17]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[17]));
	DFFtri my_dffe_18(.d(data[18]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[18]));
	DFFtri my_dffe_19(.d(data[19]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[19]));
	DFFtri my_dffe_20(.d(data[20]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[20]));
	DFFtri my_dffe_21(.d(data[21]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[21]));
	DFFtri my_dffe_22(.d(data[22]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[22]));
	DFFtri my_dffe_23(.d(data[23]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[23]));
	DFFtri my_dffe_24(.d(data[24]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[24]));
	DFFtri my_dffe_25(.d(data[25]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[25]));
	DFFtri my_dffe_26(.d(data[26]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[26]));
	DFFtri my_dffe_27(.d(data[27]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[27]));
	DFFtri my_dffe_28(.d(data[28]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[28]));
	DFFtri my_dffe_29(.d(data[29]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[29]));
	DFFtri my_dffe_30(.d(data[30]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[30]));
	DFFtri my_dffe_31(.d(data[31]), .clk(clock), .clr(reset), .in_enable(enable_and_reg), .out_enable(ctrl_readReg), .out(out[31]));


endmodule