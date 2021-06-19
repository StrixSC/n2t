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
@RETURN_ADDRESS_{0}
D = A
@SP
A = M
M = D
@SP
M = M + 1

@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1

@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1

@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1

@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1

@SP
D = M
@5
D = D - A
@{1}
D = D - A
@ARG
M = D

@SP
D = M
@LCL
M = D

@{0}
0;JMP

(RETURN_ADDRESS_{0})
"""

function_setup_label: str = """
({0})
(SETUP_{0})
"""

function_push_lcl: str = """
@LCL
A = M + {0}
M = 0
"""

ret: str = """
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

@RETURN_ADDRESS_{}
0; JMP
"""