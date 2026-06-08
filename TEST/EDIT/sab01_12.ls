/PROG  SAB01_12
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Cloutage posage2";
PROG_SIZE	= 1442;
CREATE		= DATE 26-04-02  TIME 08:57:42;
MODIFIED	= DATE 26-05-13  TIME 21:37:32;
FILE_NAME	= SAB11;
VERSION		= 0;
LINE_COUNT	= 53;
MEMORY_SIZE	= 1886;
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
   1:  !Cloutage poste 2 ;
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
  12:  !Approche joue ;
  13:   ;
  14:  !Choix Uframe et Utool ;
  15:  UFRAME_NUM=2 ;
  16:  UTOOL_NUM=2 ;
  17:   ;
  18:  R[99]=1.5 ;
  19:J P[2:App] 100% FINE ;
  20:  R[99]=2 ;
  21:   ;
  22:  !Cycle cloutage ;
  23:   ;
  24:   ;
  25:  CALL CALC01_10 ;
  26:   ;
  27:  CALL RAZ_PR100 ;
  28:  R[30:Nombre cloutage]=0 ;
  29:   ;
  30:  LBL[1] ;
  31:  PR[100,3:Offset]=(-30) ;
  32:  R[99]=2.5 ;
  33:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  34:  R[99]=3 ;
  35:   ;
  36:  PR[100,3:Offset]=0 ;
  37:  R[99]=3.5 ;
  38:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  39:  R[99]=4 ;
  40:   ;
  41:  !Pilotage clouteurs ;
  42:  CALL DCY_CLOUEUR ;
  43:   ;
  44:  PR[100,3:Offset]=(-30) ;
  45:  R[99]=4.5 ;
  46:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  47:  R[99]=5 ;
  48:   ;
  49:  R[30:Nombre cloutage]=(R[30:Nombre cloutage]+1) ;
  50:   ;
  51:  PR[100,6:Offset]=(PR[100,6:Offset]-R[24:Angle clouage]) ;
  52:   ;
  53:  IF (R[30:Nombre cloutage]<R[29:Consigne cloutag]),JMP LBL[1] ;
  54:   ;
  55:  R[99]=5.5 ;
  56:J P[2:App] 100% CNT100 ;
  57:  R[99]=6 ;
  58:   ;
  59:  !Choix Uframe et Utool ;
  60:  UFRAME_NUM=0 ;
  61:  UTOOL_NUM=1 ;
  62:   ;
  63:  !Approche posage ;
  64:  R[99]=6.5 ;
  65:J P[1:App] 100% CNT100 ;
  66:  R[99]=7 ;
  67:   ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1922.978  mm,	Y =  1563.122  mm,	Z =   -54.328  mm,
	W =  -179.532 deg,	P =      .193 deg,	R =  -120.974 deg
};
P[2:"App"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1950.819  mm,	Y =  1510.142  mm,	Z =  -824.233  mm,
	W =  -179.525 deg,	P =      .177 deg,	R =  -118.908 deg
};
P[3:"Point cloutage"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1951.419  mm,	Y =  1510.049  mm,	Z =  -900.000  mm,
	W =  -179.525 deg,	P =      .176 deg,	R =  -118.908 deg
};
/END
