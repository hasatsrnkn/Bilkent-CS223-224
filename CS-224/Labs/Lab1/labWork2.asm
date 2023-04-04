#################
# CS224
# LAB 1
# SECTION 04
# MEHMET HASAT SERINKAN
# 21901649
# 07.10.2022
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
	
	#Printing for E
	li $v0, 4
	la $a0, message4
	syscall
	
	#Inputting E
	li $v0, 5
	syscall
	sw $v0, eVariable
	
	lw $t0, bVariable
	lw $t1, cVariable
	div $t0, $t1
	mflo $t2 # b/c
	
	lw $t3, dVariable
	add $t3, $t3, $t3 #2d
	add $t2, $t2, $t3 #b/c + 2d
	
	lw $t0, eVariable
	div $t2, $t0
	mfhi $t3 # result
	
	#Newline
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Printing result
	li $v0, 4
	la $a0, message5
	syscall
	
	li $v0, 1
	add $a0, $zero, $t3
	syscall


	#End
	li $v0, 10
	syscall

.data

	bVariable: .word 0
	cVariable: .word 0
	dVariable: .word 0 
	eVariable: .word 0
	message1: .asciiz "Please enter B: "
	message2: .asciiz "Please enter C: "
	message3: .asciiz "Please enter D: "
	message4: .asciiz "Please enter E: "
	message5: .asciiz "Result is "
	newLine: .asciiz "\n"
	
