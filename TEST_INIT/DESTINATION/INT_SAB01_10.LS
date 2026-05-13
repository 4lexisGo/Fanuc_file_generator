/PROG  INT_SAB01_10.LS
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
   2:  !programme référence SAB01_10    ;
   3:      ;
   4:  SELECT R[31]=1.5,JMP LBL[1]    ;
   5:         =2.5,JMP LBL[2]    ;
   6:         =3.5,JMP LBL[3]    ;
   7:         =4.5,JMP LBL[4]    ;
   8:         =5.5,JMP LBL[5]    ;
   9:      ;
  10:  LBL[998]    ;
  11:      ;
  12:  SELECT R[31]=1,JMP LBL[999]    ;
  13:         =2,JMP LBL[1]    ;
  14:         =3,JMP LBL[4]    ;
  15:         =4,JMP LBL[5]    ;
  16:         =5,JMP LBL[999]    ;
  17:      ;
  18:  GO[1]=32    ;
  19:  PAUSE    ;
  20:  GO[1]=0    ;
  21:  JMP LBL[998]    ;
  22:      ;
  23:  !Début des trajectoires    ;
  24:      ;
  25:  LBL[1]    ;
  26:  !Calcul point de prise    ;
  27:  CALL CALC_001    ;
  28:  PR[100,3:Offset]=100    ;
  29:  R[31]=0.5    ;
  30:J PR[99:Mobil 1] 10% FINE Offset,PR[100:Offset]    ;
  31:  R[31]=1    ;
  32:  JMP LBL[998]    ;
  33:      ;
  34:  LBL[2]    ;
  35:  R[31]=1.5    ;
  36:L PR[99:Mobil 1] 100mm/sec FINE    ;
  37:  R[31]=2    ;
  38:  JMP LBL[998]    ;
  39:      ;
  40:  LBL[3]    ;
  41:  !Ouverture pince    ;
  42:  R[31]=2.5    ;
  43:  CALL OUV_PINCE    ;
  44:  R[31]=3    ;
  45:  JMP LBL[998]    ;
  46:      ;
  47:  LBL[4]    ;
  48:  R[31]=3.5    ;
  49:L PR[99:Mobil 1] 100mm/sec FINE Offset,PR[100:Offset]    ;
  50:  R[31]=4    ;
  51:  JMP LBL[998]    ;
  52:      ;
  53:  LBL[5]    ;
  54:  R[31]=4.5    ;
  55:J P[1] 10% FINE    ;
  56:  R[31]=5    ;
  57:  JMP LBL[998]    ;
  58:      ;
  59:  LBL[999]    ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
