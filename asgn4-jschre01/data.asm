        .ORIG x3500

        ; Question 1
Q1STR   .FILL x3512  ; Address of prompt
Q1PTS   .FILL #0 ; Point value for option 1
        .FILL #5  ; Point value for option 2
        .FILL #5  ; Point value for option 3
        .FILL #10  ; Point value for option 4

        ; Question 2
Q2STR   .FILL x356A
Q2PTS   .FILL #6
        .FILL #10
        .FILL #3
        .FILL #0

        ; Question 3
Q3STR   .FILL x35DF
Q3PTS   .FILL #0
        .FILL #7
        .FILL #10
        .FILL #0

        ; Results
RESULTS .FILL x365D
        .FILL x366F
        .FILL x36AF

        ; Strings must be declared separately because their lengths are variable.
Q1      .STRINGZ "\nWhat is the best state?\n    1) California\n    2) Hawaii\n    3) Alaska\n    4) Colorado\n"
Q2      .STRINGZ "\nWho is the best Quarterback of all time?\n    1) Tim Tebow\n    2) Peyton Manning\n    3) Tom Brady\n    4) Jared Goff\n"
Q3      .STRINGZ "\nWho is the most talented musician(s)?\n    1) The Black Eyed Peas\n    2) Flume\n    3) The Elaborate Owl\n    4) Justin Bieber\n"

GOODMSG .STRINGZ "Let's be friends!"
PASSMSG .STRINGZ "Adequate, but your opinions could still be shaped to be better."
FAILMSG .STRINGZ "Yikes! Looks like you need to take some time and seriously reflect on your life decisions."

        .END
