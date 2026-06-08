/PROG  CALC01_30
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 834;
CREATE		= DATE 26-05-04  TIME 16:16:06;
MODIFIED	= DATE 26-05-13  TIME 16:29:00;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 22;
MEMORY_SIZE	= 1250;
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
   4:  UFRAME_NUM=3 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:J P[1] 100% FINE    ;
   8:  LBL[1] ;
   9:   ;
  10:  PR[99:PR mobil]=P[1]    ;
  11:   ;
  12:  R[23:Diametre joue]=GI[5:Diamètre joue]    ;
  13:   ;
  14:  R[40:Calcul]=(R[23:Diametre joue]/2) ;
  15:   ;
  16:  R[40:Calcul]=(R[40:Calcul]-332) ;
  17:   ;
  18:  PR[100,2:Offset]=R[40:Calcul]    ;
  19:   ;
  20:  R[27:Vitesse detourag]=GI[8:Vitesse détourage]    ;
  21:   ;
  22:  R[26:Vitesse entame]=GI[7:Vitesse entame]    ;
/POS
P[1]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    44.000  mm,	Y =     0.000  mm,	Z =    45.000  mm,
	W =      .000 deg,	P =      .027 deg,	R =  -167.341 deg
};
/END
