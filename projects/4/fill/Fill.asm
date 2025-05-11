// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Fill.asm
// Fills or clears the screen based on keyboard input

// Infinite loop
(LOOP)
    @KBD
    D=M
    @BLACK
    D;JNE       // If a key is pressed, go to BLACK
    @WHITE
    0;JMP       // Else, go to WHITE

// Fill screen with black (-1)
(BLACK)
    @SCREEN
    D=A
    @addr
    M=D         // addr = SCREEN base address

    @fillValue
    M=-1        // fillValue = -1 (black)
    @FILL
    0;JMP

// Fill screen with white (0)
(WHITE)
    @SCREEN
    D=A
    @addr
    M=D         // addr = SCREEN base address

    @fillValue
    M=0         // fillValue = 0 (white)
    @FILL
    0;JMP

// Fill routine
(FILL)
    @fillValue
    D=M         // D = value to write
    @addr
    A=M         // A = current screen address
    M=D         // Write D to screen

    @addr
    M=M+1       // addr++

    @KBD
    D=A
    @addr
    D=D-M       // D = KBD - addr

    @FILL
    D;JGT       // If addr < KBD, keep going
    @LOOP
    0;JMP       // Else, check keyboard again
