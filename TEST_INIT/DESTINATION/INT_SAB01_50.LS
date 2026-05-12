/PROG  INT_SAB01_50.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-12  TIME 19:18:59;
MODIFIED = DATE 26-05-12  TIME 19:18:59;
PROTECT  = READ_WRITE;
TCD:   STACK_SIZE	    = 0,
       TASK_PRIORITY	= 50,
       TIME_SLICE     = 0,
       BUSY_LAMP_OFF	= 0,
       ABORT_REQUEST	= 0,
       PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
/APPL

AUTO_SINGULARITY_HEADER;    ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  !Init généré automatiquement    ;
   2:  !programme référence SAB01_50    ;
   3:      ;
   4:  SELECT R[66]=1.5,JMP LBL[1]    ;
   5:         =2.5,JMP LBL[2]    ;
   6:         =3.5,JMP LBL[3]    ;
   7:         =4.5,JMP LBL[4]    ;
   8:         =5.5,JMP LBL[5]    ;
   9:         =6.5,JMP LBL[6]    ;
  10:         =7.5,JMP LBL[7]    ;
  11:         =8.5,JMP LBL[8]    ;
  12:         =9.5,JMP LBL[9]    ;
  13:         =10.5,JMP LBL[10]    ;
  14:         =11.5,JMP LBL[11]    ;
  15:         =12.5,JMP LBL[12]    ;
  16:         =13.5,JMP LBL[13]    ;
  17:         =14.5,JMP LBL[14]    ;
  18:         =15.5,JMP LBL[15]    ;
  19:         =16.5,JMP LBL[16]    ;
  20:         =17.5,JMP LBL[17]    ;
  21:         =18.5,JMP LBL[18]    ;
  22:         =19.5,JMP LBL[19]    ;
  23:         =20.5,JMP LBL[20]    ;
  24:         =21.5,JMP LBL[21]    ;
  25:         =22.5,JMP LBL[22]    ;
  26:         =23.5,JMP LBL[23]    ;
  27:         =24.5,JMP LBL[24]    ;
  28:         =25.5,JMP LBL[25]    ;
  29:         =26.5,JMP LBL[26]    ;
  30:         =27.5,JMP LBL[27]    ;
  31:         =28.5,JMP LBL[28]    ;
  32:         =29.5,JMP LBL[29]    ;
  33:         =30.5,JMP LBL[30]    ;
  34:         =31.5,JMP LBL[31]    ;
  35:         =32.5,JMP LBL[32]    ;
  36:         =33.5,JMP LBL[33]    ;
  37:         =34.5,JMP LBL[34]    ;
  38:         =35.5,JMP LBL[35]    ;
  39:         =36.5,JMP LBL[36]    ;
  40:         =37.5,JMP LBL[37]    ;
  41:         =38.5,JMP LBL[38]    ;
  42:         =39.5,JMP LBL[39]    ;
  43:         =40.5,JMP LBL[40]    ;
  44:         =41.5,JMP LBL[41]    ;
  45:         =42.5,JMP LBL[42]    ;
  46:         =43.5,JMP LBL[43]    ;
  47:      ;
  48:  LBL[998]    ;
  49:      ;
  50:  SELECT R[66]=1,JMP LBL[999]    ;
  51:         =2,JMP LBL[1]    ;
  52:         =3,JMP LBL[2]    ;
  53:         =4,JMP LBL[3]    ;
  54:         =5,JMP LBL[6]    ;
  55:         =6,JMP LBL[7]    ;
  56:         =7,JMP LBL[6]    ;
  57:         =8,JMP LBL[7]    ;
  58:         =9,JMP LBL[8]    ;
  59:         =10,JMP LBL[9]    ;
  60:         =11,JMP LBL[10]    ;
  61:         =12,JMP LBL[11]    ;
  62:         =13,JMP LBL[12]    ;
  63:         =14,JMP LBL[13]    ;
  64:         =15,JMP LBL[14]    ;
  65:         =16,JMP LBL[15]    ;
  66:         =17,JMP LBL[16]    ;
  67:         =18,JMP LBL[17]    ;
  68:         =19,JMP LBL[18]    ;
  69:         =20,JMP LBL[19]    ;
  70:         =21,JMP LBL[20]    ;
  71:         =22,JMP LBL[21]    ;
  72:         =23,JMP LBL[22]    ;
  73:         =24,JMP LBL[23]    ;
  74:         =25,JMP LBL[24]    ;
  75:         =26,JMP LBL[25]    ;
  76:         =27,JMP LBL[26]    ;
  77:         =28,JMP LBL[27]    ;
  78:         =29,JMP LBL[28]    ;
  79:         =30,JMP LBL[31]    ;
  80:         =31,JMP LBL[32]    ;
  81:         =32,JMP LBL[33]    ;
  82:         =33,JMP LBL[34]    ;
  83:         =34,JMP LBL[33]    ;
  84:         =35,JMP LBL[34]    ;
  85:         =36,JMP LBL[35]    ;
  86:         =37,JMP LBL[38]    ;
  87:         =38,JMP LBL[39]    ;
  88:         =39,JMP LBL[40]    ;
  89:         =40,JMP LBL[41]    ;
  90:         =41,JMP LBL[42]    ;
  91:         =42,JMP LBL[43]    ;
  92:         =43,JMP LBL[999]    ;
  93:      ;
  94:  GO[1]=99    ;
  95:  PAUSE    ;
  96:  GO[1]=0    ;
  97:  JMP LBL[998]    ;
  98:      ;
  99:  !Début des trajectoires    ;
 100:      ;
 101:  LBL[1]    ;
 102:  R[66]=0.5    ;
 103:J P[1] 10% FINE    ;
 104:  R[66]=1    ;
 105:  JMP LBL[998]    ;
 106:      ;
 107:  LBL[2]    ;
 108:  !Point au dessu des stations    ;
 109:  R[66]=1.5    ;
 110:L P[18] 100mm/sec FINE    ;
 111:  R[66]=2    ;
 112:  JMP LBL[998]    ;
 113:      ;
 114:  LBL[3]    ;
 115:  !Point d'approche table de recent    ;
 116:  R[66]=2.5    ;
 117:L P[19] 100mm/sec FINE    ;
 118:  R[66]=3    ;
 119:  JMP LBL[998]    ;
 120:      ;
 121:  LBL[4]    ;
 122:  R[66]=3.5    ;
 123:L P[20] 100mm/sec FINE    ;
 124:  R[66]=4    ;
 125:  JMP LBL[998]    ;
 126:      ;
 127:  LBL[5]    ;
 128:  !Ouverture verin    ;
 129:  R[66]=4.5    ;
 130:  CALL TOOL03_OUVERTURE    ;
 131:  R[66]=5    ;
 132:  JMP LBL[998]    ;
 133:      ;
 134:  LBL[6]    ;
 135:  !Calcul point prise    ;
 136:  CALL CALC01_50_PRISE    ;
 137:  !Approche prise    ;
 138:  PR[100,3:Dcallage]=PR[100,3:Dcallage]-100    ;
 139:  PR[100,1:Dcallage]=10    ;
 140:  R[66]=5.5    ;
 141:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 142:  R[66]=6    ;
 143:  JMP LBL[998]    ;
 144:      ;
 145:  LBL[7]    ;
 146:  !Ouverture pince    ;
 147:  R[66]=6.5    ;
 148:  CALL TOOL03_OUVERTURE    ;
 149:  R[66]=7    ;
 150:  JMP LBL[998]    ;
 151:      ;
 152:  LBL[8]    ;
 153:  !Point de prise    ;
 154:  PR[100,3:Dcallage]=PR[100,3:Dcallage]+100    ;
 155:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise])    ;
 156:  R[66]=7.5    ;
 157:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 158:  R[66]=8    ;
 159:  JMP LBL[998]    ;
 160:      ;
 161:  LBL[9]    ;
 162:  !Decalage    ;
 163:  PR[100,1:Dcallage]=(-1)    ;
 164:  R[66]=8.5    ;
 165:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 166:  R[66]=9    ;
 167:  JMP LBL[998]    ;
 168:      ;
 169:  LBL[10]    ;
 170:  !Degagement piece    ;
 171:  PR[100,1:Dcallage]=(-5)    ;
 172:  PR[100,2:Dcallage]=(R[32:Reglage Prise]-3)    ;
 173:  PR[100,3:Dcallage]=(-20)    ;
 174:  R[66]=9.5    ;
 175:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 176:  R[66]=10    ;
 177:  JMP LBL[998]    ;
 178:      ;
 179:  LBL[11]    ;
 180:  PR[100,3:Dcallage]=(-100)    ;
 181:  R[66]=10.5    ;
 182:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 183:  R[66]=11    ;
 184:  JMP LBL[998]    ;
 185:      ;
 186:  LBL[12]    ;
 187:  R[66]=11.5    ;
 188:L P[2] 100mm/sec FINE    ;
 189:  R[66]=12    ;
 190:  JMP LBL[998]    ;
 191:      ;
 192:  LBL[13]    ;
 193:  R[66]=12.5    ;
 194:L P[20] 100mm/sec FINE    ;
 195:  R[66]=13    ;
 196:  JMP LBL[998]    ;
 197:      ;
 198:  LBL[14]    ;
 199:  R[66]=13.5    ;
 200:L P[19] 100mm/sec FINE    ;
 201:  R[66]=14    ;
 202:  JMP LBL[998]    ;
 203:      ;
 204:  LBL[15]    ;
 205:  R[66]=14.5    ;
 206:J P[18] 10% FINE    ;
 207:  R[66]=15    ;
 208:  JMP LBL[998]    ;
 209:      ;
 210:  LBL[16]    ;
 211:  R[66]=15.5    ;
 212:J P[1] 10% FINE    ;
 213:  R[66]=16    ;
 214:  JMP LBL[998]    ;
 215:      ;
 216:  LBL[17]    ;
 217:  R[66]=16.5    ;
 218:J P[9] 10% FINE    ;
 219:  R[66]=17    ;
 220:  JMP LBL[998]    ;
 221:      ;
 222:  LBL[18]    ;
 223:  R[66]=17.5    ;
 224:J P[10] 10% FINE    ;
 225:  R[66]=18    ;
 226:  JMP LBL[998]    ;
 227:      ;
 228:  LBL[19]    ;
 229:  R[66]=18.5    ;
 230:L P[11] 100mm/sec FINE ACC50    ;
 231:  R[66]=19    ;
 232:  JMP LBL[998]    ;
 233:      ;
 234:  LBL[20]    ;
 235:  R[66]=19.5    ;
 236:L P[12] 100mm/sec FINE    ;
 237:  R[66]=20    ;
 238:  JMP LBL[998]    ;
 239:      ;
 240:  LBL[21]    ;
 241:  R[66]=20.5    ;
 242:J P[3] 10% FINE    ;
 243:  R[66]=21    ;
 244:  JMP LBL[998]    ;
 245:      ;
 246:  LBL[22]    ;
 247:  R[66]=21.5    ;
 248:L P[4] 100mm/sec FINE    ;
 249:  R[66]=22    ;
 250:  JMP LBL[998]    ;
 251:      ;
 252:  LBL[23]    ;
 253:  !Calcul Pose    ;
 254:  CALL CALC01_50_POSE_MACHINE    ;
 255:  !Point d'approche pose    ;
 256:  PR[100,1:Dcallage]=0    ;
 257:  PR[100,2:Dcallage]=(-5)    ;
 258:  PR[100,3:Dcallage]=(-600)    ;
 259:  R[66]=22.5    ;
 260:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 261:  R[66]=23    ;
 262:  JMP LBL[998]    ;
 263:      ;
 264:  LBL[24]    ;
 265:  !Point d'approche pose    ;
 266:  PR[100,1:Dcallage]=30    ;
 267:  PR[100,2:Dcallage]=(-5)    ;
 268:  PR[100,3:Dcallage]=(-600)    ;
 269:  R[66]=23.5    ;
 270:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 271:  R[66]=24    ;
 272:  JMP LBL[998]    ;
 273:      ;
 274:  LBL[25]    ;
 275:  !Point d'approche pose    ;
 276:  PR[100,1:Dcallage]=30    ;
 277:  PR[100,2:Dcallage]=(-5)    ;
 278:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise])    ;
 279:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40)    ;
 280:  R[66]=24.5    ;
 281:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 282:  R[66]=25    ;
 283:  JMP LBL[998]    ;
 284:      ;
 285:  LBL[26]    ;
 286:  !Point d'approche pose    ;
 287:  PR[100,1:Dcallage]=0    ;
 288:  PR[100,2:Dcallage]=(-5)    ;
 289:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise])    ;
 290:  R[66]=25.5    ;
 291:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 292:  R[66]=26    ;
 293:  JMP LBL[998]    ;
 294:      ;
 295:  LBL[27]    ;
 296:  !Point d'approche pose    ;
 297:  PR[100,1:Dcallage]=0    ;
 298:  PR[100,2:Dcallage]=(-5)    ;
 299:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise])    ;
 300:  PR[100,3:Dcallage]=0    ;
 301:  !////////////////////////////////    ;
 302:  R[66]=26.5    ;
 303:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 304:  R[66]=27    ;
 305:  JMP LBL[998]    ;
 306:      ;
 307:  LBL[28]    ;
 308:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise])    ;
 309:  !Point de pose    ;
 310:  R[66]=27.5    ;
 311:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 312:  R[66]=28    ;
 313:  JMP LBL[998]    ;
 314:      ;
 315:  LBL[29]    ;
 316:  !Point de pose    ;
 317:  R[66]=28.5    ;
 318:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 319:  R[66]=29    ;
 320:  JMP LBL[998]    ;
 321:      ;
 322:  LBL[30]    ;
 323:  !ouverture du verin    ;
 324:  R[66]=29.5    ;
 325:  CALL TOOL03_OUVERTURE    ;
 326:  R[66]=30    ;
 327:  JMP LBL[998]    ;
 328:      ;
 329:  LBL[31]    ;
 330:  PR[100,1:Dcallage]=10    ;
 331:  PR[100,2:Dcallage]=R[32:Reglage Prise]    ;
 332:  R[66]=30.5    ;
 333:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 334:  R[66]=31    ;
 335:  JMP LBL[998]    ;
 336:      ;
 337:  LBL[32]    ;
 338:  !Point d'approche pose    ;
 339:  PR[100,3:Dcallage]=(-500)    ;
 340:  PR[100,2:Dcallage]=R[32:Reglage Prise]    ;
 341:  R[66]=31.5    ;
 342:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 343:  R[66]=32    ;
 344:  JMP LBL[998]    ;
 345:      ;
 346:  LBL[33]    ;
 347:  R[66]=32.5    ;
 348:L P[4] 100mm/sec FINE    ;
 349:  R[66]=33    ;
 350:  JMP LBL[998]    ;
 351:      ;
 352:  LBL[34]    ;
 353:  !Fermeture pince    ;
 354:  R[66]=33.5    ;
 355:  CALL TOOL03_FERMETURE    ;
 356:  R[66]=34    ;
 357:  JMP LBL[998]    ;
 358:      ;
 359:  LBL[35]    ;
 360:  !Calcul offset    ;
 361:  PR[100,1:Dcallage]=100    ;
 362:  !Trajectoire de pousage    ;
 363:  R[66]=34.5    ;
 364:L P[8:Pousage Piece] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 365:  R[66]=35    ;
 366:  JMP LBL[998]    ;
 367:      ;
 368:  LBL[36]    ;
 369:  !Point de poussee    ;
 370:  R[66]=35.5    ;
 371:L P[8:Pousage Piece] 100mm/sec FINE    ;
 372:  R[66]=36    ;
 373:  JMP LBL[998]    ;
 374:      ;
 375:  LBL[37]    ;
 376:  !Ouverture Pince    ;
 377:  R[66]=36.5    ;
 378:  CALL TOOL03_OUVERTURE    ;
 379:  R[66]=37    ;
 380:  JMP LBL[998]    ;
 381:      ;
 382:  LBL[38]    ;
 383:  !Trajectoire de pousage    ;
 384:  R[66]=37.5    ;
 385:L P[8:Pousage Piece] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 386:  R[66]=38    ;
 387:  JMP LBL[998]    ;
 388:      ;
 389:  LBL[39]    ;
 390:  R[66]=38.5    ;
 391:L P[14] 100mm/sec FINE    ;
 392:  R[66]=39    ;
 393:  JMP LBL[998]    ;
 394:      ;
 395:  LBL[40]    ;
 396:  R[66]=39.5    ;
 397:J P[3] 10% FINE    ;
 398:  R[66]=40    ;
 399:  JMP LBL[998]    ;
 400:      ;
 401:  LBL[41]    ;
 402:  R[66]=40.5    ;
 403:J P[12] 10% FINE    ;
 404:  R[66]=41    ;
 405:  JMP LBL[998]    ;
 406:      ;
 407:  LBL[42]    ;
 408:  R[66]=41.5    ;
 409:L P[11] 100mm/sec FINE    ;
 410:  R[66]=42    ;
 411:  JMP LBL[998]    ;
 412:      ;
 413:  LBL[43]    ;
 414:  R[66]=42.5    ;
 415:J P[7:Repos] 10% FINE    ;
 416:  R[66]=43    ;
 417:  JMP LBL[998]    ;
 418:      ;
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
