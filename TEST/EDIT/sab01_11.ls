/PROG  SAB01_11
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Cloutage posage1";
PROG_SIZE	= 1388;
CREATE		= DATE 26-04-02  TIME 08:57:02;
MODIFIED	= DATE 26-05-13  TIME 21:37:28;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 50;
MEMORY_SIZE	= 1844;
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
   1:  !Cloutage poste 1 ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=2 ;
   6:   ;
   7:  !Approche posage ;
   8:  R[99]=0.5 ;
   9:J P[1:App] 100% CNT100 ;
  10:  R[99]=1 ;
  11:   ;
  12:  !Approche joue ;
  13:   ;
  14:  !Choix Uframe et Utool ;
  15:  UFRAME_NUM=1 ;
  16:  UTOOL_NUM=2 ;
  17:   ;
  18:  R[99]=1.5 ;
  19:J P[2:App] 100% FINE ;
  20:  R[99]=2 ;
  21:   ;
  22:  !Cycle cloutage ;
  23:  CALL CALC01_10 ;
  24:   ;
  25:  CALL RAZ_PR100 ;
  26:  R[30:Nombre cloutage]=0 ;
  27:   ;
  28:  LBL[1] ;
  29:  PR[100,3:Offset]=(-30) ;
  30:  R[99]=2.5 ;
  31:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  32:  R[99]=3 ;
  33:   ;
  34:  PR[100,3:Offset]=0 ;
  35:  R[99]=3.5 ;
  36:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  37:  R[99]=4 ;
  38:  !Pilotage clouteurs ;
  39:  CALL DCY_CLOUEUR ;
  40:   ;
  41:  PR[100,3:Offset]=(-30) ;
  42:  R[99]=4.5 ;
  43:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  44:  R[99]=5 ;
  45:   ;
  46:  R[30:Nombre cloutage]=(R[30:Nombre cloutage]+1) ;
  47:   ;
  48:  PR[100,6:Offset]=(PR[100,6:Offset]-R[24:Angle clouage]) ;
  49:   ;
  50:  IF (R[30:Nombre cloutage]<R[29:Consigne cloutag]),JMP LBL[1] ;
  51:   ;
  52:  R[99]=5.5 ;
  53:J P[2:App] 100% CNT100 ;
  54:  R[99]=6 ;
  55:   ;
  56:  !Choix Uframe et Utool ;
  57:  UFRAME_NUM=0 ;
  58:  UTOOL_NUM=2 ;
  59:   ;
  60:  !Approche posage ;
  61:  R[99]=6.5 ;
  62:J P[1:App] 100% CNT100 ;
  63:  R[99]=7 ;
  64:   ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =   887.341  mm,	Y =   226.812  mm,	Z =  -520.806  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =  -166.268 deg
};
P[2:"App"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2323.835  mm,	Y =  -559.044  mm,	Z =  -213.193  mm,
	W =  -179.453 deg,	P =      .054 deg,	R =  -135.609 deg
};
P[3:"Point cloutage"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2325.081  mm,	Y =  -560.086  mm,	Z =  -390.000  mm,
	W =  -179.453 deg,	P =      .054 deg,	R =  -135.609 deg
};
/END
