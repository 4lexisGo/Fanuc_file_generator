/PROG  SAB01_22
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise posage 2";
PROG_SIZE	= 1174;
CREATE		= DATE 26-04-02  TIME 08:58:04;
MODIFIED	= DATE 26-05-29  TIME 16:50:32;
FILE_NAME	= SAB21;
VERSION		= 0;
LINE_COUNT	= 35;
MEMORY_SIZE	= 1558;
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
   1:  !Prise joue+ posage poste 2 ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche posage ;
   8:J P[1:App] 100% CNT100    ;
   9:   ;
  10:  !Choix Uframe et Utool ;
  11:  UFRAME_NUM=2 ;
  12:  UTOOL_NUM=1 ;
  13:   ;
  14:  CALL RAZ_PR100    ;
  15:  PR[100,3:Offset]=(-100)    ;
  16:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  17:   ;
  18:  CALL OUV_CHANGEUR    ;
  19:  DO[30:Monter changeur]=OFF ;
  20:   ;
  21:L P[3:Point prise] 2000mm/sec FINE    ;
  22:  CALL FERM_CHANGEUR    ;
  23:  WAIT    .50(sec) ;
  24:   ;
  25:  PR[100,3:Offset]=(-100)    ;
  26:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  27:   ;
  28:  !Choix Uframe et Utool ;
  29:  UFRAME_NUM=0 ;
  30:  UTOOL_NUM=1 ;
  31:   ;
  32:  !Approche posage ;
  33:J P[1:App] R[28:Vitesse joue + P]% CNT100    ;
  34:   ;
  35:J P[2] R[28:Vitesse joue + P]% CNT25    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1371.038  mm,	Y =  1560.917  mm,	Z =   -32.344  mm,
	W =  -179.241 deg,	P =      .566 deg,	R =  -175.938 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   717.600  mm,	Y =   807.480  mm,	Z =   -81.690  mm,
	W =   164.112 deg,	P =    12.760 deg,	R =   164.340 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1936.372  mm,	Y =  1508.465  mm,	Z =  -871.047  mm,
	W =  -179.585 deg,	P =      .173 deg,	R =  -175.940 deg
};
/END
