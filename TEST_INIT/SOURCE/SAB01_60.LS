/PROG  SAB01_60
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise/Pose inter";
PROG_SIZE	= 3438;
CREATE		= DATE 25-04-30  TIME 08:06:54;
MODIFIED	= DATE 26-01-26  TIME 19:18:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 137;
MEMORY_SIZE	= 3862;
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

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
1:  /MN ;
2:  !//////////////////////////////// ;
3:  !////Prise/Pose intercalaire///// ;
4:  !//////////////////////////////// ;
5:   ;
6:  !Recuperation Info Piece ;
7:  CALL INFO_PIECE_ACTU ;
8:   ;
9:  !Memo programme en cours ;
10:  R[38:Programme en cr]=6 ;
11:   ;
12:  !Validation Tache ;
13:  CALL VALIDATION_DEBUT_TACHE ;
14:   ;
15:  !Changment de prehenseur ;
16:  R[91:Choix outils]=2 ;
17:  CALL CHANG_OUTIL ;
18:   ;
19:  !Override ;
20:  CALL OVERRIDE ;
21:   ;
22:  !Choix Uframe/Utool ;
23:  UFRAME_NUM=0 ;
24:  UTOOL_NUM=2 ;
25:   ;
26:  !Raz PR ;
27:  CALL RAZPR99 ;
28:   ;
29:  !//////////////////////////////// ;
30:  !//////////////////////////////// ;
31:  !//////////////////////////////// ;
32:   ;
33:  !Activation telemetre ;
34:  DO[129:OFF:Activation Telemetre]=ON ;
35:   ;
36:  !Point d'approche ;
37:  R[66]=0.5 ;
38:  J P[1] 100% CNT25 ;
39:  R[66]=1 ;
40:  !Point mesure ;
41:  R[66]=1.5 ;
42:  L P[2] 2000mm/sec FINE ;
43:  R[66]=2 ;
44:  WAIT    .20(sec) ;
45:  !Definition repere et outils ;
46:  UFRAME_NUM=4 ;
47:  UTOOL_NUM=2 ;
48:   ;
49:  !Reset PR ;
50:  CALL RAZPR99 ;
51:  CALL RAZPR100 ;
52:   ;
53:  !Calcule de point de prise ;
54:  CALL CALC01_60 ;
55:   ;
56:  !Desactivation telemetre ;
57:  DO[129:OFF:Activation Telemetre]=OFF ;
58:   ;
59:  R[66]=2.5 ;
60:  L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
61:  R[66]=3 ;
62:  !Aspiration intercalaire ;
63:  R[66]=3.5 ;
64:  CALL CYCLE_ASPI ;
65:  R[66]=4 ;
66:  WAIT    .50(sec) ;
67:   ;
68:  R[66]=4.5 ;
69:  L P[4] 50mm/sec FINE ;
70:  R[66]=5 ;
71:   ;
72:  R[66]=5.5 ;
73:  L P[9] 50mm/sec FINE ;
74:  R[66]=6 ;
75:  R[66]=6.5 ;
76:  L P[10] 50mm/sec FINE ;
77:  R[66]=7 ;
78:   ;
79:   ;
80:  R[66]=7.5 ;
81:  L P[5] 50mm/sec CNT50 ;
82:  R[66]=8 ;
83:  R[66]=8.5 ;
84:  L P[6] 50mm/sec FINE ;
85:  R[66]=9 ;
86:  WAIT   1.50(sec) ;
87:  R[66]=9.5 ;
88:  L P[7] 50mm/sec FINE ;
89:  R[66]=10 ;
90:  WAIT   1.50(sec) ;
91:  R[66]=10.5 ;
92:  L P[8] 50mm/sec FINE ;
93:  R[66]=11 ;
94:  R[66]=11.5 ;
95:  L P[11] 50mm/sec FINE ;
96:  R[66]=12 ;
97:  R[66]=12.5 ;
98:  L P[12] 50mm/sec FINE ;
99:  R[66]=13 ;
100:  R[66]=13.5 ;
101:  L P[13] 50mm/sec FINE ;
102:  R[66]=14 ;
103:   ;
104:   ;
105:  !Raz PR100 ;
106:  CALL RAZPR100 ;
107:   ;
108:  !Point de degagement ;
109:  PR[100,1:Dcallage]=(-100) ;
110:  PR[100,3:Dcallage]=(-100) ;
111:  PR[100,2:Dcallage]=(-100) ;
112:  R[66]=14.5 ;
113:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Dcallage] ACC5 ;
114:  R[66]=15 ;
115:   ;
116:  !Definition repere et outils ;
117:  UFRAME_NUM=2 ;
118:  UTOOL_NUM=2 ;
119:   ;
120:  !Raz PR ;
121:  CALL RAZPR99 ;
122:  CALL RAZPR100 ;
123:   ;
124:  !Choix palette ;
125:  CALL CALC01_60_POSE ;
126:   ;
127:  PR[100,3:Dcallage]=(-800) ;
128:  R[66]=15.5 ;
129:  J PR[99:PR mobil] 50% FINE Tool_Offset,PR[100:Dcallage] ;
130:  R[66]=16 ;
131:   ;
132:  PR[100,3:Dcallage]=(-100) ;
133:  R[66]=16.5 ;
134:  L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
135:  R[66]=17 ;
136:   ;
137:  R[66]=17.5 ;
138:  L PR[99:PR mobil] 500mm/sec FINE ;
139:  R[66]=18 ;
140:   ;
141:  !Pose intercallaire ;
142:  R[66]=18.5 ;
143:  CALL TOOL02_ASPIRATION_OFF ;
144:  R[66]=19 ;
145:   ;
146:  !Raz PR ;
147:  CALL RAZPR100 ;
148:   ;
149:  PR[100,3:Dcallage]=(-100) ;
150:  R[66]=19.5 ;
151:  L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
152:  R[66]=20 ;
153:   ;
154:  PR[100,3:Dcallage]=(-800) ;
155:  R[66]=20.5 ;
156:  J PR[99:PR mobil] 100% FINE Tool_Offset,PR[100:Dcallage] ;
157:  R[66]=21 ;
158:   ;
159:  R[66]=21.5 ;
160:  J P[1] 100% FINE ;
161:  R[66]=22 ;
162:   ;
163:  !Mis en position repos ;
164:  !Definition du repere ;
165:  UFRAME_NUM=5 ;
166:  UTOOL_NUM=5 ;
167:   ;
168:  R[66]=22.5 ;
169:  J P[3:Repos] 100% FINE ;
170:  R[66]=23 ;
171:   ;
172:  !Validation Fin Tache ;
173:  CALL VALIDATION_FIN_TACHE ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   309.539  mm,	Y = -1549.649  mm,	Z =   192.044  mm,
	W =   175.948 deg,	P =     3.806 deg,	R =   176.603 deg
};
P[2]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   376.606  mm,	Y = -2150.696  mm,	Z =   397.723  mm,
	W =  -140.329 deg,	P =    11.847 deg,	R =   179.208 deg
};
P[3:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[4]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.947  mm,	Y =   432.943  mm,	Z =   -69.735  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[5]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   662.511  mm,	Y =   432.127  mm,	Z =   -31.497  mm,
	W =   179.801 deg,	P =   -12.650 deg,	R =   178.265 deg
};
P[6]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   709.627  mm,	Y =   429.898  mm,	Z =    76.216  mm,
	W =   179.777 deg,	P =   -28.983 deg,	R =   178.331 deg
};
P[7]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   662.511  mm,	Y =   432.127  mm,	Z =   -31.497  mm,
	W =   179.801 deg,	P =   -12.650 deg,	R =   178.265 deg
};
P[8]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   662.968  mm,	Y =   436.284  mm,	Z =   -24.936  mm,
	W =   179.801 deg,	P =   -12.589 deg,	R =   178.264 deg
};
P[9]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.364  mm,	Y =   437.570  mm,	Z =   -38.749  mm,
	W =  -171.544 deg,	P =     1.341 deg,	R =   178.217 deg
};
P[10]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.947  mm,	Y =   432.943  mm,	Z =   -69.735  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[11]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.947  mm,	Y =   432.943  mm,	Z =   -69.735  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[12]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   656.788  mm,	Y =   433.010  mm,	Z =   -69.770  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[13]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   653.583  mm,	Y =   432.435  mm,	Z =   129.198  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
/END
