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
   1:  !//////////////////////////////// ;
   2:  !///////Chargement OP10////////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Memo programme en cours ;
   6:  R[38:Programme en cr]=5    ;
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
  23:  //L P[6] 2000mm/sec FINE    ;
  24:  R[66:Memo INIT]=1    ;
  25:   ;
  26:J P[1] 100% CNT25    ;
  27:  R[66:Memo INIT]=2    ;
  28:   ;
  29:  !Point au dessu des stations ;
  30:L P[18] 2000mm/sec CNT25    ;
  31:  R[66:Memo INIT]=3    ;
  32:   ;
  33:  !Demande d'arret ;
  34:  CALL DEMANDE_ARRET    ;
  35:   ;
  36:  !Choix Uframe/Utool ;
  37:  UFRAME_NUM=1 ;
  38:  UTOOL_NUM=3 ;
  39:   ;
  40:  !Point d'approche table de recent ;
  41:L P[19] 2000mm/sec CNT25    ;
  42:  R[66:Memo INIT]=4    ;
  43:L P[20] 2000mm/sec CNT10    ;
  44:  R[66:Memo INIT]=5    ;
  45:  //L P[2] 2000mm/sec FINE    ;
  46:  R[66:Memo INIT]=6    ;
  47:   ;
  48:  !Demande d'arret ;
  49:  CALL DEMANDE_ARRET    ;
  50:   ;
  51:  !Ouverture verin ;
  52:  CALL TOOL03_OUVERTURE    ;
  53:   ;
  54:  !Raz PR ;
  55:  CALL RAZPR100    ;
  56:   ;
  57:  !Calcul point prise ;
  58:  CALL CALC01_50_PRISE    ;
  59:   ;
  60:  !Approche prise ;
  61:  PR[100,3:Décallage]=PR[100,3:Décallage]-100    ;
  62:  PR[100,1:Décallage]=10    ;
  63:L PR[99:PR mobil] 1000mm/sec CNT100 Tool_Offset,PR[100:Décallage]    ;
  64:  R[66:Memo INIT]=7    ;
  65:   ;
  66:  !Ouverture pince ;
  67:  CALL TOOL03_OUVERTURE    ;
  68:   ;
  69:  !Point de prise ;
  70:  PR[100,3:Décallage]=PR[100,3:Décallage]+100    ;
  71:  PR[100,2:Décallage]=(PR[100,2:Décallage]+R[32:Reglage Prise]) ;
  72:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  73:  R[66:Memo INIT]=8    ;
  74:   ;
  75:  !Decalage  ;
  76:  PR[100,1:Décallage]=(-1)    ;
  77:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  78:  R[66:Memo INIT]=9    ;
  79:   ;
  80:  !Fermeture verin ;
  81:  CALL CYCLE_FERMETURE    ;
  82:   ;
  83:  !Raz PR ;
  84:  CALL RAZPR100    ;
  85:   ;
  86:  !Degagement piece ;
  87:  PR[100,1:Décallage]=(-5)    ;
  88:  PR[100,2:Décallage]=(R[32:Reglage Prise]-3) ;
  89:  PR[100,3:Décallage]=(-20)    ;
  90:L PR[99:PR mobil] 250mm/sec CNT100 Tool_Offset,PR[100:Décallage]    ;
  91:  R[66:Memo INIT]=10    ;
  92:   ;
  93:   ;
  94:  PR[100,3:Décallage]=(-100)    ;
  95:L PR[99:PR mobil] 500mm/sec CNT100 Tool_Offset,PR[100:Décallage]    ;
  96:  R[66:Memo INIT]=11    ;
  97:L P[2] 500mm/sec FINE    ;
  98:  R[66:Memo INIT]=12    ;
  99:L P[20] 500mm/sec FINE    ;
 100:  R[66:Memo INIT]=13    ;
 101:L P[19] 500mm/sec FINE    ;
 102:  R[66:Memo INIT]=14    ;
 103:   ;
 104:  !Demande d'arret ;
 105:  CALL DEMANDE_ARRET    ;
 106:   ;
 107:  !Choix Uframe/Utool ;
 108:  UFRAME_NUM=0 ;
 109:  UTOOL_NUM=3 ;
 110:   ;
 111:J P[18] 30% CNT100    ;
 112:  R[66:Memo INIT]=15    ;
 113:J P[1] 30% CNT100    ;
 114:  R[66:Memo INIT]=16    ;
 115:J P[9] 30% CNT100    ;
 116:  R[66:Memo INIT]=17    ;
 117:J P[10] 30% CNT100    ;
 118:  R[66:Memo INIT]=18    ;
 119:L P[11] 1000mm/sec CNT100 ACC50    ;
 120:  R[66:Memo INIT]=19    ;
 121:L P[12] 500mm/sec CNT100    ;
 122:  R[66:Memo INIT]=20    ;
 123:J P[3] 30% CNT100    ;
 124:  R[66:Memo INIT]=21    ;
 125:L P[4] 500mm/sec CNT100    ;
 126:  R[66:Memo INIT]=22    ;
 127:   ;
 128:  !Demande d'arret ;
 129:  CALL DEMANDE_ARRET    ;
 130:   ;
 131:  !Choix Uframe/Utool ;
 132:  UFRAME_NUM=6 ;
 133:  UTOOL_NUM=3 ;
 134:   ;
 135:  !Test acces ;
 136:  CALL TEST_ACCES_MACHINE    ;
 137:   ;
 138:  !Raz PR ;
 139:  CALL RAZPR100    ;
 140:  CALL RAZPR99    ;
 141:   ;
 142:  !Calcul Pose ;
 143:  CALL CALC01_50_POSE_MACHINE    ;
 144:   ;
 145:  !Point d'approche pose ;
 146:  PR[100,1:Décallage]=0    ;
 147:  PR[100,2:Décallage]=(-5)    ;
 148:  PR[100,3:Décallage]=(-600)    ;
 149:L PR[99:PR mobil] 500mm/sec CNT10 Tool_Offset,PR[100:Décallage]    ;
 150:   ;
 151:  !Point d'approche pose ;
 152:  PR[100,1:Décallage]=30    ;
 153:  PR[100,2:Décallage]=(-5)    ;
 154:  PR[100,3:Décallage]=(-600)    ;
 155:L PR[99:PR mobil] 500mm/sec CNT50 Tool_Offset,PR[100:Décallage]    ;
 156:   ;
 157:  !Point d'approche pose ;
 158:  PR[100,1:Décallage]=30    ;
 159:  PR[100,2:Décallage]=(-5)    ;
 160:  PR[100,2:Décallage]=(PR[100,2:Décallage]+R[32:Reglage Prise]) ;
 161:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 162:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 163:  PR[100,3:Décallage]=(PR[100,3:Décallage]-40) ;
 164:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 165:   ;
 166:  !Point d'approche pose ;
 167:  PR[100,1:Décallage]=0    ;
 168:  PR[100,2:Décallage]=(-5)    ;
 169:  PR[100,2:Décallage]=(PR[100,2:Décallage]+R[32:Reglage Prise]) ;
 170:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 171:   ;
 172:  !Raz PR ;
 173:  CALL RAZPR100    ;
 174:   ;
 175:  !Point d'approche pose ;
 176:  PR[100,1:Décallage]=0    ;
 177:  PR[100,2:Décallage]=(-5)    ;
 178:  PR[100,2:Décallage]=(PR[100,2:Décallage]+R[32:Reglage Prise]) ;
 179:  PR[100,3:Décallage]=0    ;
 180:  !//////////////////////////////// ;
 181:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
 182:  !//////////////////////////////// ;
 183:  !Calcul Decallage Z ;
 184:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 185:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 186:  //IF (R[37:Hauteur Piece]=40),PR[100,3:Décallage]=(30) ;
 187:   ;
 188:  !//////////////////////////////// ;
 189:L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 190:  R[66:Memo INIT]=25    ;
 191:   ;
 192:  !Raz PR ;
 193:  CALL RAZPR100    ;
 194:   ;
 195:  !//////////////////////////////// ;
 196:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
 197:  !//////////////////////////////// ;
 198:  !Calcul Decallage Z ;
 199:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 200:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 201:  PR[100,2:Décallage]=(PR[100,2:Décallage]+R[32:Reglage Prise]) ;
 202:   ;
 203:  !//////////////////////////////// ;
 204:   ;
 205:  !Point de pose ;
 206:L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 207:  IF (R[37:Hauteur Piece]=40),PR[100,3:Décallage]=(30) ;
 208:  !Point de pose ;
 209:L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 210:   ;
 211:  !ouverture du verin ;
 212:  CALL TOOL03_OUVERTURE    ;
 213:  R[66:Memo INIT]=26    ;
 214:   ;
 215:  !Raz PR ;
 216:  CALL RAZPR100    ;
 217:   ;
 218:  !Point d'approche pose ;
 219:  !Calcul Decallage Z ;
 220:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
 221:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
 222:  PR[100,1:Décallage]=10    ;
 223:  PR[100,2:Décallage]=R[32:Reglage Prise]    ;
 224:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 225:  R[66:Memo INIT]=27    ;
 226:   ;
 227:  !Point d'approche pose ;
 228:  PR[100,3:Décallage]=(-500)    ;
 229:  PR[100,2:Décallage]=R[32:Reglage Prise]    ;
 230:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 231:  R[66:Memo INIT]=27    ;
 232:   ;
 233:  !Choix Uframe/Utool ;
 234:  UFRAME_NUM=0 ;
 235:  UTOOL_NUM=3 ;
 236:   ;
 237:   ;
 238:L P[4] 2000mm/sec CNT25    ;
 239:  R[66:Memo INIT]=28    ;
 240:   ;
 241:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 242:  !\\\\\\Appuie piece machine\\\\\\ ;
 243:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 244:   ;
 245:  !Fermeture pince ;
 246:  CALL TOOL03_FERMETURE    ;
 247:   ;
 248:  !Raz PR ;
 249:  CALL RAZPR99    ;
 250:  CALL RAZPR100    ;
 251:   ;
 252:  !Calcul offset ;
 253:  PR[100,1:Décallage]=100    ;
 254:   ;
 255:  !Trajectoire de pousage ;
 256:L P[8:Pousage Piece] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 257:   ;
 258:  !Point de poussee ;
 259:L P[8:Pousage Piece] 1000mm/sec FINE    ;
 260:   ;
 261:  !Ouverture Pince ;
 262:  CALL TOOL03_OUVERTURE    ;
 263:   ;
 264:  !Tempo ;
 265:  WAIT   1.00(sec) ;
 266:   ;
 267:  !Trajectoire de pousage ;
 268:L P[8:Pousage Piece] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 269:   ;
 270:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 271:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 272:  !\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ;
 273:   ;
 274:L P[14] 2000mm/sec CNT25    ;
 275:  R[66:Memo INIT]=28    ;
 276:   ;
 277:J P[3] 100% CNT25    ;
 278:  R[66:Memo INIT]=29    ;
 279:J P[12] 100% CNT25    ;
 280:  R[66:Memo INIT]=30    ;
 281:L P[11] 2000mm/sec CNT25    ;
 282:  R[66:Memo INIT]=31    ;
 283:   ;
 284:  CALL DCY_MACHINE    ;
 285:  !Demande d'arret ;
 286:  CALL DEMANDE_ARRET    ;
 287:   ;
 288:  !Mis en position repos ;
 289:  !Definition du repere ;
 290:  UFRAME_NUM=5 ;
 291:  UTOOL_NUM=5 ;
 292:   ;
 293:J P[7:Repos] 100% FINE    ;
 294:  R[66:Memo INIT]=0    ;
 295:   ;
 296:  !Demande d'arret ;
 297:  CALL DEMANDE_ARRET    ;
 298:   ;
 299:  CALL TPS_CYCLE    ;
 300:   ;
 301:  !Validation Fin Tache ;
 302:  CALL VALIDATION_FIN_TACHE    ;
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
