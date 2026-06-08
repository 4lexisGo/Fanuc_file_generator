/PROG  SAB01_60
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose sur maypro";
PROG_SIZE	= 1065;
CREATE		= DATE 26-04-02  TIME 08:59:12;
MODIFIED	= DATE 26-05-11  TIME 18:12:24;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 34;
MEMORY_SIZE	= 1445;
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
   1:  !Pose joue sur MAYPRO ;
   2:  DO[50:Pose Maypro EC]=ON ;
   3:  !Choix Utool et Uframe ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=3 ;
   6:   ;
   7:  !Approche ;
   8:  R[99]=0.5 ;
   9:J P[1:App] 100% CNT100 ;
  10:  R[99]=1 ;
  11:   ;
  12:  !Choix Utool et Uframe ;
  13:  UFRAME_NUM=4 ;
  14:  UTOOL_NUM=3 ;
  15:   ;
  16:  !Raz PR100 ;
  17:  CALL RAZ_PR100 ;
  18:   ;
  19:  PR[100,3:Offset]=(-100) ;
  20:  R[99]=1.5 ;
  21:L P[2:Point de pose] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  22:  R[99]=2 ;
  23:   ;
  24:  R[99]=2.5 ;
  25:L P[2:Point de pose] 1000mm/sec FINE ;
  26:  R[99]=3 ;
  27:  CALL OUV_PINCE ;
  28:   ;
  29:  PR[100,3:Offset]=(-100) ;
  30:  R[99]=3.5 ;
  31:L P[2:Point de pose] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  32:  R[99]=4 ;
  33:   ;
  34:  !Choix Utool et Uframe ;
  35:  UFRAME_NUM=0 ;
  36:  UTOOL_NUM=3 ;
  37:   ;
  38:  !Approche ;
  39:  R[99]=4.5 ;
  40:J P[1:App] 100% CNT100 ;
  41:  R[99]=5 ;
  42:   ;
  43:  DO[50:Pose Maypro EC]=OFF ;
  44:  DO[51:Fin pose Maypro]=PULSE,0.5sec ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -227.641  mm,	Y =  1180.389  mm,	Z =  -240.791  mm,
	W =  -179.188 deg,	P =   -32.172 deg,	R =    97.375 deg
};
P[2:"Point de pose"]{
   GP1:
	UF : 4, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -691.734  mm,	Y =  2472.161  mm,	Z =  -598.212  mm,
	W =  -179.313 deg,	P =     -.174 deg,	R =    97.806 deg
};
/END
