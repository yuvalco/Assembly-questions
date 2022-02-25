.data

.text

main:
li $a1, 255
li $a2, 4


print_base:
move $t0,$a1
move $t1,$a2
li $t4, 0 #counter

loop:
div $t0,$t1
mflo $t0
mfhi $t3

addiu $sp, $sp, -4
sw $t3, ($sp)
addi $t4,$t4, 1

beq $t0, 0, loop2

j loop

loop2:
beq $t4,0,exit

subi $t4,$t4 , 1
lw $a0, ($sp)
addiu $sp, $sp, 4

li $v0,1
syscall
j loop2

exit:
li $v0,10
syscall