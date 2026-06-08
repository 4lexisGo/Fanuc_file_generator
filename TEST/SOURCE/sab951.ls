/PROG  SAB951
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1176;
CREATE		= DATE 26-02-20  TIME 10:57:44;
MODIFIED	= DATE 26-05-27  TIME 23:11:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 41;
MEMORY_SIZE	= 1544;
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
   1:  !Pose clouteur sur posage 1 ;
   2:   ;
   3:  DO[61:Pose clout 1 EC]=ON ;
   4:  !Choix Uframe et Utool ;
   5:  UFRAME_NUM=7 ;
   6:  UTOOL_NUM=2 ;
   7:   ;
   8:  CALL RAZ_PR100    ;
   9:   ;
  10:  PR[100,1:Offset]=(-1000)    ;
  11:  PR[100,2:Offset]=((-10)) ;
  12:  PR[100,3:Offset]=(-70)    ;
  13:L P[2] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  14:   ;
  15:  !Test si posage clouteur 1 vide ;
  16:  CALL TEST5    ;
  17:   ;
  18:  PR[100,1:Offset]=0    ;
  19:L P[2] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  20:   ;
  21:  PR[100,2:Offset]=0    ;
  22:L P[2] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  23:   ;
  24:L P[2] 500mm/sec FINE    ;
  25:   ;
  26:  !Ouverture changeur ;
  27:  CALL OUV_CHANGEUR    ;
  28:   ;
  29:  !Mise a jour data ;
  30:  R[32:Outil sur robot]=0    ;
  31:  R[35:Clouteur en cour]=0    ;
  32:   ;
  33:  CALL RAZ_PR100    ;
  34:   ;
  35:  PR[100,3:Offset]=(-150)    ;
  36:L P[2] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  37:   ;
  38:  !Test si outil bien poser ;
  39:  CALL TEST6    ;
  40:   ;
  41:  DO[61:Pose clout 1 EC]=OFF ;
/POS
P[2]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2642.652  mm,	Y =   351.198  mm,	Z =   597.472  mm,
	W =     -.095 deg,	P =    19.856 deg,	R =     1.268 deg
};
/END
