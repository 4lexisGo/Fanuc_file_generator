/PROG  INT_SAB01_60.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-18  TIME 22:05:25;
MODIFIED = DATE 26-05-18  TIME 22:05:25;
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
   2:  !programme référence SAB01_60    ;
   3:      ;
   4:  SELECT R[31]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:      ;
   9:  LBL[998]    ;
  10:      ;
  11:  SELECT R[31]=1,JMP LBL[999]    ;
  12:         =2,JMP LBL[1]    ;
  13:         =3,JMP LBL[999]    ;
  14:      ;
  15:  GO[1]=32    ;
  16:  PAUSE    ;
  17:  GO[1]=0    ;
  18:  JMP LBL[998]    ;
  19:      ;
  20:  !Début des trajectoires    ;
  21:      ;
  22:  LBL[1]    ;
  23:  R[31]=0.5    ;
  24:J P[1:Pose rebut] 10% FINE Offset,PR[100:Offset]    ;
  25:  R[31]=1    ;
  26:  JMP LBL[998]    ;
  27:      ;
  28:  LBL[2]    ;
  29:  R[31]=1.5    ;
  30:L P[1:Pose rebut] 100mm/sec FINE    ;
  31:  R[31]=2    ;
  32:  JMP LBL[998]    ;
  33:      ;
  34:  LBL[3]    ;
  35:  R[31]=2.5    ;
  36:J P[1:Pose rebut] 10% FINE Offset,PR[100:Offset]    ;
  37:  R[31]=3    ;
  38:  JMP LBL[998]    ;
  39:      ;
  40:  LBL[999]    ;
/POS
P[1:"Pose rebut"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
