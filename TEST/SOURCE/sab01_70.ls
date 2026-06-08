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
   1:  !Pose joue sur stock      ;
   2:  DO[52:Pose tampon EC]=ON ;
   3:  !Choix Utool et Uframe ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche ;
   8:J P[1:App] 100% CNT100    ;
   9:J P[3] 100% FINE    ;
  10:  !Choix Utool et Uframe ;
  11:  UFRAME_NUM=5 ;
  12:  UTOOL_NUM=3 ;
  13:   ;
  14:  !Raz PR100 ;
  15:  CALL RAZ_PR100    ;
  16:   ;
  17:  CALL CALC01_70    ;
  18:   ;
  19:  PR[100,3:Offset]=(-100)    ;
  20:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  21:   ;
  22:L PR[99:PR mobil] 1000mm/sec FINE    ;
  23:  CALL OUV_PINCE    ;
  24:   ;
  25:  PR[100,2:Offset]=(-10)    ;
  26:  PR[100,3:Offset]=0    ;
  27:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  28:   ;
  29:  PR[100,3:Offset]=(-100)    ;
  30:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  31:   ;
  32:   ;
  33:  !Choix Utool et Uframe ;
  34:  UFRAME_NUM=0 ;
  35:  UTOOL_NUM=1 ;
  36:   ;
  37:  !Approche ;
  38:J P[3] 100% CNT100    ;
  39:   ;
  40:  DO[16:Dde activ télémètre]=ON ;
  41:  DO[56:Ctrl hauteur tampon]=PULSE,2.0sec ;
  42:  WAIT   2.00(sec) ;
  43:J P[2] 100% CNT100    ;
  44:   ;
  45:  R[34:Nombre joue stok]=R[34:Nombre joue stok]+1    ;
  46:  DO[52:Pose tampon EC]=OFF ;
  47:  DO[53:Fin pose tampon]=PULSE,0.5sec ;
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
