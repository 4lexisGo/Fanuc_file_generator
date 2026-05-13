/PROG  INT_SAB01_60.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-13  TIME 11:28:46;
MODIFIED = DATE 26-05-13  TIME 11:28:46;
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
   4:  SELECT R[31]=1.5,JMP LBL[1]    ;
   5:         =2.5,JMP LBL[2]    ;
   6:         =3.5,JMP LBL[3]    ;
   7:         =4.5,JMP LBL[4]    ;
   8:      ;
   9:  LBL[998]    ;
  10:      ;
  11:  SELECT R[31]=1,JMP LBL[999]    ;
  12:         =2,JMP LBL[1]    ;
  13:         =3,JMP LBL[4]    ;
  14:         =4,JMP LBL[999]    ;
  15:      ;
  16:  GO[1]=32    ;
  17:  PAUSE    ;
  18:  GO[1]=0    ;
  19:  JMP LBL[998]    ;
  20:      ;
  21:  !Début des trajectoires    ;
  22:      ;
  23:  LBL[1]    ;
  24:  R[31]=0.5    ;
  25:J P[1:Pose rebut] 10% FINE Offset,PR[100:Offset]    ;
  26:  R[31]=1    ;
  27:  JMP LBL[998]    ;
  28:      ;
  29:  LBL[2]    ;
  30:  R[31]=1.5    ;
  31:L P[1:Pose rebut] 100mm/sec FINE    ;
  32:  R[31]=2    ;
  33:  JMP LBL[998]    ;
  34:      ;
  35:  LBL[3]    ;
  36:  !Fermeture pince    ;
  37:  R[31]=2.5    ;
  38:  CALL FERM_PINCE    ;
  39:  R[31]=3    ;
  40:  JMP LBL[998]    ;
  41:      ;
  42:  LBL[4]    ;
  43:  R[31]=3.5    ;
  44:J P[1:Pose rebut] 10% FINE Offset,PR[100:Offset]    ;
  45:  R[31]=4    ;
  46:  JMP LBL[998]    ;
  47:      ;
  48:  LBL[999]    ;
/POS
P[1:"Pose rebut"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
