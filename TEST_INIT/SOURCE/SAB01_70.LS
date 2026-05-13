/PROG  SAB01_70
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pose piece prele";
PROG_SIZE	= 1167;
CREATE		= DATE 26-05-12  TIME 09:32:42;
MODIFIED	= DATE 26-05-12  TIME 16:05:16;
FILE_NAME	= SAB01_60;
VERSION		= 0;
LINE_COUNT	= 33;
MEMORY_SIZE	= 1559;
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
/APPL
/MN
1:  /MN ;
2:  /MN ;
3:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
4:  !!!!!!!!Programme de pose!!!!!!!! ;
5:  !dans la goulotte de prelevement! ;
6:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
7:   ;
8:  !Attente demande de pose prelev ;
9:  WAIT (DI[106:Dmd pose goulotte]=ON) ;
10:   ;
11:  !Envoie pose prelevement encours ;
12:  DO[112:Pose goulotte encours]=ON ;
13:   ;
14:  !Definition du repere ;
15:  UFRAME_NUM=6 ;
16:   ;
17:  !Remise a zero decallage ;
18:  CALL RAZPR(100) ;
19:   ;
20:  PR[100,3:Offset]=50 ;
21:  R[31]=0.5 ;
22:  J P[1:Pose goulotte] 100% CNT100 Offset,PR[100:Offset] ;
23:  R[31]=1 ;
24:   ;
25:  R[31]=1.5 ;
26:  L P[1:Pose goulotte] 2000mm/sec CNT0 ;
27:  R[31]=2 ;
28:   ;
29:  !Fermeture pince ;
30:  R[31]=2.5 ;
31:  CALL FERM_PINCE ;
32:  R[31]=3 ;
33:   ;
34:  R[31]=3.5 ;
35:  J P[1:Pose goulotte] 100% CNT100 Offset,PR[100:Offset] ;
36:  R[31]=4 ;
37:   ;
38:  !Acquit pose goulotte prelevement ;
39:  CALL ACQUIT_POSE_PRELEV ;
40:   ;
41:   ;
42:   ;
43:   ;
/POS
P[1:"Pose goulotte"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
