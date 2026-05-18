/PROG  SAB01_30
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Soufflage piece";
PROG_SIZE	= 792;
CREATE		= DATE 26-05-11  TIME 15:55:16;
MODIFIED	= DATE 26-05-12  TIME 09:11:02;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 30;
MEMORY_SIZE	= 1068;
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
/MN
   1:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   2:  !!!Programme de prise piece sur!! ;
   3:  !!!!!!!!la reintroduction!!!!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  !Attente demande prise reintro  ;
   7:  WAIT (DI[107:Dmd prise reintro]=ON)    ;
   8:   ;
   9:  !Envoie prise reintro encours ;
  10:  DO[114:Prise reintro encours]=ON ;
  11:   ;
  12:  !Definition du repere ;
  13:  UFRAME_NUM=4 ;
  14:   ;
  15:  !Calcul point de soufflage ;
  16:  CALL CALC_003    ;
  17:   ;
  18:  !Remise a zero decallage ;
  19:  CALL RAZPR(100) ;
  20:   ;
  21:  PR[100,3:Offset]=200    ;
  22:J PR[99:Mobil 1] 100% CNT100 Offset,PR[100:Offset]    ;
  23:   ;
  24:L PR[99:Mobil 1] 2000mm/sec CNT0    ;
  25:   ;
  26:  !Envoie en position de soufflage ;
  27:  CALL POS_SOUFFLAGE    ;
  28:   ;
  29:L PR[99:Mobil 1] 2000mm/sec CNT5 Offset,PR[100:Offset]    ;
  30:   ;
/POS
/END
