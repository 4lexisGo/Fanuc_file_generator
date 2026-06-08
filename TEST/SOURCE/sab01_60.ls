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
   8:J P[1:App] 100% CNT100    ;
   9:   ;
  10:  !Choix Utool et Uframe ;
  11:  UFRAME_NUM=4 ;
  12:  UTOOL_NUM=3 ;
  13:   ;
  14:  !Raz PR100 ;
  15:  CALL RAZ_PR100    ;
  16:   ;
  17:  PR[100,3:Offset]=(-100)    ;
  18:L P[2:Point de pose] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  19:   ;
  20:L P[2:Point de pose] 1000mm/sec FINE    ;
  21:  CALL OUV_PINCE    ;
  22:   ;
  23:  PR[100,3:Offset]=(-100)    ;
  24:L P[2:Point de pose] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  25:   ;
  26:  !Choix Utool et Uframe ;
  27:  UFRAME_NUM=0 ;
  28:  UTOOL_NUM=3 ;
  29:   ;
  30:  !Approche ;
  31:J P[1:App] 100% CNT100    ;
  32:   ;
  33:  DO[50:Pose Maypro EC]=OFF ;
  34:  DO[51:Fin pose Maypro]=PULSE,0.5sec ;
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
