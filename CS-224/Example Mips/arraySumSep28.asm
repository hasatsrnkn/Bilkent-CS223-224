# Find sum of an array

	.text
# $t1:array pointer
# $t2: sum
# $t3: array elemet

	add	$t2, $zero, $zero 	# sum= 0
	la	$t1, array		# $t1: pointing to the beginning of the array
	
	lw	$t3, 0($t1)
	add	$t2, $t2, $t3
	
	lw	$t3, 4($t1)
	add	$t2, $t2, $t3
	
	lw	$t3, 8($t1)
	add	$t2, $t2, $t3
	
	lw	$t3, 12($t1)
	add	$t2, $t2, $t3
	
	li	$v0, 4
	la	$a0, mssg
	syscall
	
	li	$v0, 1
	add	$a0, $zero, $t2 	# $a0= $t2 (sum)
	syscall
	
# stop
	li	$v0, 10
	syscall
	
	.data
array:	.word	5, 10, 15, 20

mssg:	.asciiz	"sum: "