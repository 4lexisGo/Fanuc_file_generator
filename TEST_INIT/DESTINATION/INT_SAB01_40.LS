/PROG  INT_SAB01_40.LS
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
   2:  !programme référence SAB01_40    ;
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
  31:      ;
  32:  LBL[998]    ;
  33:      ;
  34:  SELECT R[66]=1,JMP LBL[999]    ;
  35:         =2,JMP LBL[1]    ;
  36:         =3,JMP LBL[2]    ;
  37:         =4,JMP LBL[3]    ;
  38:         =5,JMP LBL[4]    ;
  39:         =6,JMP LBL[7]    ;
  40:         =7,JMP LBL[8]    ;
  41:         =8,JMP LBL[9]    ;
  42:         =9,JMP LBL[10]    ;
  43:         =10,JMP LBL[11]    ;
  44:         =11,JMP LBL[12]    ;
  45:         =12,JMP LBL[13]    ;
  46:         =13,JMP LBL[14]    ;
  47:         =14,JMP LBL[15]    ;
  48:         =15,JMP LBL[16]    ;
  49:         =16,JMP LBL[17]    ;
  50:         =17,JMP LBL[18]    ;
  51:         =18,JMP LBL[19]    ;
  52:         =19,JMP LBL[20]    ;
  53:         =20,JMP LBL[19]    ;
  54:         =21,JMP LBL[20]    ;
  55:         =22,JMP LBL[21]    ;
  56:         =23,JMP LBL[22]    ;
  57:         =24,JMP LBL[23]    ;
  58:         =25,JMP LBL[24]    ;
  59:         =26,JMP LBL[25]    ;
  60:         =27,JMP LBL[999]    ;
  61:      ;
  62:  GO[1]=99    ;
  63:  PAUSE    ;
  64:  GO[1]=0    ;
  65:  JMP LBL[998]    ;
  66:      ;
  67:  !Début des trajectoires    ;
  68:      ;
  69:  LBL[1]    ;
  70:  !Point d'approche    ;
  71:  R[66]=0.5    ;
  72:J P[1] 10% FINE    ;
  73:  R[66]=1    ;
  74:  JMP LBL[998]    ;
  75:      ;
  76:  LBL[2]    ;
  77:  !Calcul de point d'approche pal    ;
  78:  CALL CALC01_40    ;
  79:  R[66]=1.5    ;
  80:J PR[99:PR mobil] 10% FINE    ;
  81:  R[66]=2    ;
  82:  JMP LBL[998]    ;
  83:      ;
  84:  LBL[3]    ;
  85:  R[66]=2.5    ;
  86:J P[3] 10% FINE    ;
  87:  R[66]=3    ;
  88:  JMP LBL[998]    ;
  89:      ;
  90:  LBL[4]    ;
  91:  !Point d'approche prise    ;
  92:  PR[100,1:Dcallage]=4    ;
  93:  PR[100,2:Dcallage]=(-14)    ;
  94:  PR[100,3:Dcallage]=(-300)    ;
  95:  R[66]=3.5    ;
  96:J PR[51:Point de prise] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
  97:  R[66]=4    ;
  98:  JMP LBL[998]    ;
  99:      ;
 100:  LBL[5]    ;
 101:  !Point de prise    ;
 102:  PR[100,1:Dcallage]=4    ;
 103:  PR[100,2:Dcallage]=(-14)    ;
 104:  R[66]=4.5    ;
 105:L PR[51:Point de prise] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 106:  R[66]=5    ;
 107:  JMP LBL[998]    ;
 108:      ;
 109:  LBL[6]    ;
 110:  !Actionnement de l'aspiration    ;
 111:  R[66]=5.5    ;
 112:  CALL CYCLE_ASPI    ;
 113:  R[66]=6    ;
 114:  JMP LBL[998]    ;
 115:      ;
 116:  LBL[7]    ;
 117:  !Point de degagement prise    ;
 118:  PR[100,3:Dcallage]=(-100)    ;
 119:  R[66]=6.5    ;
 120:L PR[51:Point de prise] 100mm/sec FINE ACC25 Tool_Offset,PR[100:Dcallage]    ;
 121:  R[66]=7    ;
 122:  JMP LBL[998]    ;
 123:      ;
 124:  LBL[8]    ;
 125:  PR[100,3:Dcallage]=(-500)    ;
 126:  R[66]=7.5    ;
 127:J PR[51:Point de prise] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 128:  R[66]=8    ;
 129:  JMP LBL[998]    ;
 130:      ;
 131:  LBL[9]    ;
 132:  !Approche    ;
 133:  R[66]=8.5    ;
 134:J P[7] 10% FINE    ;
 135:  R[66]=9    ;
 136:  JMP LBL[998]    ;
 137:      ;
 138:  LBL[10]    ;
 139:  R[66]=9.5    ;
 140:J P[1] 10% FINE    ;
 141:  R[66]=10    ;
 142:  JMP LBL[998]    ;
 143:      ;
 144:  LBL[11]    ;
 145:  !Trajectoir vers station    ;
 146:  R[66]=10.5    ;
 147:L P[10] 100mm/sec FINE    ;
 148:  R[66]=11    ;
 149:  JMP LBL[998]    ;
 150:      ;
 151:  LBL[12]    ;
 152:  R[66]=11.5    ;
 153:J P[2] 10% FINE    ;
 154:  R[66]=12    ;
 155:  JMP LBL[998]    ;
 156:      ;
 157:  LBL[13]    ;
 158:  R[66]=12.5    ;
 159:J P[4] 10% FINE    ;
 160:  R[66]=13    ;
 161:  JMP LBL[998]    ;
 162:      ;
 163:  LBL[14]    ;
 164:  R[66]=13.5    ;
 165:L P[5] 100mm/sec FINE    ;
 166:  R[66]=14    ;
 167:  JMP LBL[998]    ;
 168:      ;
 169:  LBL[15]    ;
 170:  !Point d'approche table de recent    ;
 171:  R[66]=14.5    ;
 172:J P[13] 10% FINE    ;
 173:  R[66]=15    ;
 174:  JMP LBL[998]    ;
 175:      ;
 176:  LBL[16]    ;
 177:  R[66]=15.5    ;
 178:L P[14] 100mm/sec FINE    ;
 179:  R[66]=16    ;
 180:  JMP LBL[998]    ;
 181:      ;
 182:  LBL[17]    ;
 183:  !Calcul pose    ;
 184:  CALL CALC01_40_POSER    ;
 185:  !Approche pose    ;
 186:  PR[70,3:Offset recentrag]=(-50)    ;
 187:  R[66]=16.5    ;
 188:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[70:Offset recentr]    ;
 189:  R[66]=17    ;
 190:  JMP LBL[998]    ;
 191:      ;
 192:  LBL[18]    ;
 193:  !Remise a 0 du Z    ;
 194:  PR[70,3:Offset recentrag]=PR[70,3:Offset recentrag]+50    ;
 195:  !Point de pose    ;
 196:  R[66]=17.5    ;
 197:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 198:  R[66]=18    ;
 199:  JMP LBL[998]    ;
 200:      ;
 201:  LBL[19]    ;
 202:  R[66]=18.5    ;
 203:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 204:  R[66]=19    ;
 205:  JMP LBL[998]    ;
 206:      ;
 207:  LBL[20]    ;
 208:  !Coupure de l'aspiration    ;
 209:  R[66]=19.5    ;
 210:  CALL TOOL02_ASPIRATION_OFF    ;
 211:  R[66]=20    ;
 212:  JMP LBL[998]    ;
 213:      ;
 214:  LBL[21]    ;
 215:  !Degagement piece    ;
 216:  PR[70,3:Offset recentrag]=(-50)    ;
 217:  R[66]=20.5    ;
 218:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 219:  R[66]=21    ;
 220:  JMP LBL[998]    ;
 221:      ;
 222:  LBL[22]    ;
 223:  R[66]=21.5    ;
 224:L P[14] 100mm/sec FINE    ;
 225:  R[66]=22    ;
 226:  JMP LBL[998]    ;
 227:      ;
 228:  LBL[23]    ;
 229:  R[66]=22.5    ;
 230:L P[13] 100mm/sec FINE    ;
 231:  R[66]=23    ;
 232:  JMP LBL[998]    ;
 233:      ;
 234:  LBL[24]    ;
 235:  R[66]=23.5    ;
 236:J P[5] 10% FINE    ;
 237:  R[66]=24    ;
 238:  JMP LBL[998]    ;
 239:      ;
 240:  LBL[25]    ;
 241:  R[66]=24.5    ;
 242:J P[4] 10% FINE    ;
 243:  R[66]=25    ;
 244:  JMP LBL[998]    ;
 245:      ;
 246:  LBL[26]    ;
 247:  R[66]=25.5    ;
 248:J P[2] 10% FINE    ;
 249:  R[66]=26    ;
 250:  JMP LBL[998]    ;
 251:      ;
 252:  LBL[27]    ;
 253:  R[66]=26.5    ;
 254:J P[8:Repos] 10% FINE    ;
 255:  R[66]=27    ;
 256:  JMP LBL[998]    ;
 257:      ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   973.005  mm,	Y =   925.287  mm,	Z =     4.703  mm,
	W =  -179.292 deg,	P =      .700 deg,	R =   -88.376 deg
};
P[2]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   685.613  mm,	Y = -1523.896  mm,	Z =     4.640  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[3]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   951.701  mm,	Y =  1432.453  mm,	Z =  2172.696  mm,
	W =  -171.076 deg,	P =    67.958 deg,	R =   -80.399 deg
};
P[4]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   686.146  mm,	Y = -1524.766  mm,	Z =   470.000  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[5]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  -658.194  mm,	Y = -1760.059  mm,	Z =   470.000  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[7]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   668.039  mm,	Y =  1595.992  mm,	Z =     4.636  mm,
	W =  -179.295 deg,	P =      .698 deg,	R =   -88.373 deg
};
P[8:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[10]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1015.617  mm,	Y =  -924.130  mm,	Z =     4.641  mm,
	W =   179.767 deg,	P =      .406 deg,	R =   -88.387 deg
};
P[13]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   696.824  mm,	Y =   545.403  mm,	Z =   309.250  mm,
	W =   120.629 deg,	P =    13.721 deg,	R =   -82.387 deg
};
P[14]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   600.529  mm,	Y =   568.020  mm,	Z =   165.225  mm,
	W =   167.187 deg,	P =    11.798 deg,	R =   -81.937 deg
};
/END
