/PROG  SAB01_52
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise joue 2";
PROG_SIZE	= 1159;
CREATE		= DATE 26-04-02  TIME 08:59:04;
MODIFIED	= DATE 26-05-28  TIME 23:37:54;
FILE_NAME	= SAB42;
VERSION		= 0;
LINE_COUNT	= 37;
MEMORY_SIZE	= 1527;
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
   1:  !Prise joue poste 2 ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche posage ;
   8:  R[99]=0.5 ;
   9:J P[1:App] 100% CNT100 ;
  10:  R[99]=1 ;
  11:   ;
  12:  !Choix Uframe et Utool ;
  13:  UFRAME_NUM=2 ;
  14:  UTOOL_NUM=3 ;
  15:   ;
  16:  DO[37:Fermeture pince]=OFF ;
  17:  DO[36:Ouverture pince]=ON ;
  18:   ;
  19:  CALL RAZ_PR100 ;
  20:  PR[100,3:Offset]=(-100) ;
  21:  PR[100,2:Offset]=(-10) ;
  22:  R[99]=1.5 ;
  23:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  24:  R[99]=2 ;
  25:  PR[100,3:Offset]=0 ;
  26:  R[99]=2.5 ;
  27:L P[3:Point prise] 1000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  28:  R[99]=3 ;
  29:   ;
  30:  R[99]=3.5 ;
  31:L P[3:Point prise] 500mm/sec FINE ;
  32:  R[99]=4 ;
  33:  CALL FERM_PINCE ;
  34:   ;
  35:  PR[100,2:Offset]=0 ;
  36:  PR[100,3:Offset]=(-150) ;
  37:  R[99]=4.5 ;
  38:L P[3:Point prise] 500mm/sec FINE Tool_Offset,PR[100:Offset] ;
  39:  R[99]=5 ;
  40:   ;
  41:  !Choix Uframe et Utool ;
  42:  UFRAME_NUM=0 ;
  43:  UTOOL_NUM=1 ;
  44:   ;
  45:  !Approche posage ;
  46:  R[99]=5.5 ;
  47:J P[1:App] 100% CNT100 ;
  48:  R[99]=6 ;
  49:   ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1940.471  mm,	Y =  1518.564  mm,	Z =  -132.979  mm,
	W =   179.765 deg,	P =     -.588 deg,	R =   -28.056 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1944.429  mm,	Y =  1526.702  mm,	Z =  -905.745  mm,
	W =   179.740 deg,	P =     -.577 deg,	R =   -25.877 deg
};
/END
