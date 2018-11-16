		@---------------------\
		@Jacob Mathieu & Jeevan Panjwani
		@PA6-2.s
		@
		@
		@	Programming Assignment 6, Problem 2
		@	Your required header information goes here
		@--------------------
		@	You are to write a function that performs integer division
		@	Your function must be called div.  It takes two values, a and b passed as parameters,
		@	and should return a/b.  Code is given for you that tests
		@	your program.  Upon successful completion the following values should print
		@	0
		@	1
		@	11
		@	4
		@	5
	.extern printf
        .global main
        .func main
main:		@	DO NOT TOUCH!
		PUSH	{LR}
		MOV	R0, #5
		MOV	R1, #9
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #9
		MOV	R1, #5
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #80
		MOV	R1, #7
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #19
		MOV	R1, #4
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #60
		MOV	R1, #12
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		POP	{PC}

		@---------------------
		@	div function.  Your code goes here!
		@---------------------
div:		PUSH	{LR}	@ Leave this here
            PUSH {R2-R14}  @push R2-R14 into a stack
            MOV R2, R1     @ Moves Dividen into R2
            MOV R1, R0     @ moves divisor into R1

            MOV R3, R2
            CMP R3, R1, LSR #1 @ LSR halves the number in R1 and puts that value into R3

Div1:
            MOVLS R3, R3, LSL #1 @Doubles the value in R3 putting the value into R3 if lower than or equal to R3
            CMP R3, R1, LSR #1 @ Compares the halved value of R1 with R3
            BLS Div1  @ branches div1 function if less than
            MOV R4, #0 @moves 0 into R4

Div2:       CMP R1, R3  @Compares R3value to R1 value
            SUBCS R1, R1, R3 @If result is bigger than 32 bits subtract R1 from R3 putting the value into R1
            ADC R4, R4, R4

            MOV R3, R3, LSR #1  @half the value in R3 and put into register R3
            CMP R3, R2 @compares the value in R2 with R3
            BHS Div2 @Exits the loop of div 2 ifHs is active

            MOV R0, R4 @movs value from R4 into R0
            POP {R2-R14}
            POP {PC}


		@ Your code here

		POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf
