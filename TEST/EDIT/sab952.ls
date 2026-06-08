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
   9:  CALL TEST7 ;
  10:   ;
  11:  CALL RAZ_PR100 ;
  12:   ;
  13:  PR[100,1:Offset]=(-800) ;
  14:  PR[100,2:Offset]=(-10) ;
  15:  PR[100,3:Offset]=(-100) ;
  16:  PR[100,5:Offset]=(-20) ;
  17:  R[99]=0.5 ;
  18:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset] ;
  19:  R[99]=1 ;
  20:   ;
  21:  PR[100,1:Offset]=(-600) ;
  22:  R[99]=1.5 ;
  23:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset] ;
  24:  R[99]=2 ;
  25:   ;
  26:  PR[100,1:Offset]=(-500) ;
  27:  PR[100,3:Offset]=(-30) ;
  28:  PR[100,5:Offset]=(-10) ;
  29:  R[99]=2.5 ;
  30:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset] ;
  31:  R[99]=3 ;
  32:   ;
  33:  PR[100,1:Offset]=(-400) ;
  34:  PR[100,5:Offset]=0 ;
  35:  R[99]=3.5 ;
  36:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset] ;
  37:  R[99]=4 ;
  38:   ;
  39:  PR[100,1:Offset]=0 ;
  40:  PR[100,2:Offset]=0 ;
  41:  R[99]=4.5 ;
  42:L P[2:Pose cloueur] 1000mm/sec FINE Offset,PR[100:Offset] ;
  43:  R[99]=5 ;
  44:   ;
  45:  R[99]=5.5 ;
  46:L P[2:Pose cloueur] 500mm/sec FINE ;
  47:  R[99]=6 ;
  48:   ;
  49:  !Ouverture changeur ;
  50:  CALL OUV_CHANGEUR ;
  51:   ;
  52:  !Mise a jour data ;
  53:  R[32:Outil sur robot]=0 ;
  54:  R[35:Clouteur en cour]=0 ;
  55:   ;
  56:  CALL RAZ_PR100 ;
  57:   ;
  58:  PR[100,3:Offset]=(-100) ;
  59:  R[99]=6.5 ;
  60:L P[2:Pose cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  61:  R[99]=7 ;
  62:  PR[100,1:Offset]=(-100) ;
  63:  R[99]=7.5 ;
  64:L P[2:Pose cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  65:  R[99]=8 ;
  66:   ;
  67:  !Test si outil bien poser ;
  68:  CALL TEST8 ;
  69:   ;
  70:  DO[62:Pose clout 2 EC]=OFF ;
/POS
P[2:"Pose cloueur"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2726.847  mm,	Y =   352.711  mm,	Z =  1085.330  mm,
	W =     -.117 deg,	P =    40.079 deg,	R =     1.224 deg
};
/END
