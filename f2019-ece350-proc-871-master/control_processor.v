module control_processor(Opcode, ALUop, Rwe, ALUinB, RstatusC, JalC, DMwe, DMld, MEMwrite, RdC, PConeNC, PCTC, PCRdC, BNEC, BLTC, BEXC, RsC, ALUopAddC, SwC, SETXC, JC);
	
	input [4:0] Opcode, ALUop;
	output Rwe, ALUinB, RstatusC, JalC, DMwe, DMld, MEMwrite, RdC, PConeNC, PCTC, PCRdC, BNEC, BLTC, BEXC, RsC, ALUopAddC, SwC, SETXC, JC;
		
	wire j, bne, jal, jr, blt, addi, sw, lw, setx, bex, add, sub, and_c, or_c, sll, sra, mul, div;
	//module control_decoder(Opcode, ALUop, j, bne, jal, jr, blt, addi, sw, lw, setx, bex, add, sub, and_c, or_c, sll, sra, mul, div);
	control_decoder my_control_decoder(Opcode, ALUop, j, bne, jal, jr, blt, addi, sw, lw, setx, bex, add, sub, and_c, or_c, sll, sra, mul, div);
	
	or my_rwe(Rwe, add, addi, sub, and_c, or_c, sll, sra, mul, div, lw, jal, setx);
	or my_aluinb(ALUinB, addi, sw, lw, setx);
	or my_rstatusc(RstatusC, setx);
	or my_jalc(JalC, jal);
	or my_dmwe(DMwe, sw);
	or my_dmld(DMld, lw);
	or my_memwrite(MEMwrite, lw);
	or my_rdc(RdC, jr, bne, blt);
	or my_swc(SwC, sw);
	or my_pconenc(PConeNC, 1'b0);
	or my_pctc(PCTC, jal, j); //, jal);
	or my_PCRdC(PCRdC, jr);
	or my_bnec(BNEC, bne);
	or my_blt(BLTC, blt);
	or my_bexc(BEXC, bex);
	or my_rsc(RsC, bne, blt);
	or my_aluopaddc(ALUopAddC, lw, sw, addi, setx);
	or my_setxc(SETXC, setx);
	or my_jc(JC, j);
	
endmodule