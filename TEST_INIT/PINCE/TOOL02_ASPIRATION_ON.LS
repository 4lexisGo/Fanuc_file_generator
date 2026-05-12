/PROG  TOOL02_ASPIRATION_ON	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Aspiration ON";
PROG_SIZE	= 690;
CREATE		= DATE 25-04-30  TIME 08:28:16;
MODIFIED	= DATE 25-07-31  TIME 15:38:40;
FILE_NAME	= TOOL01_S;
VERSION		= 0;
LINE_COUNT	= 25;
MEMORY_SIZE	= 1126;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/MN
   1:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   2:  !!!!!!Activation aspiration!!!!!! ;
   3:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   4:   ;
   5:  !Timer alarme ;
   6:  $WAITTMOUT=500 ;
   7:   ;
   8:  !RAZ Probleme aspiration ;
   9:  R[81:Probleme d'aspi]=0    ;
  10:   ;
  11:  !Mise a on aspiration ;
  12:  DO[81:OFF:Dmd STOP Aspiration]=OFF ;
  13:   ;
  14:  !Attente aspiration OK ;
  15:  WAIT DI[81:OFF:Aspiration OK]=ON TIMEOUT,LBL[10] ;
  16:   ;
  17:  JMP LBL[99] ;
  18:   ;
  19:  LBL[10] ;
  20:  !Alarme: probleme aspiration ;
  21:  R[81:Probleme d'aspi]=1    ;
  22:   ;
  23:   ;
  24:  LBL[99] ;
  25:  R[52:Piece embarque]=1    ;
/POS
/END
