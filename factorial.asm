.data
	fact_result: .word 0
	
.text
main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal Factorial
	j Exit
	
Factorial:
	addi $sp $sp, -8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	
	beq $a0, $zero, IF_n0
	
ELSE:
	addi $a0, $a0, -1
	jal Factorial
	lw $a0, 4($sp)	# valor de "n" é recuperado da pilha
	mul $v0, $a0, $v0
	
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
	
IF_n0:
	addi $v0, $zero, 1
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
	

Exit:
	sw $v0, fact_result
	
	add $a0, $v0, $zero
	
	addi $v0, $zero, 1
	syscall
	
