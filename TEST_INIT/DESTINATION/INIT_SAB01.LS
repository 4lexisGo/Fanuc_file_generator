/PROG  INIT_SAB01.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-18  TIME 11:32:46;
MODIFIED = DATE 26-05-18  TIME 11:32:46;
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
   2:  !programme référence FAIVELAY    ;
   3:      ;
   4:  LBL[998]    ;
   5:      ;
   6:  SELECT R[30]=None,CALL INIT_SAB01_20    ;
   7:      ;
   8:  GO[1]=32    ;
   9:  PAUSE    ;
  10:  GO[1]=0    ;
  11:  JMP LBL[998]    ;
  12:      ;
  13:  !Début des trajectoires    ;
  14:      ;
  15:  LBL[999]    ;
  16:  R[30]=0    ;
  17:  R[31]=0    ;
  18:  IF R[99]<>0,CALL REBUT    ;
  19:  R[98]=0    ;
  20:  CALL CHANG_OUTIL    ;
/POS
/END
