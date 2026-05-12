/PROG  INT_SAB01_60.LS
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
   2:  !programme référence SAB01_60    ;
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
  27:      ;
  28:  LBL[998]    ;
  29:      ;
  30:  SELECT R[66]=1,JMP LBL[999]    ;
  31:         =2,JMP LBL[1]    ;
  32:         =3,JMP LBL[2]    ;
  33:         =4,JMP LBL[5]    ;
  34:         =5,JMP LBL[6]    ;
  35:         =6,JMP LBL[7]    ;
  36:         =7,JMP LBL[8]    ;
  37:         =8,JMP LBL[9]    ;
  38:         =9,JMP LBL[10]    ;
  39:         =10,JMP LBL[11]    ;
  40:         =11,JMP LBL[12]    ;
  41:         =12,JMP LBL[13]    ;
  42:         =13,JMP LBL[14]    ;
  43:         =14,JMP LBL[15]    ;
  44:         =15,JMP LBL[16]    ;
  45:         =16,JMP LBL[17]    ;
  46:         =17,JMP LBL[18]    ;
  47:         =18,JMP LBL[19]    ;
  48:         =19,JMP LBL[18]    ;
  49:         =20,JMP LBL[19]    ;
  50:         =21,JMP LBL[20]    ;
  51:         =22,JMP LBL[21]    ;
  52:         =23,JMP LBL[999]    ;
  53:      ;
  54:  GO[1]=99    ;
  55:  PAUSE    ;
  56:  GO[1]=0    ;
  57:  JMP LBL[998]    ;
  58:      ;
  59:  !Début des trajectoires    ;
  60:      ;
  61:  LBL[1]    ;
  62:  !Point d'approche    ;
  63:  R[66]=0.5    ;
  64:J P[1] 10% FINE    ;
  65:  R[66]=1    ;
  66:  JMP LBL[998]    ;
  67:      ;
  68:  LBL[2]    ;
  69:  !Point mesure    ;
  70:  R[66]=1.5    ;
  71:L P[2] 100mm/sec FINE    ;
  72:  R[66]=2    ;
  73:  JMP LBL[998]    ;
  74:      ;
  75:  LBL[3]    ;
  76:  !Calcule de point de prise    ;
  77:  CALL CALC01_60    ;
  78:  R[66]=2.5    ;
  79:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
  80:  R[66]=3    ;
  81:  JMP LBL[998]    ;
  82:      ;
  83:  LBL[4]    ;
  84:  !Aspiration intercalaire    ;
  85:  R[66]=3.5    ;
  86:  CALL CYCLE_ASPI    ;
  87:  R[66]=4    ;
  88:  JMP LBL[998]    ;
  89:      ;
  90:  LBL[5]    ;
  91:  R[66]=4.5    ;
  92:L P[4] 100mm/sec FINE    ;
  93:  R[66]=5    ;
  94:  JMP LBL[998]    ;
  95:      ;
  96:  LBL[6]    ;
  97:  R[66]=5.5    ;
  98:L P[9] 100mm/sec FINE    ;
  99:  R[66]=6    ;
 100:  JMP LBL[998]    ;
 101:      ;
 102:  LBL[7]    ;
 103:  R[66]=6.5    ;
 104:L P[10] 100mm/sec FINE    ;
 105:  R[66]=7    ;
 106:  JMP LBL[998]    ;
 107:      ;
 108:  LBL[8]    ;
 109:  R[66]=7.5    ;
 110:L P[5] 100mm/sec FINE    ;
 111:  R[66]=8    ;
 112:  JMP LBL[998]    ;
 113:      ;
 114:  LBL[9]    ;
 115:  R[66]=8.5    ;
 116:L P[6] 100mm/sec FINE    ;
 117:  R[66]=9    ;
 118:  JMP LBL[998]    ;
 119:      ;
 120:  LBL[10]    ;
 121:  R[66]=9.5    ;
 122:L P[7] 100mm/sec FINE    ;
 123:  R[66]=10    ;
 124:  JMP LBL[998]    ;
 125:      ;
 126:  LBL[11]    ;
 127:  R[66]=10.5    ;
 128:L P[8] 100mm/sec FINE    ;
 129:  R[66]=11    ;
 130:  JMP LBL[998]    ;
 131:      ;
 132:  LBL[12]    ;
 133:  R[66]=11.5    ;
 134:L P[11] 100mm/sec FINE    ;
 135:  R[66]=12    ;
 136:  JMP LBL[998]    ;
 137:      ;
 138:  LBL[13]    ;
 139:  R[66]=12.5    ;
 140:L P[12] 100mm/sec FINE    ;
 141:  R[66]=13    ;
 142:  JMP LBL[998]    ;
 143:      ;
 144:  LBL[14]    ;
 145:  R[66]=13.5    ;
 146:L P[13] 100mm/sec FINE    ;
 147:  R[66]=14    ;
 148:  JMP LBL[998]    ;
 149:      ;
 150:  LBL[15]    ;
 151:  !Point de degagement    ;
 152:  PR[100,1:Dcallage]=(-100)    ;
 153:  PR[100,3:Dcallage]=(-100)    ;
 154:  PR[100,2:Dcallage]=(-100)    ;
 155:  R[66]=14.5    ;
 156:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ACC5    ;
 157:  R[66]=15    ;
 158:  JMP LBL[998]    ;
 159:      ;
 160:  LBL[16]    ;
 161:  !Choix palette    ;
 162:  CALL CALC01_60_POSE    ;
 163:  PR[100,3:Dcallage]=(-800)    ;
 164:  R[66]=15.5    ;
 165:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 166:  R[66]=16    ;
 167:  JMP LBL[998]    ;
 168:      ;
 169:  LBL[17]    ;
 170:  PR[100,3:Dcallage]=(-100)    ;
 171:  R[66]=16.5    ;
 172:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 173:  R[66]=17    ;
 174:  JMP LBL[998]    ;
 175:      ;
 176:  LBL[18]    ;
 177:  R[66]=17.5    ;
 178:L PR[99:PR mobil] 100mm/sec FINE    ;
 179:  R[66]=18    ;
 180:  JMP LBL[998]    ;
 181:      ;
 182:  LBL[19]    ;
 183:  !Pose intercallaire    ;
 184:  R[66]=18.5    ;
 185:  CALL TOOL02_ASPIRATION_OFF    ;
 186:  R[66]=19    ;
 187:  JMP LBL[998]    ;
 188:      ;
 189:  LBL[20]    ;
 190:  PR[100,3:Dcallage]=(-100)    ;
 191:  R[66]=19.5    ;
 192:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 193:  R[66]=20    ;
 194:  JMP LBL[998]    ;
 195:      ;
 196:  LBL[21]    ;
 197:  PR[100,3:Dcallage]=(-800)    ;
 198:  R[66]=20.5    ;
 199:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 200:  R[66]=21    ;
 201:  JMP LBL[998]    ;
 202:      ;
 203:  LBL[22]    ;
 204:  R[66]=21.5    ;
 205:J P[1] 10% FINE    ;
 206:  R[66]=22    ;
 207:  JMP LBL[998]    ;
 208:      ;
 209:  LBL[23]    ;
 210:  R[66]=22.5    ;
 211:J P[3:Repos] 10% FINE    ;
 212:  R[66]=23    ;
 213:  JMP LBL[998]    ;
 214:      ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   309.539  mm,	Y = -1549.649  mm,	Z =   192.044  mm,
	W =   175.948 deg,	P =     3.806 deg,	R =   176.603 deg
};
P[2]{
   GP1:
	UF : 0, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   376.606  mm,	Y = -2150.696  mm,	Z =   397.723  mm,
	W =  -140.329 deg,	P =    11.847 deg,	R =   179.208 deg
};
P[3:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
P[4]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.947  mm,	Y =   432.943  mm,	Z =   -69.735  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[5]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   662.511  mm,	Y =   432.127  mm,	Z =   -31.497  mm,
	W =   179.801 deg,	P =   -12.650 deg,	R =   178.265 deg
};
P[6]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   709.627  mm,	Y =   429.898  mm,	Z =    76.216  mm,
	W =   179.777 deg,	P =   -28.983 deg,	R =   178.331 deg
};
P[7]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   662.511  mm,	Y =   432.127  mm,	Z =   -31.497  mm,
	W =   179.801 deg,	P =   -12.650 deg,	R =   178.265 deg
};
P[8]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   662.968  mm,	Y =   436.284  mm,	Z =   -24.936  mm,
	W =   179.801 deg,	P =   -12.589 deg,	R =   178.264 deg
};
P[9]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.364  mm,	Y =   437.570  mm,	Z =   -38.749  mm,
	W =  -171.544 deg,	P =     1.341 deg,	R =   178.217 deg
};
P[10]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.947  mm,	Y =   432.943  mm,	Z =   -69.735  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[11]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   658.947  mm,	Y =   432.943  mm,	Z =   -69.735  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[12]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   656.788  mm,	Y =   433.010  mm,	Z =   -69.770  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
P[13]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   653.583  mm,	Y =   432.435  mm,	Z =   129.198  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
/END
