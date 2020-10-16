module mux_2_65bit(select, in0, in1, out);
  input select;
  input [64:0] in0, in1;
  output [64:0] out;
  assign out = select ? in1 : in0;
endmodule
