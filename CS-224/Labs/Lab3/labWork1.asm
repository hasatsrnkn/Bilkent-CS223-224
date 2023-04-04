#################
# CS224
# LAB 3
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 04.11.2022
################
.text
	#Welcome message
	li $v0, 4
	la $a0, message1
	syscall

	main:
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message2
		syscall
		
		li $v0, 5
		syscall
		beqz $v0, exit 
		
		sw $v0, number
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message3
		syscall
		
		li $v0, 5
		syscall
		beqz $v0, exit 
		
		sw $v0, divider
		
		
		lw $a0, number
		lw $a1, divider
		
		jal recursiveDivision
		sw $v0, result
		
		li $v0, 4
		la $a0, message4
		syscall
		
		li $v0, 1
		lw $a0, result
		syscall
		
		j main
		
	exit:
		li $v0, 10
		syscall
	
	recursiveDivision:
		addi $sp, $sp, -8
		sw $s0, 4($sp)
		sw $ra, 0($sp)
		
		#basecase
		li $v0, 0
		blt $a0, $a1, recursiveDivisionDone
		
		move $s0, $a0
		sub $a0, $a0, $a1
		jal recursiveDivision
		
		addi $v0, $v0, 1
		
	recursiveDivisionDone:
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addi $sp, $sp, 8
		jr $ra
		

.data
	number: .word 0
	divider: .word 0
	result: .word 
	message1: .asciiz "Welcome to RecusiveDivision\n"
	message2: .asciiz "Please enter a number: "
	message3: .asciiz "Please enter the divider: "
	message4: .asciiz "The result is: "
	newLine: .asciiz "\n"


