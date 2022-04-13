# Name: {Paul Chu}
# ULID: {C00124175}
# Course: CMPS 351-{001}
# Assignment: Assembly PA 1 - Prime number tester
# Certificate of Authenticity: { I certify that the code in the method function main of this project is entirely my own work.}
# 
#

# 
# State what registers you will use for what variables here
# Be consistent with your statements or you will most likley get confused later on
#
# $t0 = value
# $t1 = i = 2 
# $t2 = reminder
# $t3 = 1
# $t4 = -1

	.text
	.globl main
	
main:
# print welcome statements
	li $v0, 4
	la $a0, welcome
	syscall

# print prompt for user input
	li $v0, 4
	la $a0, usermsg
	syscall

# get value from the user
	li $v0, 5
	syscall
	move $t0, $v0		# put the user input value into $t0

# use loop to determine if the number is prime
	ori $t3, $0, 1 		# check for 1
	ori $t1, $0, 2 		# put i = 2
	sub $t4 $0, $t3		# t4 = 0 - 1

loop:

	beq $t4, $t0, closeMsg		# check if user input is -1 to quit
	beq $t3, $t0, numIsNotPrime	# check if user input is 1 to set it not prime

	beq $t1, $t0, numIsPrime	# check to see if i == value, that means number is prime
	ori $0, $0, 0 				# no-op

	div $t0, $t1 				# val / i, but care about the reminder only to do val % i
	mfhi $t2 					# grab the reminder and put it into t2

	beqz $t2, numIsNotPrime		# check if $t2 == 0
	ori $0, $0, 0				# no-op
	
	addi $t1, $t1, 1 			# i++
	j loop						# go back to the loop
	ori $0, $0, 0 				# no-op

# print proper resulting statement 
numIsPrime:
	li $v0, 4
	la $a0, prime				# output prime message
	syscall
	j close						# jump to close

numIsNotPrime:
	li $v0, 4
	la $a0, notPrime			# output notPrime message
	syscall

# print closing prompt
close:
	li $v0, 4
	la $a0, closeMsg			#output close message
	syscall


# cleanly exit the program
li $v0, 10
syscall


	.data
welcome: 	.ascii "Welcome to the Prime Determiner!\n"
			.asciiz "Enter some numbers and I will tell you if they are prime.\n"
			

usermsg: 	.asciiz "Please enter a positive integer:\n"

prime: 		.asciiz "That value is a prime!\n"

notPrime: 	.asciiz "That value is not a prime!\n"

closeMsg: 	.asciiz "Thanks for using my program!\n"



# How many hours did you spend on this assignment? - 2 hours, one to trying to figure out how to configure it and the other was debugging
# What was the most difficult part for you? Why? - Sticking to vars and forgetting I changed it, so my loop never worked, I'm dumb I know. I would also say what was hard was the setup without any guidance from Mr. Wise, I would be lost. I also forgot that with messages to the output, I need to jump over existing ones.
# What was the easiest? Why? - Setting up vars and outputting to the console, that was really easy and simple.