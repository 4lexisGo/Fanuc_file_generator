/PROG  INT_SAB01_20.LS
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
   2:  !programme référence SAB01_20    ;
   3:      ;
   4:  SELECT R[31]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:      ;
   8:  LBL[998]    ;
   9:      ;
  10:  SELECT R[31]=1,JMP LBL[999]    ;
  11:         =2,JMP LBL[999]    ;
  12:      ;
  13:  GO[1]=32    ;
  14:  PAUSE    ;
  15:  GO[1]=0    ;
  16:  JMP LBL[998]    ;
  17:      ;
  18:  !Début des trajectoires    ;
  19:      ;
  20:  LBL[1]    ;
  21:  PR[100,3:Offset]=50    ;
  22:  R[31]=0.5    ;
  23:J PR[99:Mobil 1] 10% FINE Offset,PR[100:Offset]    ;
  24:  R[31]=1    ;
  25:  JMP LBL[998]    ;
  26:      ;
  27:  LBL[2]    ;
  28:  R[31]=1.5    ;
  29:L PR[99:Mobil 1] 100mm/sec FINE Offset,PR[100:Offset]    ;
  30:  R[31]=2    ;
  31:  JMP LBL[998]    ;
  32:      ;
  33:  LBL[999]    ;
/POS
/END
