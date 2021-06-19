// function SimpleFunction.test 2
(SimpleFunction.test)
(SETUP_SimpleFunction.test)


@LCL
A = M + 1
M = 0


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
@LCL
D = A
@endframe
M = D

@5
D = A
@endframe
AM = M - D
D = M

@SP
AM = M - 1
D = M
@ARG
A = M
M = D
@ARG
D = A
@SP
M = D + 1

@1
D = A
@endFrame
A = M - D
D = M
@THAT
M = D 

@2
D = A
@endFrame
A = M - D
D = M
@THIS
M = D 

@3
D = A
@endFrame
A = M - D
D = M
@ARG
M = D 

@4
D = A
@endFrame
A = M - D
D = M
@LCL
M = D 

@RETURN_ADDRESS_SimpleFunction.test
0; JMP

