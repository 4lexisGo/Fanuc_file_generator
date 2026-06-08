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
   1:  !Prise joue poste 1 ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=3 ;
   6:   ;
   7:  !Approche posage ;
   8:  R[99]=0.5 ;
   9:J P[1:App] R[25:Vitesse general]% CNT100 ;
  10:  R[99]=1 ;
  11:   ;
  12:  !Choix Uframe et Utool ;
  13:  UFRAME_NUM=1 ;
  14:  UTOOL_NUM=3 ;
  15:   ;
  16:  CALL RAZ_PR100 ;
  17:  PR[100,2:Offset]=(-10) ;
  18:  PR[100,3:Offset]=(-100) ;
  19:  R[99]=1.5 ;
  20:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  21:  R[99]=2 ;
  22:  PR[100,3:Offset]=0 ;
  23:  R[99]=2.5 ;
  24:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  25:  R[99]=3 ;
  26:   ;
  27:  R[99]=3.5 ;
  28:L P[3:Point prise] 500mm/sec FINE ;
  29:  R[99]=4 ;
  30:  CALL FERM_PINCE ;
  31:   ;
  32:  PR[100,2:Offset]=0 ;
  33:  PR[100,3:Offset]=(-200) ;
  34:  R[99]=4.5 ;
  35:L P[3:Point prise] 500mm/sec FINE Tool_Offset,PR[100:Offset] ;
  36:  R[99]=5 ;
  37:   ;
  38:  !Choix Uframe et Utool ;
  39:  UFRAME_NUM=0 ;
  40:  UTOOL_NUM=3 ;
  41:   ;
  42:  !Approche posage ;
  43:  R[99]=5.5 ;
  44:J P[1:App] 100% CNT100 ;
  45:  R[99]=6 ;
  46:  R[99]=6.5 ;
  47:J P[2] 100% CNT100 ;
  48:  R[99]=7 ;
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
