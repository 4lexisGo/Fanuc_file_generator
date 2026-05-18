/PROG  INT_SAB01_10.LS
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
   2:  !programme référence SAB01_10    ;
   3:      ;
   4:  SELECT R[31]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:      ;
  11:  LBL[998]    ;
  12:      ;
  13:  SELECT R[31]=1,JMP LBL[999]    ;
  14:         =2,JMP LBL[1]    ;
  15:         =3,JMP LBL[4]    ;
  16:         =4,JMP LBL[5]    ;
  17:         =5,JMP LBL[999]    ;
  18:      ;
  19:  GO[1]=32    ;
  20:  PAUSE    ;
  21:  GO[1]=0    ;
  22:  JMP LBL[998]    ;
  23:      ;
  24:  !Début des trajectoires    ;
  25:      ;
  26:  LBL[1]    ;
  27:  !Calcul point de prise    ;
  28:  CALL CALC_001    ;
  29:  PR[100,3:Offset]=100    ;
  30:  R[31]=0.5    ;
  31:J PR[99:Mobil 1] 10% FINE Offset,PR[100:Offset]    ;
  32:  R[31]=1    ;
  33:  JMP LBL[998]    ;
  34:      ;
  35:  LBL[2]    ;
  36:  R[31]=1.5    ;
  37:L PR[99:Mobil 1] 100mm/sec FINE    ;
  38:  R[31]=2    ;
  39:  JMP LBL[998]    ;
  40:      ;
  41:  LBL[3]    ;
  42:  !Ouverture pince    ;
  43:  R[31]=2.5    ;
  44:  CALL OUV_PINCE    ;
  45:  R[31]=3    ;
  46:  JMP LBL[998]    ;
  47:      ;
  48:  LBL[4]    ;
  49:  R[31]=3.5    ;
  50:L PR[99:Mobil 1] 100mm/sec FINE Offset,PR[100:Offset]    ;
  51:  R[31]=4    ;
  52:  JMP LBL[998]    ;
  53:      ;
  54:  LBL[5]    ;
  55:  R[31]=4.5    ;
  56:J P[1] 10% FINE    ;
  57:  R[31]=5    ;
  58:  JMP LBL[998]    ;
  59:      ;
  60:  LBL[999]    ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
