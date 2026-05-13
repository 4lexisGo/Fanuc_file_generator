/PROG  INT_SAB01_50.LS
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
   2:  !programme référence SAB01_50    ;
   3:      ;
   4:  SELECT R[31]=1.5,JMP LBL[1]    ;
   5:         =2.5,JMP LBL[2]    ;
   6:         =3.5,JMP LBL[3]    ;
   7:      ;
   8:  LBL[998]    ;
   9:      ;
  10:  SELECT R[31]=1,JMP LBL[999]    ;
  11:         =2,JMP LBL[1]    ;
  12:         =3,JMP LBL[999]    ;
  13:      ;
  14:  GO[1]=32    ;
  15:  PAUSE    ;
  16:  GO[1]=0    ;
  17:  JMP LBL[998]    ;
  18:      ;
  19:  !Début des trajectoires    ;
  20:      ;
  21:  LBL[1]    ;
  22:  !Point de mesure telemetre    ;
  23:  R[31]=0.5    ;
  24:J P[1:Ctrl telemetre] 10% FINE    ;
  25:  R[31]=1    ;
  26:  JMP LBL[998]    ;
  27:      ;
  28:  LBL[2]    ;
  29:  !Calcul point de pose bac    ;
  30:  CALL CALC_005    ;
  31:  R[31]=1.5    ;
  32:L PR[99:Mobil 1] 100mm/sec FINE    ;
  33:  R[31]=2    ;
  34:  JMP LBL[998]    ;
  35:      ;
  36:  LBL[3]    ;
  37:  R[31]=2.5    ;
  38:J P[1:Ctrl telemetre] 10% FINE    ;
  39:  R[31]=3    ;
  40:  JMP LBL[998]    ;
  41:      ;
  42:  LBL[999]    ;
/POS
P[1:"Ctrl telemetre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
