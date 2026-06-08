/PROG  INIT_CYCLE1.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-06-05  TIME 10:06:19;
MODIFIED = DATE 26-06-05  TIME 10:06:19;
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
   2:  !programme référence CHASSIGNOL    ;
   3:      ;
   4:  LBL[998]    ;
   5:      ;
   6:  SELECT R[100]=0, JMP LBL[999]    ;
   7:              =0,CALL INIT_sab01_10    ;
   8:              =0,CALL INIT_sab01_11    ;
   9:              =0,CALL INIT_sab01_12    ;
  10:              =0,CALL INIT_sab01_20    ;
  11:              =0,CALL INIT_sab01_21    ;
  12:              =0,CALL INIT_sab01_22    ;
  13:              =0,CALL INIT_sab01_30    ;
  14:              =0,CALL INIT_sab01_40    ;
  15:              =0,CALL INIT_sab01_41    ;
  16:              =0,CALL INIT_sab01_42    ;
  17:              =0,CALL INIT_sab01_50    ;
  18:              =0,CALL INIT_sab01_51    ;
  19:              =0,CALL INIT_sab01_52    ;
  20:              =0,CALL INIT_sab01_60    ;
  21:              =0,CALL INIT_sab01_70    ;
  22:              =0,CALL INIT_sab01_71    ;
  23:              =0,CALL INIT_sab900    ;
  24:              =0,CALL INIT_sab950    ;
  25:              =0,CALL INIT_sab951    ;
  26:              =0,CALL INIT_sab952    ;
  27:              =0,CALL INIT_sab953    ;
  28:              =0,CALL INIT_sab954    ;
  29:      ;
  30:  GO[1]=32    ;
  31:  PAUSE    ;
  32:  GO[1]=0    ;
  33:  JMP LBL[998]    ;
  34:      ;
  35:  LBL[999]    ;
  36:  R[100]=0    ;
  37:  R[100]=0    ;
  38:  IF R[99]<>0,CALL REBUT    ;
  39:  R[98]=0    ;
  40:  CALL CHANG_OUTIL    ;
/POS
/END
