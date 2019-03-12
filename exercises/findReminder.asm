	.data
prompt: .asciiz "Enter a number : "
c:	.asciiz "c = "
d:	.asciiz "d = "
modNum:	.asciiz	"modNUm = "
newLine:.asciiz "\n"
reminder:.asciiz " Reminder (x) =  "
	
	.text
	
	jal ask
	li $v0, 5
	syscall
	move $s0, $v0	# c = s0
	
	jal ask
	li $v0, 5
	syscall
	move $s1, $v0	# d = s1

	jal ask
	li $v0, 5
	syscall
	move $s2, $v0	# mod = s2
	
	jal println
	
	# print c
	li $v0, 4
	la $a0, c
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	jal println
	
	# print d
	li $v0, 4
	la $a0, d
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	jal println
	
	# print modNum
	li $v0, 4
	la $a0, modNum
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	jal println
	
	#    execution part 	# 
	# s0 -> c		#
	# s1 -> d		#
	# s2 -> mod number 	#
	# s3 -> x		#
	
	sub $s3, $s0, $s1	# x = c-d
findReminder:
	
	sub $s3, $s3, $s2	# x = t0 - modNum
	slt $t1, $s3, $s2	# checks if t0 < modNum or not
	
	beq $t1, $zero, findReminder
	
	jal println
	
	li $v0, 4
	la $a0, reminder
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	jal println
	# terminate the program
	li $v0, 10
	syscall
	
	# procedures (methods)
ask:	
	li $v0, 4
	la $a0, prompt
	syscall
	
	jr $ra

println:
	li $v0, 4
	la $a0, newLine
	syscall
	
	jr $ra