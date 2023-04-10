	.ORIG x3000; Jonathan Schreiber
	LEA R0, P1	; Loads prompt message into R0
	PUTS
	GETC
	LD R1, VAL	; Loads -30 into R1
	ADD R2, R0, R1	; Converts input from ascii value to int value
	OUT
	LD R0, NL	; Loads New Line into R0
	OUT
	LEA R0, P2	; Loads second prompt message into R0
	PUTS
	LD R4, INVNL	; Loads -10 into R4
	LEA R3, STRING	; Adds address of allocated space to R3
LOOP1	GETC
	STR R0, R3, #0
	ADD R3, R3, #1	; Increments memory address to store characters
	OUT
	ADD R5, R0, R4	; Adds characters ASCII Value to -10
	BRnp LOOP1	; Loops back to get another character if previous wasn't new line
	LEA R3, STRING	; Adds address of first char to R3
EVOD	LDR R0, R3, #0
	ADD R6, R0, #0
	ADD R5, R6, R4	; Checks for New Line
	BRz DONE
	AND R5, R5, #0	; Clear R5
	ADD R5, R5, #-2	; Loads -2 into R5
LOOP2	ADD R0, R5, R0	; Subtract 2 from R0
	BRz EVEN	; Branches to EVEN if char is even
	BRn ODD		; Branches to ODD if char is odd
	BRp LOOP2	; Goes back to LOOP2 if positive, not done yet
EVEN	ADD R0, R6, #1	; Toggle bit 0
	ADD R0, R0, R2	; Add key
	BRnzp STORE
ODD	ADD R0, R6, #-1	; Toggle bit 0 
	ADD R0, R0, R2	; Add key
STORE	STR R0, R3, #0
	ADD R3, R3, #1	; Increments memory address to store characters
	BRnzp EVOD	; Branches back to EVOD unconditionally
DONE	LEA R0, P3	;
	PUTS
	LEA R0, STRING	; Adds address of allocated space to R0
	PUTS
	AND R1, R1, #0	; Clear R1
CLEAR	LDR R2, R0, #0	;
	STR R1, R0, #0	; Clears Memory Space
	ADD R0, R0, #1	; Increments Address
	ADD R2, R2, #0	; Checks for New Line
	BRnp CLEAR	;
	HALT		; Halts machine
;
;Data Storage area
;
VAL	.FILL xFFD0
STRING	.BLKW x0015
INVNL	.FILL xFFF6
NL	.FILL x000A
P1	.STRINGZ "Encryption Key(1-9): "
P2	.STRINGZ "Input Message: "
P3	.STRINGZ "Encrypted Message: "
	.END
