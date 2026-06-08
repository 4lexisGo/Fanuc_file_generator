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
   8:  R[99]=0.5 ;
   9:J P[1:App] 100% CNT100 ;
  10:  R[99]=1 ;
  11:   ;
  12:  !Choix Uframe et Utool ;
  13:  UFRAME_NUM=1 ;
  14:  UTOOL_NUM=1 ;
  15:   ;
  16:  CALL RAZ_PR100 ;
  17:  PR[100,3:Offset]=(-50) ;
  18:  R[99]=1.5 ;
  19:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  20:  R[99]=2 ;
  21:   ;
  22:  CALL OUV_CHANGEUR ;
  23:  DO[30:Monter changeur]=OFF ;
  24:   ;
  25:  R[99]=2.5 ;
  26:L P[3:Point prise] 2000mm/sec FINE ;
  27:  R[99]=3 ;
  28:  CALL FERM_CHANGEUR ;
  29:   ;
  30:  PR[100,3:Offset]=(-200) ;
  31:  R[99]=3.5 ;
  32:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  33:  R[99]=4 ;
  34:   ;
  35:  !Choix Uframe et Utool ;
  36:  UFRAME_NUM=0 ;
  37:  UTOOL_NUM=1 ;
  38:   ;
  39:  !Approche posage ;
  40:  R[99]=4.5 ;
  41:J P[1:App] 100% CNT100 ;
  42:  R[99]=5 ;
  43:   ;
  44:   ;
  45:  R[99]=5.5 ;
  46:J P[2] 100% CNT25 ;
  47:  R[99]=6 ;
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
