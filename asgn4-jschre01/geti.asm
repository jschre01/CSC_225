;Jonathan Schreiber (jschre01@calpoly.edu)
	
	.ORIG x3300
	ST R1, SaveR1	; Saves contents of R1
LOOPA	LDI R0, KBSR	; Loads contents of KBSR into R0
	BRzp LOOPA	; Performs Polling, waiting until character waiting to be read
	LDI R0, KBDR	; Reads character from the keyboard, stores in R0
LOOPB	LDI R1, DSR	; Loads contents of DSR into R1
	BRzp LOOPB	; Performs Polling, waiting until Terminal ready to display
	STI R0, DDR	; Outputs character to the display
	LD R1, CON	; Loads Conversion offset into R1
	ADD R0, R0, R1	; Converts typed character from ascii to decimal
	LD R1, SaveR1	; Loads original contents of R1 back into itself
	RET

;Data

KBSR	.FILL xFE00
KBDR	.FILL xFE02
DSR	.FILL xFE04
DDR	.FILL xFE06
CON	.FILL xFFD0
SaveR1	.FILL x0000
	.END
