module rightArithmeticShiftSixteen(in0, out);
	
	input [31:0] in0;
	output [31:0] out;

	assign out[0] = in0[16];
	assign out[1] = in0[17];
	assign out[2] = in0[18];
	assign out[3] = in0[19];
	assign out[4] = in0[20];
	assign out[5] = in0[21];
	assign out[6] = in0[22];
	assign out[7] = in0[23];
	assign out[8] = in0[24];
	assign out[9] = in0[25];
	assign out[10] = in0[26];
	assign out[11] = in0[27];
	assign out[12] = in0[28];
	assign out[13] = in0[29];
	assign out[14] = in0[30];
	assign out[15] = in0[31];
	
	assign out[16] = in0[31];
	assign out[17] = in0[31];
	assign out[18] = in0[31];
	assign out[19] = in0[31];
	assign out[20] = in0[31];
	assign out[21] = in0[31];
	assign out[22] = in0[31];
	assign out[23] = in0[31];
	assign out[24] = in0[31];
	assign out[25] = in0[31];
	assign out[26] = in0[31];
	assign out[27] = in0[31];
	assign out[28] = in0[31];
	assign out[29] = in0[31];
	assign out[30] = in0[31];
	assign out[31] = in0[31];
	
endmodule

/*

n = 16
for i in range(0, 32):
  if ((i + n) >= 32):
    if i == 31:
      print("assign out[" + str(i) + "] = in0[31];")
    else:
      print("assign out[" + str(i) + "] = 1'b0;")
  else:
    print("assign out[" + str(i) + "] = in0["+str(i+n)+"];")
	 
*/