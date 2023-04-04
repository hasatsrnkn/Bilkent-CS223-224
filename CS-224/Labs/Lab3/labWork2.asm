#################
# CS224
# LAB 3
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 04.11.2022
################
.text
	li $v0, 4
	la $a0, message1
	syscall
	
	main:
		#Creation of first linked list
		jal takeLinkedListSize
		add $a0, $v0, $zero
		
		jal createLinkedList
		sw $v0, head
		
		lw $a0, head
		jal printLinkedList
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		lw $a1, head
		jal displayReverseOrderRecursive
		
		li $v0, 10
		syscall
		
	#Subprograms
		#DisplayReverseOrderRecursive
		displayReverseOrderRecursive:
			addi $sp, $sp, -8
			sw $s0, 4($sp)
			sw $ra, 0($sp)
			
		beqz $a1, displayReverseOrderRecursiveDone
		move $s0, $a1
		lw $a1, 0($a1)
		
		jal displayReverseOrderRecursive
		
		li $v0, 1
		lw $a0, 4($s0)
		syscall
		
		li $v0, 4
		la $a0, blank
		syscall
	
	displayReverseOrderRecursiveDone:
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		addi $sp, $sp, 8
		jr $ra
	
	# Take linked list size
	takeLinkedListSize:
		li $v0, 4
		la $a0, message2
		syscall
	
		li $v0, 5
		syscall
		
		bltz $v0, sizeIsLessThanZero
		jr $ra
	
	sizeIsLessThanZero:
		li $v0, 4
		la $a0, message3
		syscall
		
		li $v0, 5
		syscall
	
		bltz $v0, sizeIsLessThanZero
		jr $ra
		
	# Create a linked list
	createLinkedList:
		addi $sp, $sp, -24
		sw $s0, 20($sp)
		sw $s1, 16($sp)
		sw $s2, 12($sp)
		sw $s3, 8($sp)
		sw $s4, 4($sp)
		sw $ra, 0($sp) 	# Save $ra just in case we may want to call a subprogram

		move $s0, $a0	# $s0: no. of nodes to be created.
		beqz $s0, noElementsHead
		li $s1, 1		# $s1: Node counter
		
		# Create the first node: header.
		# Each node is 8 bytes: link field then data field.
		li $a0, 8
		li $v0, 9
		syscall

		# OK now we have the list head. Save list head pointer 
		move $s2, $v0	# $s2 points to the first and last node of the linked list.
		move $s3, $v0	# $s3 now points to the list head.
		
		li $v0, 4
		la $a0, message4
		syscall
		
		li $v0, 5
		syscall
		
		add $s4, $v0, $zero
		sw $s4, 4($s2) # Store the data value.
	
	addNode: 
		beq $s1, $s0, allDone
		addi $s1, $s1, 1	# Increment node counter.
		li $a0, 8 		# Remember: Node size is 8 bytes.
		li $v0, 9
		syscall
		
		# Connect the this node to the lst node pointed by $s2.
		sw $v0, 0($s2)
		move $s2, $v0	# $s2 now points to the new node.
		li $v0, 5
		syscall
		
		add $s4, $v0, $zero
		sw $s4, 4($s2) # Store the data value.
		j addNode
	
	allDone:
		# Make sure that the link field of the last node cotains 0.
		# The last node is pointed by $s2.
		sw $zero, 0($s2)
		move $v0, $s3	# Now $v0 points to the list head ($s3).
	
		# Restore the register values
		lw $ra, 0($sp)
		lw $s4, 4($sp)
		lw $s3, 8($sp)
		lw $s2, 12($sp)
		lw $s1, 16($sp)
		lw $s0, 20($sp)
		addi $sp, $sp, 24
	
		jr $ra
		
	noElementsHead:
		move $v0, $zero	# Now $v0 points to the list head ($s3).
	
		# Restore the register values
		lw $ra, 0($sp)
		lw $s4, 4($sp)
		lw $s3, 8($sp)
		lw $s2, 12($sp)
		lw $s1, 16($sp)
		lw $s0, 20($sp)
		addi $sp, $sp, 24
	
		jr $ra

	# Print Linked List
	printLinkedList:
		addi $sp, $sp, -16
		sw $s0, 12($sp)
		sw $s1, 8($sp)
		sw $s2, 4($sp)
		sw $ra, 0($sp) 	# Save $ra just in case we may want to call a subprogram
		
		add $s0, $a0, $zero # $s0: points to the current node.
		beq $s0, $zero, noSizeLinkedList
		
	printNextNode:
		beq $s0, $zero, printedAll
		lw $s2, 4($s0) #data
		
		add $a0, $zero, $s2	# $s2: Data of current node
		li $v0, 1		
		syscall	
		
		li $v0, 4
		la $a0, blank 
		syscall
		
		lw $s0, 0($s0)
		j printNextNode
		
	noSizeLinkedList:
		li $v0, 4
		la $a0, message9
		syscall 
		j printedAll
	
	printedAll:
		lw $ra, 0($sp)
		lw $s2, 4($sp)
		lw $s1, 8($sp)
		lw $s0, 12($sp)
		addi $sp, $sp, 16
		jr $ra
		
.data
	head: .word 0
	message1: .asciiz "Welcome to DisplayReverseOrderRecursive\n" 
	message2: .asciiz "Please enter the size of linked list: "
	message3: .asciiz "Size cannot be less than zero, please enter new linked list size: "
	message4: .asciiz "Please enter the elements:\n"
	
	message9: .asciiz "There are no elements. "
	
	newLine: .asciiz "\n"
	blank: .asciiz " "

