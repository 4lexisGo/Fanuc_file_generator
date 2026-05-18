/PROG  INT_SAB01_60.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-18  TIME 11:33:35;
MODIFIED = DATE 26-05-18  TIME 11:33:35;
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
   8:         =4.5,JMP LBL[4]    ;
   9:      ;
  10:  LBL[998]    ;
  11:      ;
  12:  SELECT R[31]=1,JMP LBL[999]    ;
  13:         =2,JMP LBL[1]    ;
  14:         =3,JMP LBL[4]    ;
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
  25:  R[31]=0.5    ;
  26:J P[1:Pose rebut] 10% FINE Offset,PR[100:Offset]    ;
  27:  R[31]=1    ;
  28:  JMP LBL[998]    ;
  29:      ;
  30:  LBL[2]    ;
  31:  R[31]=1.5    ;
  32:L P[1:Pose rebut] 100mm/sec FINE    ;
  33:  R[31]=2    ;
  34:  JMP LBL[998]    ;
  35:      ;
  36:  LBL[3]    ;
  37:  !Fermeture pince    ;
  38:  R[31]=2.5    ;
  39:  CALL FERM_PINCE    ;
  40:  R[31]=3    ;
  41:  JMP LBL[998]    ;
  42:      ;
  43:  LBL[4]    ;
  44:  R[31]=3.5    ;
  45:J P[1:Pose rebut] 10% FINE Offset,PR[100:Offset]    ;
  46:  R[31]=4    ;
  47:  JMP LBL[998]    ;
  48:      ;
  49:  LBL[999]    ;
/POS
P[1:"Pose rebut"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
