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
   8:J P[1:App] 100% CNT100    ;
   9:   ;
  10:  !Approche joue ;
  11:   ;
  12:  !Choix Uframe et Utool ;
  13:  UFRAME_NUM=2 ;
  14:  UTOOL_NUM=2 ;
  15:   ;
  16:J P[2:App] 100% FINE    ;
  17:   ;
  18:  !Cycle cloutage ;
  19:   ;
  20:   ;
  21:  CALL CALC01_10    ;
  22:   ;
  23:  CALL RAZ_PR100    ;
  24:  R[30:Nombre cloutage]=0    ;
  25:   ;
  26:  LBL[1] ;
  27:  PR[100,3:Offset]=(-30)    ;
  28:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  29:   ;
  30:  PR[100,3:Offset]=0    ;
  31:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  32:   ;
  33:  !Pilotage clouteurs ;
  34:  CALL DCY_CLOUEUR    ;
  35:   ;
  36:  PR[100,3:Offset]=(-30)    ;
  37:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  38:   ;
  39:  R[30:Nombre cloutage]=(R[30:Nombre cloutage]+1) ;
  40:   ;
  41:  PR[100,6:Offset]=(PR[100,6:Offset]-R[24:Angle clouage]) ;
  42:   ;
  43:  IF (R[30:Nombre cloutage]<R[29:Consigne cloutag]),JMP LBL[1] ;
  44:   ;
  45:J P[2:App] 100% CNT100    ;
  46:   ;
  47:  !Choix Uframe et Utool ;
  48:  UFRAME_NUM=0 ;
  49:  UTOOL_NUM=1 ;
  50:   ;
  51:  !Approche posage ;
  52:J P[1:App] 100% CNT100    ;
  53:   ;
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
