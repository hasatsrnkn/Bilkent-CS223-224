#################
# CS224
# LAB 3
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 01.11.2022
################
.text
	#Welcome message
	li $v0, 4
	la $a0, message1
	syscall
	
	main: 
		#Creation of first linked list
		jal takeLinkedListSize
		add $a0, $v0, $zero
		
		jal createLinkedList
		sw $v0, head1
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message5
		syscall
		
		lw $a0, head1
		jal printLinkedList
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#Creation of second linked list
		jal takeLinkedListSize
		add $a0, $v0, $zero
		
		jal createLinkedList
		sw $v0, head2
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message6
		syscall
		
		lw $a0, head2
		jal printLinkedList
		
		lw $a0, head1
		lw $a1, head2
		jal mergedSortedLists
		sw $v0, head3
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, message10
		syscall
		
		lw $a0, head3
		jal printLinkedList
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		lw $a0, head1
		jal printLinkedList
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		lw $a0, head2
		jal printLinkedList
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#NewLine
		li $v0, 4
		la $a0, newLine
		syscall
		
		#menu message
		li $v0, 4
		la $a0, message11
		syscall
	
		li $v0, 5
		syscall
		
		beqz $v0, main
		
		li $v0, 10
		syscall
		
	#Subprograms
	#1 Take linked list size
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
	
	#2 Create a linked list
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
	
	#3 Print Linked List
	printLinkedList:
		addi $sp, $sp, -16
		sw $s0, 12($sp)
		sw $s1, 8($sp)
		sw $s2, 4($sp)
		sw $ra, 0($sp) 	# Save $ra just in case we may want to call a subprogram
		
		add $s0, $a0, $zero # $s0: points to the current node.
		add $s1, $zero, $zero #size
		beq $s0, $zero, noSizeLinkedList
		
		li $v0, 4
		la $a0, message7
		syscall
		
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
		addi $s1, $s1, 1
		j printNextNode
		
	noSizeLinkedList:
		li $v0, 4
		la $a0, message9
		syscall 
		j printedAll
	
	printedAll:
		li $v0, 4
		la $a0, message8
		syscall 
		
		li $v0, 1
		add $a0, $zero, $s1
		syscall
	
		lw $ra, 0($sp)
		lw $s2, 4($sp)
		lw $s1, 8($sp)
		lw $s0, 12($sp)
		addi $sp, $sp, 16
		jr $ra
		
	#4 Merge Sort Lists
	mergedSortedLists:
		addi $sp, $sp, -32
		sw $s0, 28($sp)
		sw $s1, 24($sp)
		sw $s2, 20($sp)
		sw $s3, 16($sp)
		sw $s4, 12($sp)
		sw $s5, 8($sp)
		sw $s6, 4($sp)
		sw $ra, 0($sp) 	# Save $ra just in case we may want to call a subprogram
		
		add $s0, $zero, $a0 #Header of the first list
		add $s1, $zero, $a1 #Header of the second list
		beqz $s0, firstListEmpty
		beqz $s1, secondListEmpty 
		
		lw $s4, 4($s0) #data of the first list
		lw $s5, 4($s1) #data of the second list
		beq $s4, $s5, firstElementEqual #data equal
		blt $s5, $s4, firstElementFirstDataBigger #first data bigger
		
		li $a0, 8
		li $v0, 9
		syscall
		
		add $s2, $v0, $zero #last pointer to the merged list
		add $s3, $v0, $zero #header
		sw $s4, 4($s2)
		
		lw $s0, 0($s0)
	merge:
		beqz $s0, firstListGetEmpty
		beqz $s1, secondListGetEmpty
		
		lw $s4, 4($s0) #data of the first list
		lw $s5, 4($s1) #data of the second list
		beq $s4, $s5, dataEqual #data equal
		blt $s5, $s4, firstDataBigger #first data bigger
		li $a0, 8
		li $v0, 9
		syscall
		
		sw $v0, 0($s2)
		move $s2, $v0	# $s2 now points to the new node.
		sw $s4, 4($s2)
		
		lw $s0, 0($s0)
		
		j merge
	
	firstListGetEmpty:
		beqz $s1, allDoneMergeSort
		li $a0, 8
		li $v0, 9
		syscall
		
		lw $s5, 4($s1) #data of the second list
		sw $v0, 0($s2)
		move $s2, $v0	# $s2 now points to the new node.
		sw $s5, 4($s2)
		
		lw $s1, 0($s1)
		
		j firstListGetEmpty
		
	secondListGetEmpty:
		beqz $s0, allDoneMergeSort
		li $a0, 8
		li $v0, 9
		syscall
		
		lw $s4, 4($s0) #data of the first list
		sw $v0, 0($s2)
		move $s2, $v0	# $s2 now points to the new node.
		sw $s4, 4($s2)
		
		lw $s0, 0($s0)
		
		j secondListGetEmpty
	
	allDoneMergeSort:
		sw $zero, 0($s2)
		move $v0, $s3
		
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)
		sw $s2, 12($sp)
		sw $s3, 16($sp)
		sw $s4, 20($sp)
		sw $s5, 24($sp)
		sw $s6, 28($sp)
		
		addi $sp, $sp, 32
		
		jr $ra
		
	dataEqual:
		li $a0, 8
		li $v0, 9
		syscall
		
		sw $v0, 0($s2)
		move $s2, $v0	# $s2 now points to the new node.
		sw $s4, 4($s2)
		
		lw $s0, 0($s0)
		lw $s1, 0($s1)
		
		j merge
		
	firstDataBigger:
		li $a0, 8
		li $v0, 9
		syscall
		
		sw $v0, 0($s2)
		move $s2, $v0	# $s2 now points to the new node.
		sw $s5, 4($s2)
		
		lw $s1, 0($s1)
		
		j merge
		
	firstElementEqual:
		li $a0, 8
		li $v0, 9
		syscall
		
		add $s2, $v0, $zero #last pointer to the merged list
		add $s3, $v0, $zero #header
		sw $s4, 4($s2)
		
		lw $s0, 0($s0)
		lw $s1, 0($s1)
		
		j merge
	
	firstElementFirstDataBigger:
		li $a0, 8
		li $v0, 9
		syscall
		
		add $s2, $v0, $zero #last pointer to the merged list
		add $s3, $v0, $zero #header
		sw $s5, 4($s2)
		
		lw $s1, 0($s1)
		
		j merge
	
	firstListEmpty:
		beqz $s1, emptyList
		add $v0, $s1, $zero
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)
		sw $s2, 12($sp)
		sw $s3, 16($sp)
		sw $s4, 20($sp)
		sw $s5, 24($sp)
		sw $s6, 28($sp)
		
		addi $sp, $sp, 32
		
		jr $ra
		
	secondListEmpty:
		add $v0, $s0, $zero
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)
		sw $s2, 12($sp)
		sw $s3, 16($sp)
		sw $s4, 20($sp)
		sw $s5, 24($sp)
		sw $s6, 28($sp)
		
		addi $sp, $sp, 32
		
		jr $ra
		
	emptyList:
		add $v0, $zero, $zero
		
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)
		sw $s2, 12($sp)
		sw $s3, 16($sp)
		sw $s4, 20($sp)
		sw $s5, 24($sp)
		sw $s6, 28($sp)
		
		addi $sp, $sp, 32
		
		jr $ra
		

.data
	head1: .word 0
	head2: .word 0
	head3: .word 0
	message1: .asciiz "Welcome to MergeSortedLists\n"
	message2: .asciiz "Please enter the size of linked list: "
	message3: .asciiz "Size cannot be less than zero, please enter new linked list size: "
	message4: .asciiz "Please enter the elements:\n"
	message5: .asciiz "First linked list is created\n"
	message6: .asciiz "Second linked list is created\n"
	message7: .asciiz "Items: "
	message8: .asciiz "Size: "
	message9: .asciiz "There are no elements. "
	message10: .asciiz "The lists are merged now\n"
	message11: .asciiz "Do you want to start again (0 for yes, else for no): "
	newLine: .asciiz "\n"
	blank: .asciiz " "

