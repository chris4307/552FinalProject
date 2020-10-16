## Full Testing
nop
nop
simple_arithmetic:
	# r1 = 7, r2 = 17, r3 = 22, r4 = 44, r5 = 66, r6 = -49, r7 = 17
	addi $r1, $r1, 7   			
	addi $r2, $r1, 10  			 
	addi $r3, $r1, 15  			 
	add $r4, $r3, $r3  			
	add $r5, $r4, $r3  			
	sub $r6, $r2, $r5  			
	add $r7, $r6, $r5  			
	blt $r6, $r7, simple_multdiv		
	j simple_halt				

simple_multdiv:
	# r8 = 49, r9 = 2401, r10 = 49, r11 = 0, r12 = -343, r13 = -15, r14 = 5145
	mul $r8, $r1, $r1			
	mul $r9, $r8, $r8
	div $r10, $r9, $r8
	div $r11, $r2, $r4
	mul $r12, $r6, $r1
	div $r13, $r12, $r3
	mul $r14, $r13, $r12
	bne $r8, $r10, simple_halt
	bne $r14, $r13, 0
	j simple_overflow

simple_overflow:
	# r15 = 131070, r17 = 4, r18 = 5, r19 = 011...1111000..000, r20 = 0111...11, r22 = 1, r24 = 2, r25 = 4, r26 = 6
	# mult overflow testing
	addi $r15, $r15, 65535 # $r1 = 0000...001111...111
	addi $r15, $r15, 65535 #r1 = 131070
	mul $r16, $r15, $r15 # mult overflow 
	addi $r17, $rstatus, $r0 # $r3 = 4 = $rstatus

	# div overflow testing
	div $r7, $r7, $r0 # div overflow
	add $r18, $rstatus, $r0 # $r5 = 5 = $rstatus

	# add overflow testing
	addi $r15, $r0, 65535
	sll $r19, $r15, 15 # $r8 = 0111....111000... 000
	addi $r20, $r19, 32767 # $r9 = 0111...1111
	add $r21, $r20, $r20 # add overflow
	add $r22, $rstatus, $r0 # $r11 = 1 = $rstatus
	addi $r23, $r20, 1 # addi overflow
	add $r24, $rstatus, $r0 # $r13 = 2 = $rstatus
	mul $r25, $rstatus, $rstatus
	add $r26, $r25, $rstatus
	addi $r29, $r29, 2047
	j simple_dmem	

simple_dmem:
	sw $r24, 0($r17)	
	lw $r27, 0($r25)
	bne $r24, $r27, simple_dmem
	j simple_halt
	j simple_dmem	

simple_halt:
	bne $r0, $r8, -1
	addi $r8, $r8, 1
	bne $r0, $r8, -1