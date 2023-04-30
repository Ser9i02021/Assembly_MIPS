.data
	result: .word 0
	
.text
	li $v0, 5	# Lê-se o valor de "base" e o aramazena em $a0
	syscall
	move $a0, $v0
	
	li $v0, 5	# Lê-se o valor de "expoente" e o aramazena em $a1
	syscall
	move $a1, $v0
	
	pow: addi $sp, $sp, -8
	     sw $t0, 4($sp)
	     sw $t1, 0($sp)
	     
	     add $t0, $zero, $a0		# result --> $t0
	     addi $t1, $zero, 1	# i --> $t1
	     
	     beq $a1, $zero, after_loop_E0
	     beq $a1, $t1, after_loop_Ex
	     loop: mul $t0, $t0, $a0
	     	   addi $t1, $t1, 1
	     	   bne $t1, $a1, loop
	     	   j after_loop_Ex
	     	   
	     after_loop_E0: addi $v0, $zero, 1
	     		    j Exit
	     		    	   
	     after_loop_Ex: add $v0, $t0, $zero
	     
	     Exit: lw $t1, 0($sp)
	     	   lw $t0, 4($sp)
	     	   addi $sp, $sp, 8
	 
	 sw $v0, result
