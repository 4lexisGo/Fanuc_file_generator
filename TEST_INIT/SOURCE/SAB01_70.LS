/PROG  SAB01_70
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise soufflage";
PROG_SIZE	= 569;
CREATE		= DATE 25-10-09  TIME 16:00:18;
MODIFIED	= DATE 25-10-10  TIME 16:50:16;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 17;
MEMORY_SIZE	= 897;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  !//////////////////////////////// ;
   2:  !////Changement prehenseur///// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Memo programme en cours ;
   6:  R[38:Programme en cr]=7    ;
   7:   ;
   8:  !Validation Tache ;
   9:  CALL VALIDATION_DEBUT_TACHE    ;
  10:   ;
  11:  !Changement de prhenseur ;
  12:  R[91:Choix outils]=1    ;
  13:  CALL CHANG_OUTIL    ;
  14:   ;
  15:  !Validation Fin Tache ;
  16:  CALL VALIDATION_FIN_TACHE    ;
  17:   ;
/POS
/END
