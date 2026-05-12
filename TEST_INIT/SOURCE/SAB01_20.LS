/PROG  SAB01_20
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise OP10";
PROG_SIZE	= 6171;
CREATE		= DATE 25-04-30  TIME 08:07:46;
MODIFIED	= DATE 25-11-26  TIME 22:06:24;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 268;
MEMORY_SIZE	= 6607;
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
3:  !///////Dechargement OP10//////// ;
4:  !//////////////////////////////// ;
5:   ;
6:  !Memo programme en cours ;
7:  R[38:Programme en cr]=2 ;
8:   ;
9:  !Validation Tache ;
10:  CALL VALIDATION_DEBUT_TACHE ;
11:   ;
12:  !Soufflage piece OP10 ;
13:  CALL SAB01_21TEST ;
14:   ;
15:  !Changment de prehenseur ;
16:  R[91:Choix outils]=3 ;
17:  CALL CHANG_OUTIL ;
18:   ;
19:  !Override ;
20:  CALL OVERRIDE ;
21:   ;
22:  !Choix Uframe/Utool ;
23:  UFRAME_NUM=0 ;
24:  UTOOL_NUM=3 ;
25:   ;
26:  !Point d'approche ;
27:  R[66]=0.5 ;
28:  J P[4] 100% FINE ;
29:  R[66]=1 ;
30:   ;
31:  !Trajectoir d'approche ;
32:  R[66]=1.5 ;
33:  J P[5] 100% CNT50 ;
34:  R[66]=2 ;
35:  R[66]=2.5 ;
36:  J P[6] 100% CNT25 ;
37:  R[66]=3 ;
38:  R[66]=3.5 ;
39:  J P[8] 100% FINE ;
40:  R[66]=4 ;
41:   ;
42:  !Demande d'arret ;
43:  CALL DEMANDE_ARRET ;
44:   ;
45:  !Choix Uframe/Utool ;
46:  UFRAME_NUM=6 ;
47:  UTOOL_NUM=3 ;
48:   ;
49:  !Test acces ;
50:  CALL TEST_ACCES_MACHINE ;
51:   ;
52:  !Point d'approche prise ;
53:  !Raz PR ;
54:  CALL RAZPR100 ;
55:  CALL RAZPR99 ;
56:   ;
57:  !Calcul point prise ;
58:  CALL CALC01_20_PRISE_MACHINE ;
59:   ;
60:  !Point d'approche pose ;
61:  PR[100,1:Dcallage]=8 ;
62:  PR[100,3:Dcallage]=(-500) ;
63:  R[66]=4.5 ;
64:  L PR[99:PR mobil] 2000mm/sec CNT100 Tool_Offset,PR[100:Dcallage] ;
65:  R[66]=5 ;
66:   ;
67:  !Ouverture pince ;
68:  R[66]=5.5 ;
69:  CALL TOOL03_OUVERTURE ;
70:  R[66]=6 ;
71:   ;
72:  !Point d'approche pose ;
73:   ;
74:  PR[100,3:Dcallage]=0 ;
75:  !Calcul Decallage Z ;
76:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
77:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
78:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise]) ;
79:  R[66]=6.5 ;
80:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
81:  R[66]=7 ;
82:   ;
83:  !Raz PR ;
84:  CALL RAZPR100 ;
85:   ;
86:  !//////////////////////////////// ;
87:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
88:  !//////////////////////////////// ;
89:  !Calcul Decallage Z ;
90:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
91:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
92:  !//////////////////////////////// ;
93:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise]) ;
94:   ;
95:  !Point de prise ;
96:  R[66]=7.5 ;
97:  L PR[99:PR mobil] 200mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
98:  R[66]=8 ;
99:   ;
100:  !Actionnement du verin ;
101:  CALL CYCLE_FERMETURE ;
102:   ;
103:  !Point d'approche pose ;
104:  PR[100,1:Dcallage]=(-3) ;
105:  R[66]=8.5 ;
106:  L PR[99:PR mobil] 400mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
107:  R[66]=9 ;
108:   ;
109:  !Point d'approche pose ;
110:  PR[100,3:Dcallage]=(-200) ;
111:  R[66]=9.5 ;
112:  L PR[99:PR mobil] 200mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
113:  R[66]=10 ;
114:   ;
115:  !Activation soufflage ;
116:  DO[103:OFF:Soufflage Machine]=ON ;
117:   ;
118:  !Soufflage piece ;
119:  R[66]=10.5 ;
120:  L P[7:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE ;
121:  R[66]=11 ;
122:   ;
123:   ;
124:  !Soufflage piece ;
125:  R[66]=11.5 ;
126:  L P[1:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE ;
127:  R[66]=12 ;
128:   ;
129:  !Soufflage piece ;
130:  R[66]=12.5 ;
131:  L P[13:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE ;
132:  R[66]=13 ;
133:   ;
134:  !Desactivation soufflage ;
135:  DO[103:OFF:Soufflage Machine]=OFF ;
136:   ;
137:  !Point d'approche pose ;
138:  PR[100,3:Dcallage]=(-200) ;
139:  R[66]=13.5 ;
140:  L PR[99:PR mobil] 200mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
141:  R[66]=14 ;
142:   ;
143:  !Point d'approche pose ;
144:  PR[100,3:Dcallage]=(-500) ;
145:  R[66]=14.5 ;
146:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
147:  R[66]=15 ;
148:   ;
149:  !Trajectoir vers station ;
150:   ;
151:  !Choix Uframe/Utool ;
152:  UFRAME_NUM=0 ;
153:  UTOOL_NUM=3 ;
154:   ;
155:  !Trajectoir vers station ;
156:  R[66]=15.5 ;
157:  J P[8] 30% FINE ;
158:  R[66]=16 ;
159:  PAUSE ;
160:  R[66]=16.5 ;
161:  J P[6] 30% CNT100 ;
162:  R[66]=17 ;
163:   ;
164:  R[66]=17.5 ;
165:  J P[5] 30% CNT25 ;
166:  R[66]=18 ;
167:   ;
168:  R[66]=18.5 ;
169:  J P[4] 30% CNT25 ;
170:  R[66]=19 ;
171:   ;
172:  R[66]=19.5 ;
173:  J P[26] 30% FINE ;
174:  R[66]=20 ;
175:   ;
176:  !Trajectoire vers table ;
177:  R[66]=20.5 ;
178:  L P[22] 500mm/sec CNT100 ;
179:  R[66]=21 ;
180:   ;
181:  R[66]=21.5 ;
182:  L P[2] 500mm/sec CNT10 ;
183:  R[66]=22 ;
184:   ;
185:  R[66]=22.5 ;
186:  J P[23] 30% CNT25 ;
187:  R[66]=23 ;
188:   ;
189:  R[66]=23.5 ;
190:  J P[24] 30% FINE ;
191:  R[66]=24 ;
192:   ;
193:  R[66]=24.5 ;
194:  L P[25] 500mm/sec FINE ;
195:  R[66]=25 ;
196:   ;
197:  !Choix Uframe/Utool ;
198:  UFRAME_NUM=1 ;
199:  UTOOL_NUM=3 ;
200:   ;
201:  !Demande d'arret ;
202:  CALL DEMANDE_ARRET ;
203:   ;
204:  !Trajectoire d approche ;
205:  R[66]=25.5 ;
206:  L P[9] 500mm/sec FINE ;
207:  R[66]=26 ;
208:   ;
209:  R[66]=26.5 ;
210:  L P[10] 500mm/sec FINE ;
211:  R[66]=27 ;
212:   ;
213:  !Demande d'arret ;
214:  CALL DEMANDE_ARRET ;
215:   ;
216:  !Reset PR ;
217:  CALL RAZPR100 ;
218:   ;
219:  !Approche pose ;
220:  PR[100,3:Dcallage]=(-100) ;
221:  R[66]=27.5 ;
222:  L P[12:Pose] 500mm/sec CNT100 Tool_Offset,PR[90:Approche prise] ;
223:  R[66]=28 ;
224:   ;
225:  !Raz PR ;
226:  CALL RAZPR99 ;
227:  CALL RAZPR100 ;
228:   ;
229:  !Calcul Pose ;
230:  CALL CALC01_20_POSE_RECENTRAGE ;
231:  !Point de pose ;
232:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40) ;
233:  PR[100,2:Dcallage]=(R[32:Reglage Prise]-3) ;
234:  R[66]=28.5 ;
235:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
236:  R[66]=29 ;
237:   ;
238:  !Point de pose ;
239:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]+40) ;
240:  R[66]=29.5 ;
241:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
242:  R[66]=30 ;
243:   ;
244:  !Point de pose ;
245:  R[66]=30.5 ;
246:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
247:  R[66]=31 ;
248:   ;
249:  !Ouverture verin ;
250:  R[66]=31.5 ;
251:  CALL TOOL03_OUVERTURE ;
252:  R[66]=32 ;
253:   ;
254:  !Degagement piece ;
255:  PR[100,1:Dcallage]=12 ;
256:  R[66]=32.5 ;
257:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
258:  R[66]=33 ;
259:   ;
260:  PR[100,3:Dcallage]=(-150) ;
261:  R[66]=33.5 ;
262:  L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
263:  R[66]=34 ;
264:   ;
265:  !Trajectoire de degagement ;
266:  R[66]=34.5 ;
267:  L P[9] 2000mm/sec FINE ;
268:  R[66]=35 ;
269:   ;
270:  !Demande d'arret ;
271:  CALL DEMANDE_ARRET ;
272:   ;
273:  R[66]=35.5 ;
274:  J P[25] 100% CNT25 ;
275:  R[66]=36 ;
276:   ;
277:  R[66]=36.5 ;
278:  J P[24] 100% CNT25 ;
279:  R[66]=37 ;
280:   ;
281:  R[66]=37.5 ;
282:  J P[23] 100% CNT25 ;
283:  R[66]=38 ;
284:   ;
285:  R[66]=38.5 ;
286:  J P[3] 100% CNT25 ;
287:  R[66]=39 ;
288:   ;
289:  !Demande d'arret ;
290:  CALL DEMANDE_ARRET ;
291:   ;
292:  !Mis en position repos ;
293:  !Definition du repere ;
294:  UFRAME_NUM=5 ;
295:  UTOOL_NUM=5 ;
296:   ;
297:  R[66]=39.5 ;
298:  J P[11:Repos] 100% FINE ;
299:  R[66]=40 ;
300:   ;
301:  !Soufflage du posage OP20 ;
302:  CALL SAB01_21TEST ;
303:   ;
304:  !Depart cycle ;
305:  CALL DCY_MACHINE ;
306:   ;
307:   ;
308:  !Validation Fin Tache ;
309:  CALL VALIDATION_FIN_TACHE ;
/POS
P[1:"Deg avc Soufflag"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =  1119.518  mm,	Y =    70.483  mm,	Z =  -163.791  mm,
	W =   168.033 deg,	P =     -.571 deg,	R =   -91.955 deg
};
P[2]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   731.365  mm,	Y = -1289.531  mm,	Z =   -39.980  mm,
	W =  -178.870 deg,	P =    -2.783 deg,	R =    -3.621 deg
};
P[3]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1057.841  mm,	Y =  1839.887  mm,	Z = -1390.515  mm,
	W =   121.015 deg,	P =    -5.541 deg,	R =   -89.986 deg
};
P[4]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   892.834  mm,	Y =   947.695  mm,	Z =   -20.113  mm,
	W =  -179.358 deg,	P =    -4.540 deg,	R =   -41.889 deg
};
P[5]{
   GP1:
	UF : 0, UT : 3,	
	J1=    61.275 deg,	J2=    10.066 deg,	J3=   -24.248 deg,
	J4=   -55.994 deg,	J5=  -120.099 deg,	J6=   158.434 deg
};
P[6]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -396.596  mm,	Y =  1674.444  mm,	Z =   489.433  mm,
	W =  -173.479 deg,	P =    86.360 deg,	R =     5.637 deg
};
P[7:"Deg avc Soufflag"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   233.528  mm,	Y =   108.737  mm,	Z =   -23.181  mm,
	W =   176.502 deg,	P =     -.277 deg,	R =   -92.018 deg
};
P[8]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -561.775  mm,	Y =  1674.443  mm,	Z =   557.498  mm,
	W =  -173.479 deg,	P =    86.360 deg,	R =     5.637 deg
};
P[9]{
   GP1:
	UF : 1, UT : 3,	
	J1=  -116.321 deg,	J2=    42.351 deg,	J3=   -11.925 deg,
	J4=   -20.325 deg,	J5=  -115.109 deg,	J6=   174.225 deg
};
P[10]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   324.673  mm,	Y =   501.009  mm,	Z =    59.893  mm,
	W =   166.088 deg,	P =      .764 deg,	R =  -152.481 deg
};
P[11:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[12:"Pose"]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   313.191  mm,	Y =   508.721  mm,	Z =   -16.490  mm,
	W =   168.936 deg,	P =     1.994 deg,	R =  -152.747 deg
};
P[13:"Deg avc Soufflag"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   233.528  mm,	Y =   108.737  mm,	Z =   -23.181  mm,
	W =   176.502 deg,	P =     -.277 deg,	R =   -92.018 deg
};
P[22]{
   GP1:
	UF : 0, UT : 3,	
	J1=   -36.489 deg,	J2=   -13.546 deg,	J3=   -30.151 deg,
	J4=     6.168 deg,	J5=   -42.006 deg,	J6=   239.781 deg
};
P[23]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   174.522  mm,	Y = -1266.536  mm,	Z =   -40.082  mm,
	W =  -178.868 deg,	P =    -2.780 deg,	R =  -158.977 deg
};
P[24]{
   GP1:
	UF : 0, UT : 3,	
	J1=   -85.618 deg,	J2=    12.559 deg,	J3=    -5.097 deg,
	J4=    16.057 deg,	J5=   -94.031 deg,	J6=   137.340 deg
};
P[25]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -872.240  mm,	Y = -1925.774  mm,	Z =   522.823  mm,
	W =  -178.872 deg,	P =    -2.778 deg,	R =  -158.976 deg
};
P[26]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1192.039  mm,	Y =   947.694  mm,	Z =   -20.113  mm,
	W =  -179.358 deg,	P =    -4.540 deg,	R =     2.024 deg
};
/END
