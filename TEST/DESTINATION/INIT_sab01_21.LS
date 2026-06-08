/PROG  INIT_sab01_21.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-06-05  TIME 10:06:19;
MODIFIED = DATE 26-06-05  TIME 10:06:19;
PROTECT  = READ_WRITE;
TCD:   STACK_SIZE	    = 0,
       TASK_PRIORITY	= 50,
       TIME_SLICE     = 0,
       BUSY_LAMP_OFF	= 0,
       ABORT_REQUEST	= 0,
       PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
/APPL

AUTO_SINGULARITY_HEADER;    ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  !Init généré automatiquement    ;
   2:  !programme référence sab01_21    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:         =6.5,JMP LBL[6]    ;
  11:      ;
  12:  LBL[998]    ;
  13:      ;
  14:  SELECT R[99]=1,JMP LBL[999]    ;
  15:         =2,JMP LBL[1]    ;
  16:         =3,JMP LBL[2]    ;
  17:         =4,JMP LBL[3]    ;
  18:         =5,JMP LBL[4]    ;
  19:         =6,JMP LBL[999]    ;
  20:      ;
  21:  GO[1]=32    ;
  22:  PAUSE    ;
  23:  GO[1]=0    ;
  24:  JMP LBL[998]    ;
  25:      ;
  26:  !Début des trajectoires    ;
  27:      ;
  28:  LBL[1]    ;
  29:  !Approche posage    ;
  30:  R[99]=0.5    ;
  31:J P[1:App] 10% FINE    ;
  32:  R[99]=1    ;
  33:  JMP LBL[998]    ;
  34:      ;
  35:  LBL[2]    ;
  36:  PR[100,3:Offset]=(-50)    ;
  37:  R[99]=1.5    ;
  38:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  39:  R[99]=2    ;
  40:  JMP LBL[998]    ;
  41:      ;
  42:  LBL[3]    ;
  43:  R[99]=2.5    ;
  44:L P[3:Point prise] 100mm/sec FINE    ;
  45:  R[99]=3    ;
  46:  JMP LBL[998]    ;
  47:      ;
  48:  LBL[4]    ;
  49:  PR[100,3:Offset]=(-200)    ;
  50:  R[99]=3.5    ;
  51:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  52:  R[99]=4    ;
  53:  JMP LBL[998]    ;
  54:      ;
  55:  LBL[5]    ;
  56:  !Approche posage    ;
  57:  R[99]=4.5    ;
  58:J P[1:App] 10% FINE    ;
  59:  R[99]=5    ;
  60:  JMP LBL[998]    ;
  61:      ;
  62:  LBL[6]    ;
  63:  R[99]=5.5    ;
  64:J P[2] 10% FINE    ;
  65:  R[99]=6    ;
  66:  JMP LBL[998]    ;
  67:      ;
  68:  !Fin des trajectoires    ;
  69:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2333.720  mm,	Y =  -556.424  mm,	Z =     7.915  mm,
	W =   179.562 deg,	P =      .491 deg,	R =   107.272 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1096.801  mm,	Y =  -133.611  mm,	Z =   -66.751  mm,
	W =   174.861 deg,	P =    19.546 deg,	R =   148.100 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2324.165  mm,	Y =  -557.613  mm,	Z =  -369.343  mm,
	W =   179.855 deg,	P =      .317 deg,	R =   107.274 deg
};
/END
