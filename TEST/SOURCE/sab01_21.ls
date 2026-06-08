/PROG  SAB01_21
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise posage 1";
PROG_SIZE	= 1174;
CREATE		= DATE 26-04-02  TIME 08:57:56;
MODIFIED	= DATE 26-05-29  TIME 16:50:20;
FILE_NAME	= SAB11;
VERSION		= 0;
LINE_COUNT	= 35;
MEMORY_SIZE	= 1558;
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
   1:  !Prise joue+ posage poste 1 ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche posage ;
   8:J P[1:App] 100% CNT100    ;
   9:   ;
  10:  !Choix Uframe et Utool ;
  11:  UFRAME_NUM=1 ;
  12:  UTOOL_NUM=1 ;
  13:   ;
  14:  CALL RAZ_PR100    ;
  15:  PR[100,3:Offset]=(-50)    ;
  16:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  17:   ;
  18:  CALL OUV_CHANGEUR    ;
  19:  DO[30:Monter changeur]=OFF ;
  20:   ;
  21:L P[3:Point prise] 2000mm/sec FINE    ;
  22:  CALL FERM_CHANGEUR    ;
  23:   ;
  24:  PR[100,3:Offset]=(-200)    ;
  25:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  26:   ;
  27:  !Choix Uframe et Utool ;
  28:  UFRAME_NUM=0 ;
  29:  UTOOL_NUM=1 ;
  30:   ;
  31:  !Approche posage ;
  32:J P[1:App] 100% CNT100    ;
  33:   ;
  34:   ;
  35:J P[2] 100% CNT25    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2333.720  mm,	Y =  -556.424  mm,	Z =     7.915  mm,
	W =   179.562 deg,	P =      .491 deg,	R =   107.272 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1096.801  mm,	Y =  -133.611  mm,	Z =   -66.751  mm,
	W =   174.861 deg,	P =    19.546 deg,	R =   148.100 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2324.165  mm,	Y =  -557.613  mm,	Z =  -369.343  mm,
	W =   179.855 deg,	P =      .317 deg,	R =   107.274 deg
};
/END
