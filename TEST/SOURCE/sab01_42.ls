/PROG  SAB01_42
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose posage 2";
PROG_SIZE	= 1150;
CREATE		= DATE 26-04-02  TIME 08:58:36;
MODIFIED	= DATE 26-05-29  TIME 16:50:52;
FILE_NAME	= SAB22;
VERSION		= 0;
LINE_COUNT	= 35;
MEMORY_SIZE	= 1526;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
LOCAL_REGISTERS	= 0,0,0;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  !Pose joue+ posage poste 2 ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche posage ;
   8:J P[1:App] R[28:Vitesse joue + P]% CNT25    ;
   9:   ;
  10:J P[2] R[28:Vitesse joue + P]% CNT25    ;
  11:   ;
  12:  !Choix Uframe et Utool ;
  13:  UFRAME_NUM=2 ;
  14:  UTOOL_NUM=1 ;
  15:   ;
  16:  CALL RAZ_PR100    ;
  17:  PR[100,3:Offset]=(-100)    ;
  18:L P[3:Point prise] 1500mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  19:   ;
  20:L P[3:Point prise] 500mm/sec FINE    ;
  21:   ;
  22:  DO[30:Monter changeur]=OFF ;
  23:  WAIT    .20(sec) ;
  24:  CALL OUV_CHANGEUR    ;
  25:   ;
  26:  PR[100,3:Offset]=(-100)    ;
  27:L P[3:Point prise] 500mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  28:   ;
  29:  !Choix Uframe et Utool ;
  30:  UFRAME_NUM=0 ;
  31:  UTOOL_NUM=1 ;
  32:   ;
  33:  !Approche posage ;
  34:J P[1:App] R[25:Vitesse general]% CNT100    ;
  35:   ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   773.505  mm,	Y =   756.200  mm,	Z =   -75.520  mm,
	W =   162.252 deg,	P =    10.676 deg,	R =   153.258 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   908.762  mm,	Y =  1044.087  mm,	Z =  -242.131  mm,
	W =  -179.957 deg,	P =     2.171 deg,	R =   153.675 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 2, UT : 1,	
	J1=    38.021 deg,	J2=    71.314 deg,	J3=   -40.004 deg,
	J4=      .574 deg,	J5=   -50.086 deg,	J6=   145.670 deg
};
/END
