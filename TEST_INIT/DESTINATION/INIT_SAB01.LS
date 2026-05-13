/PROG  INIT_SAB01.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-13  TIME 11:26:45;
MODIFIED = DATE 26-05-13  TIME 11:26:45;
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
   6:      ;
   7:  GO[1]=32    ;
   8:  PAUSE    ;
   9:  GO[1]=0    ;
  10:  JMP LBL[998]    ;
  11:      ;
  12:  !Début des trajectoires    ;
  13:      ;
  14:  LBL[999]    ;
  15:  R[30]=0    ;
  16:  R[31]=0    ;
  17:  IF R[13]<>0,CALL REBUT    ;
  18:  R[10]=0    ;
  19:  CALL CHGMT_PREHENSEUR    ;
/POS
/END
