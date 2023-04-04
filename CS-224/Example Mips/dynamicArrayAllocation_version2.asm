	.text
	li $a0,12
	li $v0,9
	syscall
	
	add $t0,$v0,$zero
	
	li $t1,2
	sw $t1,0($t0)
	
	li $t1,3
	sw $t1,4($t0)
	
	li $t1,5
	sw $t1,8($t0)
	
	move $a0,$t0
	lw $a1,arraySize
	jal findSum
	
	add $a0,$v0,$zero
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
#################################

	findSum:
	add $t1,$zero,$zero
	move $t0,$a0
	move $t2,$a1
	
	next:
	beq $t2,$zero,done
	lw $t3,0($t0)
	add $t1,$t1,$t3
	addi $t0,$t0,4
	addi $t2,$t2,-1
	j next
	
	done:
	move $v0,$t1
	jr $ra
	
	

	.data
	arraySize: .word 3