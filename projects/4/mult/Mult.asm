// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Mult.asm
// Multiplies R0 and R1 using repetitive addition and stores result in R2

// Initialize result to 0
@0
D=M         // D = R0
@counter
M=D         // counter = R0

@2
M=0         // R2 = 0 (clear result)

// If counter == 0, skip loop
@counter
D=M
@END
D;JEQ

// Load R1 into temp
@1
D=M
@temp
M=D         // temp = R1

(LOOP)
    // Add temp (R1) to R2
    @temp
    D=M
    @2
    M=M+D     // R2 += temp

    // counter--
    @counter
    M=M-1

    // If counter > 0, repeat
    @counter
    D=M
    @LOOP
    D;JGT

(END)
    // Infinite loop to end program
    @END
    0;JMP