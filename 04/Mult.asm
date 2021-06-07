// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Populate variable "first" with RAM[0] Value
@R0
D=M
@first
M=D

// Populate variable "second" with RAM[1] Value
@R1
D=M
@second
M=D

// Populate a sum variable that contains the computed total
@sum
M=0

// Populate a index variable to use for the looping:
@index
M=0

// Check if first and second are both greater or equal to 0
@first
D=M
@ASSIGNMENT
D;JLE

@second
D=M
@ASSIGNMENT
D;JLE

(LOOP)
@index // Check if index < RAM[1]
D=M
@second
D=M-D
@ASSIGNMENT
D;JLE

@sum // Assign the sum to the D register
D=M

@first // Add the value of RAM[0] into the D Register
D=D+M
@sum
M=D

@index // Increment the index variable
M=M+1

@LOOP // Repeat the loop
0;JMP

(ASSIGNMENT)
@sum
D=M
@R2
M=D
@END
0;JMP

(END)
@END
0;JMP
