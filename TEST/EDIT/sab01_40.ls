/PROG  SAB01_40
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose posage";
PROG_SIZE	= 971;
CREATE		= DATE 26-04-02  TIME 08:58:20;
MODIFIED	= DATE 26-05-28  TIME 21:16:48;
FILE_NAME	= SAB20;
VERSION		= 0;
LINE_COUNT	= 27;
MEMORY_SIZE	= 1251;
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
   1:  !Pose joue + posage ;
   2:  DO[46:Pose pos + joue EC]=ON ;
   3:   ;
   4:  !Choix Uframe et Utool ;
   5:  UFRAME_NUM=0 ;
   6:  UTOOL_NUM=1 ;
   7:   ;
   8:  !Approche ;
   9:   ;
  10:  R[99]=0.5 ;
  11:J P[2:Approche 2] R[28:Vitesse joue + P]% CNT100 ;
  12:  R[99]=1 ;
  13:   ;
  14:  R[20:Num posage]=GI[3:Num posage] ;
  15:   ;
  16:  SELECT R[20:Num posage]=1,CALL SAB01_41 ;
  17:  =2,CALL SAB01_42 ;
  18:   ;
  19:   ;
  20:  !Choix Uframe et Utool ;
  21:  UFRAME_NUM=0 ;
  22:  UTOOL_NUM=1 ;
  23:   ;
  24:  !Approche ;
  25:  R[99]=1.5 ;
  26:J P[1:Approche 1] 100% CNT100 ;
  27:  R[99]=2 ;
  28:   ;
  29:  DO[46:Pose pos + joue EC]=OFF ;
  30:  DO[47:Fin pose pos + joue]=PULSE,0.5sec ;
  31:  R[33:Joue dans pince ]=0 ;
/POS
P[1:"Approche 1"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1019.461  mm,	Y =    -5.331  mm,	Z =   -22.111  mm,
	W =   178.089 deg,	P =      .708 deg,	R =    63.066 deg
};
P[2:"Approche 2"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   736.155  mm,	Y =  -792.617  mm,	Z =   -75.502  mm,
	W =   175.527 deg,	P =    20.153 deg,	R =   108.936 deg
};
/END
