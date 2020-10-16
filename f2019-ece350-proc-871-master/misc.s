# miscellaneous tests
# r1 = 100, r3 = 0, r4 = 0, r5 = 100, r6 = 200, r7 = 200

# adding to $r0
addi $r1, $r1, 100
add $r0, $r1, $r2
add $r3, $r0, $r0
add $r4, $r0, $r0

# lw stall
sw $r1, 0($r1)
lw $r5, 0($r1)
add $r6, $r5, $r1
add $r7, $r6, $r0

# memory bypass
addi $r1, $r1, 10
sw $r1, 0($r0)
lw $r2, 0($r0)