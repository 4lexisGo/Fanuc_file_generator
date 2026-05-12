/PROG  SAB01_100
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Recal auto";
PROG_SIZE	= 2272;
CREATE		= DATE 25-04-30  TIME 08:07:36;
MODIFIED	= DATE 25-10-13  TIME 18:45:54;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 87;
MEMORY_SIZE	= 2624;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
1:  /MN ;
2:  !//////////////////////////////// ;
3:  !////Recalibration automatique/// ;
4:  !//////////////////////////////// ;
5:   ;
6:  !Memo programme en cours ;
7:  R[38:Programme en cr]=10 ;
8:   ;
9:  !Validation Tache ;
10:  CALL VALIDATION_DEBUT_TACHE ;
11:   ;
12:  !Changment de prehenseur ;
13:  R[91:Choix outils]=3 ;
14:  CALL CHANG_OUTIL ;
15:   ;
16:  !Override ;
17:  CALL OVERRIDE ;
18:   ;
19:  !Choix Uframe/Utool ;
20:  UFRAME_NUM=0 ;
21:  UTOOL_NUM=3 ;
22:   ;
23:  !Trajectoire d'approche ;
24:  R[66]=0.5 ;
25:  J P[1] 100% CNT100 ;
26:  R[66]=1 ;
27:  R[66]=1.5 ;
28:  J P[2] 100% CNT10 ;
29:  R[66]=2 ;
30:   ;
31:  !Demande d'arret ;
32:  CALL DEMANDE_ARRET ;
33:   ;
34:  !Raz PR ;
35:  CALL RAZPR100 ;
36:   ;
37:  !Point d'approche du controle ;
38:  PR[100,3:Dcallage]=(-100) ;
39:  PR[100,1:Dcallage]=20 ;
40:  R[66]=2.5 ;
41:  L P[3:Point de control] 2000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
42:  R[66]=3 ;
43:   ;
44:  !Ouverture de pince ;
45:  R[66]=3.5 ;
46:  CALL TOOL03_OUVERTURE ;
47:  R[66]=4 ;
48:   ;
49:  PR[100,3:Dcallage]=0 ;
50:  PR[100,1:Dcallage]=5 ;
51:  R[66]=4.5 ;
52:  L P[3:Point de control] 2000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
53:  R[66]=5 ;
54:   ;
55:  !Point de controle ;
56:  R[66]=5.5 ;
57:  L P[3:Point de control] 100mm/sec FINE ;
58:  R[66]=6 ;
59:   ;
60:  !Fermeture pince ;
61:  R[66]=6.5 ;
62:  CALL TOOL03_FERMETURE ;
63:  R[66]=7 ;
64:   ;
65:  !Controle de la regle ;
66:  CALL CONTROLE_REGLE ;
67:   ;
68:  !Ouverture de pince ;
69:  R[66]=7.5 ;
70:  CALL TOOL03_OUVERTURE ;
71:  R[66]=8 ;
72:   ;
73:  !Point d'approche du controle ;
74:  R[66]=8.5 ;
75:  J P[3:Point de control] 100% FINE Tool_Offset,PR[100:Dcallage] ;
76:  R[66]=9 ;
77:   ;
78:  PR[100,3:Dcallage]=(-100) ;
79:  R[66]=9.5 ;
80:  L P[3:Point de control] 2000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
81:  R[66]=10 ;
82:   ;
83:  !Trajectoire retour ;
84:  R[66]=10.5 ;
85:  L P[2] 2000mm/sec FINE ;
86:  R[66]=11 ;
87:  R[66]=11.5 ;
88:  J P[1] 100% CNT100 ;
89:  R[66]=12 ;
90:   ;
91:  !Mis en position repos ;
92:  !Definition du repere ;
93:  UFRAME_NUM=5 ;
94:  UTOOL_NUM=5 ;
95:   ;
96:  R[66]=12.5 ;
97:  J P[5:Repos] 100% FINE ;
98:  R[66]=13 ;
99:   ;
100:  !Demande d'arret ;
101:  CALL DEMANDE_ARRET ;
102:   ;
103:  !Validation Fin Tache ;
104:  CALL VALIDATION_FIN_TACHE ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   150.319  mm,	Y =  -917.201  mm,	Z =   -33.536  mm,
	W =  -177.643 deg,	P =    -2.986 deg,	R =  -167.336 deg
};
P[2]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -504.080  mm,	Y = -1088.857  mm,	Z =    53.222  mm,
	W =  -178.777 deg,	P =    -7.308 deg,	R =  -165.301 deg
};
P[3:"Point de control"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -834.008  mm,	Y = -1177.339  mm,	Z =  -531.755  mm,
	W =   179.947 deg,	P =    -3.747 deg,	R =  -166.107 deg
};
P[5:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
/END
