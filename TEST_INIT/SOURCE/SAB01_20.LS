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
   1:  !//////////////////////////////// ;
   2:  !///////Dechargement OP10//////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Memo programme en cours ;
   6:  R[38:Programme en cr]=2    ;
   7:   ;
   8:  !Validation Tache ;
   9:  CALL VALIDATION_DEBUT_TACHE    ;
  10:   ;
  11:  !Soufflage piece OP10   ;
  12:  CALL SAB01_21TEST    ;
  13:   ;
  14:  !Changment de prehenseur ;
  15:  R[91:Choix outils]=3    ;
  16:  CALL CHANG_OUTIL    ;
  17:   ;
  18:  !Override ;
  19:  CALL OVERRIDE    ;
  20:   ;
  21:  !Choix Uframe/Utool ;
  22:  UFRAME_NUM=0 ;
  23:  UTOOL_NUM=3 ;
  24:   ;
  25:  !Point d'approche ;
  26:J P[4] 100% FINE    ;
  27:  R[66:Memo INIT]=55    ;
  28:   ;
  29:  !Trajectoir d'approche ;
  30:J P[5] 100% CNT50    ;
  31:  R[66:Memo INIT]=56    ;
  32:J P[6] 100% CNT25    ;
  33:  R[66:Memo INIT]=57    ;
  34:J P[8] 100% FINE    ;
  35:  R[66:Memo INIT]=58    ;
  36:   ;
  37:  !Demande d'arret ;
  38:  CALL DEMANDE_ARRET    ;
  39:   ;
  40:  !Choix Uframe/Utool ;
  41:  UFRAME_NUM=6 ;
  42:  UTOOL_NUM=3 ;
  43:   ;
  44:  !Test acces ;
  45:  CALL TEST_ACCES_MACHINE    ;
  46:   ;
  47:  !Point d'approche prise ;
  48:  !Raz PR ;
  49:  CALL RAZPR100    ;
  50:  CALL RAZPR99    ;
  51:   ;
  52:  !Calcul point prise ;
  53:  CALL CALC01_20_PRISE_MACHINE    ;
  54:   ;
  55:  !Point d'approche pose ;
  56:  PR[100,1:Décallage]=8    ;
  57:  PR[100,3:Décallage]=(-500)    ;
  58:L PR[99:PR mobil] 2000mm/sec CNT100 Tool_Offset,PR[100:Décallage]    ;
  59:  R[66:Memo INIT]=59    ;
  60:   ;
  61:  !Ouverture pince ;
  62:  CALL TOOL03_OUVERTURE    ;
  63:   ;
  64:  !Point d'approche pose ;
  65:   ;
  66:  PR[100,3:Décallage]=0    ;
  67:  !Calcul Decallage Z ;
  68:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  69:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  70:  PR[100,2:Décallage]=(PR[100,2:Décallage]+R[32:Reglage Prise]) ;
  71:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  72:  R[66:Memo INIT]=60    ;
  73:   ;
  74:  !Raz PR ;
  75:  CALL RAZPR100    ;
  76:   ;
  77:  !//////////////////////////////// ;
  78:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
  79:  !//////////////////////////////// ;
  80:  !Calcul Decallage Z ;
  81:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  82:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  83:  !//////////////////////////////// ;
  84:  PR[100,2:Décallage]=(PR[100,2:Décallage]+R[32:Reglage Prise]) ;
  85:   ;
  86:  !Point de prise ;
  87:L PR[99:PR mobil] 200mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  88:  R[66:Memo INIT]=61    ;
  89:   ;
  90:  !Actionnement du verin ;
  91:  CALL CYCLE_FERMETURE    ;
  92:   ;
  93:  R[66:Memo INIT]=62    ;
  94:  !Point d'approche pose ;
  95:  PR[100,1:Décallage]=(-3)    ;
  96:L PR[99:PR mobil] 400mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  97:  R[66:Memo INIT]=62    ;
  98:   ;
  99:  !Point d'approche pose ;
 100:  PR[100,3:Décallage]=(-200)    ;
 101:L PR[99:PR mobil] 200mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 102:  R[66:Memo INIT]=63    ;
 103:   ;
 104:  !Activation soufflage ;
 105:  DO[103:OFF:Soufflage Machine]=ON ;
 106:   ;
 107:  !Soufflage piece ;
 108:L P[7:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 109:  R[66:Memo INIT]=64    ;
 110:   ;
 111:   ;
 112:  !Soufflage piece ;
 113:L P[1:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 114:  R[66:Memo INIT]=65    ;
 115:   ;
 116:  !Soufflage piece ;
 117:L P[13:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 118:  R[66:Memo INIT]=66    ;
 119:   ;
 120:  !Desactivation soufflage ;
 121:  DO[103:OFF:Soufflage Machine]=OFF ;
 122:   ;
 123:  !Point d'approche pose ;
 124:  PR[100,3:Décallage]=(-200)    ;
 125:L PR[99:PR mobil] 200mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 126:  R[66:Memo INIT]=67    ;
 127:   ;
 128:  !Point d'approche pose ;
 129:  PR[100,3:Décallage]=(-500)    ;
 130:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 131:  R[66:Memo INIT]=68    ;
 132:   ;
 133:  !Trajectoir vers station ;
 134:   ;
 135:  !Choix Uframe/Utool ;
 136:  UFRAME_NUM=0 ;
 137:  UTOOL_NUM=3 ;
 138:   ;
 139:  !Trajectoir vers station ;
 140:J P[8] 30% FINE    ;
 141:  R[66:Memo INIT]=69    ;
 142:  PAUSE ;
 143:J P[6] 30% CNT100    ;
 144:  R[66:Memo INIT]=70    ;
 145:   ;
 146:J P[5] 30% CNT25    ;
 147:  R[66:Memo INIT]=71    ;
 148:   ;
 149:J P[4] 30% CNT25    ;
 150:  R[66:Memo INIT]=72    ;
 151:   ;
 152:J P[26] 30% FINE    ;
 153:  R[66:Memo INIT]=73    ;
 154:   ;
 155:  !Trajectoire vers table ;
 156:L P[22] 500mm/sec CNT100    ;
 157:  R[66:Memo INIT]=74    ;
 158:   ;
 159:L P[2] 500mm/sec CNT10    ;
 160:  R[66:Memo INIT]=75    ;
 161:   ;
 162:J P[23] 30% CNT25    ;
 163:  R[66:Memo INIT]=76    ;
 164:   ;
 165:J P[24] 30% FINE    ;
 166:  R[66:Memo INIT]=77    ;
 167:   ;
 168:L P[25] 500mm/sec FINE    ;
 169:  R[66:Memo INIT]=78    ;
 170:   ;
 171:  !Choix Uframe/Utool ;
 172:  UFRAME_NUM=1 ;
 173:  UTOOL_NUM=3 ;
 174:   ;
 175:  !Demande d'arret ;
 176:  CALL DEMANDE_ARRET    ;
 177:   ;
 178:  !Trajectoire d approche ;
 179:L P[9] 500mm/sec FINE    ;
 180:  R[66:Memo INIT]=79    ;
 181:   ;
 182:L P[10] 500mm/sec FINE    ;
 183:  R[66:Memo INIT]=80    ;
 184:   ;
 185:  !Demande d'arret ;
 186:  CALL DEMANDE_ARRET    ;
 187:   ;
 188:  !Reset PR ;
 189:  CALL RAZPR100    ;
 190:   ;
 191:  !Approche pose ;
 192:  PR[100,3:Décallage]=(-100)    ;
 193:L P[12:Pose] 500mm/sec CNT100 Tool_Offset,PR[90:Approche prise]    ;
 194:  R[66:Memo INIT]=81    ;
 195:   ;
 196:  !Raz PR ;
 197:  CALL RAZPR99    ;
 198:  CALL RAZPR100    ;
 199:   ;
 200:  !Calcul Pose ;
 201:  CALL CALC01_20_POSE_RECENTRAGE    ;
 202:  !Point de pose ;
 203:  PR[100,3:Décallage]=(PR[100,3:Décallage]-40) ;
 204:  PR[100,2:Décallage]=(R[32:Reglage Prise]-3) ;
 205:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 206:  R[66:Memo INIT]=82    ;
 207:   ;
 208:  !Point de pose ;
 209:  PR[100,3:Décallage]=(PR[100,3:Décallage]+40) ;
 210:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 211:  R[66:Memo INIT]=83    ;
 212:   ;
 213:  !Point de pose ;
 214:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 215:  R[66:Memo INIT]=84    ;
 216:   ;
 217:  !Ouverture verin ;
 218:  CALL TOOL03_OUVERTURE    ;
 219:   ;
 220:  R[66:Memo INIT]=85    ;
 221:  !Degagement piece ;
 222:  PR[100,1:Décallage]=12    ;
 223:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 224:  R[66:Memo INIT]=85    ;
 225:   ;
 226:  PR[100,3:Décallage]=(-150)    ;
 227:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 228:  R[66:Memo INIT]=86    ;
 229:   ;
 230:  !Trajectoire de degagement ;
 231:L P[9] 2000mm/sec FINE    ;
 232:  R[66:Memo INIT]=87    ;
 233:   ;
 234:  !Demande d'arret ;
 235:  CALL DEMANDE_ARRET    ;
 236:   ;
 237:J P[25] 100% CNT25    ;
 238:  R[66:Memo INIT]=88    ;
 239:   ;
 240:J P[24] 100% CNT25    ;
 241:  R[66:Memo INIT]=89    ;
 242:   ;
 243:J P[23] 100% CNT25    ;
 244:  R[66:Memo INIT]=90    ;
 245:   ;
 246:J P[3] 100% CNT25    ;
 247:  R[66:Memo INIT]=91    ;
 248:   ;
 249:  !Demande d'arret ;
 250:  CALL DEMANDE_ARRET    ;
 251:   ;
 252:  !Mis en position repos ;
 253:  !Definition du repere ;
 254:  UFRAME_NUM=5 ;
 255:  UTOOL_NUM=5 ;
 256:   ;
 257:J P[11:Repos] 100% FINE    ;
 258:  R[66:Memo INIT]=0    ;
 259:   ;
 260:  !Soufflage du posage OP20 ;
 261:  CALL SAB01_21TEST    ;
 262:   ;
 263:  !Depart cycle ;
 264:  CALL DCY_MACHINE    ;
 265:   ;
 266:   ;
 267:  !Validation Fin Tache ;
 268:  CALL VALIDATION_FIN_TACHE    ;
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
