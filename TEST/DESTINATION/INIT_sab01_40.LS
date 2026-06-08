/PROG  INIT_sab01_40.LS
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
   2:  !programme référence sab01_40    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:      ;
   8:  LBL[998]    ;
   9:      ;
  10:  SELECT R[99]=1,JMP LBL[999]    ;
  11:         =2,JMP LBL[999]    ;
  12:      ;
  13:  GO[1]=32    ;
  14:  PAUSE    ;
  15:  GO[1]=0    ;
  16:  JMP LBL[998]    ;
  17:      ;
  18:  !Début des trajectoires    ;
  19:      ;
  20:  LBL[1]    ;
  21:  R[99]=0.5    ;
  22:J P[2:Approche 2] R[28:Vitesse joue + P]% FINE    ;
  23:  R[99]=1    ;
  24:  JMP LBL[998]    ;
  25:      ;
  26:  LBL[2]    ;
  27:  !Approche    ;
  28:  R[99]=1.5    ;
  29:J P[1:Approche 1] 10% FINE    ;
  30:  R[99]=2    ;
  31:  JMP LBL[998]    ;
  32:      ;
  33:  !Fin des trajectoires    ;
  34:  LBL[999]    ;
/POS
P[1:"Approche 1"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1019.461  mm,	Y =    -5.331  mm,	Z =   -22.111  mm,
	W =   178.089 deg,	P =      .708 deg,	R =    63.066 deg
};
P[2:"Approche 2"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   736.155  mm,	Y =  -792.617  mm,	Z =   -75.502  mm,
	W =   175.527 deg,	P =    20.153 deg,	R =   108.936 deg
};
/END
