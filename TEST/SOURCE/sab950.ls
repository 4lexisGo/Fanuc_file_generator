/PROG  SAB950
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1439;
CREATE		= DATE 26-02-20  TIME 10:36:54;
MODIFIED	= DATE 26-05-27  TIME 23:12:16;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 44;
MEMORY_SIZE	= 1935;
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
   1:  !Pose clouteur sur echange ;
   2:   ;
   3:  !Choix prehenseur ;
   4:  R[31:Dmd outil]=1    ;
   5:  CALL SAB900    ;
   6:   ;
   7:  !Choix Uframe et Utool ;
   8:  UFRAME_NUM=0 ;
   9:  UTOOL_NUM=1 ;
  10:   ;
  11:  !Approche echange ;
  12:J P[1] 100% CNT100    ;
  13:L P[3] 3000mm/sec CNT100    ;
  14:J P[6] 100% CNT100    ;
  15:   ;
  16:  !Pose clouteur ;
  17:  SELECT R[35:Clouteur en cour]=1,CALL SAB951 ;
  18:         =2,CALL SAB952 ;
  19:   ;
  20:L P[4] 3000mm/sec FINE    ;
  21:   ;
  22:   ;
  23:   ;
  24:  !Prise cloueur ;
  25:  LBL[1] ;
  26:   ;
  27:  !Test prise cloueur 1 ;
  28:  IF (DI[59:Autor Prise clo1]=ON AND R[35:Clouteur en cour]=0),CALL SAB953 ;
  29:   ;
  30:  !Test prise cloueur 2 ;
  31:  IF (DI[60:Autor Prise clo2]=ON AND R[35:Clouteur en cour]=0),CALL SAB954 ;
  32:   ;
  33:  IF (R[35:Clouteur en cour]=0),JMP LBL[1] ;
  34:   ;
  35:  !Choix Uframe et Utool ;
  36:  UFRAME_NUM=0 ;
  37:  UTOOL_NUM=1 ;
  38:   ;
  39:  R[36:Changement cloue]=0    ;
  40:   ;
  41:L P[6] 1000mm/sec FINE    ;
  42:L P[5] 3000mm/sec CNT100    ;
  43:J P[2] 100% CNT100    ;
  44:   ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, -1',
	X =   275.455  mm,	Y =  -885.710  mm,	Z =   -20.932  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =   106.604 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, -1',
	X =   275.455  mm,	Y =  -885.710  mm,	Z =   -20.932  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =   106.604 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   434.137  mm,	Y = -1391.925  mm,	Z =   -33.348  mm,
	W =   178.701 deg,	P =     -.347 deg,	R =  -172.575 deg
};
P[4]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1727.531  mm,	Y =   349.822  mm,	Z =   456.392  mm,
	W =     -.095 deg,	P =    19.856 deg,	R =     1.268 deg
};
P[5]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   434.137  mm,	Y = -1391.925  mm,	Z =   -33.348  mm,
	W =   178.701 deg,	P =     -.347 deg,	R =  -172.575 deg
};
P[6]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   399.522  mm,	Y = -1544.546  mm,	Z =    27.475  mm,
	W =   179.916 deg,	P =   -20.356 deg,	R =   -64.272 deg
};
/END
