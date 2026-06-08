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
   8:J P[1:App] 100% CNT100    ;
   9:   ;
  10:  !Choix Uframe et Utool ;
  11:  UFRAME_NUM=2 ;
  12:  UTOOL_NUM=3 ;
  13:   ;
  14:  DO[37:Fermeture pince]=OFF ;
  15:  DO[36:Ouverture pince]=ON ;
  16:   ;
  17:  CALL RAZ_PR100    ;
  18:  PR[100,3:Offset]=(-100)    ;
  19:  PR[100,2:Offset]=(-10)    ;
  20:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  21:  PR[100,3:Offset]=0    ;
  22:L P[3:Point prise] 1000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  23:   ;
  24:L P[3:Point prise] 500mm/sec FINE    ;
  25:  CALL FERM_PINCE    ;
  26:   ;
  27:  PR[100,2:Offset]=0    ;
  28:  PR[100,3:Offset]=(-150)    ;
  29:L P[3:Point prise] 500mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  30:   ;
  31:  !Choix Uframe et Utool ;
  32:  UFRAME_NUM=0 ;
  33:  UTOOL_NUM=1 ;
  34:   ;
  35:  !Approche posage ;
  36:J P[1:App] 100% CNT100    ;
  37:   ;
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
