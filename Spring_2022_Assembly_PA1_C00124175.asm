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
	.text
	.globl main
	
main:
# print welcome statements
li $v0, 4
la $a0, welcome
syscall

# print prompt for user input


# get value from the user


# use loop to determine if the numer is prime


# print proper resulting statement 


# print closing prompt


# cleanly exit the program
li $v0, 10
syscall


	.data
welcome: 	.ascii "Welcome to the Prime Determiner!\n"
			.asciiz "Enter some numbers and I will tell you if they are prime.\n"


# How many hours did you spend on this assignment?
# What was the most difficult part for you? Why?
# What was the easiest? Why?