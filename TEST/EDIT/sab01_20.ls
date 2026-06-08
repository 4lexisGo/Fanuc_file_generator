/PROG  SAB01_20
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise posage";
PROG_SIZE	= 1023;
CREATE		= DATE 26-04-02  TIME 08:57:50;
MODIFIED	= DATE 26-05-28  TIME 21:16:36;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 30;
MEMORY_SIZE	= 1431;
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
   1:  !Prise joue + posage ;
   2:  DO[42:Prise pos + joue EC]=ON ;
   3:  !Choix prehenseur ;
   4:  R[31:Dmd outil]=0 ;
   5:  CALL SAB900 ;
   6:   ;
   7:  LBL[1] ;
   8:  !Choix Uframe et Utool ;
   9:  UFRAME_NUM=0 ;
  10:  UTOOL_NUM=1 ;
  11:   ;
  12:  !Approche ;
  13:  R[99]=0.5 ;
  14:J P[1:Approche 1] 100% CNT100 ;
  15:  R[99]=1 ;
  16:   ;
  17:  R[20:Num posage]=GI[3:Num posage] ;
  18:   ;
  19:  SELECT R[20:Num posage]=1,CALL SAB01_21 ;
  20:  =2,CALL SAB01_22 ;
  21:   ;
  22:  IF (R[20:Num posage]=0),JMP LBL[1] ;
  23:   ;
  24:  !Choix Uframe et Utool ;
  25:  UFRAME_NUM=0 ;
  26:  UTOOL_NUM=1 ;
  27:   ;
  28:  !Approche ;
  29:  R[99]=1.5 ;
  30:J P[2:Approche 1] R[28:Vitesse joue + P]% CNT100 ;
  31:  R[99]=2 ;
  32:  DO[42:Prise pos + joue EC]=OFF ;
  33:  DO[43:Fin Prise]=PULSE,0.5sec ;
  34:  R[33:Joue dans pince ]=1 ;
/POS
P[1:"Approche 1"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   922.728  mm,	Y =   508.356  mm,	Z =    32.999  mm,
	W =   179.854 deg,	P =      .317 deg,	R =   107.274 deg
};
P[2:"Approche 1"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -845.838  mm,	Y =  -732.213  mm,	Z =   -69.541  mm,
	W =   176.629 deg,	P =    20.004 deg,	R =    18.132 deg
};
/END
