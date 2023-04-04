#################
# CS224
# LAB 2
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 12.10.2022
################
.text	
	li $v0, 4
	la $a0, message1
	syscall
	
	menu:
		li $v0, 4
		la $a0, message2
		syscall
		
		li $v0, 4
		la $a0, menuOption1
		syscall
		
		li $v0, 4 
		la $a0, menuOption2
		syscall
		
		li $v0, 4
		la $a0, menuChoice
		syscall
		
		li $v0, 5
		syscall
		
		sw $v0, choice
		addi $t1, $zero, 1
		lw $t0, choice
		
		beq $t1, $t0, hexaDecimalVersion
		
		li $v0, 10
		syscall
	
	hexaDecimalVersion:
		li $v0, 4
		la $a0, message3
		syscall
		
		li $v0, 5
		syscall
		
		sw $v0, number
		
		li $v0, 4
		la $a0, message4
		syscall
		
		li $v0, 34
		lw $a0, number 
		syscall
		
	begin:
		addi $sp, $zero, -32
		sw $s0, 0($sp) #the number
		sw $s1, 4($sp) #the loop number
		sw $s2, 8($sp) #the result 
		sw $s3, 12($sp) #the least significant bit
		sw $s4, 16($sp) #8 case
		sw $s5, 20($sp) #24
		sw $s6, 24($sp) #24 to lower cases
		sw $s7, 28($sp) #number 8 
		
		add $s0, $a0, $zero
		addi $s1, $zero, 31
		add $s2, $zero, $zero
		add $s3, $zero, $zero
		add $s4, $zero, $zero
		addi $s5, $zero, 24
		addi $s6, $zero, 24
		addi $s7, $zero, 8
		
		
	loop1:
		blt $s1, $zero, showResult
		beq $s4, $s7, the8Case
		
	return:
		andi $s3, $s0, 1
		sllv $s3, $s3, $s5
		srl $s0, $s0, 1
		or $s2, $s2, $s3
		subi $s1, $s1, 1
		addi $s5, $s5, 1
		addi $s4, $s4, 1
		j loop1
	
	the8Case:
		add $s4, $zero, $zero
		addi $s6, $s6, -8
		move $s5, $s6
		j return
	
	showResult:
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message5 
		syscall
		
		li $v0, 34
		move $a0, $s2
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		lw $s0, 0($sp) #the number
		lw $s1, 4($sp) #the loop number
		lw $s2, 8($sp) #the result 
		lw $s3, 12($sp) #the least significant bit
		lw $s4, 16($sp) #8 case
		lw $s5, 20($sp) #24
		lw $s6, 24($sp) #the number for 4 
		lw $s7, 28($sp) #number 8 
		addi $sp, $sp, 32
		jal menu


.data
	message1: .asciiz "Welcome to byteInverter\n"
	message2: .asciiz "Please Enter an Option\n"
	message3: .asciiz "Please Enter an Integer: "
	message4: .asciiz "Hexadecimal of the number is "
	message5: .asciiz "The inverted hexadecimal is "
	menuOption1: .asciiz "1)Enter a decimal and see inverted byte of it\n"
	menuOption2: .asciiz "E)Quit\n"
	menuChoice: .asciiz "Your choice (Please enter 1 for first, else for second): "
	newLine: .asciiz "\n"
	choice: .word 0
	number: .word 0
	

	
