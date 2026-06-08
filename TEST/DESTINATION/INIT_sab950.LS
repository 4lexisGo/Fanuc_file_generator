/PROG  INIT_sab950.LS
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
   2:  !programme référence sab950    ;
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
  31:  !Approche echange    ;
  32:  R[99]=0.5    ;
  33:J P[1] 10% FINE    ;
  34:  R[99]=1    ;
  35:  JMP LBL[998]    ;
  36:      ;
  37:  LBL[2]    ;
  38:  R[99]=1.5    ;
  39:L P[3] 100mm/sec FINE    ;
  40:  R[99]=2    ;
  41:  JMP LBL[998]    ;
  42:      ;
  43:  LBL[3]    ;
  44:  R[99]=2.5    ;
  45:J P[6] 10% FINE    ;
  46:  R[99]=3    ;
  47:  JMP LBL[998]    ;
  48:      ;
  49:  LBL[4]    ;
  50:  R[99]=3.5    ;
  51:L P[4] 100mm/sec FINE    ;
  52:  R[99]=4    ;
  53:  JMP LBL[998]    ;
  54:      ;
  55:  LBL[5]    ;
  56:  R[99]=4.5    ;
  57:L P[6] 100mm/sec FINE    ;
  58:  R[99]=5    ;
  59:  JMP LBL[998]    ;
  60:      ;
  61:  LBL[6]    ;
  62:  R[99]=5.5    ;
  63:L P[5] 100mm/sec FINE    ;
  64:  R[99]=6    ;
  65:  JMP LBL[998]    ;
  66:      ;
  67:  LBL[7]    ;
  68:  R[99]=6.5    ;
  69:J P[2] 10% FINE    ;
  70:  R[99]=7    ;
  71:  JMP LBL[998]    ;
  72:      ;
  73:  !Fin des trajectoires    ;
  74:  LBL[999]    ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, -1',
	X =   275.455  mm,	Y =  -885.710  mm,	Z =   -20.932  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =   106.604 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, -1',
	X =   275.455  mm,	Y =  -885.710  mm,	Z =   -20.932  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =   106.604 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   434.137  mm,	Y = -1391.925  mm,	Z =   -33.348  mm,
	W =   178.701 deg,	P =     -.347 deg,	R =  -172.575 deg
};
P[4]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1727.531  mm,	Y =   349.822  mm,	Z =   456.392  mm,
	W =     -.095 deg,	P =    19.856 deg,	R =     1.268 deg
};
P[5]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   434.137  mm,	Y = -1391.925  mm,	Z =   -33.348  mm,
	W =   178.701 deg,	P =     -.347 deg,	R =  -172.575 deg
};
P[6]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   399.522  mm,	Y = -1544.546  mm,	Z =    27.475  mm,
	W =   179.916 deg,	P =   -20.356 deg,	R =   -64.272 deg
};
/END
