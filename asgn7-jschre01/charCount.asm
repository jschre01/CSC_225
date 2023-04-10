; CSC 225, Assignment 7
; Implements the "charCount" function of charCount.c.
; Jonathan Schreiber
;

	.ORIG x3300
EESET	ADD R6, R6, #-1	;Push space for return value
	ADD R6, R6, #-1	;Push space for return address
	STR R7, R6, #0	;Store return address
	ADD R6, R6, #-1	;Push space for Dynamic Link
	STR R5, R6, #0	;Store dynamic link
	ADD R5, R6, #-1	;Set new dynamic link
	ADD R6, R6, #-1	;Push space for local variable

CON1	LDR R1, R5, #4	;Load address of str
	LDR R0, R1, #0	;Load character at address
	BRz EETEAR	;If 0, done with recursion

CON2	LDR R1, R5, #5	;Load key into R1
	NOT R1, R1	;Change sign of key
	ADD R1, R1, #1	;
	ADD R0, R1, R0	;Compare char with key
	BRnp NMATCH	

MATCH	ADD R0, R0, #1	;Set R0 to #1
	STR R0, R5, #0	;Set result to #1
	BRnzp ERSET	;Jump to ERSET

NMATCH	AND R0, R0, #0	;Set R0 to #0
	STR R0, R5, #0	;Set result to #0

ERSET	LDR R0, R5, #5	;Load key into R0
	ADD R6, R6, #-1	;Push key argument
	STR R0, R6, #0	;
	LDR R0, R5, #4	;Load str into R0
	ADD R0, R0, #1	;Increment string
	ADD R6, R6, #-1	;Push str argument
	STR R0, R6, #0	
	JSR EESET	

ERTEAR	LDR R0, R6, #0	;Load return value into R0
	LDR R1, R5, #0	;Load result of function into R1
	ADD R0, R1, R0	;Add return value and result
	STR R0, R5, #0	;Store result in result's spot
	ADD R6, R6, #1	;Pop return value
	ADD R6, R6, #1	;Pop arguments
	ADD R6, R6, #1

EETEAR	LDR R0, R5, #0	;Set result to 0
	STR R0, R5, #3	;Store return value
	ADD R6, R6, #1	;Pop local variables
	LDR R5, R6, #0	;Load dynamic link into R5
	ADD R6, R6, #1	;Pop dynamic link
	LDR R7, R6, #0	;Load return address into R7
	ADD R6, R6, #1	;Pop return address
	RET

	
	.END