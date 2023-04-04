#################
# CS224
# LAB 1
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 04.10.2022
################
.text
	#First Message
	li $v0, 4
	la $a0, message1
	syscall	
	
	#Taking the arraySize
	li $v0, 5
	syscall
	sw $v0, arraySize

	#Reading and printing the array
	jal readItems
	jal printItems
	
	#Reversing the array
	la $a0, 0($t0)
	jal reverseArray
	
	#Message for array is reversed
	li $v0, 4
	la $a0, message4
	syscall
	
	#Printing the reversed array
	jal printItems
	
	#Exit the program
	li $v0, 10
	syscall
	
	#Subprograms
	readItems:
		la $t0, array
		lw $t1, arraySize
		move $t2, $zero
		move $t3, $ra
		li $v0, 4
		la $a0, message2
		syscall	
		jal readItemsOneByOne
		
	readItemsOneByOne:
		li $v0, 5
		syscall
		sw $v0, 0($t0)
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		bgt $t1, $t2, readItemsOneByOne
		move $ra, $t3
		jr $ra
		
	printItems:
		la $t0, array
		lw $t1, arraySize
		li $v0, 4
		la $a0, message3
		syscall	
		move $t2, $zero
		move $t3, $ra
		jal printItemsOneByOne
		
	printItemsOneByOne:
		li $v0, 1
		lw $a0, 0($t0)
		syscall
		
		li $v0, 4
		la $a0, blank 
		syscall
		
		addi $t0, $t0, 4
		addi $t2, $t2, 1
		bgt $t1, $t2, printItemsOneByOne
		move $ra, $t3
		jr $ra
	
	reverseArray:
		subi $t0, $a0, 4
		la $t1, array
		move $t4, $ra
		jal reverseArrayOneByOne
		
	reverseArrayOneByOne:
		lw $t2, 0($t1)
		lw $t3, 0($t0)
		sw $t2, 0($t0)
		sw $t3, 0($t1)
		addi $t1, $t1, 4
		addi $t0, $t0, -4
		bge $t0, $t1, reverseArrayOneByOne
		move $ra, $t4
		jr $ra
				
		
.data
	array: .space 80
	arraySize: .word 0
	message1: .asciiz "Enter the array size: "
	message2: .asciiz "Enter the numbers:\n" 
	message3: .asciiz "The array: "
	message4: .asciiz "\nThe array is now reversed\n"
	blank: .asciiz " "
	
