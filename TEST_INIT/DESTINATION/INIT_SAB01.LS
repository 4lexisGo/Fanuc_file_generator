/PROG  INIT_SAB01.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-12  TIME 19:18:59;
MODIFIED = DATE 26-05-12  TIME 19:18:59;
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
   6:  SELECT R[38]=1,CALL SAB01_10    ;
   7:         =10,CALL SAB01_100    ;
   8:         =2,CALL SAB01_20    ;
   9:         =3,CALL SAB01_30    ;
  10:         =4,CALL SAB01_40    ;
  11:         =5,CALL SAB01_50    ;
  12:         =6,CALL SAB01_60    ;
  13:         =7,CALL SAB01_70    ;
  14:      ;
  15:  GO[1]=99    ;
  16:  PAUSE    ;
  17:  GO[1]=0    ;
  18:  JMP LBL[998]    ;
  19:      ;
  20:  !Début des trajectoires    ;
  21:      ;
  22:  LBL[999]    ;
  23:  R[38]=0    ;
  24:  R[66]=0    ;
  25:  IF R[99]<>0,CALL REBUT    ;
  26:  R[98]=0    ;
  27:  CALL CHANG_OUTIL    ;
/POS
/END
