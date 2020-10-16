# r7 = 1, r8 = 4, r9 = 16, r10 = 16, r11 = 1, r12 = 5, r13 = 4, r18 = 5, $r15 = 3, $r25 = 5, r22 = 2
addi $r7, $r7, 1
sll $r8, $r7, 1
sll $r8, $r8, 1
mul $r9, $r8, $r8
sra $r11, $r8, 2
div $r10, $r9, $r11 
addi $r15, $r15, 3
div $r25, $r9, $r15
add $r12, $r11, $r8
sub $r13, $r12, $r7
sw $r12, 1($r15)
lw $r18, 0($r13)
jal 16
bne $r0, $r7, -1
addi $r7, $r7, 1
bne $r0, $r7, -1
addi $r22, $r22, 2
bne $r23, $r22, 0
bex 13
setx 69
div $r0, $r0, $r0
sub $rstatus, $rstatus, $r12
bex 13
setx 10
bex 13
