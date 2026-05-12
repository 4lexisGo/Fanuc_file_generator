/PROG  SAB01_40
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Devracage";
PROG_SIZE	= 4729;
CREATE		= DATE 25-04-30  TIME 08:08:04;
MODIFIED	= DATE 26-03-16  TIME 16:26:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 205;
MEMORY_SIZE	= 5161;
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
3:  !///////////Devracage//////////// ;
4:  !//////////////////////////////// ;
5:   ;
6:  !Memo programme en cours ;
7:  R[38:Programme en cr]=4 ;
8:   ;
9:  !Validation Tache ;
10:  CALL VALIDATION_DEBUT_TACHE ;
11:   ;
12:  //!Recuperation info piece ;
13:  //CALL INFO_PIECE_ACTU ;
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
26:  !Point d'approche ;
27:  R[66]=0.5 ;
28:  J P[1] 100% CNT100 ;
29:  R[66]=1 ;
30:   ;
31:  !Demande d'arret ;
32:  CALL DEMANDE_ARRET ;
33:   ;
34:  !Choix Uframe/Utool ;
35:  UFRAME_NUM=3 ;
36:  UTOOL_NUM=2 ;
37:   ;
38:  !Reset PR99 ;
39:  CALL RAZ_PR ;
40:   ;
41:  !Calcul de point d'approche pal ;
42:  CALL CALC01_40 ;
43:   ;
44:  R[66]=1.5 ;
45:  J PR[99:PR mobil] 100% FINE ;
46:  R[66]=2 ;
47:   ;
48:  !Demande d'arret ;
49:  CALL DEMANDE_ARRET ;
50:   ;
51:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
52:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
53:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
54:   ;
55:  !Photo et recuperation de donnee! ;
56:   ;
57:  CALL CAMERA ;
58:   ;
59:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
60:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
61:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
62:   ;
63:  !Choix Uframe/Utool ;
64:  UFRAME_NUM=3 ;
65:  UTOOL_NUM=2 ;
66:   ;
67:  R[66]=2.5 ;
68:  J P[3] 25% CNT100 ;
69:  R[66]=3 ;
70:   ;
71:  !Choix Uframe/Utool ;
72:  UFRAME_NUM=R[56:Calcul repere st] ;
73:  UTOOL_NUM=2 ;
74:   ;
75:  !Raz PR100 ;
76:  CALL RAZPR100 ;
77:   ;
78:  !Point d'approche prise ;
79:  PR[100,1:Dcallage]=4 ;
80:  PR[100,2:Dcallage]=(-14) ;
81:  PR[100,3:Dcallage]=(-300) ;
82:  R[66]=3.5 ;
83:  J PR[51:Point de prise] 25% FINE Tool_Offset,PR[100:Dcallage] ;
84:  R[66]=4 ;
85:   ;
86:  !Demande d'arret ;
87:  CALL DEMANDE_ARRET ;
88:   ;
89:  !Raz PR100 ;
90:  CALL RAZPR100 ;
91:   ;
92:  !Point de prise ;
93:  PR[100,1:Dcallage]=4 ;
94:  PR[100,2:Dcallage]=(-14) ;
95:  R[66]=4.5 ;
96:  L PR[51:Point de prise] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
97:  R[66]=5 ;
98:   ;
99:  !Demande d'arret ;
100:  CALL DEMANDE_ARRET ;
101:   ;
102:  !Actionnement de l'aspiration ;
103:  R[66]=5.5 ;
104:  CALL CYCLE_ASPI ;
105:  R[66]=6 ;
106:   ;
107:  //!Raz PR100 ;
108:  //CALL RAZPR100 ;
109:   ;
110:  !Point de degagement prise ;
111:  PR[100,3:Dcallage]=(-100) ;
112:  R[66]=6.5 ;
113:  L PR[51:Point de prise] 50mm/sec FINE ACC25 Tool_Offset,PR[100:Dcallage] ;
114:  R[66]=7 ;
115:  PR[100,3:Dcallage]=(-500) ;
116:  R[66]=7.5 ;
117:  J PR[51:Point de prise] 30% FINE Tool_Offset,PR[100:Dcallage] ;
118:  R[66]=8 ;
119:   ;
120:  !Raz PR ;
121:  CALL RAZPR99 ;
122:   ;
123:  !Choix Uframe/Utool ;
124:  UFRAME_NUM=0 ;
125:  UTOOL_NUM=2 ;
126:   ;
127:  !Approche ;
128:  R[66]=8.5 ;
129:  J P[7] 30% FINE ;
130:  R[66]=9 ;
131:  R[66]=9.5 ;
132:  J P[1] 30% FINE ;
133:  R[66]=10 ;
134:   ;
135:  !Trajectoir vers station ;
136:  R[66]=10.5 ;
137:  L P[10] 500mm/sec CNT25 ;
138:  R[66]=11 ;
139:  R[66]=11.5 ;
140:  J P[2] 30% CNT25 ;
141:  R[66]=12 ;
142:  R[66]=12.5 ;
143:  J P[4] 30% CNT25 ;
144:  R[66]=13 ;
145:  R[66]=13.5 ;
146:  L P[5] 500mm/sec FINE ;
147:  R[66]=14 ;
148:   ;
149:  !Demande d'arret ;
150:  CALL DEMANDE_ARRET ;
151:   ;
152:  !Demande d'arret ;
153:  CALL DEMANDE_ARRET ;
154:   ;
155:  !Choix Uframe/Utool ;
156:  UFRAME_NUM=1 ;
157:  UTOOL_NUM=2 ;
158:   ;
159:  !Point d'approche table de recent ;
160:  R[66]=14.5 ;
161:  J P[13] 100% FINE ;
162:  R[66]=15 ;
163:  R[66]=15.5 ;
164:  L P[14] 500mm/sec FINE ;
165:  R[66]=16 ;
166:   ;
167:  !Demande d'arret ;
168:  CALL DEMANDE_ARRET ;
169:   ;
170:  !Reset PR ;
171:  CALL RAZPR99 ;
172:   ;
173:  !Calcul pose ;
174:  CALL CALC01_40_POSER ;
175:   ;
176:  !Approche pose ;
177:  PR[70,3:Offset recentrag]=(-50) ;
178:  IF (R[36:Largeur Piece]=493),PR[70,2:Offset recentrag]=(PR[70,2:Offset recentrag]+(-40)) ;
179:   ;
180:  R[66]=16.5 ;
181:  J PR[99:PR mobil] 30% FINE Tool_Offset,PR[70:Offset recentr] ;
182:  R[66]=17 ;
183:   ;
184:  !Demande d'arret ;
185:  CALL DEMANDE_ARRET ;
186:   ;
187:  !Remise a 0 du Z ;
188:  PR[70,3:Offset recentrag]=PR[70,3:Offset recentrag]+50 ;
189:   ;
190:  !Point de pose ;
191:  R[66]=17.5 ;
192:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[70:Offset recentr] ;
193:  R[66]=18 ;
194:  IF (R[36:Largeur Piece]=493),PR[70,2:Offset recentrag]=(PR[70,2:Offset recentrag]+40) ;
195:   ;
196:  R[66]=18.5 ;
197:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[70:Offset recentr] ;
198:  R[66]=19 ;
199:   ;
200:  !Coupure de l'aspiration ;
201:  R[66]=19.5 ;
202:  CALL TOOL02_ASPIRATION_OFF ;
203:  R[66]=20 ;
204:   ;
205:  !Degagement piece ;
206:  PR[70,3:Offset recentrag]=(-50) ;
207:  R[66]=20.5 ;
208:  L PR[99:PR mobil] 250mm/sec CNT100 Tool_Offset,PR[70:Offset recentr] ;
209:  R[66]=21 ;
210:  R[66]=21.5 ;
211:  L P[14] 2000mm/sec FINE ;
212:  R[66]=22 ;
213:  R[66]=22.5 ;
214:  L P[13] 2000mm/sec CNT25 ;
215:  R[66]=23 ;
216:  R[66]=23.5 ;
217:  J P[5] 100% CNT25 ;
218:  R[66]=24 ;
219:  R[66]=24.5 ;
220:  J P[4] 100% CNT100 ;
221:  R[66]=25 ;
222:  R[66]=25.5 ;
223:  J P[2] 100% CNT100 ;
224:  R[66]=26 ;
225:  //J P[10] 100% CNT50 ;
226:   ;
227:  !Mis en position repos ;
228:  !Definition du repere ;
229:  UFRAME_NUM=5 ;
230:  UTOOL_NUM=5 ;
231:   ;
232:  R[66]=26.5 ;
233:  J P[8:Repos] 100% FINE ;
234:  R[66]=27 ;
235:   ;
236:  !Validation Fin Tache ;
237:  CALL VALIDATION_FIN_TACHE ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   973.005  mm,	Y =   925.287  mm,	Z =     4.703  mm,
	W =  -179.292 deg,	P =      .700 deg,	R =   -88.376 deg
};
P[2]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   685.613  mm,	Y = -1523.896  mm,	Z =     4.640  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[3]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   951.701  mm,	Y =  1432.453  mm,	Z =  2172.696  mm,
	W =  -171.076 deg,	P =    67.958 deg,	R =   -80.399 deg
};
P[4]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   686.146  mm,	Y = -1524.766  mm,	Z =   470.000  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[5]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  -658.194  mm,	Y = -1760.059  mm,	Z =   470.000  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[7]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   668.039  mm,	Y =  1595.992  mm,	Z =     4.636  mm,
	W =  -179.295 deg,	P =      .698 deg,	R =   -88.373 deg
};
P[8:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[10]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1015.617  mm,	Y =  -924.130  mm,	Z =     4.641  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[13]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   696.824  mm,	Y =   545.403  mm,	Z =   309.250  mm,
	W =   120.629 deg,	P =    13.721 deg,	R =   -82.387 deg
};
P[14]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   600.529  mm,	Y =   568.020  mm,	Z =   165.225  mm,
	W =   167.187 deg,	P =    11.798 deg,	R =   -81.937 deg
};
/END
