/PROG  SAB01_70
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose piece prele";
PROG_SIZE	= 1167;
CREATE		= DATE 26-05-12  TIME 09:32:42;
MODIFIED	= DATE 26-05-12  TIME 16:05:16;
FILE_NAME	= SAB01_60;
VERSION		= 0;
LINE_COUNT	= 33;
MEMORY_SIZE	= 1559;
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
/APPL
/MN
   1:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   2:  !!!!!!!!Programme de pose!!!!!!!! ;
   3:  !dans la goulotte de prelevement! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  !Attente demande de pose prelev ;
   7:  WAIT (DI[106:Dmd pose goulotte]=ON)    ;
   8:   ;
   9:  !Envoie pose prelevement encours ;
  10:  DO[112:Pose goulotte encours]=ON ;
  11:   ;
  12:  !Definition du repere ;
  13:  UFRAME_NUM=6 ;
  14:   ;
  15:  !Remise a zero decallage ;
  16:  CALL RAZPR(100) ;
  17:   ;
  18:  PR[100,3:Offset]=50    ;
  19:J P[1:Pose goulotte] 100% CNT100 Offset,PR[100:Offset]    ;
  20:   ;
  21:L P[1:Pose goulotte] 2000mm/sec CNT0    ;
  22:   ;
  23:  !Fermeture pince ;
  24:  CALL FERM_PINCE    ;
  25:   ;
  26:J P[1:Pose goulotte] 100% CNT100 Offset,PR[100:Offset]    ;
  27:   ;
  28:  !Acquit pose goulotte prelevement ;
  29:  CALL ACQUIT_POSE_PRELEV    ;
  30:   ;
  31:   ;
  32:   ;
  33:   ;
/POS
P[1:"Pose goulotte"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
