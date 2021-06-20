// function Main.fibonacci 0
(Main.fibonacci)

@0
D = A
@SP
M = D + M

// push argument 0
@0
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push constant 2
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1

// lt
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE_4
D;JLT
@0
D = A
@DONE_4
0;JMP

(TRUE_4)
A = -1
D = A
@DONE_4
0;JMP

(DONE_4)
@SP
A = M;
M = D;

@SP
M = M + 1

// if-goto IF_TRUE
@SP
AM = M - 1
D = M
@IF_TRUE
D;JNE

// goto IF_FALSE
@IF_FALSE
0;JMP

// label IF_TRUE
(IF_TRUE)

// push argument 0
@0
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// return
// R14 = LCL
@LCL
D = M
@R14
M = D

// retAddr = *(R14 - 5)
@5
D = A
@R14
A = M - D
D = M
@R13
M = D

// pop argument 0
@SP
AM = M - 1
D = M
@ARG
A = M
M = D

// SP = ARG + 1
@ARG
D = M
@SP
M = D + 1

// THAT = *(R14 - 1)
@1
D = A
@R14
A = M - D
D = M
@THAT
M = D 

// THIS = *(R14 - 2)
@2
D = A
@R14
A = M - D
D = M
@THIS
M = D 

// ARG = *(R14 - 3)
@3
D = A
@R14
A = M - D
D = M
@ARG
M = D 

// LCL = *(R14 - 4)
@4
D = A
@R14
A = M - D
D = M
@LCL
M = D 

// goto retAddr
@R13
A = M
0; JMP

// label IF_FALSE
(IF_FALSE)

// push argument 0
@0
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push constant 2
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1

// sub
@SP
AM = M - 1
D = M
A = A - 1
M = M - D

// call Main.fibonacci 1
// push returnAddress
@RETURN_ADDRESS_Main.fibonacci_1
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push LCL
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push ARG
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push THIS
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push THAT
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1

// ARG = SP - 5 - 1
@SP
D = M
@5
D = D - A
@1
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Main.fibonacci
@Main.fibonacci
0;JMP

(RETURN_ADDRESS_Main.fibonacci_1)

// push argument 0
@0
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push constant 1
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1

// sub
@SP
AM = M - 1
D = M
A = A - 1
M = M - D

// call Main.fibonacci 1
// push returnAddress
@RETURN_ADDRESS_Main.fibonacci_1
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push LCL
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push ARG
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push THIS
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push THAT
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1

// ARG = SP - 5 - 1
@SP
D = M
@5
D = D - A
@1
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Main.fibonacci
@Main.fibonacci
0;JMP

(RETURN_ADDRESS_Main.fibonacci_2)

// add
@SP
AM = M - 1
D = M
A = A - 1
M = D + M

// return
// R14 = LCL
@LCL
D = M
@R14
M = D

// retAddr = *(R14 - 5)
@5
D = A
@R14
A = M - D
D = M
@R13
M = D

// pop argument 0
@SP
AM = M - 1
D = M
@ARG
A = M
M = D

// SP = ARG + 1
@ARG
D = M
@SP
M = D + 1

// THAT = *(R14 - 1)
@1
D = A
@R14
A = M - D
D = M
@THAT
M = D 

// THIS = *(R14 - 2)
@2
D = A
@R14
A = M - D
D = M
@THIS
M = D 

// ARG = *(R14 - 3)
@3
D = A
@R14
A = M - D
D = M
@ARG
M = D 

// LCL = *(R14 - 4)
@4
D = A
@R14
A = M - D
D = M
@LCL
M = D 

// goto retAddr
@R13
A = M
0; JMP

// function Sys.init 0
(Sys.init)

@0
D = A
@SP
M = D + M

// push constant 4
@4
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Main.fibonacci 1
// push returnAddress
@RETURN_ADDRESS_Main.fibonacci_1
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push LCL
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push ARG
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push THIS
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push THAT
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1

// ARG = SP - 5 - 1
@SP
D = M
@5
D = D - A
@1
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Main.fibonacci
@Main.fibonacci
0;JMP

(RETURN_ADDRESS_Main.fibonacci_3)

// label WHILE
(WHILE)

// goto WHILE
@WHILE
0;JMP

