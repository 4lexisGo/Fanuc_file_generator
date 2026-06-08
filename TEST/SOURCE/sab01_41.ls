/PROG  SAB01_41
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose posage 1";
PROG_SIZE	= 1073;
CREATE		= DATE 26-04-02  TIME 08:58:26;
MODIFIED	= DATE 26-05-29  TIME 16:50:46;
FILE_NAME	= SAB21;
VERSION		= 0;
LINE_COUNT	= 31;
MEMORY_SIZE	= 1337;
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
   1:  !Pose joue+ posage poste 1 ;
   2:   ;
   3:  !Choix Uframe et Utool ;
   4:  UFRAME_NUM=0 ;
   5:  UTOOL_NUM=1 ;
   6:   ;
   7:  !Approche posage ;
   8:J P[1:App] 100% CNT100    ;
   9:   ;
  10:  !Choix Uframe et Utool ;
  11:  UFRAME_NUM=1 ;
  12:  UTOOL_NUM=1 ;
  13:   ;
  14:  CALL RAZ_PR100    ;
  15:  PR[100,3:Offset]=(-50)    ;
  16:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  17:   ;
  18:L P[3:Point prise] 2000mm/sec FINE    ;
  19:  DO[30:Monter changeur]=OFF ;
  20:  WAIT    .20(sec) ;
  21:  CALL OUV_CHANGEUR    ;
  22:   ;
  23:  PR[100,3:Offset]=(-200)    ;
  24:L P[3:Point prise] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  25:   ;
  26:  !Choix Uframe et Utool ;
  27:  UFRAME_NUM=0 ;
  28:  UTOOL_NUM=1 ;
  29:   ;
  30:  !Approche posage ;
  31:J P[1:App] 100% CNT100    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2198.716  mm,	Y =  -354.530  mm,	Z =   -54.537  mm,
	W =   178.088 deg,	P =      .708 deg,	R =    63.066 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2324.205  mm,	Y =  -555.233  mm,	Z =  -367.376  mm,
	W =   179.403 deg,	P =     -.515 deg,	R =    63.059 deg
};
/END
