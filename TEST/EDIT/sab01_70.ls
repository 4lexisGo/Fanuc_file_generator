/PROG  SAB01_70
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose sur stock";
PROG_SIZE	= 1328;
CREATE		= DATE 26-04-02  TIME 08:59:18;
MODIFIED	= DATE 26-05-28  TIME 23:41:08;
FILE_NAME	= SAB60;
VERSION		= 0;
LINE_COUNT	= 47;
MEMORY_SIZE	= 1664;
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
  14:  !Choix Utool et Uframe ;
  15:  UFRAME_NUM=5 ;
  16:  UTOOL_NUM=3 ;
  17:   ;
  18:  !Raz PR100 ;
  19:  CALL RAZ_PR100 ;
  20:   ;
  21:  CALL CALC01_70 ;
  22:   ;
  23:  PR[100,3:Offset]=(-100) ;
  24:  R[99]=2.5 ;
  25:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  26:  R[99]=3 ;
  27:   ;
  28:  R[99]=3.5 ;
  29:L PR[99:PR mobil] 1000mm/sec FINE ;
  30:  R[99]=4 ;
  31:  CALL OUV_PINCE ;
  32:   ;
  33:  PR[100,2:Offset]=(-10) ;
  34:  PR[100,3:Offset]=0 ;
  35:  R[99]=4.5 ;
  36:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  37:  R[99]=5 ;
  38:   ;
  39:  PR[100,3:Offset]=(-100) ;
  40:  R[99]=5.5 ;
  41:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  42:  R[99]=6 ;
  43:   ;
  44:   ;
  45:  !Choix Utool et Uframe ;
  46:  UFRAME_NUM=0 ;
  47:  UTOOL_NUM=1 ;
  48:   ;
  49:  !Approche ;
  50:  R[99]=6.5 ;
  51:J P[3] 100% CNT100 ;
  52:  R[99]=7 ;
  53:   ;
  54:  DO[16:Dde activ télémètre]=ON ;
  55:  DO[56:Ctrl hauteur tampon]=PULSE,2.0sec ;
  56:  WAIT   2.00(sec) ;
  57:  R[99]=7.5 ;
  58:J P[2] 100% CNT100 ;
  59:  R[99]=8 ;
  60:   ;
  61:  R[34:Nombre joue stok]=R[34:Nombre joue stok]+1 ;
  62:  DO[52:Pose tampon EC]=OFF ;
  63:  DO[53:Fin pose tampon]=PULSE,0.5sec ;
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
