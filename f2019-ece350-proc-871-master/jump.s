# r1 = 1, r2 = 4, r3 = 5, rstatus = 13, r4 = 69, r5 = 70
addi $r1, $r1, 1
addi $r2, $r1, 3
jal to_jump
j halt

to_jump:
	addi $r3, $r2, $r1
	bex halt
	setx 13
	bex to_start

to_start:
	addi $r5, $r5, 70
	jr $r31

halt:
	addi $r4, $r4, 69
	bne $r0, $r1, -1 