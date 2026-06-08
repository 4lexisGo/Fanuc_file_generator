/PROG  CALC01_70
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 714;
CREATE		= DATE 26-05-11  TIME 16:41:24;
MODIFIED	= DATE 26-05-11  TIME 18:57:14;
FILE_NAME	= CALC01_3;
VERSION		= 0;
LINE_COUNT	= 12;
MEMORY_SIZE	= 1170;
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
   1:  !Calcul offset pour cloutage ;
   2:  JMP LBL[1] ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=5 ;
   5:  UTOOL_NUM=3 ;
   6:   ;
   7:J P[1] 100% FINE    ;
   8:  LBL[1] ;
   9:   ;
  10:  PR[99:PR mobil]=P[1]    ;
  11:   ;
  12:  PR[99,3:PR mobil]=(PR[99,3:PR mobil]+(R[22:Epaiseur joue]*R[34:Nombre joue stok])) ;
/POS
P[1]{
   GP1:
	UF : 5, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X = -1833.942  mm,	Y =  1271.066  mm,	Z = -1485.331  mm,
	W =   179.925 deg,	P =     -.131 deg,	R =   -38.673 deg
};
/END
