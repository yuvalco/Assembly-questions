.data

buf: .ascii "xabvfrqwetyqqqwaquu"
buf1: .space 20
end1:.asciiz "\n"
msg1:.asciiz "\nThe number of identical char is:"

.text
.global main 
main:


la $t1, buf #sets t1 to start of string
addi $t2, $t1, 1 # sets to t1 + 1

la $t3, buf1 # buf1 address
move $t4,$zero #counter

li $s2, 0 #init counter for equal

loop:
beq $t4,20, print #finish loop

lb $s0,($t1) #index
lb $s1,($t2) #index + 1

beq $s0,$s1 equal

slt $t6, $s0,$s1 

beq $t6 , 1 , add
beq $t6 , 0 , sub

equal:
li $t5 , '='
sb $t5 , buf1($t4)
addi $s2,$s2,1
j end

sub:
li $t5 , '-'
sb $t5 , buf1($t4)
j end

add:
li $t5 , '+'
sb $t5 , buf1($t4)
j end


end:
addi $t1, $t1,1
addi $t2, $t2,1
addi $t4, $t4,1
j loop


print:
    la $a0, buf1
    li $v0, 4
    syscall
