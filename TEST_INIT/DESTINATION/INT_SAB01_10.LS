/PROG  INT_SAB01_10.LS
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
   2:  !programme référence SAB01_10    ;
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
  38:      ;
  39:  LBL[998]    ;
  40:      ;
  41:  SELECT R[66]=1,JMP LBL[999]    ;
  42:         =2,JMP LBL[1]    ;
  43:         =3,JMP LBL[2]    ;
  44:         =4,JMP LBL[3]    ;
  45:         =5,JMP LBL[4]    ;
  46:         =6,JMP LBL[7]    ;
  47:         =7,JMP LBL[8]    ;
  48:         =8,JMP LBL[9]    ;
  49:         =9,JMP LBL[10]    ;
  50:         =10,JMP LBL[11]    ;
  51:         =11,JMP LBL[12]    ;
  52:         =12,JMP LBL[13]    ;
  53:         =13,JMP LBL[14]    ;
  54:         =14,JMP LBL[15]    ;
  55:         =15,JMP LBL[16]    ;
  56:         =16,JMP LBL[17]    ;
  57:         =17,JMP LBL[18]    ;
  58:         =18,JMP LBL[19]    ;
  59:         =19,JMP LBL[20]    ;
  60:         =20,JMP LBL[21]    ;
  61:         =21,JMP LBL[22]    ;
  62:         =22,JMP LBL[23]    ;
  63:         =23,JMP LBL[24]    ;
  64:         =24,JMP LBL[25]    ;
  65:         =25,JMP LBL[26]    ;
  66:         =26,JMP LBL[27]    ;
  67:         =27,JMP LBL[28]    ;
  68:         =28,JMP LBL[27]    ;
  69:         =29,JMP LBL[28]    ;
  70:         =30,JMP LBL[29]    ;
  71:         =31,JMP LBL[30]    ;
  72:         =32,JMP LBL[31]    ;
  73:         =33,JMP LBL[32]    ;
  74:         =34,JMP LBL[999]    ;
  75:      ;
  76:  GO[1]=99    ;
  77:  PAUSE    ;
  78:  GO[1]=0    ;
  79:  JMP LBL[998]    ;
  80:      ;
  81:  !Début des trajectoires    ;
  82:      ;
  83:  LBL[1]    ;
  84:  !Point d'approche    ;
  85:  R[66]=0.5    ;
  86:J P[2:App 1] 10% FINE    ;
  87:  R[66]=1    ;
  88:  JMP LBL[998]    ;
  89:      ;
  90:  LBL[2]    ;
  91:  !Trajectoir d'approche    ;
  92:  R[66]=1.5    ;
  93:J P[4:App 2] 10% FINE    ;
  94:  R[66]=2    ;
  95:  JMP LBL[998]    ;
  96:      ;
  97:  LBL[3]    ;
  98:  R[66]=2.5    ;
  99:J P[3:App 3] 10% FINE    ;
 100:  R[66]=3    ;
 101:  JMP LBL[998]    ;
 102:      ;
 103:  LBL[4]    ;
 104:  R[66]=3.5    ;
 105:L P[14] 100mm/sec FINE    ;
 106:  R[66]=4    ;
 107:  JMP LBL[998]    ;
 108:      ;
 109:  LBL[5]    ;
 110:  !Calcul point prise    ;
 111:  CALL CALC01_10_PRISE_MACHINE    ;
 112:  !Point d'approche pose    ;
 113:  PR[100,3:Dcallage]=(-200)    ;
 114:  R[66]=4.5    ;
 115:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 116:  R[66]=5    ;
 117:  JMP LBL[998]    ;
 118:      ;
 119:  LBL[6]    ;
 120:  !Ouverture pince    ;
 121:  R[66]=5.5    ;
 122:  CALL TOOL03_OUVERTURE    ;
 123:  R[66]=6    ;
 124:  JMP LBL[998]    ;
 125:      ;
 126:  LBL[7]    ;
 127:  !Point d'approche prise    ;
 128:  PR[100,1:Dcallage]=10    ;
 129:  PR[100,3:Dcallage]=(-75)    ;
 130:  R[66]=6.5    ;
 131:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 132:  R[66]=7    ;
 133:  JMP LBL[998]    ;
 134:      ;
 135:  LBL[8]    ;
 136:  PR[100,3:Dcallage]=0    ;
 137:  !////////////////////////////////    ;
 138:  R[66]=7.5    ;
 139:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 140:  R[66]=8    ;
 141:  JMP LBL[998]    ;
 142:      ;
 143:  LBL[9]    ;
 144:  !Point de prise    ;
 145:  R[66]=8.5    ;
 146:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 147:  R[66]=9    ;
 148:  JMP LBL[998]    ;
 149:      ;
 150:  LBL[10]    ;
 151:  !Point d'approche pose    ;
 152:  PR[100,2:Dcallage]=1.5    ;
 153:  R[66]=9.5    ;
 154:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 155:  R[66]=10    ;
 156:  JMP LBL[998]    ;
 157:      ;
 158:  LBL[11]    ;
 159:  !Point d'approche pose    ;
 160:  PR[100,3:Dcallage]=(-200)    ;
 161:  R[66]=10.5    ;
 162:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 163:  R[66]=11    ;
 164:  JMP LBL[998]    ;
 165:      ;
 166:  LBL[12]    ;
 167:  !Soufflage piece    ;
 168:  R[66]=11.5    ;
 169:L P[13:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 170:  R[66]=12    ;
 171:  JMP LBL[998]    ;
 172:      ;
 173:  LBL[13]    ;
 174:  R[66]=12.5    ;
 175:L P[17] 100mm/sec FINE    ;
 176:  R[66]=13    ;
 177:  JMP LBL[998]    ;
 178:      ;
 179:  LBL[14]    ;
 180:  R[66]=13.5    ;
 181:L P[16] 100mm/sec FINE    ;
 182:  R[66]=14    ;
 183:  JMP LBL[998]    ;
 184:      ;
 185:  LBL[15]    ;
 186:  R[66]=14.5    ;
 187:L P[18] 100mm/sec FINE    ;
 188:  R[66]=15    ;
 189:  JMP LBL[998]    ;
 190:      ;
 191:  LBL[16]    ;
 192:  !Soufflage piece    ;
 193:  R[66]=15.5    ;
 194:L P[12:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 195:  R[66]=16    ;
 196:  JMP LBL[998]    ;
 197:      ;
 198:  LBL[17]    ;
 199:  !Trajectoir vers station 1 2    ;
 200:  R[66]=16.5    ;
 201:J P[1:App 4] 10% FINE    ;
 202:  R[66]=17    ;
 203:  JMP LBL[998]    ;
 204:      ;
 205:  LBL[18]    ;
 206:  R[66]=17.5    ;
 207:J P[3:App 3] 10% FINE    ;
 208:  R[66]=18    ;
 209:  JMP LBL[998]    ;
 210:      ;
 211:  LBL[19]    ;
 212:  R[66]=18.5    ;
 213:J P[4:App 2] 10% FINE    ;
 214:  R[66]=19    ;
 215:  JMP LBL[998]    ;
 216:      ;
 217:  LBL[20]    ;
 218:  R[66]=19.5    ;
 219:J P[2:App 1] 10% FINE    ;
 220:  R[66]=20    ;
 221:  JMP LBL[998]    ;
 222:      ;
 223:  LBL[21]    ;
 224:  R[66]=20.5    ;
 225:J P[7] 10% FINE    ;
 226:  R[66]=21    ;
 227:  JMP LBL[998]    ;
 228:      ;
 229:  LBL[22]    ;
 230:  !Point au dessu de la station    ;
 231:  R[66]=21.5    ;
 232:L P[10] 100mm/sec FINE    ;
 233:  R[66]=22    ;
 234:  JMP LBL[998]    ;
 235:      ;
 236:  LBL[23]    ;
 237:  R[66]=22.5    ;
 238:J P[8] 10% FINE    ;
 239:  R[66]=23    ;
 240:  JMP LBL[998]    ;
 241:      ;
 242:  LBL[24]    ;
 243:  R[66]=23.5    ;
 244:J P[9] 10% FINE    ;
 245:  R[66]=24    ;
 246:  JMP LBL[998]    ;
 247:      ;
 248:  LBL[25]    ;
 249:  !Calcule pose palette    ;
 250:  CALL CALC01_10    ;
 251:  !Approche palette    ;
 252:  PR[100,3:Dcallage]=(-500)    ;
 253:  R[66]=24.5    ;
 254:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 255:  R[66]=25    ;
 256:  JMP LBL[998]    ;
 257:      ;
 258:  LBL[26]    ;
 259:  !Approche pose    ;
 260:  PR[100,3:Dcallage]=(-50)    ;
 261:  R[66]=25.5    ;
 262:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 263:  R[66]=26    ;
 264:  JMP LBL[998]    ;
 265:      ;
 266:  LBL[27]    ;
 267:  !Point de pose    ;
 268:  R[66]=26.5    ;
 269:L PR[99:PR mobil] 100mm/sec FINE    ;
 270:  R[66]=27    ;
 271:  JMP LBL[998]    ;
 272:      ;
 273:  LBL[28]    ;
 274:  !Ouverture verin    ;
 275:  R[66]=27.5    ;
 276:  CALL TOOL03_OUVERTURE    ;
 277:  R[66]=28    ;
 278:  JMP LBL[998]    ;
 279:      ;
 280:  LBL[29]    ;
 281:  !Degagement piece    ;
 282:  R[66]=28.5    ;
 283:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 284:  R[66]=29    ;
 285:  JMP LBL[998]    ;
 286:      ;
 287:  LBL[30]    ;
 288:  !Degagement palette    ;
 289:  PR[100,3:Dcallage]=(-300)    ;
 290:  R[66]=29.5    ;
 291:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 292:  R[66]=30    ;
 293:  JMP LBL[998]    ;
 294:      ;
 295:  LBL[31]    ;
 296:  !Retour en position repos    ;
 297:  R[66]=30.5    ;
 298:J P[8] 10% FINE    ;
 299:  R[66]=31    ;
 300:  JMP LBL[998]    ;
 301:      ;
 302:  LBL[32]    ;
 303:  R[66]=31.5    ;
 304:J P[5] 10% FINE    ;
 305:  R[66]=32    ;
 306:  JMP LBL[998]    ;
 307:      ;
 308:  LBL[33]    ;
 309:  R[66]=32.5    ;
 310:J P[6] 10% FINE    ;
 311:  R[66]=33    ;
 312:  JMP LBL[998]    ;
 313:      ;
 314:  LBL[34]    ;
 315:  R[66]=33.5    ;
 316:J P[11:Repos] 10% FINE    ;
 317:  R[66]=34    ;
 318:  JMP LBL[998]    ;
 319:      ;
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
