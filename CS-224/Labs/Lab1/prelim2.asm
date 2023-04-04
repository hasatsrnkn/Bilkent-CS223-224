#################
# CS224
# LAB 1
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 04.10.2022
################
.text
	#Printing for B
	li $v0, 4
	la $a0, message1
	syscall
	
	#Inputting B
	li $v0, 5
	syscall
	sw $v0, bVariable
	
	#Printing for C
	li $v0, 4
	la $a0, message2
	syscall
	
	#Inputting C
	li $v0, 5
	syscall
	sw $v0, cVariable
	
	#Printing for D
	li $v0, 4
	la $a0, message3
	syscall
	
	#Inputting D
	li $v0, 5
	syscall
	sw $v0, dVariable
	
	lw $a0, bVariable
	lw $a1, bVariable
	lw $a2, cVariable
	move $t3, $zero
	
	#Division Part
	jal divisionLoop
	
	#Mult part
	lw $t0, dVariable
	lw $t1, bVariable
	mul $t2, $t0, $t1
	sw $t2, multResult
	
	#Parenthesis result 
	lw $t0, divisionResult
	lw $t1, multResult
	lw $t2, cVariable
	add $t3, $t1, $t0
	sub $t4, $t3, $t2
	sw $t4, inParenthesisResult
	
	#Modular part
	lw $a0, inParenthesisResult
	lw $a1, inParenthesisResult
	lw $a2, bVariable
	jal modular
	
	#Showing the result
	li $v0, 4
	la $a0, resultMessage
	syscall
	
	li $v0, 1
	lw $a0, aResult
	syscall
	
	#Exit the program
	li $v0, 10
	syscall
	
	
	#Subprograms
	divisionLoop:
		move $t0, $a0
		move $t1, $a1
		move $t2, $a2
		move $t4, $ra
		j divisionLoop2
	
	divisionLoop2:
		blt $t0, $t2, divisionLoopExit	
 		sub $t0, $t0, $t2 
 		addi $t3, $t3, 1
		j divisionLoop2
		
	divisionLoopExit:
		sw $t3, divisionResult
		move $ra, $t4
		jr $ra
		
	modular:
		move $t0, $a0
		move $t1, $a1
		move $t2, $a2
		move $t3, $ra
		j modular2
		
	modular2:
		blt $t0, $t2, modularExit
		sub $t0, $t0, $t2
		j modular2
		
	modularExit:
		sw $t0, aResult
		move $ra, $t3
		jr $ra
		
.data
	message1: .asciiz "Enter B: "
	message2: .asciiz "Enter C: "
	message3: .asciiz "Enter D: "
	resultMessage: .asciiz "The result is "
	bVariable: .word 0
	cVariable: .word 0
	dVariable: .word 0
	divisionResult: .word 0
	multResult: .word 0
	inParenthesisResult: .word 0
	aResult: .word 0
