/PROG  SAB01_50
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose piece bac";
PROG_SIZE	= 1139;
CREATE		= DATE 26-05-12  TIME 09:32:06;
MODIFIED	= DATE 26-05-12  TIME 11:01:06;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 31;
MEMORY_SIZE	= 1419;
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
   2:  !!!Programme de pose piece dans!! ;
   3:  !!!!!!!!!!!!!!le bac!!!!!!!!!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  !Attente demande de pose ;
   7:  !dans le bac ;
   8:  WAIT (DI[103:Dmd pose bac]=ON)    ;
   9:   ;
  10:  !Envoie pose bac encours ;
  11:  DO[106:Pose bac encours]=ON ;
  12:   ;
  13:  !Definition du repere ;
  14:  UFRAME_NUM=5 ;
  15:   ;
  16:  !Point de mesure telemetre ;
  17:J P[1:Ctrl telemetre] 100% FINE    ;
  18:   ;
  19:  !Calcul point de pose bac ;
  20:  CALL CALC_005    ;
  21:   ;
  22:  !Remise a zero decallage ;
  23:  CALL RAZPR(100) ;
  24:   ;
  25:L PR[99:Mobil 1] 2000mm/sec CNT0    ;
  26:  !Fermeture pince ;
  27:  CALL FERM_CHANGEUR    ;
  28:   ;
  29:J P[1:Ctrl telemetre] 100% CNT100    ;
  30:  !Acquitement pose bac ;
  31:  CALL ACQUIT_POSE    ;
/POS
P[1:"Ctrl telemetre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
