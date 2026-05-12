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
   1:  !//////////////////////////////// ;
   2:  !///////Chargement OP20//////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Memo programme en cours ;
   6:  R[38:Programme en cr]=3    ;
   7:   ;
   8:  !Validation Tache ;
   9:  CALL VALIDATION_DEBUT_TACHE    ;
  10:   ;
  11:  !Changment de prehenseur ;
  12:  R[91:Choix outils]=3    ;
  13:  CALL CHANG_OUTIL    ;
  14:   ;
  15:  !Override ;
  16:  CALL OVERRIDE    ;
  17:   ;
  18:  !Choix Uframe/Utool ;
  19:  UFRAME_NUM=0 ;
  20:  UTOOL_NUM=3 ;
  21:   ;
  22:  !Approche table de retournement ;
  23:J P[6] 100% CNT25    ;
  24:  R[66:Memo INIT]=115    ;
  25:   ;
  26:J P[2] 100% FINE    ;
  27:  R[66:Memo INIT]=116    ;
  28:   ;
  29:J P[30] 100% FINE    ;
  30:  R[66:Memo INIT]=117    ;
  31:   ;
  32:  !Demande d'arret ;
  33:  CALL DEMANDE_ARRET    ;
  34:   ;
  35:  !Choix Uframe/Utool ;
  36:  UFRAME_NUM=1 ;
  37:  UTOOL_NUM=3 ;
  38:   ;
  39:  !Demande d'arret ;
  40:  CALL DEMANDE_ARRET    ;
  41:   ;
  42:  !Ouverture verin ;
  43:  CALL TOOL03_OUVERTURE    ;
  44:   ;
  45:  !Calcul point prise ;
  46:  CALL CALC01_30_PRISE    ;
  47:   ;
  48:  !Raz PR ;
  49:  CALL RAZPR100    ;
  50:   ;
  51:  !Calcul Offset ;
  52:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  53:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  54:   ;
  55:  !Approche prise ;
  56:  PR[100,3:Décallage]=PR[100,3:Décallage]-100    ;
  57:L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  58:  R[66:Memo INIT]=118    ;
  59:   ;
  60:  !Ouverture pince ;
  61:  CALL TOOL03_OUVERTURE    ;
  62:   ;
  63:   ;
  64:  !Point de prise ;
  65:  PR[100,3:Décallage]=PR[100,3:Décallage]+100    ;
  66:  PR[100,1:Décallage]=10    ;
  67:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  68:  R[66:Memo INIT]=119    ;
  69:   ;
  70:  !Calcul Offset ;
  71:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  72:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  73:   ;
  74:  !Decalage  ;
  75:  PR[100,1:Décallage]=(-1)    ;
  76:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  77:  R[66:Memo INIT]=120    ;
  78:   ;
  79:  !Fermeture verin ;
  80:  CALL CYCLE_FERMETURE    ;
  81:   ;
  82:  !Raz PR ;
  83:  R[66:Memo INIT]=121    ;
  84:  CALL RAZPR100    ;
  85:   ;
  86:  !//////////////////////////////// ;
  87:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
  88:  !//////////////////////////////// ;
  89:  !Calcul Decallage Z ;
  90:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  91:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  92:  !//////////////////////////////// ;
  93:   ;
  94:  PR[100,1:Décallage]=(-5)    ;
  95:  PR[100,2:Décallage]=5    ;
  96:   ;
  97:  PR[100,3:Décallage]=PR[100,3:Décallage]+10    ;
  98:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  99:  R[66:Memo INIT]=121    ;
 100:   ;
 101:  !Degagement piece ;
 102:  PR[100,2:Décallage]=8    ;
 103:  PR[100,1:Décallage]=(-900)    ;
 104:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 105:  R[66:Memo INIT]=122    ;
 106:   ;
 107:J P[8] 30% CNT15    ;
 108:  R[66:Memo INIT]=123    ;
 109:   ;
 110:L P[9] 500mm/sec CNT15    ;
 111:  R[66:Memo INIT]=124    ;
 112:   ;
 113:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 114:  !\\\\\\\\\\\TEST\\\\\\\\\\\\\\\\\ ;
 115:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 116:   ;
 117:J P[18] 30% CNT25    ;
 118:  R[66:Memo INIT]=125    ;
 119:J P[19] 30% FINE    ;
 120:  R[66:Memo INIT]=126    ;
 121:   ;
 122:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 123:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 124:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 125:   ;
 126:  !Demande d'arret ;
 127:  CALL DEMANDE_ARRET    ;
 128:   ;
 129:  !Choix Uframe/Utool ;
 130:  UFRAME_NUM=0 ;
 131:  UTOOL_NUM=3 ;
 132:   ;
 133:   ;
 134:L P[11] 500mm/sec CNT10    ;
 135:  R[66:Memo INIT]=127    ;
 136:   ;
 137:L P[15] 1000mm/sec CNT100 ACC50    ;
 138:  R[66:Memo INIT]=128    ;
 139:   ;
 140:J P[16] 30% CNT100    ;
 141:  R[66:Memo INIT]=129    ;
 142:   ;
 143:L P[17] 500mm/sec CNT100    ;
 144:  R[66:Memo INIT]=130    ;
 145:   ;
 146:  !Demande d'arret ;
 147:  CALL DEMANDE_ARRET    ;
 148:   ;
 149:L P[20] 500mm/sec FINE    ;
 150:  R[66:Memo INIT]=131    ;
 151:   ;
 152:L P[4] 500mm/sec FINE    ;
 153:  R[66:Memo INIT]=132    ;
 154:   ;
 155:  !Demande d'arret ;
 156:  CALL DEMANDE_ARRET    ;
 157:   ;
 158:  !Choix Uframe/Utool ;
 159:  UFRAME_NUM=6 ;
 160:  UTOOL_NUM=3 ;
 161:   ;
 162:  !Test acces ;
 163:  CALL TEST_ACCES_MACHINE    ;
 164:   ;
 165:L P[27] 500mm/sec FINE    ;
 166:  R[66:Memo INIT]=133    ;
 167:   ;
 168:  !Raz PR ;
 169:  CALL RAZPR100    ;
 170:  CALL RAZPR99    ;
 171:   ;
 172:  !Calcul pose ;
 173:  CALL CALC01_30_POSE_MACHINE    ;
 174:   ;
 175:  !Traj spe ;
 176:  IF (R[73:OP20 traj spe]=1) THEN ;
 177:  !Point d'approche pose ;
 178:  PR[100,1:Décallage]=50    ;
 179:  PR[100,2:Décallage]=30    ;
 180:  PR[100,3:Décallage]=(-200)    ;
 181:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 182:  ENDIF ;
 183:   ;
 184:  !Traj non spe ;
 185:  IF (R[73:OP20 traj spe]=0) THEN ;
 186:  !Point d'approche pose ;
 187:  PR[100,1:Décallage]=5    ;
 188:  PR[100,2:Décallage]=30    ;
 189:  PR[100,3:Décallage]=(-200)    ;
 190:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 191:  R[66:Memo INIT]=134    ;
 192:  ENDIF ;
 193:   ;
 194:  !Point d'approche pose ;
 195:  !Calcul Offset ;
 196:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 197:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 198:  IF (R[37:Hauteur Piece]=40),PR[100,3:Décallage]=(20) ;
 199:   ;
 200:  !Traj spe ;
 201:  IF (R[73:OP20 traj spe]=1) THEN ;
 202:  !Point d'approche pose ;
 203:  PR[100,3:Décallage]=(PR[100,3:Décallage]-30) ;
 204:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 205:   ;
 206:  PR[100,2:Décallage]=1    ;
 207:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 208:   ;
 209:  PR[100,3:Décallage]=25    ;
 210:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 211:  ENDIF ;
 212:   ;
 213:  !Skip traj spe ;
 214:  IF R[73:OP20 traj spe]<>0,JMP LBL[40] ;
 215:   ;
 216:  !Point d'approche pose ;
 217:  PR[100,2:Décallage]=30    ;
 218:  PR[100,3:Décallage]=(PR[100,3:Décallage]-40) ;
 219:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 220:  R[66:Memo INIT]=135    ;
 221:   ;
 222:  !Point d'approche pose ;
 223:  PR[100,1:Décallage]=5    ;
 224:  PR[100,2:Décallage]=0    ;
 225:  !Calcul Offset ;
 226:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 227:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 228:  PR[100,3:Décallage]=(PR[100,3:Décallage]-40) ;
 229:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 230:  R[66:Memo INIT]=136    ;
 231:   ;
 232:  !Fin traj spe ;
 233:  LBL[40] ;
 234:  !Raz PR ;
 235:  CALL RAZPR100    ;
 236:  !Calcul Offset ;
 237:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 238:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 239:  IF (R[37:Hauteur Piece]=40),PR[100,3:Décallage]=(20) ;
 240:   ;
 241:  !Point d'approche pose ;
 242:  PR[100,1:Décallage]=5    ;
 243:L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 244:  R[66:Memo INIT]=137    ;
 245:   ;
 246:  !Calcul pose ;
 247:  CALL CALC01_30_POSE_MACHINE    ;
 248:   ;
 249:  !Point de pose ;
 250:  PR[100,1:Décallage]=0    ;
 251:  PR[100,2:Décallage]=1    ;
 252:  IF (R[37:Hauteur Piece]=40),PR[100,3:Décallage]=(20) ;
 253:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 254:  R[66:Memo INIT]=138    ;
 255:   ;
 256:  PR[100,2:Décallage]=3    ;
 257:L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 258:   ;
 259:  !ouverture du verin ;
 260:  CALL TOOL03_OUVERTURE    ;
 261:  R[66:Memo INIT]=139    ;
 262:   ;
 263:  !Raz PR ;
 264:  CALL RAZPR100    ;
 265:   ;
 266:  !Calcul Offset ;
 267:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 268:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 269:  IF (R[37:Hauteur Piece]=40),PR[100,3:Décallage]=(20) ;
 270:   ;
 271:  !Traj spe ;
 272:  IF (R[73:OP20 traj spe]=1) THEN ;
 273:  !Point d'approche pose ;
 274:  PR[100,1:Décallage]=60    ;
 275:  PR[100,3:Décallage]=(PR[100,3:Décallage]+10) ;
 276:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 277:   ;
 278:  ENDIF ;
 279:   ;
 280:  !Skip traj spe ;
 281:  IF R[73:OP20 traj spe]<>0,JMP LBL[90] ;
 282:   ;
 283:  !Point d'approche pose ;
 284:  PR[100,1:Décallage]=10    ;
 285:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 286:  R[66:Memo INIT]=139    ;
 287:   ;
 288:  !Fin traj spe ;
 289:  LBL[90] ;
 290:  !Point d'approche pose ;
 291:  PR[100,3:Décallage]=(-200)    ;
 292:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 293:  R[66:Memo INIT]=140    ;
 294:   ;
 295:  //L P[32] 2000mm/sec FINE    ;
 296:  R[66:Memo INIT]=141    ;
 297:   ;
 298:  !Choix Uframe/Utool ;
 299:  UFRAME_NUM=0 ;
 300:  UTOOL_NUM=3 ;
 301:   ;
 302:  //L P[21] 2000mm/sec FINE    ;
 303:  R[66:Memo INIT]=142    ;
 304:   ;
 305:L P[22] 1000mm/sec FINE    ;
 306:  R[66:Memo INIT]=143    ;
 307:   ;
 308:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 309:  !\\\\\\Appuie piece machine\\\\\\ ;
 310:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 311:   ;
 312:  !Fermeture pince ;
 313:  CALL TOOL03_FERMETURE    ;
 314:   ;
 315:  !Raz PR ;
 316:  CALL RAZPR99    ;
 317:  CALL RAZPR100    ;
 318:   ;
 319:  !Calcul offset ;
 320:  PR[100,1:Décallage]=100    ;
 321:   ;
 322:  !Trajectoire de pousage ;
 323:L P[33:Pousage Piece] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 324:  R[66:Memo INIT]=144    ;
 325:   ;
 326:  !Point de poussee ;
 327:L P[33:Pousage Piece] 300mm/sec FINE    ;
 328:  R[66:Memo INIT]=145    ;
 329:   ;
 330:  !Ouverture Pince ;
 331:  CALL TOOL03_OUVERTURE    ;
 332:   ;
 333:  !Tempo ;
 334:  WAIT   1.00(sec) ;
 335:   ;
 336:  !Trajectoire de pousage ;
 337:L P[33:Pousage Piece] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 338:  R[66:Memo INIT]=146    ;
 339:   ;
 340:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 341:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 342:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 343:   ;
 344:L P[25] 1000mm/sec FINE    ;
 345:  R[66:Memo INIT]=147    ;
 346:   ;
 347:L P[23] 2000mm/sec CNT100    ;
 348:  R[66:Memo INIT]=148    ;
 349:   ;
 350:J P[24] 100% CNT100    ;
 351:  R[66:Memo INIT]=149    ;
 352:   ;
 353:J P[16] 100% FINE    ;
 354:  R[66:Memo INIT]=150    ;
 355:   ;
 356:J P[15] 100% CNT50    ;
 357:  R[66:Memo INIT]=151    ;
 358:   ;
 359:J P[1] 100% CNT25    ;
 360:  R[66:Memo INIT]=152    ;
 361:   ;
 362:  CALL DCY_MACHINE    ;
 363:   ;
 364:  !Demande d'arret ;
 365:  CALL DEMANDE_ARRET    ;
 366:   ;
 367:  !Mis en position repos ;
 368:  !Definition du repere ;
 369:  UFRAME_NUM=5 ;
 370:  UTOOL_NUM=5 ;
 371:   ;
 372:J P[14:Repos] 100% FINE    ;
 373:  R[66:Memo INIT]=0    ;
 374:   ;
 375:  !Demande d'arret ;
 376:  CALL DEMANDE_ARRET    ;
 377:   ;
 378:  CALL TPS_CYCLE    ;
 379:   ;
 380:  !Validation Fin Tache ;
 381:  CALL VALIDATION_FIN_TACHE    ;
 382:   ;
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
