/PROG  SAB01_30
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Sciage";
PROG_SIZE	= 1435;
CREATE		= DATE 26-04-02  TIME 08:58:12;
MODIFIED	= DATE 26-05-27  TIME 18:40:08;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 55;
MEMORY_SIZE	= 1731;
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
   1:  !Sciage ;
   2:  DO[44:Sciage EC]=ON ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche scie ;
   8:J P[2:App 1] R[28:Vitesse joue + P]% CNT100    ;
   9:   ;
  10:  !Choix Uframe et Utool ;
  11:  UFRAME_NUM=3 ;
  12:  UTOOL_NUM=1 ;
  13:   ;
  14:  CALL RAZ_PR100    ;
  15:   ;
  16:  CALL CALC01_30    ;
  17:   ;
  18:  !Approche ;
  19:  PR[100,1:Offset]=(-800)    ;
  20:L PR[99:PR mobil] 1500mm/sec FINE Offset,PR[100:Offset]    ;
  21:   ;
  22:  !Entame ;
  23:  PR[100,1:Offset]=(0) ;
  24:L PR[99:PR mobil] R[26:Vitesse entame]mm/sec FINE Offset,PR[100:Offset]    ;
  25:  WAIT    .20(sec) ;
  26:   ;
  27:  !Rotation ;
  28:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+120) ;
  29:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec CNT100 Offset,PR[100:Offset] ACC30    ;
  30:   ;
  31:  !Rotation ;
  32:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+120) ;
  33:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec CNT100 Offset,PR[100:Offset]    ;
  34:   ;
  35:  !Rotation ;
  36:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+130) ;
  37:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec FINE Offset,PR[100:Offset]    ;
  38:   ;
  39:  PR[100,2:Offset]=(PR[100,2:Offset]+100) ;
  40:L PR[99:PR mobil] R[26:Vitesse entame]mm/sec FINE Offset,PR[100:Offset]    ;
  41:   ;
  42:  PR[100,1:Offset]=(-800)    ;
  43:L PR[99:PR mobil] 500mm/sec FINE Offset,PR[100:Offset]    ;
  44:   ;
  45:  !Choix Uframe et Utool ;
  46:  UFRAME_NUM=0 ;
  47:  UTOOL_NUM=1 ;
  48:   ;
  49:  !Approche scie ;
  50:J P[2:App 1] R[28:Vitesse joue + P]% CNT25    ;
  51:   ;
  52:J P[3] R[28:Vitesse joue + P]% CNT25    ;
  53:   ;
  54:  DO[44:Sciage EC]=OFF ;
  55:  DO[45:Fin sciage]=PULSE,0.5sec ;
/POS
P[2:"App 1"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1438.636  mm,	Y =  -679.878  mm,	Z =  -167.792  mm,
	W =   179.691 deg,	P =     -.160 deg,	R =    10.332 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -830.607  mm,	Y =  -690.699  mm,	Z =   -81.690  mm,
	W =   175.962 deg,	P =    19.885 deg,	R =    16.177 deg
};
/END
