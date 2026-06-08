/PROG  INIT_sab01_50.LS
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
   2:  !programme référence sab01_50    ;
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
  21:  !Approche    ;
  22:  R[99]=0.5    ;
  23:J P[1] R[25:Vitesse general]% FINE    ;
  24:  R[99]=1    ;
  25:  JMP LBL[998]    ;
  26:      ;
  27:  LBL[2]    ;
  28:  !Approche    ;
  29:  R[99]=1.5    ;
  30:J P[2:Approche 2] 10% FINE    ;
  31:  R[99]=2    ;
  32:  JMP LBL[998]    ;
  33:      ;
  34:  !Fin des trajectoires    ;
  35:  LBL[999]    ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   796.182  mm,	Y =   297.680  mm,	Z =    33.466  mm,
	W =  -179.698 deg,	P =     -.868 deg,	R =  -147.696 deg
};
P[2:"Approche 2"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   993.353  mm,	Y =   938.653  mm,	Z =   -58.917  mm,
	W =  -141.932 deg,	P =     1.375 deg,	R =   -32.205 deg
};
/END
