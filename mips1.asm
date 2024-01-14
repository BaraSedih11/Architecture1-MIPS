#.data segment
.data
msg1: .asciiz "\nEnter first number 0-9: "
newline: .asciiz "\n"
msg2: .asciiz "Enter second number 0-9: "
name: .asciiz "Bara Al Sedih\n"
ans1: .asciiz "The sum of odd numbers is: "
ans2: .asciiz "The factorial is: "

.text

main:

read1:
#print msg1 
li $v0, 4
la $a0, msg1
syscall

#read num1
li $v0, 5
syscall 
move $t0, $v0
blt $t0, 0, read1


read2:
#print msg2
li $v0, 4
la $a0, msg2
syscall


#read num2
li $v0, 5
syscall
move $t1, $v0
blt $t1, 0, read2


#print name
li $v0, 4
la $a0, name
syscall

#---------here I checked the validation of the inputs----------
move $a0, $t0
move $a1, $t1

jal SumOdd

move $a0, $t0
move $a1, $t1

jal Factorial

li $v0, 10
syscall	

#-------------The first function----------------------
SumOdd:
mul $a0, $a0, 2
mul $a1, $a1, 20

addi $t2, $a0, 1
add $t3, $0, $0

loop1:
add $t3, $t3, $t2

addi $t2, $t2, 2
blt $t2, $a1, loop1

la $a0, ans1
li $v0, 4
syscall

move $a0, $t3
li $v0, 1
syscall

#print newline
li $v0, 4
la $a0, newline
syscall

jr $ra


#--------------The second function----------------------
Factorial:
move $t5, $a0
move $t6, $a1

#print msg
la $a0, ans2
li $v0, 4
syscall

blt $t5, $t6, less
sub $t7, $t5, $t6
j fact

less:
sub $t7, $t6, $t5
j fact

fact:
beq $t7, $0, equal

addi $t8, $0, 1

loop2:
mul $t8, $t8, $t7
addi $t7, $t7, -1
bgt $t7, $0, loop2

move $a0, $t8
li $v0, 1
syscall
j end

equal:
addi $a0, $0, 1
li $v0, 1
syscall
j end

end:
jr $ra

