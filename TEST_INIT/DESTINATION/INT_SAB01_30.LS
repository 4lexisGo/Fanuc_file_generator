/PROG  INT_SAB01_30.LS
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
   2:  !programme référence SAB01_30    ;
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
  22:  !Calcul point de soufflage    ;
  23:  CALL CALC_003    ;
  24:  PR[100,3:Offset]=200    ;
  25:  R[31]=0.5    ;
  26:J PR[99:Mobil 1] 10% FINE Offset,PR[100:Offset]    ;
  27:  R[31]=1    ;
  28:  JMP LBL[998]    ;
  29:      ;
  30:  LBL[2]    ;
  31:  R[31]=1.5    ;
  32:L PR[99:Mobil 1] 100mm/sec FINE    ;
  33:  R[31]=2    ;
  34:  JMP LBL[998]    ;
  35:      ;
  36:  LBL[3]    ;
  37:  R[31]=2.5    ;
  38:L PR[99:Mobil 1] 100mm/sec FINE Offset,PR[100:Offset]    ;
  39:  R[31]=3    ;
  40:  JMP LBL[998]    ;
  41:      ;
  42:  LBL[999]    ;
/POS
/END
