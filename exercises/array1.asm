	.data
array:	.space 80
prompt: .asciiz "Enter the element size : "
getElem:.asciiz "Enter number for an array : "
newLine:.asciiz "\n"
	
	######################################
	#                                    #
	#             array1.asm             #
	#				     #
	######################################
	
	# 
	#  The program ask from user to input element size 
	#  and gets element and display them
	#

	.text
	
	jal println
	
	# asking to get a new element size
	la $a0, prompt		
	li $v0, 4
	syscall
	
	# user input element size
	li $v0, 5
	syscall
	
	# get the element size
	move $s0, $v0
	 
	# initializing variable
	add $t0, $zero, 0  # array 
	add $t1, $zero, 0  # i = 0 
	
loop:	# asking to get a number
	la $a0, getElem	
	li $v0, 4
	syscall
	
	# get a number
	li $v0, 5
	syscall
	
	# store the number in the given index array the array
	sw $v0, array($t0)
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	
	bne $s0, $t1, loop
	
	jal println
	
	#-----------------------#
	# initializing variable #
	add $t0, $zero, 0  # array 
	add $t1, $zero, 0  # i = 0
display:  
	# print the number
	li $v0, 1
	# get the number in the given index from the array
	lw $a0, array($t0)
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	
	bne $s0, $t1, display
	
	jal println
	jal println
	
	#-----------------------#
	# initializing variable #
	addi $t3, $zero, 4
	mul $t0, $s0, $t3  #array 
	add $t1, $zero, 0  # i = 0
	
displayReverse:  

	addi $t0, $t0, -4
	addi $t1, $t1, 1
	
	# print the number
	li $v0, 1
	# get the number in the given index from the array
	lw $a0, array($t0)
	syscall
	
	bne $s0, $t1, displayReverse
	
	jal println
	
	# terminate the program
	li $v0, 10
	syscall
	
	#procedures (methods)
println:
	# new line
	la $a0, newLine
	li $v0, 4
	syscall
	
	jr $ra
