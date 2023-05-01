.data
	INPUT: .space 8
	STRING: .asciiz "Enter a string (up to 7 digits): "
	count_A: .word 0
	
.text
main:
	addi, $v0, $zero, 8
	la $a0, INPUT
	addi $a1, $zero, 8
	syscall
	
	li $t3, 0x0
	
	li $t0, 0x61	# $t0 recebe o valor do caractere "A"
	
Count_A:	
	lb $t1, 0($a0)
	beq $t1, $t3, Exit
	addi $a0, $a0, 1
	beq $t1, $t0, Char_A
	j Count_A
	
Char_A:
	addi $t2, $t2, 1
	j Count_A
	
Exit:
	sw $t2, count_A
	
	addi $v0, $zero, 4
	la $a0, count_A
	syscall
