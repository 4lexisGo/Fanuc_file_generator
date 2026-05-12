/PROG  TOOL02_ASPIRATION_OFF	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Aspiration OFF";
PROG_SIZE	= 950;
CREATE		= DATE 25-04-30  TIME 08:28:26;
MODIFIED	= DATE 25-09-19  TIME 16:43:44;
FILE_NAME	= TOOL02_A;
VERSION		= 0;
LINE_COUNT	= 36;
MEMORY_SIZE	= 1470;
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
   2:  !!!!!Programme de coupure de!!!!! ;
   3:  !!!!!!!!!!l'aspiration!!!!!!!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  LBL[1] ;
   7:  !Timer alarme ;
   8:  $WAITTMOUT=500 ;
   9:   ;
  10:  !Desactivation aspiration ;
  11:  DO[81:OFF:Dmd STOP Aspiration]=ON ;
  12:   ;
  13:  !Soufflage aspiration ;
  14:  DO[82:OFF:Soufflage aspira]=PULSE,10.0sec ;
  15:  WAIT    .50(sec) ;
  16:   ;
  17:  !Attente aspiration OK a OFF ;
  18:  WAIT DI[81:OFF:Aspiration OK]=OFF TIMEOUT,LBL[10] ;
  19:   ;
  20:  JMP LBL[99] ;
  21:   ;
  22:  LBL[10] ;
  23:  !Alarme: aspiration non coupee ;
  24:  GO[1:0:Alarme]=21 ;
  25:  JMP LBL[1] ;
  26:   ;
  27:  LBL[99] ;
  28:  //DO[82:OFF:Soufflage aspira]=OFF ;
  29:  !Auto acquitement alarme ;
  30:  IF (GO[1:0:Alarme]=21),GO[1:0:Alarme]=(0) ;
  31:   ;
  32:  !RAZ memo piece sur ventouse ;
  33:  R[52:Piece embarque]=0    ;
  34:   ;
  35:  !Remise du tool sans piece ;
  36:  PAYLOAD[2] ;
/POS
/END
