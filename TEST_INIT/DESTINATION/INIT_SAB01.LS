/PROG  INIT_SAB01.LS
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
   2:  !programme référence FAIVELAY    ;
   3:      ;
   4:  LBL[998]    ;
   5:      ;
   6:  SELECT R[30]=0,CALL INIT_SAB01_10    ;
   7:              =0,CALL INIT_SAB01_20    ;
   8:              =0,CALL INIT_SAB01_30    ;
   9:              =0,CALL INIT_SAB01_40    ;
  10:              =0,CALL INIT_SAB01_50    ;
  11:              =0,CALL INIT_SAB01_60    ;
  12:              =0,CALL INIT_SAB01_70    ;
  13:      ;
  14:  GO[1]=32    ;
  15:  PAUSE    ;
  16:  GO[1]=0    ;
  17:  JMP LBL[998]    ;
  18:      ;
  19:  !Début des trajectoires    ;
  20:      ;
  21:  LBL[999]    ;
  22:  R[30]=0    ;
  23:  R[31]=0    ;
  24:  IF R[99]<>0,CALL REBUT    ;
  25:  R[98]=0    ;
  26:  CALL CHANG_OUTIL    ;
/POS
/END
