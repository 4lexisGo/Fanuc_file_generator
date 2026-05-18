/PROG  INT_SAB01_20.LS
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
   2:  !programme référence SAB01_20    ;
   3:      ;
   4:  SELECT R[31]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:      ;
   9:  LBL[998]    ;
  10:      ;
  11:  SELECT R[31]=1,JMP LBL[999]    ;
  12:         =2,JMP LBL[3]    ;
  13:         =3,JMP LBL[999]    ;
  14:      ;
  15:  GO[1]=32    ;
  16:  PAUSE    ;
  17:  GO[1]=0    ;
  18:  JMP LBL[998]    ;
  19:      ;
  20:  !Début des trajectoires    ;
  21:      ;
  22:  LBL[1]    ;
  23:  !Calcul point de prise reintro    ;
  24:  CALL CALC_002    ;
  25:  PR[100,3:Offset]=50    ;
  26:  R[31]=0.5    ;
  27:J PR[99:Mobil 1] 10% FINE Offset,PR[100:Offset]    ;
  28:  R[31]=1    ;
  29:  JMP LBL[998]    ;
  30:      ;
  31:  LBL[2]    ;
  32:  !Ouverture pince    ;
  33:  R[31]=1.5    ;
  34:  CALL OUV_PINCE    ;
  35:  R[31]=2    ;
  36:  JMP LBL[998]    ;
  37:      ;
  38:  LBL[3]    ;
  39:  R[31]=2.5    ;
  40:L PR[99:Mobil 1] 100mm/sec FINE Offset,PR[100:Offset]    ;
  41:  R[31]=3    ;
  42:  JMP LBL[998]    ;
  43:      ;
  44:  LBL[999]    ;
/POS
/END
