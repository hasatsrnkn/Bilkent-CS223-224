# Tiny program that shows how to access array elements
# It also illustrate mult and div instructions

	.text
	
# Copy array1 to array2

	la	$t0, array1
	la	$t1, array2
	lw	$t2, arraySize
	
copy:	lw	$t3, 0($t0)	# Load from array1 to $t3
	sw	$t3, 0($t1)	# Store from $t3 to array2
	addi	$t0, $t0, 4	# Increment the pointer to array1 by 4
	addi	$t1, $t1, 4	# Increment nthe poinet to array2 by 4
	addi	$t2, $t2, -1	# Decrement the number of items processed
	bne	$t2, $zero, copy
		
	li	$v0, 10
	syscall
	
	.data
array1:	.word	 	10, 20, 30, 40, 50
arraySize:	
	.word		5
array2:	.space 	20
