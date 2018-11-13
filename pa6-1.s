		@---------------------
		@	Programming Assignment 6, Problem 1
		@	Your required header information goes here
		@   Jeevan Panjwani & Jake Mathieu
        @   Due: Sometime next week
        @   Purpose: To call a function and compute an equation using the result of the function.
		@---------------------
		@ In those you will use the provided function pow to comput
		@ a^b - 3a
		@ You must set up the arguments to pow and call it using BL
		@ The result should be in R4 after the program completes
	.extern printf
	.global	main
	.func main
main:	PUSH {LR}
	@	Your code goes here
    LDR R0, =a      @ Set R0 to a
    LDR R0, [R0]    @ Load the value of a into R0
    LDR R1, =b      @ Set R1 to b
    LDR R1, [R1]    @ Load the value of b into R1
    MOV R5, #3      @ Move 3 into R5

    BL pow          @ Call pow function for a^b

    LDR R7, =a      @ Set R7 to a
    LDR R7, [R7]    @ Load value of a into R7

    MUL R3, R7, R5  @ Value of 3*a
    SUB R4, R0, R3  @ Computes: a^b-3-a and stores the answer in R4

	@ Code to print your answer.  DO NOT CHANGE!
	LDR	R0, =out
	MOV	R1, R4
	BL 	printf
	POP	{PC}

	@---------------------
	@  pow function.  DO NOT CHANGE!
	@---------------------
pow:	PUSH		{LR}
	PUSH		{R4-R6}
	MOV		R4, R1
	MOV		R5, #1
loop:	CMP		R4, #0
	BEQ		exit
	MUL		R5, R0, R5
	SUB		R4, R4, #1
	BAL		loop
exit:	MOV		R0, R5
	POP		{R4-R6}
	POP		{PC}

.data
a:	.word	3
b:	.word	4
out:	.asciz "Answer: %d\n"
