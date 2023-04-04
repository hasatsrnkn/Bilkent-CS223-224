#################
# CS224
# LAB 3
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 01.11.2022
################
.text
	li $v0, 4
	la $a0, message1
	syscall
	
	example: 
		add $s0, $s2, $s0
		add $s0, $s2, $s0
		add $s0, $s2, $s0
		add $s0, $s2, $s0
		add $s0, $s3, $s0
		add $s0, $s2, $s0
		add $s0, $s3, $s0
		add $s0, $s1, $s0
	
	main:
		li $v0, 4
		la $a0, message2
		syscall
		
		li $v0, 5
		syscall
		sw $v0, number #number is on the variable
		
		addi $s0, $zero, 1
		blt $v0, $s0, exit
		
		addi $s0, $zero, 31
		bgt $v0, $s0, exit
		la $a0, example #beginning of instructions
		la $a1, main #ending of instructions
		lw $a2, number #the number
		
		jal calculation
		sw $v0, result
		
		li $v0, 4
		la $a0, message3
		syscall
		
		li $v0, 1
		lw $a0, result
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		j main
		
	exit:	
		li $v0,10
		syscall
		
	
	
	#Subprograms
	calculation:
		addi $sp, $sp, -24
		sw $s0, 20($sp)
		sw $s1, 16($sp)
		sw $s2, 12($sp)
		sw $s3, 8($sp)
		sw $s4, 4($sp)
		sw $ra, 0($sp) 	# Save $ra just in case we may want to call a subprogram
		
		add $s0, $zero, $a0 #first address
		add $s1, $zero, $a1 #second adress
		add $s2, $zero, $a2 #number
		add $s3, $zero, $zero #result
				
	firstLoop:
		beq $s0, $s1, allDone
		lw $s4, 0($s0) #load the instruction
		
		srl $s4, $s4, 26 #Looking for opcode
		beqz $s4, rInstruction #if 0 all, then the ins. is r type
		j iInstruction #if not, it is i type
	
	rInstruction:
		lw $s4, 0($s0)  #load the instruction
		srl $s4, $s4, 21 
		jal lookForEquality
		
		lw $s4, 0($s0)  #load the instruction
		sll $s4, $s4, 11
		srl $s4, $s4, 27
		jal lookForEquality
		
		lw $s4, 0($s0)  #load the instruction
		sll $s4, $s4, 16
		srl $s4, $s4, 27
		jal lookForEquality
		
		addi $s0, $s0, 4
		j firstLoop
	
	iInstruction:
		lw $s4, 0($s0)  #load the instruction
		sll $s4, $s4, 6
		srl $s4, $s4, 27
		jal lookForEquality
		
		lw $s4, 0($s0)  #load the instruction
		sll $s4, $s4, 11
		srl $s4, $s4, 27
		jal lookForEquality
		
		addi $s0, $s0, 4
		j firstLoop
		
	lookForEquality:
		beq $s4, $s2, incrementTheResult
		jr $ra
		
	incrementTheResult:
		addi $s3, $s3, 1
		jr $ra
		
	allDone:
		
		add $v0, $zero, $s3
		lw $ra, 0($sp) 	# Save $ra just in case we may want to call a subprogram
		lw $s4, 4($sp)
		lw $s3, 8($sp)
		lw $s2, 12($sp)
		lw $s1, 16($sp)
		lw $s0, 20($sp)
		addi $sp, $sp, 24
		
		jr $ra
.data
	number: .word 0
	result: .word 0
	message1: .asciiz "Welcome to RegisterCount\n"
	message2: .asciiz "Please Enter a Number: "
	message3: .asciiz "The result is: " 
	newLine: .asciiz "\n"
	
	

