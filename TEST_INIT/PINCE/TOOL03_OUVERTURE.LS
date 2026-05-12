/PROG  TOOL03_OUVERTURE	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Ouverture verin";
PROG_SIZE	= 752;
CREATE		= DATE 25-04-30  TIME 08:28:58;
MODIFIED	= DATE 25-10-14  TIME 17:41:32;
FILE_NAME	= TOOL03_F;
VERSION		= 0;
LINE_COUNT	= 24;
MEMORY_SIZE	= 1028;
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
   2:  !Programme d'ouverture des pinces ;
   3:  !!!!!!du prehenseur thermo!!!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  !RAZ demande ouverture pince ;
   7:  DO[88:OFF:Fermeture Pince]=OFF ;
   8:   ;
   9:  !Envoie demande ouverture pince ;
  10:  DO[87:OFF:Ouverture Pince]=ON ;
  11:   ;
  12:  !Attente ouverture pince OK ;
  13:  WAIT (DI[87:OFF:Ouverture P OK]=ON)    ;
  14:   ;
  15:  !Arret pilotage fermeture pour ;
  16:  !Activation Bloquage ;
  17:  DO[87:OFF:Ouverture Pince]=OFF ;
  18:   ;
  19:   ;
  20:  !Mise memo thermo dans pince ;
  21:  R[52:Piece embarque]=0    ;
  22:   ;
  23:  !Remise du tool sans piece ;
  24:  PAYLOAD[3] ;
/POS
/END
