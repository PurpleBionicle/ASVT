Q BIT p3.2

  U_ BIT p0.3
  W_ BIT p1.3
  X_ BIT p1.0
  Y BIT p0.2
  Z BIT p2.5

  AA_ BIT p0.5
  BB_ BIT p2.4
  G_ BIT p2.0


  U BIT 21h.0
  W BIT 20h.1
  X BIT 28h.1

  AA BIT 28h.6
  BB BIT 21h.6
  G BIT 26h.0

  ORG 0h

START:

PIN_REDIRECT:
  MOV C,U_
  MOV U,C

  MOV C,W_
  MOV W,C

  MOV C,X_
  MOV X,C

  MOV C,AA_
  MOV AA,C

  MOV C,BB_
  MOV BB,C

  MOV C,G_
  MOV G,C

  ; JB идем на метку, если 1
  ; JNB идем на метку, если 0
  ;Q = (Y*(/W+X)*/Z) + ((A+/G)*(/U+B))

TEST_Y:
  MOV A, p0
  ANL A, #00000100b ;Y
  JZ TEST_A

TEST_W:
  MOV A, 20h
  ANL A, #0000010b ;W
  JNZ TEST_Z

TEST_X:
  MOV A, 28h
  ANL A, #00000010b ; X
  JZ TEST_A

TEST_Z:
  MOV A, p2
  ANL A, #00100000b ; Z
  JZ SET_Q

TEST_A:
  MOV A, 28h
  ANL A, #00100000b ; AA
  JZ TEST_U

TEST_G:
  MOV A, 26h
  ANL A, #00000001b ; G
  JNZ CLR_Q

TEST_U:
  MOV A, 21h
  ANL A, #00000001b ; U
  JNZ CLR_Q

TEST_B:
  MOV A, 21h
  ANL A, #01000000b ;
  JNZ SET_Q

CLR_Q:
  SETB Q
  JMP START

SET_Q:
  CLR Q
  JMP START
END
