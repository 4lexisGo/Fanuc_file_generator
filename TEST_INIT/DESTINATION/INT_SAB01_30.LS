/PROG  INT_SAB01_30.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-05-12  TIME 15:57:24;
MODIFIED = DATE 26-05-12  TIME 15:57:24;
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
   2:  !programme référence SAB01_30    ;
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
  47:         =44.5,JMP LBL[44]    ;
  48:         =45.5,JMP LBL[45]    ;
  49:         =46.5,JMP LBL[46]    ;
  50:         =47.5,JMP LBL[47]    ;
  51:         =48.5,JMP LBL[48]    ;
  52:      ;
  53:  LBL[998]    ;
  54:      ;
  55:  SELECT R[66]=1,JMP LBL[999]    ;
  56:         =2,JMP LBL[1]    ;
  57:         =3,JMP LBL[2]    ;
  58:         =4,JMP LBL[5]    ;
  59:         =5,JMP LBL[6]    ;
  60:         =6,JMP LBL[5]    ;
  61:         =7,JMP LBL[6]    ;
  62:         =8,JMP LBL[7]    ;
  63:         =9,JMP LBL[8]    ;
  64:         =10,JMP LBL[9]    ;
  65:         =11,JMP LBL[10]    ;
  66:         =12,JMP LBL[11]    ;
  67:         =13,JMP LBL[12]    ;
  68:         =14,JMP LBL[13]    ;
  69:         =15,JMP LBL[14]    ;
  70:         =16,JMP LBL[15]    ;
  71:         =17,JMP LBL[16]    ;
  72:         =18,JMP LBL[17]    ;
  73:         =19,JMP LBL[18]    ;
  74:         =20,JMP LBL[19]    ;
  75:         =21,JMP LBL[20]    ;
  76:         =22,JMP LBL[21]    ;
  77:         =23,JMP LBL[22]    ;
  78:         =24,JMP LBL[23]    ;
  79:         =25,JMP LBL[24]    ;
  80:         =26,JMP LBL[25]    ;
  81:         =27,JMP LBL[26]    ;
  82:         =28,JMP LBL[27]    ;
  83:         =29,JMP LBL[28]    ;
  84:         =30,JMP LBL[29]    ;
  85:         =31,JMP LBL[30]    ;
  86:         =32,JMP LBL[33]    ;
  87:         =33,JMP LBL[34]    ;
  88:         =34,JMP LBL[35]    ;
  89:         =35,JMP LBL[36]    ;
  90:         =36,JMP LBL[37]    ;
  91:         =37,JMP LBL[36]    ;
  92:         =38,JMP LBL[37]    ;
  93:         =39,JMP LBL[38]    ;
  94:         =40,JMP LBL[41]    ;
  95:         =41,JMP LBL[42]    ;
  96:         =42,JMP LBL[43]    ;
  97:         =43,JMP LBL[44]    ;
  98:         =44,JMP LBL[45]    ;
  99:         =45,JMP LBL[46]    ;
 100:         =46,JMP LBL[47]    ;
 101:         =47,JMP LBL[48]    ;
 102:         =48,JMP LBL[999]    ;
 103:      ;
 104:  GO[1]=99    ;
 105:  PAUSE    ;
 106:  GO[1]=0    ;
 107:  JMP LBL[998]    ;
 108:      ;
 109:  !Début des trajectoires    ;
 110:      ;
 111:  LBL[1]    ;
 112:  !Approche table de retournement    ;
 113:  R[66]=0.5    ;
 114:J P[6] 10% FINE    ;
 115:  R[66]=1    ;
 116:  JMP LBL[998]    ;
 117:      ;
 118:  LBL[2]    ;
 119:  R[66]=1.5    ;
 120:J P[2] 10% FINE    ;
 121:  R[66]=2    ;
 122:  JMP LBL[998]    ;
 123:      ;
 124:  LBL[3]    ;
 125:  R[66]=2.5    ;
 126:J P[30] 10% FINE    ;
 127:  R[66]=3    ;
 128:  JMP LBL[998]    ;
 129:      ;
 130:  LBL[4]    ;
 131:  !Ouverture verin    ;
 132:  R[66]=3.5    ;
 133:  CALL TOOL03_OUVERTURE    ;
 134:  R[66]=4    ;
 135:  JMP LBL[998]    ;
 136:      ;
 137:  LBL[5]    ;
 138:  !Calcul point prise    ;
 139:  CALL CALC01_30_PRISE    ;
 140:  !Approche prise    ;
 141:  PR[100,3:Dcallage]=PR[100,3:Dcallage]-100    ;
 142:  R[66]=4.5    ;
 143:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 144:  R[66]=5    ;
 145:  JMP LBL[998]    ;
 146:      ;
 147:  LBL[6]    ;
 148:  !Ouverture pince    ;
 149:  R[66]=5.5    ;
 150:  CALL TOOL03_OUVERTURE    ;
 151:  R[66]=6    ;
 152:  JMP LBL[998]    ;
 153:      ;
 154:  LBL[7]    ;
 155:  !Point de prise    ;
 156:  PR[100,3:Dcallage]=PR[100,3:Dcallage]+100    ;
 157:  PR[100,1:Dcallage]=10    ;
 158:  R[66]=6.5    ;
 159:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 160:  R[66]=7    ;
 161:  JMP LBL[998]    ;
 162:      ;
 163:  LBL[8]    ;
 164:  !Decalage    ;
 165:  PR[100,1:Dcallage]=(-1)    ;
 166:  R[66]=7.5    ;
 167:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 168:  R[66]=8    ;
 169:  JMP LBL[998]    ;
 170:      ;
 171:  LBL[9]    ;
 172:  !Raz PR    ;
 173:  PR[100,1:Dcallage]=(-5)    ;
 174:  PR[100,2:Dcallage]=5    ;
 175:  PR[100,3:Dcallage]=PR[100,3:Dcallage]+10    ;
 176:  R[66]=8.5    ;
 177:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 178:  R[66]=9    ;
 179:  JMP LBL[998]    ;
 180:      ;
 181:  LBL[10]    ;
 182:  !Degagement piece    ;
 183:  PR[100,2:Dcallage]=8    ;
 184:  PR[100,1:Dcallage]=(-900)    ;
 185:  R[66]=9.5    ;
 186:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 187:  R[66]=10    ;
 188:  JMP LBL[998]    ;
 189:      ;
 190:  LBL[11]    ;
 191:  R[66]=10.5    ;
 192:J P[8] 10% FINE    ;
 193:  R[66]=11    ;
 194:  JMP LBL[998]    ;
 195:      ;
 196:  LBL[12]    ;
 197:  R[66]=11.5    ;
 198:L P[9] 100mm/sec FINE    ;
 199:  R[66]=12    ;
 200:  JMP LBL[998]    ;
 201:      ;
 202:  LBL[13]    ;
 203:  R[66]=12.5    ;
 204:J P[18] 10% FINE    ;
 205:  R[66]=13    ;
 206:  JMP LBL[998]    ;
 207:      ;
 208:  LBL[14]    ;
 209:  R[66]=13.5    ;
 210:J P[19] 10% FINE    ;
 211:  R[66]=14    ;
 212:  JMP LBL[998]    ;
 213:      ;
 214:  LBL[15]    ;
 215:  R[66]=14.5    ;
 216:L P[11] 100mm/sec FINE    ;
 217:  R[66]=15    ;
 218:  JMP LBL[998]    ;
 219:      ;
 220:  LBL[16]    ;
 221:  R[66]=15.5    ;
 222:L P[15] 100mm/sec FINE ACC50    ;
 223:  R[66]=16    ;
 224:  JMP LBL[998]    ;
 225:      ;
 226:  LBL[17]    ;
 227:  R[66]=16.5    ;
 228:J P[16] 10% FINE    ;
 229:  R[66]=17    ;
 230:  JMP LBL[998]    ;
 231:      ;
 232:  LBL[18]    ;
 233:  R[66]=17.5    ;
 234:L P[17] 100mm/sec FINE    ;
 235:  R[66]=18    ;
 236:  JMP LBL[998]    ;
 237:      ;
 238:  LBL[19]    ;
 239:  R[66]=18.5    ;
 240:L P[20] 100mm/sec FINE    ;
 241:  R[66]=19    ;
 242:  JMP LBL[998]    ;
 243:      ;
 244:  LBL[20]    ;
 245:  R[66]=19.5    ;
 246:L P[4] 100mm/sec FINE    ;
 247:  R[66]=20    ;
 248:  JMP LBL[998]    ;
 249:      ;
 250:  LBL[21]    ;
 251:  R[66]=20.5    ;
 252:L P[27] 100mm/sec FINE    ;
 253:  R[66]=21    ;
 254:  JMP LBL[998]    ;
 255:      ;
 256:  LBL[22]    ;
 257:  !Calcul pose    ;
 258:  CALL CALC01_30_POSE_MACHINE    ;
 259:  !Point d'approche pose    ;
 260:  PR[100,1:Dcallage]=50    ;
 261:  PR[100,2:Dcallage]=30    ;
 262:  PR[100,3:Dcallage]=(-200)    ;
 263:  R[66]=21.5    ;
 264:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 265:  R[66]=22    ;
 266:  JMP LBL[998]    ;
 267:      ;
 268:  LBL[23]    ;
 269:  !Point d'approche pose    ;
 270:  PR[100,1:Dcallage]=5    ;
 271:  PR[100,2:Dcallage]=30    ;
 272:  PR[100,3:Dcallage]=(-200)    ;
 273:  R[66]=22.5    ;
 274:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 275:  R[66]=23    ;
 276:  JMP LBL[998]    ;
 277:      ;
 278:  LBL[24]    ;
 279:  !Point d'approche pose    ;
 280:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-30)    ;
 281:  R[66]=23.5    ;
 282:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 283:  R[66]=24    ;
 284:  JMP LBL[998]    ;
 285:      ;
 286:  LBL[25]    ;
 287:  PR[100,2:Dcallage]=1    ;
 288:  R[66]=24.5    ;
 289:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 290:  R[66]=25    ;
 291:  JMP LBL[998]    ;
 292:      ;
 293:  LBL[26]    ;
 294:  PR[100,3:Dcallage]=25    ;
 295:  R[66]=25.5    ;
 296:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 297:  R[66]=26    ;
 298:  JMP LBL[998]    ;
 299:      ;
 300:  LBL[27]    ;
 301:  !Point d'approche pose    ;
 302:  PR[100,2:Dcallage]=30    ;
 303:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40)    ;
 304:  R[66]=26.5    ;
 305:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 306:  R[66]=27    ;
 307:  JMP LBL[998]    ;
 308:      ;
 309:  LBL[28]    ;
 310:  !Point d'approche pose    ;
 311:  PR[100,1:Dcallage]=5    ;
 312:  PR[100,2:Dcallage]=0    ;
 313:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40)    ;
 314:  R[66]=27.5    ;
 315:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 316:  R[66]=28    ;
 317:  JMP LBL[998]    ;
 318:      ;
 319:  LBL[29]    ;
 320:  !Point d'approche pose    ;
 321:  PR[100,1:Dcallage]=5    ;
 322:  R[66]=28.5    ;
 323:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 324:  R[66]=29    ;
 325:  JMP LBL[998]    ;
 326:      ;
 327:  LBL[30]    ;
 328:  !Calcul pose    ;
 329:  CALL CALC01_30_POSE_MACHINE    ;
 330:  !Point de pose    ;
 331:  PR[100,1:Dcallage]=0    ;
 332:  PR[100,2:Dcallage]=1    ;
 333:  R[66]=29.5    ;
 334:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 335:  R[66]=30    ;
 336:  JMP LBL[998]    ;
 337:      ;
 338:  LBL[31]    ;
 339:  PR[100,2:Dcallage]=3    ;
 340:  R[66]=30.5    ;
 341:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 342:  R[66]=31    ;
 343:  JMP LBL[998]    ;
 344:      ;
 345:  LBL[32]    ;
 346:  !ouverture du verin    ;
 347:  R[66]=31.5    ;
 348:  CALL TOOL03_OUVERTURE    ;
 349:  R[66]=32    ;
 350:  JMP LBL[998]    ;
 351:      ;
 352:  LBL[33]    ;
 353:  !Point d'approche pose    ;
 354:  PR[100,1:Dcallage]=60    ;
 355:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]+10)    ;
 356:  R[66]=32.5    ;
 357:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 358:  R[66]=33    ;
 359:  JMP LBL[998]    ;
 360:      ;
 361:  LBL[34]    ;
 362:  !Point d'approche pose    ;
 363:  PR[100,1:Dcallage]=10    ;
 364:  R[66]=33.5    ;
 365:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 366:  R[66]=34    ;
 367:  JMP LBL[998]    ;
 368:      ;
 369:  LBL[35]    ;
 370:  !Point d'approche pose    ;
 371:  PR[100,3:Dcallage]=(-200)    ;
 372:  R[66]=34.5    ;
 373:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 374:  R[66]=35    ;
 375:  JMP LBL[998]    ;
 376:      ;
 377:  LBL[36]    ;
 378:  R[66]=35.5    ;
 379:L P[22] 100mm/sec FINE    ;
 380:  R[66]=36    ;
 381:  JMP LBL[998]    ;
 382:      ;
 383:  LBL[37]    ;
 384:  !Fermeture pince    ;
 385:  R[66]=36.5    ;
 386:  CALL TOOL03_FERMETURE    ;
 387:  R[66]=37    ;
 388:  JMP LBL[998]    ;
 389:      ;
 390:  LBL[38]    ;
 391:  !Calcul offset    ;
 392:  PR[100,1:Dcallage]=100    ;
 393:  !Trajectoire de pousage    ;
 394:  R[66]=37.5    ;
 395:L P[33:Pousage Piece] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 396:  R[66]=38    ;
 397:  JMP LBL[998]    ;
 398:      ;
 399:  LBL[39]    ;
 400:  !Point de poussee    ;
 401:  R[66]=38.5    ;
 402:L P[33:Pousage Piece] 100mm/sec FINE    ;
 403:  R[66]=39    ;
 404:  JMP LBL[998]    ;
 405:      ;
 406:  LBL[40]    ;
 407:  !Ouverture Pince    ;
 408:  R[66]=39.5    ;
 409:  CALL TOOL03_OUVERTURE    ;
 410:  R[66]=40    ;
 411:  JMP LBL[998]    ;
 412:      ;
 413:  LBL[41]    ;
 414:  !Trajectoire de pousage    ;
 415:  R[66]=40.5    ;
 416:L P[33:Pousage Piece] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 417:  R[66]=41    ;
 418:  JMP LBL[998]    ;
 419:      ;
 420:  LBL[42]    ;
 421:  R[66]=41.5    ;
 422:L P[25] 100mm/sec FINE    ;
 423:  R[66]=42    ;
 424:  JMP LBL[998]    ;
 425:      ;
 426:  LBL[43]    ;
 427:  R[66]=42.5    ;
 428:L P[23] 100mm/sec FINE    ;
 429:  R[66]=43    ;
 430:  JMP LBL[998]    ;
 431:      ;
 432:  LBL[44]    ;
 433:  R[66]=43.5    ;
 434:J P[24] 10% FINE    ;
 435:  R[66]=44    ;
 436:  JMP LBL[998]    ;
 437:      ;
 438:  LBL[45]    ;
 439:  R[66]=44.5    ;
 440:J P[16] 10% FINE    ;
 441:  R[66]=45    ;
 442:  JMP LBL[998]    ;
 443:      ;
 444:  LBL[46]    ;
 445:  R[66]=45.5    ;
 446:J P[15] 10% FINE    ;
 447:  R[66]=46    ;
 448:  JMP LBL[998]    ;
 449:      ;
 450:  LBL[47]    ;
 451:  R[66]=46.5    ;
 452:J P[1] 10% FINE    ;
 453:  R[66]=47    ;
 454:  JMP LBL[998]    ;
 455:      ;
 456:  LBL[48]    ;
 457:  R[66]=47.5    ;
 458:J P[14:Repos] 10% FINE    ;
 459:  R[66]=48    ;
 460:  JMP LBL[998]    ;
 461:      ;
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
