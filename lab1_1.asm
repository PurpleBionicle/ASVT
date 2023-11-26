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

CALC:
  MOV C,X
  ORL C,/W
  ANL C,Y
  ANL C,/Z
  MOV F0,C
  MOV C,AA
  ORL C,/G
  MOV T0,C
  MOV C,BB
  ORL C,/U
  ANL C,T0
  ORL C,F0
  CPL C
  MOV Q,C

  JMP START

END
