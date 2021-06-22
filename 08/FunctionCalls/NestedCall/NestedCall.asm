
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
@RETURN_ADDRESS_Sys.init_0_0
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

(RETURN_ADDRESS_Sys.init_0_0)
// function Sys.init 0
(Sys.init)

@0
D = A
@SP
M = D + M

// push constant 4000
@4000
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 0
@SP
AM = M - 1
D = M
@THIS
M = D

// push constant 5000
@5000
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 1
@SP
AM = M - 1
D = M
@THAT
M = D

// call Sys.main 0
// push returnAddress
@RETURN_ADDRESS_Sys.main_0_6
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

// goto Sys.main
@Sys.main
0;JMP

(RETURN_ADDRESS_Sys.main_0_6)

// pop temp 1
@SP
AM = M - 1
D = M
@6
M = D

// label LOOP
(LOOP)

// goto LOOP
@LOOP
0;JMP

// function Sys.main 5
(Sys.main)

@5
D = A
@SP
M = D + M

// push constant 4001
@4001
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 0
@SP
AM = M - 1
D = M
@THIS
M = D

// push constant 5001
@5001
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 1
@SP
AM = M - 1
D = M
@THAT
M = D

// push constant 200
@200
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop local 1
@1
D = A
@LCL
M = M + D
@SP
AM = M - 1
D = M
@LCL
A = M
M = D
@1
D = A
@LCL
M = M - D

// push constant 40
@40
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop local 2
@2
D = A
@LCL
M = M + D
@SP
AM = M - 1
D = M
@LCL
A = M
M = D
@2
D = A
@LCL
M = M - D

// push constant 6
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop local 3
@3
D = A
@LCL
M = M + D
@SP
AM = M - 1
D = M
@LCL
A = M
M = D
@3
D = A
@LCL
M = M - D

// push constant 123
@123
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Sys.add12 1
// push returnAddress
@RETURN_ADDRESS_Sys.add12_1_22
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

// goto Sys.add12
@Sys.add12
0;JMP

(RETURN_ADDRESS_Sys.add12_1_22)

// pop temp 0
@SP
AM = M - 1
D = M
@5
M = D

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

// push local 2
@2
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push local 3
@3
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push local 4
@4
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

// add
@SP
AM = M - 1
D = M
A = A - 1
M = D + M

// add
@SP
AM = M - 1
D = M
A = A - 1
M = D + M

// add
@SP
AM = M - 1
D = M
A = A - 1
M = D + M

// return
// endFrame = LCL
@LCL
D = M
@endFrame
M = D

// returnAddr = *(endFrame - 5)
@5
D = A
@endFrame
A = M - D
D = M
@returnAddr
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

// THAT = *(endFrame - 1)
@1
D = A
@endFrame
A = M - D
D = M
@THAT
M = D 

// THIS = *(endFrame - 2)
@2
D = A
@endFrame
A = M - D
D = M
@THIS
M = D 

// ARG = *(endFrame - 3)
@3
D = A
@endFrame
A = M - D
D = M
@ARG
M = D 

// LCL = *(endFrame - 4)
@4
D = A
@endFrame
A = M - D
D = M
@LCL
M = D 

// goto returnAddr
@returnAddr
A = M
0; JMP

// function Sys.add12 0
(Sys.add12)

@0
D = A
@SP
M = D + M

// push constant 4002
@4002
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 0
@SP
AM = M - 1
D = M
@THIS
M = D

// push constant 5002
@5002
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 1
@SP
AM = M - 1
D = M
@THAT
M = D

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

// push constant 12
@12
D = A
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

// return
// endFrame = LCL
@LCL
D = M
@endFrame
M = D

// returnAddr = *(endFrame - 5)
@5
D = A
@endFrame
A = M - D
D = M
@returnAddr
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

// THAT = *(endFrame - 1)
@1
D = A
@endFrame
A = M - D
D = M
@THAT
M = D 

// THIS = *(endFrame - 2)
@2
D = A
@endFrame
A = M - D
D = M
@THIS
M = D 

// ARG = *(endFrame - 3)
@3
D = A
@endFrame
A = M - D
D = M
@ARG
M = D 

// LCL = *(endFrame - 4)
@4
D = A
@endFrame
A = M - D
D = M
@LCL
M = D 

// goto returnAddr
@returnAddr
A = M
0; JMP

