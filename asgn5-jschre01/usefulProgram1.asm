; A very useful program.
; CSC 225, Assignment 5
; Jonathan Schreiber

        .ORIG x3000
MAIN    LEA R0, INITMSG ; Print the starting message.
        PUTS
	LD R0, GETI
	STI R0, TRAPV
	LD R0, INTR
	STI R0, INTV
	LEA R6, MAIN
        TRAP x26        ; Get a character.
        OUT             ; Print the character.
        TRAP x26        ; Repeat four more times.
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        LEA R0, ENDMSG  ; Print the ending message.
        PUTS
        BRnzp MAIN
	HALT

INITMSG .STRINGZ "Enter five characters: "
ENDMSG  .STRINGZ "\nSuccess! Running again...\n\n"
TRAPV	.FILL x0026
GETI	.FILL x3300
INTV	.FILL x0180
INTR	.FILL x3500
        .END
