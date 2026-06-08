/PROG  SAB01_71
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Controle stock";
PROG_SIZE	= 862;
CREATE		= DATE 26-05-27  TIME 18:59:26;
MODIFIED	= DATE 26-05-27  TIME 19:01:20;
FILE_NAME	= SAB01_70;
VERSION		= 0;
LINE_COUNT	= 17;
MEMORY_SIZE	= 1166;
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
   1:  !Pose joue sur stock ;
   2:  DO[52:Pose tampon EC]=ON ;
   3:  !Choix Utool et Uframe ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche ;
   8:  R[99]=0.5 ;
   9:J P[1:App] 100% CNT100 ;
  10:  R[99]=1 ;
  11:  R[99]=1.5 ;
  12:J P[3] 100% FINE ;
  13:  R[99]=2 ;
  14:   ;
  15:  !Approche ;
  16:  R[99]=2.5 ;
  17:J P[3] 100% CNT100 ;
  18:  R[99]=3 ;
  19:   ;
  20:  DO[56:Ctrl hauteur tampon]=PULSE,2.0sec ;
  21:  WAIT   2.00(sec) ;
  22:  R[99]=3.5 ;
  23:J P[2] 100% CNT100 ;
  24:  R[99]=4 ;
  25:   ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -642.084  mm,	Y =  1060.018  mm,	Z =   257.197  mm,
	W =  -141.915 deg,	P =    -2.189 deg,	R =    47.868 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1023.078  mm,	Y =   809.668  mm,	Z =   186.000  mm,
	W =   179.825 deg,	P =    -1.082 deg,	R =   -18.432 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1669.407  mm,	Y =  1025.064  mm,	Z =   173.193  mm,
	W =   179.826 deg,	P =    -1.080 deg,	R =   -18.431 deg
};
/END
