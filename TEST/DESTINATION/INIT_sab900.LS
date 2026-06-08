/PROG  INIT_sab900.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-06-05  TIME 10:06:19;
MODIFIED = DATE 26-06-05  TIME 10:06:19;
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
   2:  !programme référence sab900    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:         =6.5,JMP LBL[6]    ;
  11:         =7.5,JMP LBL[7]    ;
  12:         =8.5,JMP LBL[8]    ;
  13:         =9.5,JMP LBL[9]    ;
  14:         =10.5,JMP LBL[10]    ;
  15:         =11.5,JMP LBL[11]    ;
  16:         =12.5,JMP LBL[12]    ;
  17:         =13.5,JMP LBL[13]    ;
  18:         =14.5,JMP LBL[14]    ;
  19:         =15.5,JMP LBL[15]    ;
  20:         =16.5,JMP LBL[16]    ;
  21:         =17.5,JMP LBL[17]    ;
  22:         =18.5,JMP LBL[18]    ;
  23:         =19.5,JMP LBL[19]    ;
  24:         =20.5,JMP LBL[20]    ;
  25:         =21.5,JMP LBL[21]    ;
  26:      ;
  27:  LBL[998]    ;
  28:      ;
  29:  SELECT R[99]=1,JMP LBL[999]    ;
  30:         =2,JMP LBL[1]    ;
  31:         =3,JMP LBL[2]    ;
  32:         =4,JMP LBL[3]    ;
  33:         =5,JMP LBL[4]    ;
  34:         =6,JMP LBL[5]    ;
  35:         =7,JMP LBL[6]    ;
  36:         =8,JMP LBL[7]    ;
  37:         =9,JMP LBL[8]    ;
  38:         =10,JMP LBL[9]    ;
  39:         =11,JMP LBL[10]    ;
  40:         =12,JMP LBL[11]    ;
  41:         =13,JMP LBL[12]    ;
  42:         =14,JMP LBL[13]    ;
  43:         =15,JMP LBL[14]    ;
  44:         =16,JMP LBL[15]    ;
  45:         =17,JMP LBL[16]    ;
  46:         =18,JMP LBL[17]    ;
  47:         =19,JMP LBL[18]    ;
  48:         =20,JMP LBL[19]    ;
  49:         =21,JMP LBL[999]    ;
  50:      ;
  51:  GO[1]=32    ;
  52:  PAUSE    ;
  53:  GO[1]=0    ;
  54:  JMP LBL[998]    ;
  55:      ;
  56:  !Début des trajectoires    ;
  57:      ;
  58:  LBL[1]    ;
  59:  !Approche magasin    ;
  60:  R[99]=0.5    ;
  61:J P[1:App] 10% FINE    ;
  62:  R[99]=1    ;
  63:  JMP LBL[998]    ;
  64:      ;
  65:  LBL[2]    ;
  66:  PR[100,2:Offset]=(-50)    ;
  67:  PR[100,3:Offset]=500    ;
  68:  R[99]=1.5    ;
  69:L P[2:Point clouteur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  70:  R[99]=2    ;
  71:  JMP LBL[998]    ;
  72:      ;
  73:  LBL[3]    ;
  74:  PR[100,2:Offset]=(-50)    ;
  75:  PR[100,3:Offset]=200    ;
  76:  R[99]=2.5    ;
  77:L P[2:Point clouteur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  78:  R[99]=3    ;
  79:  JMP LBL[998]    ;
  80:      ;
  81:  LBL[4]    ;
  82:  PR[100,2:Offset]=0    ;
  83:  R[99]=3.5    ;
  84:L P[2:Point clouteur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  85:  R[99]=4    ;
  86:  JMP LBL[998]    ;
  87:      ;
  88:  LBL[5]    ;
  89:  R[99]=4.5    ;
  90:L P[2:Point clouteur] 100mm/sec FINE    ;
  91:  R[99]=5    ;
  92:  JMP LBL[998]    ;
  93:      ;
  94:  LBL[6]    ;
  95:  PR[100,3:Offset]=(-100)    ;
  96:  R[99]=5.5    ;
  97:L P[2:Point clouteur] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  98:  R[99]=6    ;
  99:  JMP LBL[998]    ;
 100:      ;
 101:  LBL[7]    ;
 102:  PR[100,3:Offset]=(-200)    ;
 103:  R[99]=6.5    ;
 104:J P[3:Point pince] 10% FINE Tool_Offset,PR[100:Offset]    ;
 105:  R[99]=7    ;
 106:  JMP LBL[998]    ;
 107:      ;
 108:  LBL[8]    ;
 109:  R[99]=7.5    ;
 110:L P[3:Point pince] 100mm/sec FINE    ;
 111:  R[99]=8    ;
 112:  JMP LBL[998]    ;
 113:      ;
 114:  LBL[9]    ;
 115:  PR[100,3:Offset]=(-100)    ;
 116:  R[99]=8.5    ;
 117:L P[3:Point pince] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 118:  R[99]=9    ;
 119:  JMP LBL[998]    ;
 120:      ;
 121:  LBL[10]    ;
 122:  PR[100,3:Offset]=(-500)    ;
 123:  R[99]=9.5    ;
 124:L P[3:Point pince] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 125:  R[99]=10    ;
 126:  JMP LBL[998]    ;
 127:      ;
 128:  LBL[11]    ;
 129:  PR[100,3:Offset]=(-100)    ;
 130:  R[99]=10.5    ;
 131:L P[2:Point clouteur] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 132:  R[99]=11    ;
 133:  JMP LBL[998]    ;
 134:      ;
 135:  LBL[12]    ;
 136:  R[99]=11.5    ;
 137:L P[2:Point clouteur] 100mm/sec FINE    ;
 138:  R[99]=12    ;
 139:  JMP LBL[998]    ;
 140:      ;
 141:  LBL[13]    ;
 142:  PR[100,3:Offset]=100    ;
 143:  R[99]=12.5    ;
 144:L P[2:Point clouteur] 100mm/sec FINE Offset,PR[100:Offset]    ;
 145:  R[99]=13    ;
 146:  JMP LBL[998]    ;
 147:      ;
 148:  LBL[14]    ;
 149:  PR[100,2:Offset]=(-50)    ;
 150:  R[99]=13.5    ;
 151:L P[2:Point clouteur] 100mm/sec FINE Offset,PR[100:Offset]    ;
 152:  R[99]=14    ;
 153:  JMP LBL[998]    ;
 154:      ;
 155:  LBL[15]    ;
 156:  PR[100,3:Offset]=500    ;
 157:  R[99]=14.5    ;
 158:L P[2:Point clouteur] 100mm/sec FINE Offset,PR[100:Offset]    ;
 159:  R[99]=15    ;
 160:  JMP LBL[998]    ;
 161:      ;
 162:  LBL[16]    ;
 163:  PR[100,3:Offset]=(-100)    ;
 164:  R[99]=15.5    ;
 165:J P[3:Point pince] 10% FINE Tool_Offset,PR[100:Offset]    ;
 166:  R[99]=16    ;
 167:  JMP LBL[998]    ;
 168:      ;
 169:  LBL[17]    ;
 170:  R[99]=16.5    ;
 171:L P[3:Point pince] 100mm/sec FINE    ;
 172:  R[99]=17    ;
 173:  JMP LBL[998]    ;
 174:      ;
 175:  LBL[18]    ;
 176:  PR[100,3:Offset]=(-100)    ;
 177:  R[99]=17.5    ;
 178:L P[3:Point pince] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 179:  R[99]=18    ;
 180:  JMP LBL[998]    ;
 181:      ;
 182:  LBL[19]    ;
 183:  PR[100,3:Offset]=(-250)    ;
 184:  R[99]=18.5    ;
 185:L P[3:Point pince] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 186:  R[99]=19    ;
 187:  JMP LBL[998]    ;
 188:      ;
 189:  LBL[20]    ;
 190:  !Approche magasin    ;
 191:  R[99]=19.5    ;
 192:J P[4:App] 10% FINE    ;
 193:  R[99]=20    ;
 194:  JMP LBL[998]    ;
 195:      ;
 196:  LBL[21]    ;
 197:  R[99]=20.5    ;
 198:J P[5] 10% FINE    ;
 199:  R[99]=21    ;
 200:  JMP LBL[998]    ;
 201:      ;
 202:  !Fin des trajectoires    ;
 203:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    42.855  mm,	Y =  1423.563  mm,	Z =   -32.593  mm,
	W =  -179.980 deg,	P =    -1.343 deg,	R =   -88.952 deg
};
P[2:"Point clouteur"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =    47.335  mm,	Y =   745.997  mm,	Z = -1284.511  mm,
	W =  -179.624 deg,	P =   -20.846 deg,	R =   -90.322 deg
};
P[3:"Point pince"]{
   GP1:
	UF : 6, UT : 3,	
	J1=    88.712 deg,	J2=    43.843 deg,	J3=   -81.102 deg,
	J4=     2.142 deg,	J5=    -9.039 deg,	J6=  -181.087 deg
};
P[4:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    42.855  mm,	Y =  1423.563  mm,	Z =   -32.593  mm,
	W =  -179.980 deg,	P =    -1.343 deg,	R =   -88.952 deg
};
P[5]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, -1',
	X =    51.955  mm,	Y =   926.099  mm,	Z =   -20.932  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =   -93.883 deg
};
/END
