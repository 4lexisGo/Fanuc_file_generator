/PROG  INT_SAB01_60.LS
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
  26:      ;
  27:  LBL[998]    ;
  28:      ;
  29:  SELECT R[66]=1,JMP LBL[999]    ;
  30:         =2,JMP LBL[1]    ;
  31:         =3,JMP LBL[2]    ;
  32:         =4,JMP LBL[5]    ;
  33:         =5,JMP LBL[6]    ;
  34:         =6,JMP LBL[7]    ;
  35:         =7,JMP LBL[8]    ;
  36:         =8,JMP LBL[9]    ;
  37:         =9,JMP LBL[10]    ;
  38:         =10,JMP LBL[11]    ;
  39:         =11,JMP LBL[12]    ;
  40:         =12,JMP LBL[13]    ;
  41:         =13,JMP LBL[14]    ;
  42:         =14,JMP LBL[15]    ;
  43:         =15,JMP LBL[16]    ;
  44:         =16,JMP LBL[17]    ;
  45:         =17,JMP LBL[18]    ;
  46:         =18,JMP LBL[17]    ;
  47:         =19,JMP LBL[18]    ;
  48:         =20,JMP LBL[19]    ;
  49:         =21,JMP LBL[20]    ;
  50:         =22,JMP LBL[999]    ;
  51:      ;
  52:  GO[1]=99    ;
  53:  PAUSE    ;
  54:  GO[1]=0    ;
  55:  JMP LBL[998]    ;
  56:      ;
  57:  !Début des trajectoires    ;
  58:      ;
  59:  LBL[1]    ;
  60:  !Point d'approche    ;
  61:  R[66]=0.5    ;
  62:J P[1] 10% FINE    ;
  63:  R[66]=1    ;
  64:  JMP LBL[998]    ;
  65:      ;
  66:  LBL[2]    ;
  67:  !Point mesure    ;
  68:  R[66]=1.5    ;
  69:L P[2] 100mm/sec FINE    ;
  70:  R[66]=2    ;
  71:  JMP LBL[998]    ;
  72:      ;
  73:  LBL[3]    ;
  74:  !Calcule de point de prise    ;
  75:  CALL CALC01_60    ;
  76:  R[66]=2.5    ;
  77:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
  78:  R[66]=3    ;
  79:  JMP LBL[998]    ;
  80:      ;
  81:  LBL[4]    ;
  82:  !Aspiration intercalaire    ;
  83:  CALL CYCLE_ASPI    ;
  84:  R[66]=3.5    ;
  85:L P[4] 100mm/sec FINE    ;
  86:  R[66]=4    ;
  87:  JMP LBL[998]    ;
  88:      ;
  89:  LBL[5]    ;
  90:  R[66]=4.5    ;
  91:L P[9] 100mm/sec FINE    ;
  92:  R[66]=5    ;
  93:  JMP LBL[998]    ;
  94:      ;
  95:  LBL[6]    ;
  96:  R[66]=5.5    ;
  97:L P[10] 100mm/sec FINE    ;
  98:  R[66]=6    ;
  99:  JMP LBL[998]    ;
 100:      ;
 101:  LBL[7]    ;
 102:  R[66]=6.5    ;
 103:L P[5] 100mm/sec FINE    ;
 104:  R[66]=7    ;
 105:  JMP LBL[998]    ;
 106:      ;
 107:  LBL[8]    ;
 108:  R[66]=7.5    ;
 109:L P[6] 100mm/sec FINE    ;
 110:  R[66]=8    ;
 111:  JMP LBL[998]    ;
 112:      ;
 113:  LBL[9]    ;
 114:  R[66]=8.5    ;
 115:L P[7] 100mm/sec FINE    ;
 116:  R[66]=9    ;
 117:  JMP LBL[998]    ;
 118:      ;
 119:  LBL[10]    ;
 120:  R[66]=9.5    ;
 121:L P[8] 100mm/sec FINE    ;
 122:  R[66]=10    ;
 123:  JMP LBL[998]    ;
 124:      ;
 125:  LBL[11]    ;
 126:  R[66]=10.5    ;
 127:L P[11] 100mm/sec FINE    ;
 128:  R[66]=11    ;
 129:  JMP LBL[998]    ;
 130:      ;
 131:  LBL[12]    ;
 132:  R[66]=11.5    ;
 133:L P[12] 100mm/sec FINE    ;
 134:  R[66]=12    ;
 135:  JMP LBL[998]    ;
 136:      ;
 137:  LBL[13]    ;
 138:  R[66]=12.5    ;
 139:L P[13] 100mm/sec FINE    ;
 140:  R[66]=13    ;
 141:  JMP LBL[998]    ;
 142:      ;
 143:  LBL[14]    ;
 144:  !Point de degagement    ;
 145:  PR[100,1:Dcallage]=(-100)    ;
 146:  PR[100,3:Dcallage]=(-100)    ;
 147:  PR[100,2:Dcallage]=(-100)    ;
 148:  R[66]=13.5    ;
 149:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage] ACC5    ;
 150:  R[66]=14    ;
 151:  JMP LBL[998]    ;
 152:      ;
 153:  LBL[15]    ;
 154:  !Choix palette    ;
 155:  CALL CALC01_60_POSE    ;
 156:  PR[100,3:Dcallage]=(-800)    ;
 157:  R[66]=14.5    ;
 158:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 159:  R[66]=15    ;
 160:  JMP LBL[998]    ;
 161:      ;
 162:  LBL[16]    ;
 163:  PR[100,3:Dcallage]=(-100)    ;
 164:  R[66]=15.5    ;
 165:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 166:  R[66]=16    ;
 167:  JMP LBL[998]    ;
 168:      ;
 169:  LBL[17]    ;
 170:  R[66]=16.5    ;
 171:L PR[99:PR mobil] 100mm/sec FINE    ;
 172:  R[66]=17    ;
 173:  JMP LBL[998]    ;
 174:      ;
 175:  LBL[18]    ;
 176:  !Pose intercallaire    ;
 177:  R[66]=17.5    ;
 178:  CALL TOOL02_ASPIRATION_OFF    ;
 179:  R[66]=18    ;
 180:  JMP LBL[998]    ;
 181:      ;
 182:  LBL[19]    ;
 183:  PR[100,3:Dcallage]=(-100)    ;
 184:  R[66]=18.5    ;
 185:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 186:  R[66]=19    ;
 187:  JMP LBL[998]    ;
 188:      ;
 189:  LBL[20]    ;
 190:  PR[100,3:Dcallage]=(-800)    ;
 191:  R[66]=19.5    ;
 192:J PR[99:PR mobil] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 193:  R[66]=20    ;
 194:  JMP LBL[998]    ;
 195:      ;
 196:  LBL[21]    ;
 197:  R[66]=20.5    ;
 198:J P[1] 10% FINE    ;
 199:  R[66]=21    ;
 200:  JMP LBL[998]    ;
 201:      ;
 202:  LBL[22]    ;
 203:  R[66]=21.5    ;
 204:J P[3:Repos] 10% FINE    ;
 205:  R[66]=22    ;
 206:  JMP LBL[998]    ;
 207:      ;
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
