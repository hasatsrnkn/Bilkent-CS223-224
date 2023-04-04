#################
# CS224
# LAB 1
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 07.10.2022
################
.text
	#First message
	li $v0, 4
	la $a0, message1
	syscall
	
	#Taking the arraySize
	li $v0, 5
	syscall
	sw $v0, arraySize
	
	#Reading the items
	jal readItems
	
	menu:
		li $v0, 4
		la $a0, menuOption1
		syscall
		
		li $v0, 4
		la $a0, menuOption2
		syscall
		
		li $v0, 4
		la $a0, menuOption3
		syscall
		
		li $v0, 4
		la $a0, menuOption4
		syscall
		
		li $v0, 4
		la $a0, message3
		syscall
		
		li $v0, 5
		syscall
		add $t0, $zero, $v0
		addi $t1, $zero, 1
		addi $t2, $zero, 2
		addi $t3, $zero, 3
		addi $t4, $zero, 4
		
		beq $t0, $t1, option1
		beq $t0, $t2, option2
		beq $t0, $t3, option3
		beq $t0, $t4, option4
		
	
	#Subprograms
	readItems:
		la $t0, array
		lw $t1, arraySize
		add $t2, $zero, $zero
		add $t3, $zero, $ra
		li $v0, 4
		la $a0, message2
		syscall
		jal readItems2
		
	readItems2:
		li $v0, 5
		syscall
		sw $v0, 0($t0)
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		bgt $t1, $t2, readItems2
		add $ra, $zero, $t3
		jr $ra
		
	#Option1
	option1:
		li $v0, 4
		la $a0, message4
		syscall
		
		li $v0, 5
		syscall
		add $t1, $zero, $v0 #the number
		
		la $t0, array
		lw $t4, arraySize #array size
		add $t2, $zero, $zero #number of iteration
		add $t3, $zero, $zero #number of sum
		j option1Loop1
		
	option1Loop1:
		lw $t5, 0($t0)
		bge $t2, $t4, option1LoopExit
		bgt $t5, $t1, option1Loop2
		addi $t2, $t2, 1
		addi $t0, $t0, 4
		jal option1Loop1
		
	option1Loop2:
		lw $t5, 0($t0)
		addi $t2, $t2, 1
		add $t3, $t3, $t5
		addi $t0, $t0, 4
		jal option1Loop1
		
		
	option1LoopExit:
		li $v0, 4
		la $a0, option1Message
		syscall
		
		li $v0, 1
		add $a0, $zero, $t3
		syscall
		
		#New Line
		li $v0, 4
		la $a0, newLine
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
		
		jal menu
		
	#Option2
	option2:
		la $t0, array
		lw $t1, arraySize #arraysize
		add $t2, $zero, $zero #number of iteration
		add $t3, $zero, $zero #sum of odd
		add $t4, $zero, $zero #sum of even
		addi $t6, $zero, 2 #2 register
		j option2Loop1
		
	option2Loop1:
		lw $t5, 0($t0)
		bge $t2, $t1, option2LoopExit
		div $t5, $t6
		mfhi $t7 #mod2
		addi $t5, $zero, 1 #1 register
		beq $t7, $zero, option2EvenLoop
		beq $t7, $t5, option2OddLoop
		
		
	option2EvenLoop:
		lw $t5, 0($t0)
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		add $t4, $t4, $t5
		j option2Loop1
	
	option2OddLoop:
		lw $t5, 0($t0)
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		add $t3, $t3, $t5
		j option2Loop1
		
	option2LoopExit:
		li $v0, 4
		la $a0, option2Message1
		syscall
		
		li $v0, 1
		add $a0, $zero, $t4
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, option2Message2
		syscall
		
		li $v0, 1
		add $a0, $zero, $t3
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		jal menu
		
	
	#Option3
	option3:
		li $v0, 4
		la $a0, message4
		syscall
		
		li $v0, 5
		syscall
		add $t4, $v0, $zero #the number
		
		la $t0, array
		lw $t1, arraySize #arraysize
		add $t2, $zero, $zero #number of iteration
		add $t3, $zero, $zero #number of occurances
		j option3Loop1
		
	option3Loop1:
		lw $t5, 0($t0)
		bge $t2, $t1, option3LoopExit
		div $t5, $t4
		mfhi $t6
		beq $t6, $zero, option3Loop2
		addi $t2, $t2, 1
		addi $t0, $t0, 4
		jal option3Loop1
		
	option3Loop2:
		addi $t2, $t2, 1
		addi $t3, $t3, 1
		addi $t0, $t0, 4
		jal option3Loop1
		 
	option3LoopExit:
		li $v0, 4
		la $a0, option3Message
		syscall 
		
		li $v0, 1
		add $a0, $zero, $t3
		syscall
		
		#New Line
		li $v0, 4
		la $a0, newLine
		syscall
		li $v0, 4
		la $a0, newLine
		syscall
		
		jal menu
		
	
	#Option4
	option4:
		#Exit the program
		li $v0, 10
		syscall

.data
	array: .space 400
	arraySize: .word 0
	number: .word 0
	message1: .asciiz "Enter the array size: "
	message2: .asciiz "Enter the numbers:\n"
	message3: .asciiz "Your choice: "
	message4: .asciiz "Please enter a number: "
	option1Message: .asciiz "The summation: "
	option2Message1: .asciiz "The summation of even numbers: "
	option2Message2: .asciiz "The summation of odd numbers: "
	option3Message: .asciiz "The number of occurances: "
	newLine: .asciiz "\n"
	menuOption1: .asciiz "1) Find summation of numbers stored in the array which is greater than an input number.\n"
	menuOption2: .asciiz "2) Find summation of even and odd numbers and display them.\n"
	menuOption3: .asciiz "3) Display the number of occurrences of the array elements divisible by a certain input number.\n"
	menuOption4: .asciiz "4) Quit.\n"
	

