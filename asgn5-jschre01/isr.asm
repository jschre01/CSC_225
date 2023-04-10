; A very useful interrupt service routine.
; CSC 225, Assignment 5
; Jonathan Schreiber

        .ORIG x3500
	LDI R0, KBDR	; Loads contents of KBDR into R0
	ST R1, SaveR1
	AND R1, R1, #0	; Clear R1
	STI R1, KSR	; Clear KBSR
	LDI R1, R1PC	
	STR R1, R6, #0	; Reset Stack Pointer to Program 1's PC
	LD R1, SaveR1
	RTI

;
;Data
;
KSR	.FILL xFE00
KBDR	.FILL xFE02
SaveR1	.FILL x0000
R1PC	.FILL x32FF
	.END
