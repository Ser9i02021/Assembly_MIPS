.data
	G: .word 0
	H: .word 0
	I: .word 0
	J: .word 0
	F: .word 0
	
.text
	li $v0, 5	# Lê-se G e o armazena em $a0
	syscall
	move $a0, $v0
	
	li $v0, 5	# Lê-se H e o armazena em $a1
	syscall
	move $a1, $v0
	
	li $v0, 5	# Lê-se I e o armazena em $a2
	syscall
	move $a2, $v0
	
	li $v0, 5	# Lê-se J e o armazena em $a3
	syscall
	move $a3, $v0
	
	calcula: addi $sp, $sp, -12	# Empilha-se os valores dos registradores $t0, $t1 e $s0 na área de "pilha" da memória
		 sw $t0, 8($sp)
		 sw $t1, 4($sp)
		 sw $s0, 0($sp)
		 
		 add $t0, $a0, $a1	# $t0 recebe G + H
		 add $t1, $a2, $a2	# $t1 recebe I + J
		 sub $s0, $t0, $t1	# $s0 recebe (G + H) - (I + J)
		 add $v0, $s0, $zero	# $v0 recebe o conteúdo de $s0
		 
		 
 		 lw $s0, 0($sp)		# Desempilha-se os valores da "pilha" e os retorna aos seus registradores iniciais $t0, $t1 e $s0
 		 lw $t1, 4($sp)
		 lw $t0, 8($sp)		
		 addi $sp, $sp, 12
	
	sw $a0, G	# Salva-se os valores de G, H, I, J e F na memória de dados	 
	sw $a1, H
	sw $a2, I
	sw $a3, J
	sw $v0, F
	
