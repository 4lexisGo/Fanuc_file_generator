/PROG  SAB954
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1444;
CREATE		= DATE 26-05-06  TIME 15:56:02;
MODIFIED	= DATE 26-05-29  TIME 16:52:08;
FILE_NAME	= SAB952;
VERSION		= 0;
LINE_COUNT	= 55;
MEMORY_SIZE	= 1756;
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
   1:  !Prise clouteur sur posage 2 ;
   2:   ;
   3:  DO[60:Prise clout 2 EC]=ON ;
   4:  !Choix Uframe et Utool ;
   5:  UFRAME_NUM=7 ;
   6:  UTOOL_NUM=2 ;
   7:   ;
   8:  CALL RAZ_PR100 ;
   9:   ;
  10:  PR[100,1:Offset]=(-100) ;
  11:  PR[100,3:Offset]=(-100) ;
  12:  R[99]=0.5 ;
  13:L P[2:Prise cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  14:  R[99]=1 ;
  15:  PR[100,1:Offset]=0 ;
  16:  R[99]=1.5 ;
  17:L P[2:Prise cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  18:  R[99]=2 ;
  19:   ;
  20:  DO[30:Monter changeur]=OFF ;
  21:   ;
  22:  !Test si clouteur 2 present ;
  23:  CALL TEST8 ;
  24:   ;
  25:  R[99]=2.5 ;
  26:L P[2:Prise cloueur] 500mm/sec FINE ;
  27:  R[99]=3 ;
  28:   ;
  29:  !Fermeture changeur ;
  30:  CALL FERM_CHANGEUR ;
  31:  R[32:Outil sur robot]=1 ;
  32:  R[35:Clouteur en cour]=2 ;
  33:  GO[3:Nombre clous préhenseur2]=(GI[11:Nb clous poste 2]) ;
  34:   ;
  35:  CALL RAZ_PR100 ;
  36:   ;
  37:  PR[100,3:Offset]=(-30) ;
  38:  R[99]=3.5 ;
  39:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  40:  R[99]=4 ;
  41:   ;
  42:  PR[100,1:Offset]=(-500) ;
  43:  PR[100,2:Offset]=(-10) ;
  44:  R[99]=4.5 ;
  45:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  46:  R[99]=5 ;
  47:   ;
  48:  PR[100,5:Offset]=(-10) ;
  49:  R[99]=5.5 ;
  50:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  51:  R[99]=6 ;
  52:   ;
  53:  PR[100,1:Offset]=(-600) ;
  54:  PR[100,5:Offset]=(-20) ;
  55:  R[99]=6.5 ;
  56:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  57:  R[99]=7 ;
  58:   ;
  59:  PR[100,3:Offset]=(-100) ;
  60:  R[99]=7.5 ;
  61:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  62:  R[99]=8 ;
  63:   ;
  64:  PR[100,1:Offset]=(-800) ;
  65:  R[99]=8.5 ;
  66:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  67:  R[99]=9 ;
  68:   ;
  69:  !Test si clouteur 2 bien pris ;
  70:  CALL TEST7 ;
  71:   ;
  72:  DO[60:Prise clout 2 EC]=OFF ;
  73:   ;
/POS
P[2:"Prise cloueur"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2726.847  mm,	Y =   352.711  mm,	Z =  1085.330  mm,
	W =     -.117 deg,	P =    40.079 deg,	R =     1.224 deg
};
/END
