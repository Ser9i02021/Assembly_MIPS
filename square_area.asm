.data
	area: .word 0
	
.text
	main: addi $a0, $zero, 4
	      addi $a1, $zero, 10
	      
	      jal CalculaAreaQuadrado
	      
	      sw $v0, area
	      
	      j Exit
	      
	CalculaAreaQuadrado: addi $sp, $sp, -4
			     sw $t0, 0($sp)
			     
			     mul $t0, $a0, $a1
			     add $v0, $t0, $zero
			     
			     lw $t0, 0($sp)
			     addi $sp, $sp, 4
			     
			     jr $ra
			     
	Exit: nop
