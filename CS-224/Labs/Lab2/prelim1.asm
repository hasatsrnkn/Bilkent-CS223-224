#################
# CS224
# LAB 2
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 12.10.2022
################
.text	

	main:
		#Welcome message
		li $v0, 4
		la $a0, message1
		syscall
		
		jal userInterface

	userInterface:

		#NewLine
		li $v0, 4
		la $a0, newLine 
		syscall
				
		#Prompt for entering the hex number
		li $v0, 4
		la $a0, message2
		syscall

		#Taking the string
		li $v0, 8	
		la $a0, myString
		li $a1, 20
		syscall
		
	validHexChecker:
		la $s0, myString #the myString
		add $s1, $zero, $zero #the result is 0 now
		addi $sp, $sp, -20
		sw $s0, 0($sp) #adress of the word
		sw $s1, 4($sp) #decimal result
		sw $s2, 8($sp) #the ascii version of char
		sw $s3, 12($sp) # the first ascii to check
		sw $s4, 16($sp) # the second ascii to check
		
	loop1:
		lbu $s2, 0($s0) #ascii
		beq $s2, $zero, showResult
		beq $s2, 10, showResult
		li $s3, 0x30 #0 
		li $s4, 0x39 #9
		
		blt $s2, $s3, end
		bgt $s2, $s4, loop2
		
		addi $s2, $s2, -0x30
		jal summation
	
	loop2:
		li $s3, 0x41 #A
		li $s4, 0x46 #F
		
		blt $s2, $s3, end
		bgt $s2, $s4, loop3
	
		addi $s2, $s2, -0x37
		jal summation
		
	loop3:
		li $s3, 0X61 #a
		li $s4, 0X66 #f
		
		blt $s2, $s3, end
		bgt $s2, $s4, end
		
		addi $s2, $s2, -0x57
		jal summation
			
	end:	
		lw $s0, 0($sp) #adress of the word
		lw $s1, 4($sp) #decimal result
		lw $s2, 8($sp) #the ascii version of char
		lw $s3, 12($sp) # the first ascii to check
		lw $s4, 16($sp) # the second ascii to check
		addi $sp, $sp, 20
		li $v0, 4
		la $a0 message3
		syscall
		
		li $v0, 10
		syscall
	
	summation:
		addi $s0, $s0, 1
		mul $s1, $s1, 0x10
		add $s1, $s1, $s2
		jal loop1

	showResult:
		li $v0, 4
		la $a0, newLine
		syscall
	
		li $v0, 4
		la $a0, message4
		syscall
		
		li $v0, 1
		add $a0, $zero, $s1
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		lw $s0, 0($sp) #adress of the word
		lw $s1, 4($sp) #decimal result
		lw $s2, 8($sp) #the ascii version of char
		lw $s3, 12($sp) # the first ascii to check
		lw $s4, 16($sp) # the second ascii to check
		addi $sp, $sp, 20
		
		jal userInterface
		
.data
	result: .word 0
	myString: .asciiz ""
	message1: .asciiz "Welcome to hex to decimal converter"
	message2: .asciiz "Please enter a hex number: "
	message3: .asciiz "Invalid hex"
	message4: .asciiz "The result is: "
	newLine: .asciiz "\n"

	




