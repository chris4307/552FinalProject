# r1 = 5, r3 = 10, r4 = 10, r5 = 20, r6 = 30, r7 = 20

nop
nop
addi $r1, $r1, 10
sw $r1, 0($r0)
lw $r2, 0($r0)

#addi $r1, $r1, 5
#add $r3, $r1, $r1 # checks read ports 1&2 XM bypass
#add $r4, $r1, $r1 # checks read ports 1&2 MW bypass 
#add $r5, $r4, $r3 # checks read port 1 XM bypass, port 2 MW bypass
#add $r6, $r4, $r5 # checks read port 1 MW bypass, port 2 XM bypass
#add $r7, $r3, $r4 # checks no bypass instruction


