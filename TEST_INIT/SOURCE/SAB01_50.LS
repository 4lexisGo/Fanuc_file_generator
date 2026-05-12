/PROG  SAB01_50
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Chgt brut op10";
PROG_SIZE	= 6995;
CREATE		= DATE 25-04-30  TIME 08:08:10;
MODIFIED	= DATE 26-02-03  TIME 19:31:22;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 302;
MEMORY_SIZE	= 7431;
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
3:  !///////Chargement OP10////////// ;
4:  !//////////////////////////////// ;
5:   ;
6:  !Memo programme en cours ;
7:  R[38:Programme en cr]=5 ;
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
23:  !Approche table de retournement ;
24:  //L P[6] 2000mm/sec FINE ;
25:   ;
26:  R[66]=0.5 ;
27:  J P[1] 100% CNT25 ;
28:  R[66]=1 ;
29:   ;
30:  !Point au dessu des stations ;
31:  R[66]=1.5 ;
32:  L P[18] 2000mm/sec CNT25 ;
33:  R[66]=2 ;
34:   ;
35:  !Demande d'arret ;
36:  CALL DEMANDE_ARRET ;
37:   ;
38:  !Choix Uframe/Utool ;
39:  UFRAME_NUM=1 ;
40:  UTOOL_NUM=3 ;
41:   ;
42:  !Point d'approche table de recent ;
43:  R[66]=2.5 ;
44:  L P[19] 2000mm/sec CNT25 ;
45:  R[66]=3 ;
46:  R[66]=3.5 ;
47:  L P[20] 2000mm/sec CNT10 ;
48:  R[66]=4 ;
49:  //L P[2] 2000mm/sec FINE ;
50:   ;
51:  !Demande d'arret ;
52:  CALL DEMANDE_ARRET ;
53:   ;
54:  !Ouverture verin ;
55:  R[66]=4.5 ;
56:  CALL TOOL03_OUVERTURE ;
57:  R[66]=5 ;
58:   ;
59:  !Raz PR ;
60:  CALL RAZPR100 ;
61:   ;
62:  !Calcul point prise ;
63:  CALL CALC01_50_PRISE ;
64:   ;
65:  !Approche prise ;
66:  PR[100,3:Dcallage]=PR[100,3:Dcallage]-100 ;
67:  PR[100,1:Dcallage]=10 ;
68:  R[66]=5.5 ;
69:  L PR[99:PR mobil] 1000mm/sec CNT100 Tool_Offset,PR[100:Dcallage] ;
70:  R[66]=6 ;
71:   ;
72:  !Ouverture pince ;
73:  R[66]=6.5 ;
74:  CALL TOOL03_OUVERTURE ;
75:  R[66]=7 ;
76:   ;
77:  !Point de prise ;
78:  PR[100,3:Dcallage]=PR[100,3:Dcallage]+100 ;
79:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise]) ;
80:  R[66]=7.5 ;
81:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
82:  R[66]=8 ;
83:   ;
84:  !Decalage ;
85:  PR[100,1:Dcallage]=(-1) ;
86:  R[66]=8.5 ;
87:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
88:  R[66]=9 ;
89:   ;
90:  !Fermeture verin ;
91:  CALL CYCLE_FERMETURE ;
92:   ;
93:  !Raz PR ;
94:  CALL RAZPR100 ;
95:   ;
96:  !Degagement piece ;
97:  PR[100,1:Dcallage]=(-5) ;
98:  PR[100,2:Dcallage]=(R[32:Reglage Prise]-3) ;
99:  PR[100,3:Dcallage]=(-20) ;
100:  R[66]=9.5 ;
101:  L PR[99:PR mobil] 250mm/sec CNT100 Tool_Offset,PR[100:Dcallage] ;
102:  R[66]=10 ;
103:   ;
104:   ;
105:  PR[100,3:Dcallage]=(-100) ;
106:  R[66]=10.5 ;
107:  L PR[99:PR mobil] 500mm/sec CNT100 Tool_Offset,PR[100:Dcallage] ;
108:  R[66]=11 ;
109:  R[66]=11.5 ;
110:  L P[2] 500mm/sec FINE ;
111:  R[66]=12 ;
112:  R[66]=12.5 ;
113:  L P[20] 500mm/sec FINE ;
114:  R[66]=13 ;
115:  R[66]=13.5 ;
116:  L P[19] 500mm/sec FINE ;
117:  R[66]=14 ;
118:   ;
119:  !Demande d'arret ;
120:  CALL DEMANDE_ARRET ;
121:   ;
122:  !Choix Uframe/Utool ;
123:  UFRAME_NUM=0 ;
124:  UTOOL_NUM=3 ;
125:   ;
126:  R[66]=14.5 ;
127:  J P[18] 30% CNT100 ;
128:  R[66]=15 ;
129:  R[66]=15.5 ;
130:  J P[1] 30% CNT100 ;
131:  R[66]=16 ;
132:  R[66]=16.5 ;
133:  J P[9] 30% CNT100 ;
134:  R[66]=17 ;
135:  R[66]=17.5 ;
136:  J P[10] 30% CNT100 ;
137:  R[66]=18 ;
138:  R[66]=18.5 ;
139:  L P[11] 1000mm/sec CNT100 ACC50 ;
140:  R[66]=19 ;
141:  R[66]=19.5 ;
142:  L P[12] 500mm/sec CNT100 ;
143:  R[66]=20 ;
144:  R[66]=20.5 ;
145:  J P[3] 30% CNT100 ;
146:  R[66]=21 ;
147:  R[66]=21.5 ;
148:  L P[4] 500mm/sec CNT100 ;
149:  R[66]=22 ;
150:   ;
151:  !Demande d'arret ;
152:  CALL DEMANDE_ARRET ;
153:   ;
154:  !Choix Uframe/Utool ;
155:  UFRAME_NUM=6 ;
156:  UTOOL_NUM=3 ;
157:   ;
158:  !Test acces ;
159:  CALL TEST_ACCES_MACHINE ;
160:   ;
161:  !Raz PR ;
162:  CALL RAZPR100 ;
163:  CALL RAZPR99 ;
164:   ;
165:  !Calcul Pose ;
166:  CALL CALC01_50_POSE_MACHINE ;
167:   ;
168:  !Point d'approche pose ;
169:  PR[100,1:Dcallage]=0 ;
170:  PR[100,2:Dcallage]=(-5) ;
171:  PR[100,3:Dcallage]=(-600) ;
172:  R[66]=22.5 ;
173:  L PR[99:PR mobil] 500mm/sec CNT10 Tool_Offset,PR[100:Dcallage] ;
174:  R[66]=23 ;
175:   ;
176:  !Point d'approche pose ;
177:  PR[100,1:Dcallage]=30 ;
178:  PR[100,2:Dcallage]=(-5) ;
179:  PR[100,3:Dcallage]=(-600) ;
180:  R[66]=23.5 ;
181:  L PR[99:PR mobil] 500mm/sec CNT50 Tool_Offset,PR[100:Dcallage] ;
182:  R[66]=24 ;
183:   ;
184:  !Point d'approche pose ;
185:  PR[100,1:Dcallage]=30 ;
186:  PR[100,2:Dcallage]=(-5) ;
187:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise]) ;
188:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
189:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
190:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40) ;
191:  R[66]=24.5 ;
192:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
193:  R[66]=25 ;
194:   ;
195:  !Point d'approche pose ;
196:  PR[100,1:Dcallage]=0 ;
197:  PR[100,2:Dcallage]=(-5) ;
198:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise]) ;
199:  R[66]=25.5 ;
200:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
201:  R[66]=26 ;
202:   ;
203:  !Raz PR ;
204:  CALL RAZPR100 ;
205:   ;
206:  !Point d'approche pose ;
207:  PR[100,1:Dcallage]=0 ;
208:  PR[100,2:Dcallage]=(-5) ;
209:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise]) ;
210:  PR[100,3:Dcallage]=0 ;
211:  !//////////////////////////////// ;
212:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
213:  !//////////////////////////////// ;
214:  !Calcul Decallage Z ;
215:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
216:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
217:  //IF (R[37:Hauteur Piece]=40),PR[100,3:Dcallage]=(30) ;
218:   ;
219:  !//////////////////////////////// ;
220:  R[66]=26.5 ;
221:  L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
222:  R[66]=27 ;
223:   ;
224:  !Raz PR ;
225:  CALL RAZPR100 ;
226:   ;
227:  !//////////////////////////////// ;
228:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
229:  !//////////////////////////////// ;
230:  !Calcul Decallage Z ;
231:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
232:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
233:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise]) ;
234:   ;
235:  !//////////////////////////////// ;
236:   ;
237:  !Point de pose ;
238:  R[66]=27.5 ;
239:  L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
240:  R[66]=28 ;
241:  IF (R[37:Hauteur Piece]=40),PR[100,3:Dcallage]=(30) ;
242:  !Point de pose ;
243:  R[66]=28.5 ;
244:  L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
245:  R[66]=29 ;
246:   ;
247:  !ouverture du verin ;
248:  R[66]=29.5 ;
249:  CALL TOOL03_OUVERTURE ;
250:  R[66]=30 ;
251:   ;
252:  !Raz PR ;
253:  CALL RAZPR100 ;
254:   ;
255:  !Point d'approche pose ;
256:  !Calcul Decallage Z ;
257:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
258:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
259:  PR[100,1:Dcallage]=10 ;
260:  PR[100,2:Dcallage]=R[32:Reglage Prise] ;
261:  R[66]=30.5 ;
262:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
263:  R[66]=31 ;
264:   ;
265:  !Point d'approche pose ;
266:  PR[100,3:Dcallage]=(-500) ;
267:  PR[100,2:Dcallage]=R[32:Reglage Prise] ;
268:  R[66]=31.5 ;
269:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
270:  R[66]=32 ;
271:   ;
272:  !Choix Uframe/Utool ;
273:  UFRAME_NUM=0 ;
274:  UTOOL_NUM=3 ;
275:   ;
276:   ;
277:  R[66]=32.5 ;
278:  L P[4] 2000mm/sec CNT25 ;
279:  R[66]=33 ;
280:   ;
281:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
282:  !\\\\\\Appuie piece machine\\\\\\ ;
283:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
284:   ;
285:  !Fermeture pince ;
286:  R[66]=33.5 ;
287:  CALL TOOL03_FERMETURE ;
288:  R[66]=34 ;
289:   ;
290:  !Raz PR ;
291:  CALL RAZPR99 ;
292:  CALL RAZPR100 ;
293:   ;
294:  !Calcul offset ;
295:  PR[100,1:Dcallage]=100 ;
296:   ;
297:  !Trajectoire de pousage ;
298:  R[66]=34.5 ;
299:  L P[8:Pousage Piece] 1000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
300:  R[66]=35 ;
301:   ;
302:  !Point de poussee ;
303:  R[66]=35.5 ;
304:  L P[8:Pousage Piece] 1000mm/sec FINE ;
305:  R[66]=36 ;
306:   ;
307:  !Ouverture Pince ;
308:  R[66]=36.5 ;
309:  CALL TOOL03_OUVERTURE ;
310:  R[66]=37 ;
311:   ;
312:  !Tempo ;
313:  WAIT   1.00(sec) ;
314:   ;
315:  !Trajectoire de pousage ;
316:  R[66]=37.5 ;
317:  L P[8:Pousage Piece] 1000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
318:  R[66]=38 ;
319:   ;
320:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
321:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
322:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
323:   ;
324:  R[66]=38.5 ;
325:  L P[14] 2000mm/sec CNT25 ;
326:  R[66]=39 ;
327:   ;
328:  R[66]=39.5 ;
329:  J P[3] 100% CNT25 ;
330:  R[66]=40 ;
331:  R[66]=40.5 ;
332:  J P[12] 100% CNT25 ;
333:  R[66]=41 ;
334:  R[66]=41.5 ;
335:  L P[11] 2000mm/sec CNT25 ;
336:  R[66]=42 ;
337:   ;
338:  CALL DCY_MACHINE ;
339:  !Demande d'arret ;
340:  CALL DEMANDE_ARRET ;
341:   ;
342:  !Mis en position repos ;
343:  !Definition du repere ;
344:  UFRAME_NUM=5 ;
345:  UTOOL_NUM=5 ;
346:   ;
347:  R[66]=42.5 ;
348:  J P[7:Repos] 100% FINE ;
349:  R[66]=43 ;
350:   ;
351:  !Demande d'arret ;
352:  CALL DEMANDE_ARRET ;
353:   ;
354:  CALL TPS_CYCLE ;
355:   ;
356:  !Validation Fin Tache ;
357:  CALL VALIDATION_FIN_TACHE ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 3,	
	J1=   -43.345 deg,	J2=    -8.894 deg,	J3=   -31.067 deg,
	J4=    18.133 deg,	J5=   -67.463 deg,	J6=   129.648 deg
};
P[2]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   413.568  mm,	Y =   557.487  mm,	Z =   184.811  mm,
	W =   175.360 deg,	P =    -3.518 deg,	R =  -161.253 deg
};
P[3]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   -21.501  mm,	Y =  1631.798  mm,	Z =   605.366  mm,
	W =   160.733 deg,	P =    88.232 deg,	R =   -20.480 deg
};
P[4]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -500.359  mm,	Y =  1631.524  mm,	Z =   604.092  mm,
	W =   161.122 deg,	P =    88.073 deg,	R =   -20.077 deg
};
P[6]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   951.699  mm,	Y =  -758.519  mm,	Z =  -120.042  mm,
	W =  -179.358 deg,	P =    -4.540 deg,	R =   -90.671 deg
};
P[7:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[8:"Pousage Piece"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -845.597  mm,	Y =  1704.494  mm,	Z =   -44.864  mm,
	W =   179.456 deg,	P =    -4.191 deg,	R =    -1.055 deg
};
P[9]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   810.858  mm,	Y = -1124.405  mm,	Z =   -39.980  mm,
	W =  -178.870 deg,	P =    -2.783 deg,	R =    -3.621 deg
};
P[10]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =  1261.576  mm,	Y =  -866.358  mm,	Z =   -39.980  mm,
	W =  -178.870 deg,	P =    -2.783 deg,	R =    -3.621 deg
};
P[11]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1211.530  mm,	Y =   872.890  mm,	Z =   -42.414  mm,
	W =  -178.870 deg,	P =    -2.783 deg,	R =     -.904 deg
};
P[12]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   638.486  mm,	Y =  1631.666  mm,	Z =   411.844  mm,
	W =  -178.870 deg,	P =    -2.783 deg,	R =     -.904 deg
};
P[14]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -500.359  mm,	Y =  1631.524  mm,	Z =   604.092  mm,
	W =   161.122 deg,	P =    88.073 deg,	R =   -20.077 deg
};
P[18]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   155.084  mm,	Y = -1288.252  mm,	Z =   480.494  mm,
	W =  -176.152 deg,	P =    -2.497 deg,	R =  -139.688 deg
};
P[19]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.421  mm,	Y =   566.027  mm,	Z =   254.321  mm,
	W =   133.886 deg,	P =   -42.964 deg,	R =  -117.966 deg
};
P[20]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   708.760  mm,	Y =   557.518  mm,	Z =   237.066  mm,
	W =   175.120 deg,	P =   -18.470 deg,	R =  -159.985 deg
};
/END
