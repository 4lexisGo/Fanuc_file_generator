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
   8:  R[99]=0.5 ;
   9:J P[2:App 1] R[28:Vitesse joue + P]% CNT100 ;
  10:  R[99]=1 ;
  11:   ;
  12:  !Choix Uframe et Utool ;
  13:  UFRAME_NUM=3 ;
  14:  UTOOL_NUM=1 ;
  15:   ;
  16:  CALL RAZ_PR100 ;
  17:   ;
  18:  CALL CALC01_30 ;
  19:   ;
  20:  !Approche ;
  21:  PR[100,1:Offset]=(-800) ;
  22:  R[99]=1.5 ;
  23:L PR[99:PR mobil] 1500mm/sec FINE Offset,PR[100:Offset] ;
  24:  R[99]=2 ;
  25:   ;
  26:  !Entame ;
  27:  PR[100,1:Offset]=(0) ;
  28:  R[99]=2.5 ;
  29:L PR[99:PR mobil] R[26:Vitesse entame]mm/sec FINE Offset,PR[100:Offset] ;
  30:  R[99]=3 ;
  31:  WAIT    .20(sec) ;
  32:   ;
  33:  !Rotation ;
  34:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+120) ;
  35:  R[99]=3.5 ;
  36:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec CNT100 Offset,PR[100:Offset] ACC30 ;
  37:  R[99]=4 ;
  38:   ;
  39:  !Rotation ;
  40:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+120) ;
  41:  R[99]=4.5 ;
  42:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec CNT100 Offset,PR[100:Offset] ;
  43:  R[99]=5 ;
  44:   ;
  45:  !Rotation ;
  46:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+130) ;
  47:  R[99]=5.5 ;
  48:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec FINE Offset,PR[100:Offset] ;
  49:  R[99]=6 ;
  50:   ;
  51:  PR[100,2:Offset]=(PR[100,2:Offset]+100) ;
  52:  R[99]=6.5 ;
  53:L PR[99:PR mobil] R[26:Vitesse entame]mm/sec FINE Offset,PR[100:Offset] ;
  54:  R[99]=7 ;
  55:   ;
  56:  PR[100,1:Offset]=(-800) ;
  57:  R[99]=7.5 ;
  58:L PR[99:PR mobil] 500mm/sec FINE Offset,PR[100:Offset] ;
  59:  R[99]=8 ;
  60:   ;
  61:  !Choix Uframe et Utool ;
  62:  UFRAME_NUM=0 ;
  63:  UTOOL_NUM=1 ;
  64:   ;
  65:  !Approche scie ;
  66:  R[99]=8.5 ;
  67:J P[2:App 1] R[28:Vitesse joue + P]% CNT25 ;
  68:  R[99]=9 ;
  69:   ;
  70:  R[99]=9.5 ;
  71:J P[3] R[28:Vitesse joue + P]% CNT25 ;
  72:  R[99]=10 ;
  73:   ;
  74:  DO[44:Sciage EC]=OFF ;
  75:  DO[45:Fin sciage]=PULSE,0.5sec ;
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
