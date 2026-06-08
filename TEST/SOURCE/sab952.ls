/PROG  SAB952
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose cloueur 2";
PROG_SIZE	= 1456;
CREATE		= DATE 26-05-26  TIME 14:36:26;
MODIFIED	= DATE 26-05-27  TIME 15:29:58;
FILE_NAME	= SAB951;
VERSION		= 0;
LINE_COUNT	= 54;
MEMORY_SIZE	= 1772;
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
   1:  !Pose clouteur sur posage 2 ;
   2:   ;
   3:  DO[62:Pose clout 2 EC]=ON ;
   4:  !Choix Uframe et Utool ;
   5:  UFRAME_NUM=7 ;
   6:  UTOOL_NUM=2 ;
   7:   ;
   8:  !Test si posage clouteur 2 vide ;
   9:  CALL TEST7    ;
  10:   ;
  11:  CALL RAZ_PR100    ;
  12:   ;
  13:  PR[100,1:Offset]=(-800)    ;
  14:  PR[100,2:Offset]=(-10)    ;
  15:  PR[100,3:Offset]=(-100)    ;
  16:  PR[100,5:Offset]=(-20)    ;
  17:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset]    ;
  18:   ;
  19:  PR[100,1:Offset]=(-600)    ;
  20:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset]    ;
  21:   ;
  22:  PR[100,1:Offset]=(-500)    ;
  23:  PR[100,3:Offset]=(-30)    ;
  24:  PR[100,5:Offset]=(-10)    ;
  25:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset]    ;
  26:   ;
  27:  PR[100,1:Offset]=(-400)    ;
  28:  PR[100,5:Offset]=0    ;
  29:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset]    ;
  30:   ;
  31:  PR[100,1:Offset]=0    ;
  32:  PR[100,2:Offset]=0    ;
  33:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset]    ;
  34:   ;
  35:L P[2:Pose cloueur] 500mm/sec FINE    ;
  36:   ;
  37:  !Ouverture changeur ;
  38:  CALL OUV_CHANGEUR    ;
  39:   ;
  40:  !Mise a jour data ;
  41:  R[32:Outil sur robot]=0    ;
  42:  R[35:Clouteur en cour]=0    ;
  43:   ;
  44:  CALL RAZ_PR100    ;
  45:   ;
  46:  PR[100,3:Offset]=(-100)    ;
  47:L P[2:Pose cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  48:  PR[100,1:Offset]=(-100)    ;
  49:L P[2:Pose cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  50:   ;
  51:  !Test si outil bien poser ;
  52:  CALL TEST8    ;
  53:   ;
  54:  DO[62:Pose clout 2 EC]=OFF ;
/POS
P[2:"Pose cloueur"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2726.847  mm,	Y =   352.711  mm,	Z =  1085.330  mm,
	W =     -.117 deg,	P =    40.079 deg,	R =     1.224 deg
};
/END
