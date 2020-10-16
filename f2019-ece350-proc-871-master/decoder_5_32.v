module decoder_5_32(select, o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25, o26, o27, o28, o29, o30, o31);

	input [4:0] select;
	output o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25, o26, o27, o28, o29, o30, o31;
	
	wire select0, select1, select2, select3, select4;
	wire not_select0, not_select1, not_select2, not_select3, not_select4;
	assign select0 = select[0];
	assign select1 = select[1];
	assign select2 = select[2];
	assign select3 = select[3];
	assign select4 = select[4];
	not my_not_select0(not_select0, select0);
	not my_not_select1(not_select1, select1);
	not my_not_select2(not_select2, select2);
	not my_not_select3(not_select3, select3);
	not my_not_select4(not_select4, select4);
	
	and my_choose_o0(o0, not_select0, not_select1, not_select2, not_select3, not_select4);
	and my_choose_o1(o1, select0, not_select1, not_select2, not_select3, not_select4);
	and my_choose_o2(o2, not_select0, select1, not_select2, not_select3, not_select4);
	and my_choose_o3(o3, select0, select1, not_select2, not_select3, not_select4);
	and my_choose_o4(o4, not_select0, not_select1, select2, not_select3, not_select4);
	and my_choose_o5(o5, select0, not_select1, select2, not_select3, not_select4);
	and my_choose_o6(o6, not_select0, select1, select2, not_select3, not_select4);
	and my_choose_o7(o7, select0, select1, select2, not_select3, not_select4);
	and my_choose_o8(o8, not_select0, not_select1, not_select2, select3, not_select4);
	
	and my_choose_o9(o9, select0, not_select1, not_select2, select3, not_select4);
	and my_choose_o10(o10, not_select0, select1, not_select2, select3, not_select4);
	and my_choose_o11(o11, select0, select1, not_select2, select3, not_select4);
	and my_choose_o12(o12, not_select0, not_select1, select2, select3, not_select4);
	and my_choose_o13(o13, select0, not_select1, select2, select3, not_select4);
	and my_choose_o14(o14, not_select0, select1, select2, select3, not_select4);
	and my_choose_o15(o15, select0, select1, select2, select3, not_select4);
	
	and my_choose_o16(o16, not_select0, not_select1, not_select2, not_select3, select4);
	and my_choose_o17(o17, select0, not_select1, not_select2, not_select3, select4);
	and my_choose_o18(o18, not_select0, select1, not_select2, not_select3, select4);
	and my_choose_o19(o19, select0, select1, not_select2, not_select3, select4);
	and my_choose_o20(o20, not_select0, not_select1, select2, not_select3, select4);
	and my_choose_o21(o21, select0, not_select1, select2, not_select3, select4);
	and my_choose_o22(o22, not_select0, select1, select2, not_select3, select4);
	and my_choose_o23(o23, select0, select1, select2, not_select3, select4);
	and my_choose_o24(o24, not_select0, not_select1, not_select2, select3, select4);
	and my_choose_o25(o25, select0, not_select1, not_select2, select3, select4);
	and my_choose_o26(o26, not_select0, select1, not_select2, select3, select4);
	and my_choose_o27(o27, select0, select1, not_select2, select3, select4);
	and my_choose_o28(o28, not_select0, not_select1, select2, select3, select4);
	and my_choose_o29(o29, select0, not_select1, select2, select3, select4);
	and my_choose_o30(o30, not_select0, select1, select2, select3, select4);
	and my_choose_o31(o31, select0, select1, select2, select3, select4);
	
endmodule