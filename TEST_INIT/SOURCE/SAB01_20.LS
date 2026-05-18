/PROG  SAB01_20
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise reintro";
PROG_SIZE	= 946;
CREATE		= DATE 26-05-11  TIME 14:41:34;
MODIFIED	= DATE 26-05-12  TIME 11:12:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 37;
MEMORY_SIZE	= 1338;
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
   6:  !Attente demande de prise reintro ;
   7:  WAIT (DI[107:Dmd prise reintro]=OFF)    ;
   8:   ;
   9:  !Envoie prise reintro encours ;
  10:  DO[114:Prise reintro encours]=ON ;
  11:   ;
  12:  !Changement prehenseur ;
  13:  IF (GI[3:Num réference]=1),R[11:Choix outil]=(1) ;
  14:   ;
  15:  IF (GI[3:Num réference]=2),R[11:Choix outil]=(2) ;
  16:   ;
  17:  CALL CHGMT_PREHENSEUR    ;
  18:   ;
  19:  !Definition du repere ;
  20:  UFRAME_NUM=3 ;
  21:   ;
  22:  !Calcul point de prise reintro ;
  23:  CALL CALC_002    ;
  24:   ;
  25:  !Remise a zero decallage ;
  26:  CALL RAZPR(100) ;
  27:   ;
  28:  PR[100,3:Offset]=50    ;
  29:J PR[99:Mobil 1] 100% CNT100 Offset,PR[100:Offset]    ;
  30:   ;
  31:  !Ouverture pince ;
  32:  CALL OUV_PINCE    ;
  33:   ;
  34:L PR[99:Mobil 1] 2000mm/sec CNT5 Offset,PR[100:Offset]    ;
  35:   ;
  36:  !Acquitement prise reintro ;
  37:  CALL ACQUIT_REINTRO    ;
/POS
/END
