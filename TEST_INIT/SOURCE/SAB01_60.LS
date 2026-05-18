/PROG  SAB01_60
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose piece rebut";
PROG_SIZE	= 1051;
CREATE		= DATE 26-05-12  TIME 09:32:34;
MODIFIED	= DATE 26-05-12  TIME 15:45:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 27;
MEMORY_SIZE	= 1339;
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
   2:  !!!!!!!!Programme de pose!!!!!!!! ;
   3:  !!!!!!!!rebut dans le bac!!!!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  !Attente demande de pose rebut ;
   7:  WAIT (DI[105:Dmd pose rebut]=ON)    ;
   8:  !Envoie pose bac rebut encours ;
   9:  DO[110:Pose rebut encours]=ON ;
  10:   ;
  11:  !Definition du repere ;
  12:  UFRAME_NUM=2 ;
  13:   ;
  14:  !Remise a zero decallage ;
  15:  CALL RAZPR(100) ;
  16:   ;
  17:J P[1:Pose rebut] 100% CNT100 Offset,PR[100:Offset]    ;
  18:   ;
  19:L P[1:Pose rebut] 2000mm/sec CNT10    ;
  20:   ;
  21:  !Fermeture pince ;
  22:  CALL FERM_PINCE    ;
  23:   ;
  24:J P[1:Pose rebut] 100% CNT100 Offset,PR[100:Offset]    ;
  25:   ;
  26:  !Acquitement pose rebut ;
  27:  CALL ACQUIT_POSE_REBUT    ;
/POS
P[1:"Pose rebut"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
