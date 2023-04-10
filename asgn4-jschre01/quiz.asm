; CSC 225, Assignment 4
; <Jonathan Schreiber>

        .ORIG x3000
	LD R0, GETI
	STI R0, TR	; Sets up TRAP x26 to take you to GETI
        LDI R0, Q1STR
        PUTS
	LEA R0, ANSWER
	PUTS
	TRAP x26
        LD R1, Q1STR
	ADD R0, R0, R1	; Computes Memory address of answer
	LDR R0, R0, #0
	AND R2, R2, #0
	ADD R2, R2, R0
	LDI R0, Q2STR
        PUTS
	LEA R0, ANSWER
	PUTS
	TRAP x26
        LD R1, Q2STR
	ADD R0, R0, R1	; Computes Memory address of answer
	LDR R0, R0, #0
	ADD R2, R2, R0
	LDI R0, Q3STR
        PUTS
	LEA R0, ANSWER
	PUTS
	TRAP x26
        LD R1, Q3STR
	ADD R0, R0, R1	; Computes Memory address of answer
	LDR R0, R0, #0
	ADD R2, R2, R0
	LEA R0, END
	PUTS
	LD R0, RESULTS
	LD R1, CHEK1
	ADD R2, R2, R1
	BRnz FAIL 
	ADD R2, R2, #-6
	BRnz PASS
	LDR R0, R0, #0
	PUTS
	BRnzp DONE
PASS	LDR R0, R0, #1
	PUTS
	BRnzp DONE
FAIL	LDR R0, R0, #2
	PUTS
DONE	HALT
       

Q1STR   .FILL x3500
Q1PTS   .FILL x3501
Q2STR   .FILL x3505
Q2PTS   .FILL x3506
Q3STR   .FILL x350A
Q3PTS   .FILL x350B
RESULTS .FILL x350F
TR	.FILL x0026
GETI	.FILL x3300
CHEK1	.FILL xFFEC
ANSWER	.STRINGZ "Answer: "
END	.STRINGZ "\nResult: "
        .END
