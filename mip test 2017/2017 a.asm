################# Data segment #####################
.data
array: .word -3,0,3,6,9,12,15,18,21,24
yes: .asciiz "Yes"
no: .asciiz "No"
msg1: .asciiz "\n Please enter a number between 1-100 \n"
################# Code segment #####################
.text
.globl main
main:# main program entry

la $t1, array
addi $t2 , $t1, 4
li $t3 , 0 #counter
lw $s0 , ($t1)
lw $s1 , ($t2)
sub $t4, $s1,$s0

loop:
beq $t3, 9, endArray

lw $s0 , ($t1)
lw $s1 , ($t2)

sub $t5, $s1,$s0
bne $t4, $t5, notSeries

addi $t1, $t1, 4
addi $t2, $t2, 4
addi $t3, $t3, 1
j loop

notSeries: # print no
la $a0 , no
li $v0 , 4
syscall
j exit

endArray: #print yes
la $a0 , yes
li $v0 , 4
syscall

readNumber:
la $a0 , msg1
li $v0 , 4
syscall

li $v0, 5 # read number
syscall

bgt $v0,100, readNumber
blt $v0, 0 , readNumber

li $t1, 0 # counter

lw $t2,array

loop2:
beq $t1 , $v0 , print
add $t2,$t2,$t4
addi $t1,$t1,1
j loop2

print:
move $a0 , $t2
li $v0 , 1
syscall


exit:
li $v0, 10
syscall