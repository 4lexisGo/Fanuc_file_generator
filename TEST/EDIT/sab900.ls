/PROG  SAB900
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Changement outil";
PROG_SIZE	= 3500;
CREATE		= DATE 26-02-12  TIME 10:34:22;
MODIFIED	= DATE 26-05-29  TIME 16:51:40;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 172;
MEMORY_SIZE	= 4012;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
LOCAL_REGISTERS	= 0,0,0;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  !Gestion prehenseur ;
   2:   ;
   3:  !Raz PR100 ;
   4:  CALL RAZ_PR100 ;
   5:   ;
   6:  !Test si prehenseur deja sur le ;
   7:  !robot ;
   8:  IF (R[31:Dmd outil]=R[32:Outil sur robot]),JMP LBL[99] ;
   9:   ;
  10:  LBL[2] ;
  11:  !Choix Uframe et Utool ;
  12:  UFRAME_NUM=0 ;
  13:  UTOOL_NUM=1 ;
  14:   ;
  15:  !Approche magasin ;
  16:  R[99]=0.5 ;
  17:J P[1:App] 100% CNT100 ;
  18:  R[99]=1 ;
  19:   ;
  20:  !Pose prehenseur ;
  21:  SELECT R[32:Outil sur robot]=1,JMP LBL[10] ;
  22:  =2,JMP LBL[20] ;
  23:  =0,JMP LBL[50] ;
  24:   ;
  25:   ;
  26:  LBL[10] ;
  27:  !Pose clouteuse ;
  28:   ;
  29:  !Choix Uframe et Utool ;
  30:  UFRAME_NUM=6 ;
  31:  UTOOL_NUM=2 ;
  32:   ;
  33:  PR[100,2:Offset]=(-50) ;
  34:  PR[100,3:Offset]=500 ;
  35:  R[99]=1.5 ;
  36:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  37:  R[99]=2 ;
  38:   ;
  39:  !Test si magasin libre ;
  40:  CALL TEST2 ;
  41:   ;
  42:  PR[100,2:Offset]=(-50) ;
  43:  PR[100,3:Offset]=200 ;
  44:  R[99]=2.5 ;
  45:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  46:  R[99]=3 ;
  47:   ;
  48:  PR[100,2:Offset]=0 ;
  49:  R[99]=3.5 ;
  50:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset] ;
  51:  R[99]=4 ;
  52:   ;
  53:  R[99]=4.5 ;
  54:L P[2:Point clouteur] 500mm/sec FINE ;
  55:  R[99]=5 ;
  56:   ;
  57:  !Ouverture changeur ;
  58:  CALL OUV_CHANGEUR ;
  59:  R[32:Outil sur robot]=0 ;
  60:   ;
  61:  PR[100,3:Offset]=(-100) ;
  62:  R[99]=5.5 ;
  63:L P[2:Point clouteur] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  64:  R[99]=6 ;
  65:   ;
  66:  !Test si outil bien poser ;
  67:  CALL TEST1 ;
  68:   ;
  69:  JMP LBL[50] ;
  70:   ;
  71:  LBL[20] ;
  72:  !Pose pince ;
  73:   ;
  74:  !Choix Uframe et Utool ;
  75:  UFRAME_NUM=6 ;
  76:  UTOOL_NUM=3 ;
  77:   ;
  78:  PR[100,3:Offset]=(-200) ;
  79:  R[99]=6.5 ;
  80:J P[3:Point pince] 66% FINE Tool_Offset,PR[100:Offset] ;
  81:  R[99]=7 ;
  82:   ;
  83:  !Test si magasin libre ;
  84:  CALL TEST4 ;
  85:   ;
  86:  R[99]=7.5 ;
  87:L P[3:Point pince] 500mm/sec FINE ;
  88:  R[99]=8 ;
  89:  !Ouverture changeur ;
  90:  CALL OUV_CHANGEUR ;
  91:  R[32:Outil sur robot]=0 ;
  92:   ;
  93:  PR[100,3:Offset]=(-100) ;
  94:  R[99]=8.5 ;
  95:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
  96:  R[99]=9 ;
  97:   ;
  98:  !Test si outil bien poser ;
  99:  CALL TEST3 ;
 100:   ;
 101:  PR[100,3:Offset]=(-500) ;
 102:  R[99]=9.5 ;
 103:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
 104:  R[99]=10 ;
 105:   ;
 106:  JMP LBL[50] ;
 107:   ;
 108:   ;
 109:  LBL[50] ;
 110:  !Prise outil ;
 111:  SELECT R[31:Dmd outil]=1,JMP LBL[60] ;
 112:  =2,JMP LBL[70] ;
 113:  =0,JMP LBL[98] ;
 114:   ;
 115:   ;
 116:  LBL[60] ;
 117:  !Prise clouteuse ;
 118:   ;
 119:  !Choix Uframe et Utool ;
 120:  UFRAME_NUM=6 ;
 121:  UTOOL_NUM=2 ;
 122:   ;
 123:  PR[100,3:Offset]=(-100) ;
 124:  R[99]=10.5 ;
 125:L P[2:Point clouteur] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
 126:  R[99]=11 ;
 127:  DO[30:Monter changeur]=OFF ;
 128:  !Test si presence outil ;
 129:  CALL TEST1 ;
 130:   ;
 131:   ;
 132:  R[99]=11.5 ;
 133:L P[2:Point clouteur] 500mm/sec FINE ;
 134:  R[99]=12 ;
 135:   ;
 136:  !Ouverture changeur ;
 137:  CALL FERM_CHANGEUR ;
 138:  R[32:Outil sur robot]=1 ;
 139:   ;
 140:  PR[100,3:Offset]=100 ;
 141:  R[99]=12.5 ;
 142:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset] ;
 143:  R[99]=13 ;
 144:   ;
 145:  !Test si outil bien pris ;
 146:  CALL TEST2 ;
 147:   ;
 148:  PR[100,2:Offset]=(-50) ;
 149:  R[99]=13.5 ;
 150:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset] ;
 151:  R[99]=14 ;
 152:   ;
 153:  PR[100,3:Offset]=500 ;
 154:  R[99]=14.5 ;
 155:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset] ;
 156:  R[99]=15 ;
 157:   ;
 158:  JMP LBL[98] ;
 159:   ;
 160:  LBL[70] ;
 161:  !Prise pince ;
 162:   ;
 163:  !Choix Uframe et Utool ;
 164:  UFRAME_NUM=6 ;
 165:  UTOOL_NUM=3 ;
 166:   ;
 167:  PR[100,3:Offset]=(-100) ;
 168:  R[99]=15.5 ;
 169:J P[3:Point pince] 66% FINE Tool_Offset,PR[100:Offset] ;
 170:  R[99]=16 ;
 171:   ;
 172:  !Test si presence pince ;
 173:  CALL TEST3 ;
 174:   ;
 175:  DO[34:Ouverture changeur]=ON ;
 176:  WAIT    .20(sec) ;
 177:  DO[30:Monter changeur]=OFF ;
 178:   ;
 179:  R[99]=16.5 ;
 180:L P[3:Point pince] 500mm/sec FINE ;
 181:  R[99]=17 ;
 182:  !Fermeture changeur ;
 183:  CALL FERM_CHANGEUR ;
 184:  R[32:Outil sur robot]=2 ;
 185:   ;
 186:  PR[100,3:Offset]=(-100) ;
 187:  R[99]=17.5 ;
 188:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
 189:  R[99]=18 ;
 190:   ;
 191:  !Test si outil bien pris ;
 192:  CALL TEST4 ;
 193:   ;
 194:  PR[100,3:Offset]=(-250) ;
 195:  R[99]=18.5 ;
 196:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset] ;
 197:  R[99]=19 ;
 198:   ;
 199:  JMP LBL[98] ;
 200:   ;
 201:  LBL[98] ;
 202:  !Choix Uframe et Utool ;
 203:  UFRAME_NUM=0 ;
 204:  UTOOL_NUM=1 ;
 205:   ;
 206:  !Approche magasin ;
 207:  R[99]=19.5 ;
 208:J P[4:App] 100% CNT100 ;
 209:  R[99]=20 ;
 210:   ;
 211:  R[99]=20.5 ;
 212:J P[5] 100% FINE ;
 213:  R[99]=21 ;
 214:  LBL[99] ;
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
