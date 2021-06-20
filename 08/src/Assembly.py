add_command: str = """
@SP
AM = M - 1
D = M
A = A - 1
M = D + M
"""

gt_command: str = """
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE_{0}
D;JGT
@0
D = A
@DONE_{0}
0;JMP

(TRUE_{0})
A = -1
D = A
@DONE_{0}
0;JMP

(DONE_{0})
@SP
A = M;
M = D;

@SP
M = M + 1
"""

eq_command: str = """
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D

@TRUE_{0}
D;JEQ
@0
D = A
@DONE_{0}
0;JMP

(TRUE_{0})
A = -1
D = A
@DONE_{0}
0;JMP

(DONE_{0})
@SP
A = M;
M = D;

@SP
M = M + 1
"""

and_command: str = """
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M&D
@SP
M = M + 1
"""

gt_command: str = """
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE_{0}
D;JGT
@0
D = A
@DONE_{0}
0;JMP

(TRUE_{0})
A = -1
D = A
@DONE_{0}
0;JMP

(DONE_{0})
@SP
A = M;
M = D;

@SP
M = M + 1
"""

lt_command: str = """
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE_{0}
D;JLT
@0
D = A
@DONE_{0}
0;JMP

(TRUE_{0})
A = -1
D = A
@DONE_{0}
0;JMP

(DONE_{0})
@SP
A = M;
M = D;

@SP
M = M + 1
"""

neg_command: str = """
@SP
A = M - 1
D = M
M = -D
"""

not_command: str = """
@SP
AM = M - 1
M = !M
@SP
M = M + 1
"""

or_command: str = """
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M|D
@SP
M = M + 1
"""

sub_command: str = """
@SP
AM = M - 1
D = M
A = A - 1
M = M - D
"""

static_pop: str = """
@SP
AM = M - 1
D = M
@{}
M = D
"""

static_push: str = """
@{}
D = M
@SP
A = M
M = D
@SP
M = M + 1
"""

temp_pop: str = """
@SP
AM = M - 1
D = M
@{}
M = D
"""

temp_push: str = """
@{}
D = M
@SP
A = M
M = D
@SP
M = M + 1
"""

pop: str = """
@{1}
D = A
@{0}
M = M + D
@SP
AM = M - 1
D = M
@{0}
A = M
M = D
@{1}
D = A
@{0}
M = M - D
"""

constant_push: str = """
@{}
D = A
@SP
A = M
M = D
@SP
M = M + 1
"""

push: str = """
@{1}
D = A
@{0}
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
"""

pointer_push: str = """
@{0}
D = M
@SP
A = M
M = D
@SP
M = M + 1
"""

pointer_pop: str = """
@SP
AM = M - 1
D = M
@{0}
M = D
"""

label: str = """
({})
"""

goto: str = """
@{}
0;JMP
"""

ifgoto: str = """
@SP
AM = M - 1
D = M
@{0}
D;JNE
"""

call: str = """
// push returnAddress
@RETURN_ADDRESS_{0}_{1}
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

// ARG = SP - 5 - {1}
@SP
D = M
@5
D = D - A
@{1}
D = D - A
@ARG
M = D

// LCL = SP
@SP
D = M
@LCL
M = D

// goto {0}
@{0}
0;JMP

(RETURN_ADDRESS_{0}_{2})
"""

fun: str = """
({0})

@{1}
D = A
@SP
M = D + M
"""

ret: str = """
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
"""

bootstrap: str = """
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

"""