/PROG  INT_SAB01_40.LS
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
  30:      ;
  31:  LBL[998]    ;
  32:      ;
  33:  SELECT R[66]=1,JMP LBL[999]    ;
  34:         =2,JMP LBL[1]    ;
  35:         =3,JMP LBL[2]    ;
  36:         =4,JMP LBL[3]    ;
  37:         =5,JMP LBL[4]    ;
  38:         =6,JMP LBL[7]    ;
  39:         =7,JMP LBL[8]    ;
  40:         =8,JMP LBL[9]    ;
  41:         =9,JMP LBL[10]    ;
  42:         =10,JMP LBL[11]    ;
  43:         =11,JMP LBL[12]    ;
  44:         =12,JMP LBL[13]    ;
  45:         =13,JMP LBL[14]    ;
  46:         =14,JMP LBL[15]    ;
  47:         =15,JMP LBL[16]    ;
  48:         =16,JMP LBL[17]    ;
  49:         =17,JMP LBL[18]    ;
  50:         =18,JMP LBL[19]    ;
  51:         =19,JMP LBL[18]    ;
  52:         =20,JMP LBL[19]    ;
  53:         =21,JMP LBL[20]    ;
  54:         =22,JMP LBL[21]    ;
  55:         =23,JMP LBL[22]    ;
  56:         =24,JMP LBL[23]    ;
  57:         =25,JMP LBL[24]    ;
  58:         =26,JMP LBL[999]    ;
  59:      ;
  60:  GO[1]=99    ;
  61:  PAUSE    ;
  62:  GO[1]=0    ;
  63:  JMP LBL[998]    ;
  64:      ;
  65:  !Début des trajectoires    ;
  66:      ;
  67:  LBL[1]    ;
  68:  !Point d'approche    ;
  69:  R[66]=0.5    ;
  70:J P[1] 10% FINE    ;
  71:  R[66]=1    ;
  72:  JMP LBL[998]    ;
  73:      ;
  74:  LBL[2]    ;
  75:  !Calcul de point d'approche pal    ;
  76:  CALL CALC01_40    ;
  77:  R[66]=1.5    ;
  78:J PR[99:PR mobil] 10% FINE    ;
  79:  R[66]=2    ;
  80:  JMP LBL[998]    ;
  81:      ;
  82:  LBL[3]    ;
  83:  R[66]=2.5    ;
  84:J P[3] 10% FINE    ;
  85:  R[66]=3    ;
  86:  JMP LBL[998]    ;
  87:      ;
  88:  LBL[4]    ;
  89:  !Point d'approche prise    ;
  90:  PR[100,1:Dcallage]=4    ;
  91:  PR[100,2:Dcallage]=(-14)    ;
  92:  PR[100,3:Dcallage]=(-300)    ;
  93:  R[66]=3.5    ;
  94:J PR[51:Point de prise] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
  95:  R[66]=4    ;
  96:  JMP LBL[998]    ;
  97:      ;
  98:  LBL[5]    ;
  99:  !Point de prise    ;
 100:  PR[100,1:Dcallage]=4    ;
 101:  PR[100,2:Dcallage]=(-14)    ;
 102:  R[66]=4.5    ;
 103:L PR[51:Point de prise] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 104:  R[66]=5    ;
 105:  JMP LBL[998]    ;
 106:      ;
 107:  LBL[6]    ;
 108:  !Actionnement de l'aspiration    ;
 109:  CALL CYCLE_ASPI    ;
 110:  !Point de degagement prise    ;
 111:  PR[100,3:Dcallage]=(-100)    ;
 112:  R[66]=5.5    ;
 113:L PR[51:Point de prise] 100mm/sec FINE ACC25 Tool_Offset,PR[100:Dcallage]    ;
 114:  R[66]=6    ;
 115:  JMP LBL[998]    ;
 116:      ;
 117:  LBL[7]    ;
 118:  PR[100,3:Dcallage]=(-500)    ;
 119:  R[66]=6.5    ;
 120:J PR[51:Point de prise] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 121:  R[66]=7    ;
 122:  JMP LBL[998]    ;
 123:      ;
 124:  LBL[8]    ;
 125:  !Approche    ;
 126:  R[66]=7.5    ;
 127:J P[7] 10% FINE    ;
 128:  R[66]=8    ;
 129:  JMP LBL[998]    ;
 130:      ;
 131:  LBL[9]    ;
 132:  R[66]=8.5    ;
 133:J P[1] 10% FINE    ;
 134:  R[66]=9    ;
 135:  JMP LBL[998]    ;
 136:      ;
 137:  LBL[10]    ;
 138:  !Trajectoir vers station    ;
 139:  R[66]=9.5    ;
 140:L P[10] 100mm/sec FINE    ;
 141:  R[66]=10    ;
 142:  JMP LBL[998]    ;
 143:      ;
 144:  LBL[11]    ;
 145:  R[66]=10.5    ;
 146:J P[2] 10% FINE    ;
 147:  R[66]=11    ;
 148:  JMP LBL[998]    ;
 149:      ;
 150:  LBL[12]    ;
 151:  R[66]=11.5    ;
 152:J P[4] 10% FINE    ;
 153:  R[66]=12    ;
 154:  JMP LBL[998]    ;
 155:      ;
 156:  LBL[13]    ;
 157:  R[66]=12.5    ;
 158:L P[5] 100mm/sec FINE    ;
 159:  R[66]=13    ;
 160:  JMP LBL[998]    ;
 161:      ;
 162:  LBL[14]    ;
 163:  !Point d'approche table de recent    ;
 164:  R[66]=13.5    ;
 165:J P[13] 10% FINE    ;
 166:  R[66]=14    ;
 167:  JMP LBL[998]    ;
 168:      ;
 169:  LBL[15]    ;
 170:  R[66]=14.5    ;
 171:L P[14] 100mm/sec FINE    ;
 172:  R[66]=15    ;
 173:  JMP LBL[998]    ;
 174:      ;
 175:  LBL[16]    ;
 176:  !Calcul pose    ;
 177:  CALL CALC01_40_POSER    ;
 178:  !Approche pose    ;
 179:  PR[70,3:Offset recentrag]=(-50)    ;
 180:  R[66]=15.5    ;
 181:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[70:Offset recentr]    ;
 182:  R[66]=16    ;
 183:  JMP LBL[998]    ;
 184:      ;
 185:  LBL[17]    ;
 186:  !Remise a 0 du Z    ;
 187:  PR[70,3:Offset recentrag]=PR[70,3:Offset recentrag]+50    ;
 188:  !Point de pose    ;
 189:  R[66]=16.5    ;
 190:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 191:  R[66]=17    ;
 192:  JMP LBL[998]    ;
 193:      ;
 194:  LBL[18]    ;
 195:  R[66]=17.5    ;
 196:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 197:  R[66]=18    ;
 198:  JMP LBL[998]    ;
 199:      ;
 200:  LBL[19]    ;
 201:  !Coupure de l'aspiration    ;
 202:  R[66]=18.5    ;
 203:  CALL TOOL02_ASPIRATION_OFF    ;
 204:  R[66]=19    ;
 205:  JMP LBL[998]    ;
 206:      ;
 207:  LBL[20]    ;
 208:  !Degagement piece    ;
 209:  PR[70,3:Offset recentrag]=(-50)    ;
 210:  R[66]=19.5    ;
 211:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 212:  R[66]=20    ;
 213:  JMP LBL[998]    ;
 214:      ;
 215:  LBL[21]    ;
 216:  R[66]=20.5    ;
 217:L P[14] 100mm/sec FINE    ;
 218:  R[66]=21    ;
 219:  JMP LBL[998]    ;
 220:      ;
 221:  LBL[22]    ;
 222:  R[66]=21.5    ;
 223:L P[13] 100mm/sec FINE    ;
 224:  R[66]=22    ;
 225:  JMP LBL[998]    ;
 226:      ;
 227:  LBL[23]    ;
 228:  R[66]=22.5    ;
 229:J P[5] 10% FINE    ;
 230:  R[66]=23    ;
 231:  JMP LBL[998]    ;
 232:      ;
 233:  LBL[24]    ;
 234:  R[66]=23.5    ;
 235:J P[4] 10% FINE    ;
 236:  R[66]=24    ;
 237:  JMP LBL[998]    ;
 238:      ;
 239:  LBL[25]    ;
 240:  R[66]=24.5    ;
 241:J P[2] 10% FINE    ;
 242:  R[66]=25    ;
 243:  JMP LBL[998]    ;
 244:      ;
 245:  LBL[26]    ;
 246:  R[66]=25.5    ;
 247:J P[8:Repos] 10% FINE    ;
 248:  R[66]=26    ;
 249:  JMP LBL[998]    ;
 250:      ;
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
