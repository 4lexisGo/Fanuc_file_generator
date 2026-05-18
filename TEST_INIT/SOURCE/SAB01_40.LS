/PROG  SAB01_40
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Controle piece";
PROG_SIZE	= 714;
CREATE		= DATE 26-05-12  TIME 09:05:08;
MODIFIED	= DATE 26-05-12  TIME 09:31:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 25;
MEMORY_SIZE	= 1010;
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
   2:  !!!!Programme de controle du!!!!! ;
   3:  !!!!!datamatrix de la piece!!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  !Attente demande controle piece ;
   7:  WAIT (DI[102:Dmd depl caméra]=ON)    ;
   8:   ;
   9:  !Envoie controle camera encours ;
  10:  DO[104:Pos cam encours]=ON ;
  11:   ;
  12:  !Definition du repere ;
  13:  UFRAME_NUM=5 ;
  14:   ;
  15:  !Calcul point de controle data ;
  16:  CALL CALC_004    ;
  17:   ;
  18:  !Remise a zero decallage ;
  19:  CALL RAZPR(100) ;
  20:   ;
  21:J PR[99:Mobil 1] 100% CNT0    ;
  22:   ;
  23:  !Envoie en position de controle ;
  24:  CALL POS_CONTROLE    ;
  25:   ;
/POS
/END
