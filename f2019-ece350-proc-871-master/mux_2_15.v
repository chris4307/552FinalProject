module mux_2_15(select, in0, in1, out);
  input select;
  input [14:0] in0, in1;
  output [14:0] out;
  assign out = select ? in1 : in0;
endmodule
