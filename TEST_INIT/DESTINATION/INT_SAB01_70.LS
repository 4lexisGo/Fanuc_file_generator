/PROG  INT_SAB01_70.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-12  TIME 15:57:24;
MODIFIED = DATE 26-05-12  TIME 15:57:24;
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
   2:  !programme référence SAB01_70    ;
   3:      ;
   4:      ;
   5:  LBL[998]    ;
   6:      ;
   7:      ;
   8:  GO[1]=99    ;
   9:  PAUSE    ;
  10:  GO[1]=0    ;
  11:  JMP LBL[998]    ;
  12:      ;
  13:  !Début des trajectoires    ;
  14:      ;
/POS
/END
