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
   8:J P[1:App] 100% CNT100    ;
   9:   ;
  10:  !Approche joue ;
  11:   ;
  12:  !Choix Uframe et Utool ;
  13:  UFRAME_NUM=1 ;
  14:  UTOOL_NUM=2 ;
  15:   ;
  16:J P[2:App] 100% FINE    ;
  17:   ;
  18:  !Cycle cloutage ;
  19:  CALL CALC01_10    ;
  20:   ;
  21:  CALL RAZ_PR100    ;
  22:  R[30:Nombre cloutage]=0    ;
  23:   ;
  24:  LBL[1] ;
  25:  PR[100,3:Offset]=(-30)    ;
  26:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  27:   ;
  28:  PR[100,3:Offset]=0    ;
  29:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  30:  !Pilotage clouteurs ;
  31:  CALL DCY_CLOUEUR    ;
  32:   ;
  33:  PR[100,3:Offset]=(-30)    ;
  34:L P[3:Point cloutage] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  35:   ;
  36:  R[30:Nombre cloutage]=(R[30:Nombre cloutage]+1) ;
  37:   ;
  38:  PR[100,6:Offset]=(PR[100,6:Offset]-R[24:Angle clouage]) ;
  39:   ;
  40:  IF (R[30:Nombre cloutage]<R[29:Consigne cloutag]),JMP LBL[1] ;
  41:   ;
  42:J P[2:App] 100% CNT100    ;
  43:   ;
  44:  !Choix Uframe et Utool ;
  45:  UFRAME_NUM=0 ;
  46:  UTOOL_NUM=2 ;
  47:   ;
  48:  !Approche posage ;
  49:J P[1:App] 100% CNT100    ;
  50:   ;
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
