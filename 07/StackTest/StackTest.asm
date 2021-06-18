// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1

// eq
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D

@TRUE_3
D;JEQ
@0
D = A
@DONE_3
0;JMP

(TRUE_3)
A = -1
D = A
@DONE_3
0;JMP

(DONE_3)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 16
@16
D = A
@SP
A = M
M = D
@SP
M = M + 1

// eq
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D

@TRUE_6
D;JEQ
@0
D = A
@DONE_6
0;JMP

(TRUE_6)
A = -1
D = A
@DONE_6
0;JMP

(DONE_6)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 16
@16
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 17
@17
D = A
@SP
A = M
M = D
@SP
M = M + 1

// eq
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D

@TRUE_9
D;JEQ
@0
D = A
@DONE_9
0;JMP

(TRUE_9)
A = -1
D = A
@DONE_9
0;JMP

(DONE_9)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 892
@892
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 891
@891
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
@TRUE_12
D;JLT
@0
D = A
@DONE_12
0;JMP

(TRUE_12)
A = -1
D = A
@DONE_12
0;JMP

(DONE_12)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 891
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 892
@892
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
@TRUE_15
D;JLT
@0
D = A
@DONE_15
0;JMP

(TRUE_15)
A = -1
D = A
@DONE_15
0;JMP

(DONE_15)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 891
@891
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 891
@891
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
@TRUE_18
D;JLT
@0
D = A
@DONE_18
0;JMP

(TRUE_18)
A = -1
D = A
@DONE_18
0;JMP

(DONE_18)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 32767
@32767
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1

// gt
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE_21
D;JGT
@0
D = A
@DONE_21
0;JMP

(TRUE_21)
A = -1
D = A
@DONE_21
0;JMP

(DONE_21)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 32767
@32767
D = A
@SP
A = M
M = D
@SP
M = M + 1

// gt
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE_24
D;JGT
@0
D = A
@DONE_24
0;JMP

(TRUE_24)
A = -1
D = A
@DONE_24
0;JMP

(DONE_24)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 32766
@32766
D = A
@SP
A = M
M = D
@SP
M = M + 1

// gt
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE_27
D;JGT
@0
D = A
@DONE_27
0;JMP

(TRUE_27)
A = -1
D = A
@DONE_27
0;JMP

(DONE_27)
@SP
A = M;
M = D;

@SP
M = M + 1

// push constant 57
@57
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 31
@31
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 53
@53
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

// push constant 112
@112
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

// neg
@SP
A = M - 1
D = M
M = -D

// and
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M&D
@SP
M = M + 1

// push constant 82
@82
D = A
@SP
A = M
M = D
@SP
M = M + 1

// or
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M|D
@SP
M = M + 1

// not
@SP
AM = M - 1
M = !M
@SP
M = M + 1

