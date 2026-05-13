/PROG  SAB01_50
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose piece bac";
PROG_SIZE	= 1139;
CREATE		= DATE 26-05-12  TIME 09:32:06;
MODIFIED	= DATE 26-05-12  TIME 11:01:06;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 31;
MEMORY_SIZE	= 1419;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/MN
1:  /MN ;
2:  /MN ;
3:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
4:  !!!Programme de pose piece dans!! ;
5:  !!!!!!!!!!!!!!le bac!!!!!!!!!!!!! ;
6:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
7:   ;
8:  !Attente demande de pose ;
9:  !dans le bac ;
10:  WAIT (DI[103:Dmd pose bac]=ON) ;
11:   ;
12:  !Envoie pose bac encours ;
13:  DO[106:Pose bac encours]=ON ;
14:   ;
15:  !Definition du repere ;
16:  UFRAME_NUM=5 ;
17:   ;
18:  !Point de mesure telemetre ;
19:  R[31]=0.5 ;
20:  J P[1:Ctrl telemetre] 100% FINE ;
21:  R[31]=1 ;
22:   ;
23:  !Calcul point de pose bac ;
24:  CALL CALC_005 ;
25:   ;
26:  !Remise a zero decallage ;
27:  CALL RAZPR(100) ;
28:   ;
29:  R[31]=1.5 ;
30:  L PR[99:Mobil 1] 2000mm/sec CNT0 ;
31:  R[31]=2 ;
32:  !Fermeture pince ;
33:  CALL FERM_CHANGEUR ;
34:   ;
35:  R[31]=2.5 ;
36:  J P[1:Ctrl telemetre] 100% CNT100 ;
37:  R[31]=3 ;
38:  !Acquitement pose bac ;
39:  CALL ACQUIT_POSE ;
/POS
P[1:"Ctrl telemetre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
