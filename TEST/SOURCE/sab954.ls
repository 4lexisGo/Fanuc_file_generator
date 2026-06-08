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
   8:  CALL RAZ_PR100    ;
   9:   ;
  10:  PR[100,1:Offset]=(-100)    ;
  11:  PR[100,3:Offset]=(-100)    ;
  12:L P[2:Prise cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  13:  PR[100,1:Offset]=0    ;
  14:L P[2:Prise cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  15:   ;
  16:  DO[30:Monter changeur]=OFF ;
  17:   ;
  18:  !Test si clouteur 2 present ;
  19:  CALL TEST8    ;
  20:   ;
  21:L P[2:Prise cloueur] 500mm/sec FINE    ;
  22:   ;
  23:  !Fermeture changeur ;
  24:  CALL FERM_CHANGEUR    ;
  25:  R[32:Outil sur robot]=1    ;
  26:  R[35:Clouteur en cour]=2    ;
  27:  GO[3:Nombre clous préhenseur2]=(GI[11:Nb clous poste 2]) ;
  28:   ;
  29:  CALL RAZ_PR100    ;
  30:   ;
  31:  PR[100,3:Offset]=(-30)    ;
  32:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  33:   ;
  34:  PR[100,1:Offset]=(-500)    ;
  35:  PR[100,2:Offset]=(-10)    ;
  36:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  37:   ;
  38:  PR[100,5:Offset]=(-10)    ;
  39:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  40:   ;
  41:  PR[100,1:Offset]=(-600)    ;
  42:  PR[100,5:Offset]=(-20)    ;
  43:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  44:   ;
  45:  PR[100,3:Offset]=(-100)    ;
  46:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  47:   ;
  48:  PR[100,1:Offset]=(-800)    ;
  49:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  50:   ;
  51:  !Test si clouteur 2 bien pris ;
  52:  CALL TEST7    ;
  53:   ;
  54:  DO[60:Prise clout 2 EC]=OFF ;
  55:   ;
/POS
P[2:"Prise cloueur"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2726.847  mm,	Y =   352.711  mm,	Z =  1085.330  mm,
	W =     -.117 deg,	P =    40.079 deg,	R =     1.224 deg
};
/END
