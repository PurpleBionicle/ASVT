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
  JB Y, TEST_W
  JMP TEST_A

TEST_W:
  JB W, TEST_X ; если на W = 1 - /W = 0 и надо смотреть Х
  JMP TEST_Z

TEST_X:
  JB X, TEST_Z
  JMP TEST_A

TEST_Z:
  JB Z, TEST_A ; если на Z = 1 - /Z = 0 идем в A
  JMP SET_Q

TEST_A:
  JB AA, TEST_U ;если на A = 1 идем в U
  JMP TEST_G

TEST_G:
  JB G, CLR_Q ; если на G = 1 - /G = 0 --> Q=0
  JMP TEST_U

TEST_U:
  JNB U, SET_Q ; если на U = 0 - /U = 1 --> Q=1
  JMP TEST_B

TEST_B:
  JB BB, SET_Q

CLR_Q:
  SETB Q
  JMP START

SET_Q:
  CLR Q
  JMP START
END
