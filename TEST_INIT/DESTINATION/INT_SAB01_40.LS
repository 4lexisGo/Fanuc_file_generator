/PROG  INT_SAB01_40.LS
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
   2:  !programme référence SAB01_40    ;
   3:      ;
   4:  SELECT R[31]=1.5,JMP LBL[1]    ;
   5:      ;
   6:  LBL[998]    ;
   7:      ;
   8:  SELECT R[31]=1,JMP LBL[999]    ;
   9:      ;
  10:  GO[1]=32    ;
  11:  PAUSE    ;
  12:  GO[1]=0    ;
  13:  JMP LBL[998]    ;
  14:      ;
  15:  !Début des trajectoires    ;
  16:      ;
  17:  LBL[1]    ;
  18:  !Calcul point de controle data    ;
  19:  CALL CALC_004    ;
  20:  R[31]=0.5    ;
  21:J PR[99:Mobil 1] 10% FINE    ;
  22:  R[31]=1    ;
  23:  JMP LBL[998]    ;
  24:      ;
  25:  LBL[999]    ;
/POS
/END
