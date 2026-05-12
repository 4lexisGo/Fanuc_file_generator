/PROG  SAB01_30
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pos OP10 sur op2";
PROG_SIZE	= 8807;
CREATE		= DATE 25-04-30  TIME 08:07:54;
MODIFIED	= DATE 26-04-16  TIME 21:32:36;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 382;
MEMORY_SIZE	= 9311;
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
3:  !///////Chargement OP20//////// ;
4:  !//////////////////////////////// ;
5:   ;
6:  !Memo programme en cours ;
7:  R[38:Programme en cr]=3 ;
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
24:  R[66]=0.5 ;
25:  J P[6] 100% CNT25 ;
26:  R[66]=1 ;
27:   ;
28:  R[66]=1.5 ;
29:  J P[2] 100% FINE ;
30:  R[66]=2 ;
31:   ;
32:  R[66]=2.5 ;
33:  J P[30] 100% FINE ;
34:  R[66]=3 ;
35:   ;
36:  !Demande d'arret ;
37:  CALL DEMANDE_ARRET ;
38:   ;
39:  !Choix Uframe/Utool ;
40:  UFRAME_NUM=1 ;
41:  UTOOL_NUM=3 ;
42:   ;
43:  !Demande d'arret ;
44:  CALL DEMANDE_ARRET ;
45:   ;
46:  !Ouverture verin ;
47:  R[66]=3.5 ;
48:  CALL TOOL03_OUVERTURE ;
49:  R[66]=4 ;
50:   ;
51:  !Calcul point prise ;
52:  CALL CALC01_30_PRISE ;
53:   ;
54:  !Raz PR ;
55:  CALL RAZPR100 ;
56:   ;
57:  !Calcul Offset ;
58:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
59:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
60:   ;
61:  !Approche prise ;
62:  PR[100,3:Dcallage]=PR[100,3:Dcallage]-100 ;
63:  R[66]=4.5 ;
64:  L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
65:  R[66]=5 ;
66:   ;
67:  !Ouverture pince ;
68:  R[66]=5.5 ;
69:  CALL TOOL03_OUVERTURE ;
70:  R[66]=6 ;
71:   ;
72:   ;
73:  !Point de prise ;
74:  PR[100,3:Dcallage]=PR[100,3:Dcallage]+100 ;
75:  PR[100,1:Dcallage]=10 ;
76:  R[66]=6.5 ;
77:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
78:  R[66]=7 ;
79:   ;
80:  !Calcul Offset ;
81:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
82:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
83:   ;
84:  !Decalage ;
85:  PR[100,1:Dcallage]=(-1) ;
86:  R[66]=7.5 ;
87:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
88:  R[66]=8 ;
89:   ;
90:  !Fermeture verin ;
91:  CALL CYCLE_FERMETURE ;
92:   ;
93:  !Raz PR ;
94:  CALL RAZPR100 ;
95:   ;
96:  !//////////////////////////////// ;
97:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
98:  !//////////////////////////////// ;
99:  !Calcul Decallage Z ;
100:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
101:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
102:  !//////////////////////////////// ;
103:   ;
104:  PR[100,1:Dcallage]=(-5) ;
105:  PR[100,2:Dcallage]=5 ;
106:   ;
107:  PR[100,3:Dcallage]=PR[100,3:Dcallage]+10 ;
108:  R[66]=8.5 ;
109:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
110:  R[66]=9 ;
111:   ;
112:  !Degagement piece ;
113:  PR[100,2:Dcallage]=8 ;
114:  PR[100,1:Dcallage]=(-900) ;
115:  R[66]=9.5 ;
116:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
117:  R[66]=10 ;
118:   ;
119:  R[66]=10.5 ;
120:  J P[8] 30% CNT15 ;
121:  R[66]=11 ;
122:   ;
123:  R[66]=11.5 ;
124:  L P[9] 500mm/sec CNT15 ;
125:  R[66]=12 ;
126:   ;
127:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
128:  !\\\\\\\\\\\TEST\\\\\\\\\\\\\\\\\ ;
129:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
130:   ;
131:  R[66]=12.5 ;
132:  J P[18] 30% CNT25 ;
133:  R[66]=13 ;
134:  R[66]=13.5 ;
135:  J P[19] 30% FINE ;
136:  R[66]=14 ;
137:   ;
138:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
139:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
140:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
141:   ;
142:  !Demande d'arret ;
143:  CALL DEMANDE_ARRET ;
144:   ;
145:  !Choix Uframe/Utool ;
146:  UFRAME_NUM=0 ;
147:  UTOOL_NUM=3 ;
148:   ;
149:   ;
150:  R[66]=14.5 ;
151:  L P[11] 500mm/sec CNT10 ;
152:  R[66]=15 ;
153:   ;
154:  R[66]=15.5 ;
155:  L P[15] 1000mm/sec CNT100 ACC50 ;
156:  R[66]=16 ;
157:   ;
158:  R[66]=16.5 ;
159:  J P[16] 30% CNT100 ;
160:  R[66]=17 ;
161:   ;
162:  R[66]=17.5 ;
163:  L P[17] 500mm/sec CNT100 ;
164:  R[66]=18 ;
165:   ;
166:  !Demande d'arret ;
167:  CALL DEMANDE_ARRET ;
168:   ;
169:  R[66]=18.5 ;
170:  L P[20] 500mm/sec FINE ;
171:  R[66]=19 ;
172:   ;
173:  R[66]=19.5 ;
174:  L P[4] 500mm/sec FINE ;
175:  R[66]=20 ;
176:   ;
177:  !Demande d'arret ;
178:  CALL DEMANDE_ARRET ;
179:   ;
180:  !Choix Uframe/Utool ;
181:  UFRAME_NUM=6 ;
182:  UTOOL_NUM=3 ;
183:   ;
184:  !Test acces ;
185:  CALL TEST_ACCES_MACHINE ;
186:   ;
187:  R[66]=20.5 ;
188:  L P[27] 500mm/sec FINE ;
189:  R[66]=21 ;
190:   ;
191:  !Raz PR ;
192:  CALL RAZPR100 ;
193:  CALL RAZPR99 ;
194:   ;
195:  !Calcul pose ;
196:  CALL CALC01_30_POSE_MACHINE ;
197:   ;
198:  !Traj spe ;
199:  IF (R[73:OP20 traj spe]=1) THEN ;
200:  !Point d'approche pose ;
201:  PR[100,1:Dcallage]=50 ;
202:  PR[100,2:Dcallage]=30 ;
203:  PR[100,3:Dcallage]=(-200) ;
204:  R[66]=21.5 ;
205:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
206:  R[66]=22 ;
207:  ENDIF ;
208:   ;
209:  !Traj non spe ;
210:  IF (R[73:OP20 traj spe]=0) THEN ;
211:  !Point d'approche pose ;
212:  PR[100,1:Dcallage]=5 ;
213:  PR[100,2:Dcallage]=30 ;
214:  PR[100,3:Dcallage]=(-200) ;
215:  R[66]=22.5 ;
216:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
217:  R[66]=23 ;
218:  ENDIF ;
219:   ;
220:  !Point d'approche pose ;
221:  !Calcul Offset ;
222:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
223:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
224:  IF (R[37:Hauteur Piece]=40),PR[100,3:Dcallage]=(20) ;
225:   ;
226:  !Traj spe ;
227:  IF (R[73:OP20 traj spe]=1) THEN ;
228:  !Point d'approche pose ;
229:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-30) ;
230:  R[66]=23.5 ;
231:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
232:  R[66]=24 ;
233:   ;
234:  PR[100,2:Dcallage]=1 ;
235:  R[66]=24.5 ;
236:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
237:  R[66]=25 ;
238:   ;
239:  PR[100,3:Dcallage]=25 ;
240:  R[66]=25.5 ;
241:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
242:  R[66]=26 ;
243:  ENDIF ;
244:   ;
245:  !Skip traj spe ;
246:  IF R[73:OP20 traj spe]<>0,JMP LBL[40] ;
247:   ;
248:  !Point d'approche pose ;
249:  PR[100,2:Dcallage]=30 ;
250:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40) ;
251:  R[66]=26.5 ;
252:  L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
253:  R[66]=27 ;
254:   ;
255:  !Point d'approche pose ;
256:  PR[100,1:Dcallage]=5 ;
257:  PR[100,2:Dcallage]=0 ;
258:  !Calcul Offset ;
259:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
260:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
261:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40) ;
262:  R[66]=27.5 ;
263:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
264:  R[66]=28 ;
265:   ;
266:  !Fin traj spe ;
267:  LBL[40] ;
268:  !Raz PR ;
269:  CALL RAZPR100 ;
270:  !Calcul Offset ;
271:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
272:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
273:  IF (R[37:Hauteur Piece]=40),PR[100,3:Dcallage]=(20) ;
274:   ;
275:  !Point d'approche pose ;
276:  PR[100,1:Dcallage]=5 ;
277:  R[66]=28.5 ;
278:  L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
279:  R[66]=29 ;
280:   ;
281:  !Calcul pose ;
282:  CALL CALC01_30_POSE_MACHINE ;
283:   ;
284:  !Point de pose ;
285:  PR[100,1:Dcallage]=0 ;
286:  PR[100,2:Dcallage]=1 ;
287:  IF (R[37:Hauteur Piece]=40),PR[100,3:Dcallage]=(20) ;
288:  R[66]=29.5 ;
289:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
290:  R[66]=30 ;
291:   ;
292:  PR[100,2:Dcallage]=3 ;
293:  R[66]=30.5 ;
294:  L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
295:  R[66]=31 ;
296:   ;
297:  !ouverture du verin ;
298:  R[66]=31.5 ;
299:  CALL TOOL03_OUVERTURE ;
300:  R[66]=32 ;
301:   ;
302:  !Raz PR ;
303:  CALL RAZPR100 ;
304:   ;
305:  !Calcul Offset ;
306:  IF (R[36:Largeur Piece]<=410),PR[100,3:Dcallage]=(25) ;
307:  IF (R[36:Largeur Piece]>410),PR[100,3:Dcallage]=(0) ;
308:  IF (R[37:Hauteur Piece]=40),PR[100,3:Dcallage]=(20) ;
309:   ;
310:  !Traj spe ;
311:  IF (R[73:OP20 traj spe]=1) THEN ;
312:  !Point d'approche pose ;
313:  PR[100,1:Dcallage]=60 ;
314:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]+10) ;
315:  R[66]=32.5 ;
316:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
317:  R[66]=33 ;
318:   ;
319:  ENDIF ;
320:   ;
321:  !Skip traj spe ;
322:  IF R[73:OP20 traj spe]<>0,JMP LBL[90] ;
323:   ;
324:  !Point d'approche pose ;
325:  PR[100,1:Dcallage]=10 ;
326:  R[66]=33.5 ;
327:  L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
328:  R[66]=34 ;
329:   ;
330:  !Fin traj spe ;
331:  LBL[90] ;
332:  !Point d'approche pose ;
333:  PR[100,3:Dcallage]=(-200) ;
334:  R[66]=34.5 ;
335:  L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
336:  R[66]=35 ;
337:   ;
338:  //L P[32] 2000mm/sec FINE ;
339:   ;
340:  !Choix Uframe/Utool ;
341:  UFRAME_NUM=0 ;
342:  UTOOL_NUM=3 ;
343:   ;
344:  //L P[21] 2000mm/sec FINE ;
345:   ;
346:  R[66]=35.5 ;
347:  L P[22] 1000mm/sec FINE ;
348:  R[66]=36 ;
349:   ;
350:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
351:  !\\\\\\Appuie piece machine\\\\\\ ;
352:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
353:   ;
354:  !Fermeture pince ;
355:  R[66]=36.5 ;
356:  CALL TOOL03_FERMETURE ;
357:  R[66]=37 ;
358:   ;
359:  !Raz PR ;
360:  CALL RAZPR99 ;
361:  CALL RAZPR100 ;
362:   ;
363:  !Calcul offset ;
364:  PR[100,1:Dcallage]=100 ;
365:   ;
366:  !Trajectoire de pousage ;
367:  R[66]=37.5 ;
368:  L P[33:Pousage Piece] 500mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
369:  R[66]=38 ;
370:   ;
371:  !Point de poussee ;
372:  R[66]=38.5 ;
373:  L P[33:Pousage Piece] 300mm/sec FINE ;
374:  R[66]=39 ;
375:   ;
376:  !Ouverture Pince ;
377:  R[66]=39.5 ;
378:  CALL TOOL03_OUVERTURE ;
379:  R[66]=40 ;
380:   ;
381:  !Tempo ;
382:  WAIT   1.00(sec) ;
383:   ;
384:  !Trajectoire de pousage ;
385:  R[66]=40.5 ;
386:  L P[33:Pousage Piece] 1000mm/sec FINE Tool_Offset,PR[100:Dcallage] ;
387:  R[66]=41 ;
388:   ;
389:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
390:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
391:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
392:   ;
393:  R[66]=41.5 ;
394:  L P[25] 1000mm/sec FINE ;
395:  R[66]=42 ;
396:   ;
397:  R[66]=42.5 ;
398:  L P[23] 2000mm/sec CNT100 ;
399:  R[66]=43 ;
400:   ;
401:  R[66]=43.5 ;
402:  J P[24] 100% CNT100 ;
403:  R[66]=44 ;
404:   ;
405:  R[66]=44.5 ;
406:  J P[16] 100% FINE ;
407:  R[66]=45 ;
408:   ;
409:  R[66]=45.5 ;
410:  J P[15] 100% CNT50 ;
411:  R[66]=46 ;
412:   ;
413:  R[66]=46.5 ;
414:  J P[1] 100% CNT25 ;
415:  R[66]=47 ;
416:   ;
417:  CALL DCY_MACHINE ;
418:   ;
419:  !Demande d'arret ;
420:  CALL DEMANDE_ARRET ;
421:   ;
422:  !Mis en position repos ;
423:  !Definition du repere ;
424:  UFRAME_NUM=5 ;
425:  UTOOL_NUM=5 ;
426:   ;
427:  R[66]=47.5 ;
428:  J P[14:Repos] 100% FINE ;
429:  R[66]=48 ;
430:   ;
431:  !Demande d'arret ;
432:  CALL DEMANDE_ARRET ;
433:   ;
434:  CALL TPS_CYCLE ;
435:   ;
436:  !Validation Fin Tache ;
437:  CALL VALIDATION_FIN_TACHE ;
438:   ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   778.609  mm,	Y =  1405.177  mm,	Z =    25.164  mm,
	W =  -179.493 deg,	P =    -2.147 deg,	R =   -83.712 deg
};
P[2]{
   GP1:
	UF : 0, UT : 3,	
	J1=   -62.752 deg,	J2=    -8.552 deg,	J3=   -36.243 deg,
	J4=   -26.686 deg,	J5=   -51.200 deg,	J6=   -12.261 deg
};
P[4]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =  -826.370  mm,	Y =  2049.414  mm,	Z =   824.086  mm,
	W =   -89.123 deg,	P =      .882 deg,	R =    85.284 deg
};
P[6]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   638.373  mm,	Y = -1106.562  mm,	Z =   -25.432  mm,
	W =  -179.359 deg,	P =    -4.540 deg,	R =  -148.372 deg
};
P[8]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1196.697  mm,	Y =   905.669  mm,	Z =    51.512  mm,
	W =     3.433 deg,	P =    62.213 deg,	R =  -159.621 deg
};
P[9]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1253.162  mm,	Y =   905.670  mm,	Z =  -979.843  mm,
	W =   175.453 deg,	P =    57.714 deg,	R =    -5.829 deg
};
P[11]{
   GP1:
	UF : 0, UT : 3,	
	J1=   -33.511 deg,	J2=   -15.550 deg,	J3=   -26.611 deg,
	J4=     6.608 deg,	J5=   -45.688 deg,	J6=   240.714 deg
};
P[14:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[15]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   638.487  mm,	Y =  1631.666  mm,	Z =   411.845  mm,
	W =  -178.870 deg,	P =    -2.783 deg,	R =     -.904 deg
};
P[16]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   -21.038  mm,	Y =  1631.798  mm,	Z =   605.230  mm,
	W =   161.440 deg,	P =    88.172 deg,	R =   -19.774 deg
};
P[17]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -500.359  mm,	Y =  1631.524  mm,	Z =   604.092  mm,
	W =   161.122 deg,	P =    88.073 deg,	R =   -20.077 deg
};
P[18]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1197.223  mm,	Y =   905.666  mm,	Z = -1012.092  mm,
	W =  -176.503 deg,	P =   -62.106 deg,	R =   176.547 deg
};
P[19]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =  1197.223  mm,	Y =   905.666  mm,	Z = -1012.092  mm,
	W =  -179.264 deg,	P =    57.851 deg,	R =      .266 deg
};
P[20]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -500.049  mm,	Y =  1909.313  mm,	Z =   600.896  mm,
	W =   161.011 deg,	P =    88.073 deg,	R =   -20.069 deg
};
P[21]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -875.551  mm,	Y =  1639.306  mm,	Z =   592.147  mm,
	W =    91.822 deg,	P =     -.417 deg,	R =   -91.203 deg
};
P[22]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -722.331  mm,	Y =  1639.307  mm,	Z =   592.146  mm,
	W =   161.127 deg,	P =    88.073 deg,	R =   -20.072 deg
};
P[23]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -500.359  mm,	Y =  1631.524  mm,	Z =   604.092  mm,
	W =   161.122 deg,	P =    88.073 deg,	R =   -20.077 deg
};
P[24]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   -21.038  mm,	Y =  1631.798  mm,	Z =   605.230  mm,
	W =   161.440 deg,	P =    88.172 deg,	R =   -19.774 deg
};
P[25]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -722.331  mm,	Y =  1639.307  mm,	Z =   592.146  mm,
	W =   161.127 deg,	P =    88.073 deg,	R =   -20.072 deg
};
P[27]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   824.085  mm,	Y =   -25.675  mm,	Z =   168.313  mm,
	W =  -179.051 deg,	P =    -4.730 deg,	R =   -90.891 deg
};
P[30]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -236.498  mm,	Y = -1673.601  mm,	Z =   -32.032  mm,
	W =    23.283 deg,	P =    63.118 deg,	R =  -131.121 deg
};
P[32]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   425.650  mm,	Y =   145.654  mm,	Z =   164.428  mm,
	W =   179.675 deg,	P =      .582 deg,	R =  -179.883 deg
};
P[33:"Pousage Piece"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -693.357  mm,	Y =  1638.967  mm,	Z =    81.368  mm,
	W =  -179.959 deg,	P =    -3.110 deg,	R =    -1.217 deg
};
/END
