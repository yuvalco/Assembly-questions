.data

.text

main:
li $a1,0x1e8f8f1e


byte_palindrome:
move $t0, $a1


and $t1,$t0,0x000000ff
and $t2,$t0,0x0000ff00

srl $t3,$t0,16
and $t3,$t0,0x000000ff
srl $t4,$t0,24
and $t4,$t0,0x000000ff

xor $s0,$t1,$t4
xor $s1,$t2,$t3
or $s2, $s0,$s1

beqz $s2, match
j noMatch

match:
li $v1 ,1

noMatch:
li $v1 ,0