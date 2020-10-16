# overflow testing

# mult overflow testing
addi $r1, $r1, 65535 # $r1 = 0000...001111...111
addi $r1, $r1, 65535 #r1 = 131070
mul $r2, $r1, $r1 # mult overflow 
addi $r3, $rstatus, $r0 # $r3 = 4 = $rstatus

# div overflow testing
div $r4, $r1, $r1 # $r4 = 1
div $r4, $r1, $r0 # div overflow
add $r5, $rstatus, $r0 # $r5 = 5 = $rstatus
add $r6, $r5, $r5 # $r6 = 10

# add overflow testing
addi $r7, $r7, 65535 # $r7 = 000000..01111...1111
sll $r8, $r7, 15 # $r8 = 0111....111000... 000
addi $r9, $r8, 32767 # $r9 = 0111...1111
add $r10, $r9, $r9 # add overflow
add $r11, $rstatus, $r0 # $r11 = 1 = $rstatus
addi $r12, $r9, 1 # addi overflow
add $r13, $rstatus, $r0 # $r13 = 2 = $rstatus

