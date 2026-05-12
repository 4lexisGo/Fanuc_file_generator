/PROG  INT_SAB01_30.LS
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
 172:  PR[100,1:Dcallage]=(-5)    ;
 173:  PR[100,2:Dcallage]=5    ;
 174:  PR[100,3:Dcallage]=PR[100,3:Dcallage]+10    ;
 175:  R[66]=8.5    ;
 176:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 177:  R[66]=9    ;
 178:  JMP LBL[998]    ;
 179:      ;
 180:  LBL[10]    ;
 181:  !Degagement piece    ;
 182:  PR[100,2:Dcallage]=8    ;
 183:  PR[100,1:Dcallage]=(-900)    ;
 184:  R[66]=9.5    ;
 185:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 186:  R[66]=10    ;
 187:  JMP LBL[998]    ;
 188:      ;
 189:  LBL[11]    ;
 190:  R[66]=10.5    ;
 191:J P[8] 10% FINE    ;
 192:  R[66]=11    ;
 193:  JMP LBL[998]    ;
 194:      ;
 195:  LBL[12]    ;
 196:  R[66]=11.5    ;
 197:L P[9] 100mm/sec FINE    ;
 198:  R[66]=12    ;
 199:  JMP LBL[998]    ;
 200:      ;
 201:  LBL[13]    ;
 202:  R[66]=12.5    ;
 203:J P[18] 10% FINE    ;
 204:  R[66]=13    ;
 205:  JMP LBL[998]    ;
 206:      ;
 207:  LBL[14]    ;
 208:  R[66]=13.5    ;
 209:J P[19] 10% FINE    ;
 210:  R[66]=14    ;
 211:  JMP LBL[998]    ;
 212:      ;
 213:  LBL[15]    ;
 214:  R[66]=14.5    ;
 215:L P[11] 100mm/sec FINE    ;
 216:  R[66]=15    ;
 217:  JMP LBL[998]    ;
 218:      ;
 219:  LBL[16]    ;
 220:  R[66]=15.5    ;
 221:L P[15] 100mm/sec FINE ACC50    ;
 222:  R[66]=16    ;
 223:  JMP LBL[998]    ;
 224:      ;
 225:  LBL[17]    ;
 226:  R[66]=16.5    ;
 227:J P[16] 10% FINE    ;
 228:  R[66]=17    ;
 229:  JMP LBL[998]    ;
 230:      ;
 231:  LBL[18]    ;
 232:  R[66]=17.5    ;
 233:L P[17] 100mm/sec FINE    ;
 234:  R[66]=18    ;
 235:  JMP LBL[998]    ;
 236:      ;
 237:  LBL[19]    ;
 238:  R[66]=18.5    ;
 239:L P[20] 100mm/sec FINE    ;
 240:  R[66]=19    ;
 241:  JMP LBL[998]    ;
 242:      ;
 243:  LBL[20]    ;
 244:  R[66]=19.5    ;
 245:L P[4] 100mm/sec FINE    ;
 246:  R[66]=20    ;
 247:  JMP LBL[998]    ;
 248:      ;
 249:  LBL[21]    ;
 250:  R[66]=20.5    ;
 251:L P[27] 100mm/sec FINE    ;
 252:  R[66]=21    ;
 253:  JMP LBL[998]    ;
 254:      ;
 255:  LBL[22]    ;
 256:  !Calcul pose    ;
 257:  CALL CALC01_30_POSE_MACHINE    ;
 258:  !Point d'approche pose    ;
 259:  PR[100,1:Dcallage]=50    ;
 260:  PR[100,2:Dcallage]=30    ;
 261:  PR[100,3:Dcallage]=(-200)    ;
 262:  R[66]=21.5    ;
 263:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 264:  R[66]=22    ;
 265:  JMP LBL[998]    ;
 266:      ;
 267:  LBL[23]    ;
 268:  !Point d'approche pose    ;
 269:  PR[100,1:Dcallage]=5    ;
 270:  PR[100,2:Dcallage]=30    ;
 271:  PR[100,3:Dcallage]=(-200)    ;
 272:  R[66]=22.5    ;
 273:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 274:  R[66]=23    ;
 275:  JMP LBL[998]    ;
 276:      ;
 277:  LBL[24]    ;
 278:  !Point d'approche pose    ;
 279:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-30)    ;
 280:  R[66]=23.5    ;
 281:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 282:  R[66]=24    ;
 283:  JMP LBL[998]    ;
 284:      ;
 285:  LBL[25]    ;
 286:  PR[100,2:Dcallage]=1    ;
 287:  R[66]=24.5    ;
 288:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 289:  R[66]=25    ;
 290:  JMP LBL[998]    ;
 291:      ;
 292:  LBL[26]    ;
 293:  PR[100,3:Dcallage]=25    ;
 294:  R[66]=25.5    ;
 295:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 296:  R[66]=26    ;
 297:  JMP LBL[998]    ;
 298:      ;
 299:  LBL[27]    ;
 300:  !Point d'approche pose    ;
 301:  PR[100,2:Dcallage]=30    ;
 302:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40)    ;
 303:  R[66]=26.5    ;
 304:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 305:  R[66]=27    ;
 306:  JMP LBL[998]    ;
 307:      ;
 308:  LBL[28]    ;
 309:  !Point d'approche pose    ;
 310:  PR[100,1:Dcallage]=5    ;
 311:  PR[100,2:Dcallage]=0    ;
 312:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40)    ;
 313:  R[66]=27.5    ;
 314:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 315:  R[66]=28    ;
 316:  JMP LBL[998]    ;
 317:      ;
 318:  LBL[29]    ;
 319:  !Point d'approche pose    ;
 320:  PR[100,1:Dcallage]=5    ;
 321:  R[66]=28.5    ;
 322:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 323:  R[66]=29    ;
 324:  JMP LBL[998]    ;
 325:      ;
 326:  LBL[30]    ;
 327:  !Calcul pose    ;
 328:  CALL CALC01_30_POSE_MACHINE    ;
 329:  !Point de pose    ;
 330:  PR[100,1:Dcallage]=0    ;
 331:  PR[100,2:Dcallage]=1    ;
 332:  R[66]=29.5    ;
 333:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 334:  R[66]=30    ;
 335:  JMP LBL[998]    ;
 336:      ;
 337:  LBL[31]    ;
 338:  PR[100,2:Dcallage]=3    ;
 339:  R[66]=30.5    ;
 340:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 341:  R[66]=31    ;
 342:  JMP LBL[998]    ;
 343:      ;
 344:  LBL[32]    ;
 345:  !ouverture du verin    ;
 346:  R[66]=31.5    ;
 347:  CALL TOOL03_OUVERTURE    ;
 348:  R[66]=32    ;
 349:  JMP LBL[998]    ;
 350:      ;
 351:  LBL[33]    ;
 352:  !Point d'approche pose    ;
 353:  PR[100,1:Dcallage]=60    ;
 354:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]+10)    ;
 355:  R[66]=32.5    ;
 356:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 357:  R[66]=33    ;
 358:  JMP LBL[998]    ;
 359:      ;
 360:  LBL[34]    ;
 361:  !Point d'approche pose    ;
 362:  PR[100,1:Dcallage]=10    ;
 363:  R[66]=33.5    ;
 364:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 365:  R[66]=34    ;
 366:  JMP LBL[998]    ;
 367:      ;
 368:  LBL[35]    ;
 369:  !Point d'approche pose    ;
 370:  PR[100,3:Dcallage]=(-200)    ;
 371:  R[66]=34.5    ;
 372:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 373:  R[66]=35    ;
 374:  JMP LBL[998]    ;
 375:      ;
 376:  LBL[36]    ;
 377:  R[66]=35.5    ;
 378:L P[22] 100mm/sec FINE    ;
 379:  R[66]=36    ;
 380:  JMP LBL[998]    ;
 381:      ;
 382:  LBL[37]    ;
 383:  !Fermeture pince    ;
 384:  R[66]=36.5    ;
 385:  CALL TOOL03_FERMETURE    ;
 386:  R[66]=37    ;
 387:  JMP LBL[998]    ;
 388:      ;
 389:  LBL[38]    ;
 390:  !Calcul offset    ;
 391:  PR[100,1:Dcallage]=100    ;
 392:  !Trajectoire de pousage    ;
 393:  R[66]=37.5    ;
 394:L P[33:Pousage Piece] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 395:  R[66]=38    ;
 396:  JMP LBL[998]    ;
 397:      ;
 398:  LBL[39]    ;
 399:  !Point de poussee    ;
 400:  R[66]=38.5    ;
 401:L P[33:Pousage Piece] 100mm/sec FINE    ;
 402:  R[66]=39    ;
 403:  JMP LBL[998]    ;
 404:      ;
 405:  LBL[40]    ;
 406:  !Ouverture Pince    ;
 407:  R[66]=39.5    ;
 408:  CALL TOOL03_OUVERTURE    ;
 409:  R[66]=40    ;
 410:  JMP LBL[998]    ;
 411:      ;
 412:  LBL[41]    ;
 413:  !Trajectoire de pousage    ;
 414:  R[66]=40.5    ;
 415:L P[33:Pousage Piece] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 416:  R[66]=41    ;
 417:  JMP LBL[998]    ;
 418:      ;
 419:  LBL[42]    ;
 420:  R[66]=41.5    ;
 421:L P[25] 100mm/sec FINE    ;
 422:  R[66]=42    ;
 423:  JMP LBL[998]    ;
 424:      ;
 425:  LBL[43]    ;
 426:  R[66]=42.5    ;
 427:L P[23] 100mm/sec FINE    ;
 428:  R[66]=43    ;
 429:  JMP LBL[998]    ;
 430:      ;
 431:  LBL[44]    ;
 432:  R[66]=43.5    ;
 433:J P[24] 10% FINE    ;
 434:  R[66]=44    ;
 435:  JMP LBL[998]    ;
 436:      ;
 437:  LBL[45]    ;
 438:  R[66]=44.5    ;
 439:J P[16] 10% FINE    ;
 440:  R[66]=45    ;
 441:  JMP LBL[998]    ;
 442:      ;
 443:  LBL[46]    ;
 444:  R[66]=45.5    ;
 445:J P[15] 10% FINE    ;
 446:  R[66]=46    ;
 447:  JMP LBL[998]    ;
 448:      ;
 449:  LBL[47]    ;
 450:  R[66]=46.5    ;
 451:J P[1] 10% FINE    ;
 452:  R[66]=47    ;
 453:  JMP LBL[998]    ;
 454:      ;
 455:  LBL[48]    ;
 456:  R[66]=47.5    ;
 457:J P[14:Repos] 10% FINE    ;
 458:  R[66]=48    ;
 459:  JMP LBL[998]    ;
 460:      ;
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
