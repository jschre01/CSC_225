; A very useful trap.
; CSC 225, Assignment 5
; Jonathan Schreiber

        .ORIG x3300
	ST R7, #-2	;Stores contents of R7 in memory location x32FF
	ST R0, SaveR0	;Saves contents of R0
	LD R0, ENABLE
	STI R0, KBSR 	;Turns on interrupts
	LD R7, USER2	;Loads address of Useful Program 2
	LD R0, SaveR0	
	JMP R7

;
;Data
;

KBSR	.FILL xFE00
ENABLE	.FILL x4000
SaveR0	.FILL x0000
USER2	.FILL x3400
	.END
