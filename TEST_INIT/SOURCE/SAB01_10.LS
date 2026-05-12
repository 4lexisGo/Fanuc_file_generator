/PROG  SAB01_10
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Dechargement op2";
PROG_SIZE	= 5447;
CREATE		= DATE 25-04-30  TIME 08:07:30;
MODIFIED	= DATE 26-04-15  TIME 20:13:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 225;
MEMORY_SIZE	= 5935;
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
3:  !///////Dechargement OP20//////// ;
4:  !//////////////////////////////// ;
5:   ;
6:  !Recuperation Info Piece ;
7:  CALL INFO_PIECE_ACTU ;
8:   ;
9:  !Memo programme en cours ;
10:  R[38:Programme en cr]=1 ;
11:   ;
12:  !Validation Tache ;
13:  CALL VALIDATION_DEBUT_TACHE ;
14:   ;
15:  !Soufflage piece OP20 ;
16:  CALL SAB01_11 ;
17:   ;
18:  !Changment de prehenseur ;
19:  R[91:Choix outils]=3 ;
20:  CALL CHANG_OUTIL ;
21:   ;
22:  !Override ;
23:  CALL OVERRIDE ;
24:   ;
25:  !Choix Uframe/Utool ;
26:  UFRAME_NUM=0 ;
27:  UTOOL_NUM=3 ;
28:   ;
29:  !Point d'approche ;
30:  R[66]=0.5 ;
31:  J P[2:App 1] 100% FINE ;
32:  R[66]=1 ;
33:   ;
34:  !Trajectoir d'approche ;
35:  R[66]=1.5 ;
36:  J P[4:App 2] 100% CNT25 ;
37:  R[66]=2 ;
38:  R[66]=2.5 ;
39:  J P[3:App 3] 100% FINE ;
40:  R[66]=3 ;
41:  R[66]=3.5 ;
42:  L P[14] 2000mm/sec FINE ;
43:  R[66]=4 ;
44:   ;
45:  !Demande d'arret ;
46:  CALL DEMANDE_ARRET ;
47:   ;
48:  !Choix Uframe/Utool ;
49:  UFRAME_NUM=6 ;
50:  UTOOL_NUM=3 ;
51:   ;
52:  !Test acces ;
53:  CALL TEST_ACCES_MACHINE ;
54:   ;
55:  !Calcul point prise ;
56:  CALL CALC01_10_PRISE_MACHINE ;
57:   ;
58:  !Point d'approche pose ;
59:  PR[100,3:Dcallage]=(-200) ;
60:  R[66]=4.5 ;
61:  L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
62:  R[66]=5 ;
63:   ;
64:  !Ouverture pince ;
65:  R[66]=5.5 ;
66:  CALL TOOL03_OUVERTURE ;
67:  R[66]=6 ;
68:   ;
69:  !Point d'approche prise ;
70:  PR[100,1:Dcallage]=10 ;
71:  PR[100,3:Dcallage]=(-75) ;
72:  R[66]=6.5 ;
73:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
74:  R[66]=7 ;
75:   ;
76:  PR[100,3:Dcallage]=0 ;
77:  !//////////////////////////////// ;
78:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
79:  !//////////////////////////////// ;
80:  !Calcul Decallage Z ;
81:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
82:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
83:  !//////////////////////////////// ;
84:  R[66]=7.5 ;
85:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
86:  R[66]=8 ;
87:   ;
88:  !Raz PR ;
89:  CALL RAZPR100 ;
90:   ;
91:  !//////////////////////////////// ;
92:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
93:  !//////////////////////////////// ;
94:  !Calcul Decallage Z ;
95:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
96:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
97:  !//////////////////////////////// ;
98:   ;
99:  !Point de prise ;
100:  R[66]=8.5 ;
101:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
102:  R[66]=9 ;
103:   ;
104:  !Actionnement du verin ;
105:  CALL CYCLE_FERMETURE ;
106:   ;
107:  !Point d'approche pose ;
108:  PR[100,2:Dcallage]=1.5 ;
109:  R[66]=9.5 ;
110:  L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
111:  R[66]=10 ;
112:   ;
113:  !Point d'approche pose ;
114:  PR[100,3:Dcallage]=(-200) ;
115:  R[66]=10.5 ;
116:  L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
117:  R[66]=11 ;
118:   ;
119:  !Activation soufflage ;
120:  DO[103:OFF:Soufflage Machine]=ON ;
121:   ;
122:  !Soufflage piece ;
123:  R[66]=11.5 ;
124:  L P[13:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE ;
125:  R[66]=12 ;
126:   ;
127:  R[66]=12.5 ;
128:  L P[17] 100mm/sec FINE ;
129:  R[66]=13 ;
130:   ;
131:  R[66]=13.5 ;
132:  L P[16] 100mm/sec FINE ;
133:  R[66]=14 ;
134:  R[66]=14.5 ;
135:  L P[18] 100mm/sec FINE ;
136:  R[66]=15 ;
137:  !Soufflage piece ;
138:  R[66]=15.5 ;
139:  L P[12:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE ;
140:  R[66]=16 ;
141:   ;
142:   ;
143:  !Desactivation soufflage ;
144:  DO[103:OFF:Soufflage Machine]=OFF ;
145:   ;
146:  !Choix Uframe/Utool ;
147:  UFRAME_NUM=0 ;
148:  UTOOL_NUM=3 ;
149:   ;
150:  !Trajectoir vers station 1 2 ;
151:  R[66]=16.5 ;
152:  J P[1:App 4] 30% FINE ;
153:  R[66]=17 ;
154:   ;
155:  R[66]=17.5 ;
156:  J P[3:App 3] 30% CNT100 ;
157:  R[66]=18 ;
158:   ;
159:  R[66]=18.5 ;
160:  J P[4:App 2] 30% CNT25 ;
161:  R[66]=19 ;
162:   ;
163:  R[66]=19.5 ;
164:  J P[2:App 1] 30% CNT25 ;
165:  R[66]=20 ;
166:   ;
167:  R[66]=20.5 ;
168:  J P[7] 30% FINE ;
169:  R[66]=21 ;
170:   ;
171:   ;
172:  !Demande d'arret ;
173:  CALL DEMANDE_ARRET ;
174:   ;
175:  !Choix Uframe/Utool ;
176:  UFRAME_NUM=2 ;
177:  UTOOL_NUM=3 ;
178:   ;
179:  !Point au dessu de la station ;
180:  R[66]=21.5 ;
181:  L P[10] 500mm/sec FINE ;
182:  R[66]=22 ;
183:   ;
184:  R[66]=22.5 ;
185:  J P[8] 30% FINE ;
186:  R[66]=23 ;
187:   ;
188:  R[66]=23.5 ;
189:  J P[9] 30% FINE ;
190:  R[66]=24 ;
191:   ;
192:  !Demande d'arret ;
193:  CALL DEMANDE_ARRET ;
194:   ;
195:  !Reset PR ;
196:  CALL RAZPR99 ;
197:  CALL RAZPR100 ;
198:   ;
199:  !Calcule pose palette ;
200:  CALL CALC01_10 ;
201:   ;
202:  !Approche palette ;
203:  PR[100,3:Dcallage]=(-500) ;
204:  R[66]=24.5 ;
205:  J PR[99:PR mobil] 30% FINE Tool_Offset,PR[100:Dcallage] ;
206:  R[66]=25 ;
207:  !Approche pose ;
208:  PR[100,3:Dcallage]=(-50) ;
209:  R[66]=25.5 ;
210:  L PR[99:PR mobil] 500mm/sec CNT100 Tool_Offset,PR[100:Dcallage] ;
211:  R[66]=26 ;
212:   ;
213:  !Point de pose ;
214:  R[66]=26.5 ;
215:  L PR[99:PR mobil] 250mm/sec FINE ;
216:  R[66]=27 ;
217:   ;
218:  !Ouverture verin ;
219:  R[66]=27.5 ;
220:  CALL TOOL03_OUVERTURE ;
221:  R[66]=28 ;
222:   ;
223:  !Degagement piece ;
224:  R[66]=28.5 ;
225:  L PR[99:PR mobil] 500mm/sec CNT100 Tool_Offset,PR[100:Dcallage] ;
226:  R[66]=29 ;
227:   ;
228:  !Degagement palette ;
229:  PR[100,3:Dcallage]=(-300) ;
230:  R[66]=29.5 ;
231:  J PR[99:PR mobil] 100% CNT100 Tool_Offset,PR[100:Dcallage] ;
232:  R[66]=30 ;
233:   ;
234:  !Retour en position repos ;
235:  R[66]=30.5 ;
236:  J P[8] 100% CNT15 ;
237:  R[66]=31 ;
238:  R[66]=31.5 ;
239:  J P[5] 100% CNT15 ;
240:  R[66]=32 ;
241:  R[66]=32.5 ;
242:  J P[6] 50% CNT15 ;
243:  R[66]=33 ;
244:   ;
245:  !Mis en position repos ;
246:  !Definition du repere ;
247:  UFRAME_NUM=5 ;
248:  UTOOL_NUM=5 ;
249:   ;
250:  R[66]=33.5 ;
251:  J P[11:Repos] 100% FINE ;
252:  R[66]=34 ;
253:   ;
254:   ;
255:  !Soufflage du posage OP20 ;
256:  CALL SAB01_11 ;
257:   ;
258:  !Depart cycle ;
259:  CALL DCY_MACHINE ;
260:   ;
261:  !Validation Fin Tache ;
262:  CALL VALIDATION_FIN_TACHE ;
/POS
P[1:"App 4"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -561.775  mm,	Y =  1674.443  mm,	Z =   557.498  mm,
	W =  -173.479 deg,	P =    86.360 deg,	R =     5.637 deg
};
P[2:"App 1"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   892.834  mm,	Y =   947.695  mm,	Z =   -20.113  mm,
	W =  -179.358 deg,	P =    -4.540 deg,	R =   -41.889 deg
};
P[3:"App 3"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -396.596  mm,	Y =  1674.444  mm,	Z =   489.433  mm,
	W =  -173.479 deg,	P =    86.360 deg,	R =     5.637 deg
};
P[4:"App 2"]{
   GP1:
	UF : 0, UT : 3,	
	J1=    61.275 deg,	J2=    10.066 deg,	J3=   -24.248 deg,
	J4=   -55.994 deg,	J5=  -120.099 deg,	J6=   158.434 deg
};
P[5]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1153.797  mm,	Y =  1639.660  mm,	Z =  1279.221  mm,
	W =  -179.819 deg,	P =    -5.084 deg,	R =   -89.482 deg
};
P[6]{
   GP1:
	UF : 2, UT : 3,	
	J1=     7.261 deg,	J2=   -28.762 deg,	J3=   -23.004 deg,
	J4=    13.218 deg,	J5=   -83.399 deg,	J6=   110.454 deg
};
P[7:""]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1192.039  mm,	Y =   947.694  mm,	Z =   -20.113  mm,
	W =  -179.358 deg,	P =    -4.540 deg,	R =     2.024 deg
};
P[8]{
   GP1:
	UF : 2, UT : 3,	
	J1=   -70.429 deg,	J2=    -1.645 deg,	J3=   -29.071 deg,
	J4=   -13.541 deg,	J5=   -43.040 deg,	J6=   289.290 deg
};
P[9]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   689.634  mm,	Y =  1187.976  mm,	Z =  1279.220  mm,
	W =  -179.819 deg,	P =    -5.084 deg,	R =      .465 deg
};
P[10:""]{
   GP1:
	UF : 2, UT : 3,	
	J1=   -27.392 deg,	J2=   -26.756 deg,	J3=   -29.501 deg,
	J4=     8.722 deg,	J5=   -40.829 deg,	J6=   232.169 deg
};
P[11:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[12:"Deg avc Soufflag"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   482.702  mm,	Y =   227.042  mm,	Z =   147.597  mm,
	W =   179.908 deg,	P =    -4.227 deg,	R =    89.078 deg
};
P[13:"Deg avc Soufflag"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   482.702  mm,	Y =   227.042  mm,	Z =   147.597  mm,
	W =   179.908 deg,	P =    -4.227 deg,	R =    89.078 deg
};
P[14]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -875.548  mm,	Y =  1639.306  mm,	Z =   592.146  mm,
	W =   161.127 deg,	P =    88.073 deg,	R =   -20.072 deg
};
P[16]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1362.158  mm,	Y =   212.539  mm,	Z =   -13.639  mm,
	W =  -169.586 deg,	P =    -3.989 deg,	R =    88.323 deg
};
P[17]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   465.412  mm,	Y =   227.330  mm,	Z =   150.791  mm,
	W =  -169.585 deg,	P =    -3.990 deg,	R =    88.323 deg
};
P[18]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   465.412  mm,	Y =   227.330  mm,	Z =   150.791  mm,
	W =  -169.585 deg,	P =    -3.990 deg,	R =    88.323 deg
};
/END
