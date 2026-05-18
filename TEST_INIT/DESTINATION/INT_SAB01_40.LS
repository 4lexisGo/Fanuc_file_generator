/PROG  INT_SAB01_40.LS
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
   2:  !programme référence SAB01_40    ;
   3:      ;
   4:  SELECT R[31]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:      ;
   7:  LBL[998]    ;
   8:      ;
   9:  SELECT R[31]=1,JMP LBL[999]    ;
  10:      ;
  11:  GO[1]=32    ;
  12:  PAUSE    ;
  13:  GO[1]=0    ;
  14:  JMP LBL[998]    ;
  15:      ;
  16:  !Début des trajectoires    ;
  17:      ;
  18:  LBL[1]    ;
  19:  !Calcul point de controle data    ;
  20:  CALL CALC_004    ;
  21:  R[31]=0.5    ;
  22:J PR[99:Mobil 1] 10% FINE    ;
  23:  R[31]=1    ;
  24:  JMP LBL[998]    ;
  25:      ;
  26:  LBL[999]    ;
/POS
/END
