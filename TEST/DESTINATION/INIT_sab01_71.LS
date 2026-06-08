/PROG  INIT_sab01_71.LS
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
   2:  !programme référence sab01_71    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:      ;
  10:  LBL[998]    ;
  11:      ;
  12:  SELECT R[99]=1,JMP LBL[999]    ;
  13:         =2,JMP LBL[1]    ;
  14:         =3,JMP LBL[2]    ;
  15:         =4,JMP LBL[999]    ;
  16:      ;
  17:  GO[1]=32    ;
  18:  PAUSE    ;
  19:  GO[1]=0    ;
  20:  JMP LBL[998]    ;
  21:      ;
  22:  !Début des trajectoires    ;
  23:      ;
  24:  LBL[1]    ;
  25:  !Approche    ;
  26:  R[99]=0.5    ;
  27:J P[1:App] 10% FINE    ;
  28:  R[99]=1    ;
  29:  JMP LBL[998]    ;
  30:      ;
  31:  LBL[2]    ;
  32:  R[99]=1.5    ;
  33:J P[3] 10% FINE    ;
  34:  R[99]=2    ;
  35:  JMP LBL[998]    ;
  36:      ;
  37:  LBL[3]    ;
  38:  !Approche    ;
  39:  R[99]=2.5    ;
  40:J P[3] 10% FINE    ;
  41:  R[99]=3    ;
  42:  JMP LBL[998]    ;
  43:      ;
  44:  LBL[4]    ;
  45:  R[99]=3.5    ;
  46:J P[2] 10% FINE    ;
  47:  R[99]=4    ;
  48:  JMP LBL[998]    ;
  49:      ;
  50:  !Fin des trajectoires    ;
  51:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -642.084  mm,	Y =  1060.018  mm,	Z =   257.197  mm,
	W =  -141.915 deg,	P =    -2.189 deg,	R =    47.868 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1023.078  mm,	Y =   809.668  mm,	Z =   186.000  mm,
	W =   179.825 deg,	P =    -1.082 deg,	R =   -18.432 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1669.407  mm,	Y =  1025.064  mm,	Z =   173.193  mm,
	W =   179.826 deg,	P =    -1.080 deg,	R =   -18.431 deg
};
/END
