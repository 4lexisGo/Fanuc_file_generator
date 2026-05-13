/PROG  SAB01_60
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose piece rebut";
PROG_SIZE	= 1051;
CREATE		= DATE 26-05-12  TIME 09:32:34;
MODIFIED	= DATE 26-05-12  TIME 15:45:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 27;
MEMORY_SIZE	= 1339;
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
4:  !!!!!!!!Programme de pose!!!!!!!! ;
5:  !!!!!!!!rebut dans le bac!!!!!!!! ;
6:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
7:   ;
8:  !Attente demande de pose rebut ;
9:  WAIT (DI[105:Dmd pose rebut]=ON) ;
10:  !Envoie pose bac rebut encours ;
11:  DO[110:Pose rebut encours]=ON ;
12:   ;
13:  !Definition du repere ;
14:  UFRAME_NUM=2 ;
15:   ;
16:  !Remise a zero decallage ;
17:  CALL RAZPR(100) ;
18:   ;
19:  R[31]=0.5 ;
20:  J P[1:Pose rebut] 100% CNT100 Offset,PR[100:Offset] ;
21:  R[31]=1 ;
22:   ;
23:  R[31]=1.5 ;
24:  L P[1:Pose rebut] 2000mm/sec CNT10 ;
25:  R[31]=2 ;
26:   ;
27:  !Fermeture pince ;
28:  R[31]=2.5 ;
29:  CALL FERM_PINCE ;
30:  R[31]=3 ;
31:   ;
32:  R[31]=3.5 ;
33:  J P[1:Pose rebut] 100% CNT100 Offset,PR[100:Offset] ;
34:  R[31]=4 ;
35:   ;
36:  !Acquitement pose rebut ;
37:  CALL ACQUIT_POSE_REBUT ;
/POS
P[1:"Pose rebut"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
