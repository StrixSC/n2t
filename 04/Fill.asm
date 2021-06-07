// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(INFINITE)
@SCREEN
D=A
@index
M=D

@KBD
D=M
@FILLWHITE
D;JEQ

(FILLBLACK)
@KBD
D=M
@END
D;JEQ
@KBD
D=A
@index
D=D-M
@END
D;JLT
@index
A=M
M=-1
@index
M=M+1
@FILLBLACK
0;JMP

(FILLWHITE)
@KBD
D=M
@END
D;JGT
@KBD
D=A
@index
D=D-M
@END
D;JLT
@index
A=M
M=0
@index
M=M+1
@FILLWHITE
0;JMP

(END)
@INFINITE
0;JMP