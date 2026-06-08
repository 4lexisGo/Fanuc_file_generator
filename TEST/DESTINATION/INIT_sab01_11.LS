/PROG  INIT_sab01_11.LS
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
   2:  !programme référence sab01_11    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:         =6.5,JMP LBL[6]    ;
  11:         =7.5,JMP LBL[7]    ;
  12:      ;
  13:  LBL[998]    ;
  14:      ;
  15:  SELECT R[99]=1,JMP LBL[999]    ;
  16:         =2,JMP LBL[1]    ;
  17:         =3,JMP LBL[2]    ;
  18:         =4,JMP LBL[3]    ;
  19:         =5,JMP LBL[4]    ;
  20:         =6,JMP LBL[5]    ;
  21:         =7,JMP LBL[999]    ;
  22:      ;
  23:  GO[1]=32    ;
  24:  PAUSE    ;
  25:  GO[1]=0    ;
  26:  JMP LBL[998]    ;
  27:      ;
  28:  !Début des trajectoires    ;
  29:      ;
  30:  LBL[1]    ;
  31:  !Approche posage    ;
  32:  R[99]=0.5    ;
  33:J P[1:App] 10% FINE    ;
  34:  R[99]=1    ;
  35:  JMP LBL[998]    ;
  36:      ;
  37:  LBL[2]    ;
  38:  R[99]=1.5    ;
  39:J P[2:App] 10% FINE    ;
  40:  R[99]=2    ;
  41:  JMP LBL[998]    ;
  42:      ;
  43:  LBL[3]    ;
  44:  PR[100,3:Offset]=(-30)    ;
  45:  R[99]=2.5    ;
  46:L P[3:Point cloutage] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  47:  R[99]=3    ;
  48:  JMP LBL[998]    ;
  49:      ;
  50:  LBL[4]    ;
  51:  PR[100,3:Offset]=0    ;
  52:  R[99]=3.5    ;
  53:L P[3:Point cloutage] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  54:  R[99]=4    ;
  55:  JMP LBL[998]    ;
  56:      ;
  57:  LBL[5]    ;
  58:  PR[100,3:Offset]=(-30)    ;
  59:  R[99]=4.5    ;
  60:L P[3:Point cloutage] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  61:  R[99]=5    ;
  62:  JMP LBL[998]    ;
  63:      ;
  64:  LBL[6]    ;
  65:  PR[100,6:Offset]=(PR[100,6:Offset]-R[24:Angle clouage])    ;
  66:  R[99]=5.5    ;
  67:J P[2:App] 10% FINE    ;
  68:  R[99]=6    ;
  69:  JMP LBL[998]    ;
  70:      ;
  71:  LBL[7]    ;
  72:  !Approche posage    ;
  73:  R[99]=6.5    ;
  74:J P[1:App] 10% FINE    ;
  75:  R[99]=7    ;
  76:  JMP LBL[998]    ;
  77:      ;
  78:  !Fin des trajectoires    ;
  79:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =   887.341  mm,	Y =   226.812  mm,	Z =  -520.806  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =  -166.268 deg
};
P[2:"App"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2323.835  mm,	Y =  -559.044  mm,	Z =  -213.193  mm,
	W =  -179.453 deg,	P =      .054 deg,	R =  -135.609 deg
};
P[3:"Point cloutage"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2325.081  mm,	Y =  -560.086  mm,	Z =  -390.000  mm,
	W =  -179.453 deg,	P =      .054 deg,	R =  -135.609 deg
};
/END
