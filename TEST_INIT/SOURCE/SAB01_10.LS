/PROG  SAB01_10
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise table ech";
PROG_SIZE	= 1343;
CREATE		= DATE 26-05-11  TIME 09:41:02;
MODIFIED	= DATE 26-05-11  TIME 15:06:30;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 42;
MEMORY_SIZE	= 1723;
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
4:  !Programme de prise piece de la!! ;
5:  !!!!!!!!!!table d'echange!!!!!!!! ;
6:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
7:   ;
8:  !Attente demande de prise echange ;
9:  WAIT (DI[100:Dmd prise table ech]=ON) ;
10:  !Changement prehenseur ;
11:  IF (GI[3:Num rference]=1),R[11:Choix outil]=(1) ;
12:   ;
13:  IF (GI[3:Num rference]=2),R[11:Choix outil]=(2) ;
14:   ;
15:  CALL CHGMT_PREHENSEUR ;
16:   ;
17:  !Envoie prise table encours ;
18:  DO[100:Prise table encours]=ON ;
19:   ;
20:  !Definition du repere ;
21:  UFRAME_NUM=1 ;
22:   ;
23:  !Test ou prendre la piece ;
24:  CALL TEST_005 ;
25:   ;
26:  !Calcul point de prise ;
27:  CALL CALC_001 ;
28:   ;
29:  !Remise a zero decallage ;
30:  CALL RAZPR(100) ;
31:   ;
32:  PR[100,3:Offset]=100 ;
33:  R[31]=0.5 ;
34:  J PR[99:Mobil 1] 100% CNT100 Offset,PR[100:Offset] ;
35:  R[31]=1 ;
36:   ;
37:  R[31]=1.5 ;
38:  L PR[99:Mobil 1] 2000mm/sec CNT0 ;
39:  R[31]=2 ;
40:  !Ouverture pince ;
41:  R[31]=2.5 ;
42:  CALL OUV_PINCE ;
43:  R[31]=3 ;
44:   ;
45:  R[31]=3.5 ;
46:  L PR[99:Mobil 1] 2000mm/sec CNT5 Offset,PR[100:Offset] ;
47:  R[31]=4 ;
48:   ;
49:  R[31]=4.5 ;
50:  J P[1] 100% CNT100 ;
51:  R[31]=5 ;
52:   ;
53:  !Acquitement prise table d'echang ;
54:  CALL ACQUIT_PRISE_ECH ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
