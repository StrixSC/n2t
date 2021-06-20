// function SimpleFunction.test 2
(SimpleFunction.test)

@2
D = A
@SP
M = D + M

// push local 0
@0
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push local 1
@1
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// add
@SP
AM = M - 1
D = M
A = A - 1
M = D + M

// not
@SP
AM = M - 1
M = !M
@SP
M = M + 1

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

// add
@SP
AM = M - 1
D = M
A = A - 1
M = D + M

// push argument 1
@1
D = A
@ARG
A = M + D
D = M
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

// return
// R14 = LCL
@LCL
D = M
@R14
M = D

// R13 = *(R14 - 5)
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

// goto R13
@R13
A = M
0; JMP

