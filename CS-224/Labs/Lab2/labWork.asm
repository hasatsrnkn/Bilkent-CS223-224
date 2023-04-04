#################
# CS224
# LAB 2
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 14.10.2022
################
.text
	#Welcome message
	li $v0, 4
	la $a0, message1
	syscall
	
	main:
		jal takeTheArraySize
		sw $v0, arraySize
		
		addi $s0, $zero, 4
		lw $s1, arraySize
		mul $s3, $s1, $s0
		
		li $v0, 9
		add $a0, $zero, $s3
		syscall
		
		sw $v0, array
		
		lw $a0, array
		lw $a1, arraySize
		
		jal monitor
		
		li $v0, 10
		syscall
		
	#Subprograms
	monitor:
		addi $sp, $sp, -40
		sw $s7, 32($sp)
		sw $s6, 28($sp)
		sw $s5, 24($sp)
		sw $s4, 20($sp)
		sw $s3, 16($sp)
		sw $s2, 12($sp) 
		sw $s1, 8($sp)
		sw $s0, 4($sp)
		sw $ra, 0($sp)
		
		
		jal readItems
		
		lw $a0, array
		lw $a1, arraySize
		jal printItems
		
		lw $a0, array
		lw $a1, arraySize
		jal bubbleSort
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message6
		syscall

		lw $a0, array
		lw $a1, arraySize
		jal printItems
		
		lw $a0, array
		lw $a1, arraySize
		jal minMax
		
		add $s0, $zero, $v0
		add $s1, $zero, $v1
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, minMessage
		syscall
		
		li $v0, 1
		add $a0, $zero, $s0
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, maxMessage
		syscall
		
		li $v0, 1
		add $a0, $zero, $s1
		syscall
		
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		lw $s1, 8($sp)
		lw $s2, 12($sp)
		lw $s3, 16($sp)
		lw $s4, 20($sp)
		lw $s5, 24($sp)
		lw $s6, 28($sp)
		lw $s7, 32($sp)
		addi $sp, $sp, 40
		
		jr $ra
	
	#BubbleSort
	bubbleSort:
		sw $ra, 36($sp)
		add $s0, $zero, $a0 #array
		add $s2, $zero, $zero #counter for outer loop
		add $s3, $zero, $zero #counter for inner loop
		
	outerLoop:
		add $s4, $s0, $zero #array2
		addi $s1, $a1, -1 #arraySize - 1
		add $s3, $zero, $zero # inner counter
		beq $s2, $s1, exitBubbleSort
		sub $s1, $s1, $s2
	innerLoop:
		lw $s5, 0($s4) #first element
		lw $s6, 4($s4) #second element
		blt $s5, $s6, swap
	nextInnerLoop:
		addi $s3, $s3, 1
		addi $s4, $s4, 4
		blt $s3, $s1, innerLoop
		addi $s2, $s2, 1
		j outerLoop
	swap:
		add $s7, $s5, $zero #temp
		add $s5, $s6, $zero
		add $s6, $s7, $zero
		sw $s5, 0($s4) #first element
		sw $s6, 4($s4) #second element
		j nextInnerLoop
	
	exitBubbleSort: 
		lw $ra, 36($sp)
		jr $ra
		
	#MinMax
	minMax:
		sw $ra, 36($sp)
		add $s0, $zero, $a0 #array
		add $s1, $zero, $a1 #array size
		add $s2, $zero, $zero #counter for loop
		lw $v0, 0($s0) #min element
		lw $v1, 0($s0) #max element 
	minMaxLoop:
		beq $s2, $s1, exitMinMax
		lw $s3, 0($s0) 
		blt $s3, $v0, minCase
		bgt $s3, $v1, maxCase
	nextMinMax:
		addi $s0, $s0, 4
		add $s2, $s2, 1
		j minMaxLoop
	
	exitMinMax:
		lw $ra, 36($sp)
		jr $ra
	minCase:
		add $v0, $zero, $s3
		j nextMinMax
		
	maxCase:
		add $v1, $zero, $s3
		j nextMinMax
		
	#read
	readItems:
		add $s0, $zero, $a0 #array 
		add $s1, $zero, $a1 #arraySize
		add $s2, $zero, $zero #counter
		move $s3, $ra #return address
		
		li $v0, 4
		la $a0, message4
		syscall
		
		jal readItemsOneByOne
		
	readItemsOneByOne:
		li $v0, 5
		syscall
		sw $v0, 0($s0)
		addi $s0, $s0, 4
		addi $s2, $s2, 1
		bgt $s1, $s2, readItemsOneByOne
		add $ra, $zero, $s3
		jr $ra
	
	#print
	printItems:
		add $s0, $zero, $a0 #array 
		add $s1, $zero, $a1 #arraySize
		add $s2, $zero, $zero #counter
		move $s3, $ra #return address
		
		li $v0, 4
		la $a0, message5
		syscall
		
		jal printItemsOneByOne
		
	printItemsOneByOne:
		li $v0, 1
		lw $a0, 0($s0)
		syscall
		
		li $v0, 4
		la $a0, blank 
		syscall
		
		addi $s0, $s0, 4
		addi $s2, $s2, 1
		bgt $s1, $s2, printItemsOneByOne
		move $ra, $s3
		jr $ra
	
	#array size
	takeTheArraySize:
		li $v0, 4
		la $a0, message2
		syscall
	
		li $v0, 5
		syscall
		
		ble $v0, $zero, sizeIsZeroOrLess
		jr $ra
	
	sizeIsZeroOrLess:
		li $v0, 4
		la $a0, message3
		syscall
		
		li $v0, 5
		syscall
	
		ble $v0, $zero, sizeIsZeroOrLess
		jr $ra


.data
	arraySize: .word 0
	array: .word 0
	
	message1: .asciiz "Welcome to Lab work\n"
	message2: .asciiz "Please enter the size of array: "
	message3: .asciiz "Size cannot be less or equal to zero, please enter new array size: "
	message4: .asciiz "Please enter the elements:\n"
	message5: .asciiz "The array: "
	message6: .asciiz "The array is sorted\n"
	
	minMessage: .asciiz "The min element: "
	maxMessage: .asciiz "The max element: "
	
	blank: .asciiz " "
	newLine: .asciiz "\n"
