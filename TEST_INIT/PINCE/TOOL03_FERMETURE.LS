/PROG  TOOL03_FERMETURE	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Fermeture verin";
PROG_SIZE	= 1006;
CREATE		= DATE 25-04-30  TIME 08:28:46;
MODIFIED	= DATE 25-10-14  TIME 17:32:38;
FILE_NAME	= TOOL02_A;
VERSION		= 0;
LINE_COUNT	= 41;
MEMORY_SIZE	= 1506;
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
   2:  !!!!!Programme de fermeture!!!!!! ;
   3:  !!!!des pinces du prehenseur!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  LBL[1] ;
   7:   ;
   8:  !Si mauvaise prise ;
   9:  IF R[82:Probleme prise]=1,JMP LBL[99] ;
  10:   ;
  11:  !Reglage du TIMEOUT ;
  12:  $WAITTMOUT=1000 ;
  13:   ;
  14:  !RAZ demande fermeture pince ;
  15:  DO[87:OFF:Ouverture Pince]=OFF ;
  16:   ;
  17:  !Envoie demande fermeture pince ;
  18:  DO[88:OFF:Fermeture Pince]=ON ;
  19:   ;
  20:  !Attente fermeture pince OK ;
  21:  WAIT DI[88:OFF:Fermeture P OK]=ON TIMEOUT,LBL[10] ;
  22:   ;
  23:  !Arret pilotage fermeture pour ;
  24:  !Activation Bloquage ;
  25:  DO[88:OFF:Fermeture Pince]=OFF ;
  26:   ;
  27:  JMP LBL[2] ;
  28:   ;
  29:  LBL[10] ;
  30:  GO[1:0:Alarme]=22 ;
  31:  R[82:Probleme prise]=1    ;
  32:  JMP LBL[1] ;
  33:   ;
  34:   ;
  35:  LBL[2] ;
  36:   ;
  37:  !Memo piece dans pince ;
  38:  R[52:Piece embarque]=1    ;
  39:   ;
  40:  LBL[99] ;
  41:  IF (GO[1:0:Alarme]=22),GO[1:0:Alarme]=(0) ;
/POS
/END
