/PROG  SAB953
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1148;
CREATE		= DATE 26-05-06  TIME 16:35:08;
MODIFIED	= DATE 26-05-29  TIME 16:51:58;
FILE_NAME	= SAB951;
VERSION		= 0;
LINE_COUNT	= 38;
MEMORY_SIZE	= 1528;
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
   1:  !Prise clouteur sur posage 1 ;
   2:   ;
   3:  DO[59:Prise clout 1 EC]=ON ;
   4:  !Choix Uframe et Utool ;
   5:  UFRAME_NUM=7 ;
   6:  UTOOL_NUM=2 ;
   7:   ;
   8:  !Test si outil present ;
   9:  CALL TEST6    ;
  10:   ;
  11:  CALL RAZ_PR100    ;
  12:   ;
  13:  PR[100,3:Offset]=(-100)    ;
  14:L P[2:Prise cloueur] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  15:   ;
  16:  DO[30:Monter changeur]=OFF ;
  17:   ;
  18:L P[2:Prise cloueur] 500mm/sec FINE    ;
  19:   ;
  20:  !Fermeture changeur ;
  21:  CALL FERM_CHANGEUR    ;
  22:  R[32:Outil sur robot]=1    ;
  23:  R[35:Clouteur en cour]=1    ;
  24:  GO[2:Nombre clous préhenseur1]=(GI[10:Nb clous poste 1]) ;
  25:   ;
  26:  PR[100,3:Offset]=(-50)    ;
  27:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  28:   ;
  29:  PR[100,2:Offset]=(-10)    ;
  30:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  31:   ;
  32:  PR[100,1:Offset]=(-1000)    ;
  33:L P[2:Prise cloueur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  34:   ;
  35:  !Test si outil bien pris ;
  36:  CALL TEST5    ;
  37:   ;
  38:  DO[59:Prise clout 1 EC]=OFF ;
/POS
P[2:"Prise cloueur"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2642.879  mm,	Y =   351.212  mm,	Z =   602.312  mm,
	W =     -.094 deg,	P =    19.856 deg,	R =     1.268 deg
};
/END
