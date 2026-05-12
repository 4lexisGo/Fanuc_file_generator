/PROG  INT_SAB01_20.LS
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
   2:  !programme référence SAB01_20    ;
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
  44:      ;
  45:  LBL[998]    ;
  46:      ;
  47:  SELECT R[66]=1,JMP LBL[999]    ;
  48:         =2,JMP LBL[1]    ;
  49:         =3,JMP LBL[2]    ;
  50:         =4,JMP LBL[3]    ;
  51:         =5,JMP LBL[4]    ;
  52:         =6,JMP LBL[7]    ;
  53:         =7,JMP LBL[8]    ;
  54:         =8,JMP LBL[9]    ;
  55:         =9,JMP LBL[10]    ;
  56:         =10,JMP LBL[11]    ;
  57:         =11,JMP LBL[12]    ;
  58:         =12,JMP LBL[13]    ;
  59:         =13,JMP LBL[14]    ;
  60:         =14,JMP LBL[15]    ;
  61:         =15,JMP LBL[16]    ;
  62:         =16,JMP LBL[17]    ;
  63:         =17,JMP LBL[18]    ;
  64:         =18,JMP LBL[19]    ;
  65:         =19,JMP LBL[20]    ;
  66:         =20,JMP LBL[21]    ;
  67:         =21,JMP LBL[22]    ;
  68:         =22,JMP LBL[23]    ;
  69:         =23,JMP LBL[24]    ;
  70:         =24,JMP LBL[25]    ;
  71:         =25,JMP LBL[26]    ;
  72:         =26,JMP LBL[27]    ;
  73:         =27,JMP LBL[28]    ;
  74:         =28,JMP LBL[29]    ;
  75:         =29,JMP LBL[30]    ;
  76:         =30,JMP LBL[31]    ;
  77:         =31,JMP LBL[32]    ;
  78:         =32,JMP LBL[31]    ;
  79:         =33,JMP LBL[32]    ;
  80:         =34,JMP LBL[33]    ;
  81:         =35,JMP LBL[34]    ;
  82:         =36,JMP LBL[35]    ;
  83:         =37,JMP LBL[36]    ;
  84:         =38,JMP LBL[37]    ;
  85:         =39,JMP LBL[38]    ;
  86:         =40,JMP LBL[999]    ;
  87:      ;
  88:  GO[1]=99    ;
  89:  PAUSE    ;
  90:  GO[1]=0    ;
  91:  JMP LBL[998]    ;
  92:      ;
  93:  !Début des trajectoires    ;
  94:      ;
  95:  LBL[1]    ;
  96:  !Point d'approche    ;
  97:  R[66]=0.5    ;
  98:J P[4] 10% FINE    ;
  99:  R[66]=1    ;
 100:  JMP LBL[998]    ;
 101:      ;
 102:  LBL[2]    ;
 103:  !Trajectoir d'approche    ;
 104:  R[66]=1.5    ;
 105:J P[5] 10% FINE    ;
 106:  R[66]=2    ;
 107:  JMP LBL[998]    ;
 108:      ;
 109:  LBL[3]    ;
 110:  R[66]=2.5    ;
 111:J P[6] 10% FINE    ;
 112:  R[66]=3    ;
 113:  JMP LBL[998]    ;
 114:      ;
 115:  LBL[4]    ;
 116:  R[66]=3.5    ;
 117:J P[8] 10% FINE    ;
 118:  R[66]=4    ;
 119:  JMP LBL[998]    ;
 120:      ;
 121:  LBL[5]    ;
 122:  !Calcul point prise    ;
 123:  CALL CALC01_20_PRISE_MACHINE    ;
 124:  !Point d'approche pose    ;
 125:  PR[100,1:Dcallage]=8    ;
 126:  PR[100,3:Dcallage]=(-500)    ;
 127:  R[66]=4.5    ;
 128:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 129:  R[66]=5    ;
 130:  JMP LBL[998]    ;
 131:      ;
 132:  LBL[6]    ;
 133:  !Ouverture pince    ;
 134:  R[66]=5.5    ;
 135:  CALL TOOL03_OUVERTURE    ;
 136:  R[66]=6    ;
 137:  JMP LBL[998]    ;
 138:      ;
 139:  LBL[7]    ;
 140:  PR[100,3:Dcallage]=0    ;
 141:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise])    ;
 142:  R[66]=6.5    ;
 143:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 144:  R[66]=7    ;
 145:  JMP LBL[998]    ;
 146:      ;
 147:  LBL[8]    ;
 148:  !////////////////////////////////    ;
 149:  PR[100,2:Dcallage]=(PR[100,2:Dcallage]+R[32:Reglage Prise])    ;
 150:  !Point de prise    ;
 151:  R[66]=7.5    ;
 152:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 153:  R[66]=8    ;
 154:  JMP LBL[998]    ;
 155:      ;
 156:  LBL[9]    ;
 157:  !Point d'approche pose    ;
 158:  PR[100,1:Dcallage]=(-3)    ;
 159:  R[66]=8.5    ;
 160:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 161:  R[66]=9    ;
 162:  JMP LBL[998]    ;
 163:      ;
 164:  LBL[10]    ;
 165:  !Point d'approche pose    ;
 166:  PR[100,3:Dcallage]=(-200)    ;
 167:  R[66]=9.5    ;
 168:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 169:  R[66]=10    ;
 170:  JMP LBL[998]    ;
 171:      ;
 172:  LBL[11]    ;
 173:  !Soufflage piece    ;
 174:  R[66]=10.5    ;
 175:L P[7:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 176:  R[66]=11    ;
 177:  JMP LBL[998]    ;
 178:      ;
 179:  LBL[12]    ;
 180:  !Soufflage piece    ;
 181:  R[66]=11.5    ;
 182:L P[1:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 183:  R[66]=12    ;
 184:  JMP LBL[998]    ;
 185:      ;
 186:  LBL[13]    ;
 187:  !Soufflage piece    ;
 188:  R[66]=12.5    ;
 189:L P[13:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 190:  R[66]=13    ;
 191:  JMP LBL[998]    ;
 192:      ;
 193:  LBL[14]    ;
 194:  !Point d'approche pose    ;
 195:  PR[100,3:Dcallage]=(-200)    ;
 196:  R[66]=13.5    ;
 197:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 198:  R[66]=14    ;
 199:  JMP LBL[998]    ;
 200:      ;
 201:  LBL[15]    ;
 202:  !Point d'approche pose    ;
 203:  PR[100,3:Dcallage]=(-500)    ;
 204:  R[66]=14.5    ;
 205:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 206:  R[66]=15    ;
 207:  JMP LBL[998]    ;
 208:      ;
 209:  LBL[16]    ;
 210:  !Trajectoir vers station    ;
 211:  R[66]=15.5    ;
 212:J P[8] 10% FINE    ;
 213:  R[66]=16    ;
 214:  JMP LBL[998]    ;
 215:      ;
 216:  LBL[17]    ;
 217:  R[66]=16.5    ;
 218:J P[6] 10% FINE    ;
 219:  R[66]=17    ;
 220:  JMP LBL[998]    ;
 221:      ;
 222:  LBL[18]    ;
 223:  R[66]=17.5    ;
 224:J P[5] 10% FINE    ;
 225:  R[66]=18    ;
 226:  JMP LBL[998]    ;
 227:      ;
 228:  LBL[19]    ;
 229:  R[66]=18.5    ;
 230:J P[4] 10% FINE    ;
 231:  R[66]=19    ;
 232:  JMP LBL[998]    ;
 233:      ;
 234:  LBL[20]    ;
 235:  R[66]=19.5    ;
 236:J P[26] 10% FINE    ;
 237:  R[66]=20    ;
 238:  JMP LBL[998]    ;
 239:      ;
 240:  LBL[21]    ;
 241:  !Trajectoire vers table    ;
 242:  R[66]=20.5    ;
 243:L P[22] 100mm/sec FINE    ;
 244:  R[66]=21    ;
 245:  JMP LBL[998]    ;
 246:      ;
 247:  LBL[22]    ;
 248:  R[66]=21.5    ;
 249:L P[2] 100mm/sec FINE    ;
 250:  R[66]=22    ;
 251:  JMP LBL[998]    ;
 252:      ;
 253:  LBL[23]    ;
 254:  R[66]=22.5    ;
 255:J P[23] 10% FINE    ;
 256:  R[66]=23    ;
 257:  JMP LBL[998]    ;
 258:      ;
 259:  LBL[24]    ;
 260:  R[66]=23.5    ;
 261:J P[24] 10% FINE    ;
 262:  R[66]=24    ;
 263:  JMP LBL[998]    ;
 264:      ;
 265:  LBL[25]    ;
 266:  R[66]=24.5    ;
 267:L P[25] 100mm/sec FINE    ;
 268:  R[66]=25    ;
 269:  JMP LBL[998]    ;
 270:      ;
 271:  LBL[26]    ;
 272:  !Trajectoire d approche    ;
 273:  R[66]=25.5    ;
 274:L P[9] 100mm/sec FINE    ;
 275:  R[66]=26    ;
 276:  JMP LBL[998]    ;
 277:      ;
 278:  LBL[27]    ;
 279:  R[66]=26.5    ;
 280:L P[10] 100mm/sec FINE    ;
 281:  R[66]=27    ;
 282:  JMP LBL[998]    ;
 283:      ;
 284:  LBL[28]    ;
 285:  !Approche pose    ;
 286:  PR[100,3:Dcallage]=(-100)    ;
 287:  R[66]=27.5    ;
 288:L P[12:Pose] 100mm/sec FINE Tool_Offset,PR[90:Approche prise]    ;
 289:  R[66]=28    ;
 290:  JMP LBL[998]    ;
 291:      ;
 292:  LBL[29]    ;
 293:  !Calcul Pose    ;
 294:  CALL CALC01_20_POSE_RECENTRAGE    ;
 295:  !Point de pose    ;
 296:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]-40)    ;
 297:  PR[100,2:Dcallage]=(R[32:Reglage Prise]-3)    ;
 298:  R[66]=28.5    ;
 299:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 300:  R[66]=29    ;
 301:  JMP LBL[998]    ;
 302:      ;
 303:  LBL[30]    ;
 304:  !Point de pose    ;
 305:  PR[100,3:Dcallage]=(PR[100,3:Dcallage]+40)    ;
 306:  R[66]=29.5    ;
 307:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 308:  R[66]=30    ;
 309:  JMP LBL[998]    ;
 310:      ;
 311:  LBL[31]    ;
 312:  !Point de pose    ;
 313:  R[66]=30.5    ;
 314:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 315:  R[66]=31    ;
 316:  JMP LBL[998]    ;
 317:      ;
 318:  LBL[32]    ;
 319:  !Ouverture verin    ;
 320:  R[66]=31.5    ;
 321:  CALL TOOL03_OUVERTURE    ;
 322:  R[66]=32    ;
 323:  JMP LBL[998]    ;
 324:      ;
 325:  LBL[33]    ;
 326:  !Degagement piece    ;
 327:  PR[100,1:Dcallage]=12    ;
 328:  R[66]=32.5    ;
 329:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 330:  R[66]=33    ;
 331:  JMP LBL[998]    ;
 332:      ;
 333:  LBL[34]    ;
 334:  PR[100,3:Dcallage]=(-150)    ;
 335:  R[66]=33.5    ;
 336:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 337:  R[66]=34    ;
 338:  JMP LBL[998]    ;
 339:      ;
 340:  LBL[35]    ;
 341:  !Trajectoire de degagement    ;
 342:  R[66]=34.5    ;
 343:L P[9] 100mm/sec FINE    ;
 344:  R[66]=35    ;
 345:  JMP LBL[998]    ;
 346:      ;
 347:  LBL[36]    ;
 348:  R[66]=35.5    ;
 349:J P[25] 10% FINE    ;
 350:  R[66]=36    ;
 351:  JMP LBL[998]    ;
 352:      ;
 353:  LBL[37]    ;
 354:  R[66]=36.5    ;
 355:J P[24] 10% FINE    ;
 356:  R[66]=37    ;
 357:  JMP LBL[998]    ;
 358:      ;
 359:  LBL[38]    ;
 360:  R[66]=37.5    ;
 361:J P[23] 10% FINE    ;
 362:  R[66]=38    ;
 363:  JMP LBL[998]    ;
 364:      ;
 365:  LBL[39]    ;
 366:  R[66]=38.5    ;
 367:J P[3] 10% FINE    ;
 368:  R[66]=39    ;
 369:  JMP LBL[998]    ;
 370:      ;
 371:  LBL[40]    ;
 372:  R[66]=39.5    ;
 373:J P[11:Repos] 10% FINE    ;
 374:  R[66]=40    ;
 375:  JMP LBL[998]    ;
 376:      ;
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
