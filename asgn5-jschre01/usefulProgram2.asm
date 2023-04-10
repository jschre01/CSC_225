; Another very useful program.
; CSC 225, Assignment 5
; Jonathan Schreiber

        .ORIG x3400
CL	AND R0, R0, #0
GROW	ADD R0, R0, #1
	BRzp GROW
	LD R0, AST
	OUT
	BRnzp CL
	HALT
;
;Data
;
AST	.FILL x002A
        .END
