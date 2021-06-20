
// Bootstrap
@256
D=A
@SP
M=D
D=-1
@THIS
M=D
@THAT
M=D
@LCL
M=D
@ARG
M=D

// call Sys.init 0
// push returnAddress
@RETURN_ADDRESS_Sys.init_0
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

// ARG = SP - 5 - 0
@SP
D = M
@5
D = D - A
@0
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Sys.init
@Sys.init
0;JMP

(RETURN_ADDRESS_Sys.init_0)
// function Class1.set 0
(Class1.set)

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

// pop static 0
@SP
AM = M - 1
D = M
@Class1.0
M = D

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

// pop static 1
@SP
AM = M - 1
D = M
@Class1.1
M = D

// push constant 0
@0
D = A
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

// function Class1.get 0
(Class1.get)

@0
D = A
@SP
M = D + M

// push static 0
@Class1.0
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push static 1
@Class1.1
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

// function Class2.set 0
(Class2.set)

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

// pop static 0
@SP
AM = M - 1
D = M
@Class2.0
M = D

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

// pop static 1
@SP
AM = M - 1
D = M
@Class2.1
M = D

// push constant 0
@0
D = A
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

// function Class2.get 0
(Class2.get)

@0
D = A
@SP
M = D + M

// push static 0
@Class2.0
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push static 1
@Class2.1
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

// function Sys.init 0
(Sys.init)

@0
D = A
@SP
M = D + M

// push constant 6
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 8
@8
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Class1.set 2
// push returnAddress
@RETURN_ADDRESS_Class1.set_2
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

// ARG = SP - 5 - 2
@SP
D = M
@5
D = D - A
@2
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Class1.set
@Class1.set
0;JMP

(RETURN_ADDRESS_Class1.set_1)

// pop temp 0
@SP
AM = M - 1
D = M
@5
M = D

// push constant 23
@23
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 15
@15
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Class2.set 2
// push returnAddress
@RETURN_ADDRESS_Class2.set_2
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

// ARG = SP - 5 - 2
@SP
D = M
@5
D = D - A
@2
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Class2.set
@Class2.set
0;JMP

(RETURN_ADDRESS_Class2.set_2)

// pop temp 0
@SP
AM = M - 1
D = M
@5
M = D

// call Class1.get 0
// push returnAddress
@RETURN_ADDRESS_Class1.get_0
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

// ARG = SP - 5 - 0
@SP
D = M
@5
D = D - A
@0
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Class1.get
@Class1.get
0;JMP

(RETURN_ADDRESS_Class1.get_3)

// call Class2.get 0
// push returnAddress
@RETURN_ADDRESS_Class2.get_0
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

// ARG = SP - 5 - 0
@SP
D = M
@5
D = D - A
@0
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto Class2.get
@Class2.get
0;JMP

(RETURN_ADDRESS_Class2.get_4)

// label WHILE
(WHILE)

// goto WHILE
@WHILE
0;JMP

