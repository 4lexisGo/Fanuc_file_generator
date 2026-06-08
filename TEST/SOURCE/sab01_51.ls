/PROG  SAB01_51
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise joue 1";
PROG_SIZE	= 1178;
CREATE		= DATE 26-04-02  TIME 08:58:54;
MODIFIED	= DATE 26-05-28  TIME 16:48:38;
FILE_NAME	= SAB41;
VERSION		= 0;
LINE_COUNT	= 34;
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
   1:  !Prise joue poste 1    ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=3 ;
   6:   ;
   7:  !Approche posage ;
   8:J P[1:App] R[25:Vitesse general]% CNT100    ;
   9:   ;
  10:  !Choix Uframe et Utool ;
  11:  UFRAME_NUM=1 ;
  12:  UTOOL_NUM=3 ;
  13:   ;
  14:  CALL RAZ_PR100    ;
  15:  PR[100,2:Offset]=(-10)    ;
  16:  PR[100,3:Offset]=(-100)    ;
  17:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  18:  PR[100,3:Offset]=0    ;
  19:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  20:   ;
  21:L P[3:Point prise] 500mm/sec FINE    ;
  22:  CALL FERM_PINCE    ;
  23:   ;
  24:  PR[100,2:Offset]=0    ;
  25:  PR[100,3:Offset]=(-200)    ;
  26:L P[3:Point prise] 500mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  27:   ;
  28:  !Choix Uframe et Utool ;
  29:  UFRAME_NUM=0 ;
  30:  UTOOL_NUM=3 ;
  31:   ;
  32:  !Approche posage ;
  33:J P[1:App] 100% CNT100    ;
  34:J P[2] 100% CNT100    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  2351.959  mm,	Y =  -547.248  mm,	Z =   -23.870  mm,
	W =  -179.576 deg,	P =     -.438 deg,	R =   -91.277 deg
};
P[2]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1481.987  mm,	Y =  -449.737  mm,	Z =   -58.917  mm,
	W =  -141.932 deg,	P =     1.375 deg,	R =   -91.313 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  2345.067  mm,	Y =  -550.002  mm,	Z =  -392.395  mm,
	W =  -179.554 deg,	P =     -.443 deg,	R =   -91.277 deg
};
/END
