   0:/PROG  SAB01_20+
   1:/ATTR+
   2:OWNER		= MNEDITOR;+
   3:COMMENT		= "Prise reintro";+
   4:PROG_SIZE	= 946;+
   5:CREATE		= DATE 26-05-11  TIME 14:41:34;+
   6:MODIFIED	= DATE 26-05-12  TIME 11:12:34;+
   7:FILE_NAME	= ;+
   8:VERSION		= 0;+
   9:LINE_COUNT	= 37;+
  10:MEMORY_SIZE	= 1338;+
  11:PROTECT		= READ_WRITE;+
  12:TCD:  STACK_SIZE	= 0,+
  13:TASK_PRIORITY	= 50,+
  14:TIME_SLICE	= 0,+
  15:BUSY_LAMP_OFF	= 0,+
  16:ABORT_REQUEST	= 0,+
  17:PAUSE_REQUEST	= 0;+
  18:DEFAULT_GROUP	= 1,*,*,*,*;+
  19:CONTROL_CODE	= 00000000 00000000;+
  20:/APPL+
  21:/MN+
  22:1:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;+
  23:2:  !!!Programme de prise piece sur!! ;+
  24:3:  !!!!!!!!la reintroduction!!!!!!!! ;+
  25:4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;+
  26:5:   ;+
  27:6:  !Attente demande de prise reintro ;+
  28:7:  WAIT (DI[107:Dmd prise reintro]=OFF)    ;+
  29:8:   ;+
  30:9:  !Envoie prise reintro encours ;+
  31:10:  DO[114:Prise reintro encours]=ON ;+
  32:11:   ;+
  33:12:  !Changement prehenseur ;+
  34:13:  IF (GI[3:Num réference]=1),R[11:Choix outil]=(1) ;+
  35:14:   ;+
  36:15:  IF (GI[3:Num réference]=2),R[11:Choix outil]=(2) ;+
  37:16:   ;+
  38:17:  CALL CHGMT_PREHENSEUR    ;+
  39:18:   ;+
  40:19:  !Definition du repere ;+
  41:20:  UFRAME_NUM=3 ;+
  42:21:   ;+
  43:22:  !Calcul point de prise reintro ;+
  44:23:  CALL CALC_002    ;+
  45:24:   ;+
  46:25:  !Remise a zero decallage ;+
  47:26:  CALL RAZPR(100) ;+
  48:27:   ;+
  49:28:  PR[100,3:Offset]=50    ;+
  50:29:J PR[99:Mobil 1] 100% CNT100 Offset,PR[100:Offset]    ;+
  51:30:   ;+
  52:31:  !Ouverture pince ;+
  53:32:  CALL OUV_PINCE    ;+
  54:33:   ;+
  55:34:L PR[99:Mobil 1] 2000mm/sec CNT5 Offset,PR[100:Offset]    ;+
  56:35:   ;+
  57:36:  !Acquitement prise reintro ;+
  58:37:  CALL ACQUIT_REINTRO    ;+
  59:/POS+
  60:/END+
