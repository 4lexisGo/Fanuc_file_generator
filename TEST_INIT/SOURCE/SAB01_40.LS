/PROG  SAB01_40
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Devracage";
PROG_SIZE	= 4729;
CREATE		= DATE 25-04-30  TIME 08:08:04;
MODIFIED	= DATE 26-03-16  TIME 16:26:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 205;
MEMORY_SIZE	= 5161;
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
   2:  !///////////Devracage//////////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Memo programme en cours ;
   6:  R[38:Programme en cr]=4    ;
   7:   ;
   8:  !Validation Tache ;
   9:  CALL VALIDATION_DEBUT_TACHE    ;
  10:   ;
  11:  //!Recuperation info piece ;
  12:  //CALL INFO_PIECE_ACTU    ;
  13:   ;
  14:  !Changment de prehenseur ;
  15:  R[91:Choix outils]=2    ;
  16:  CALL CHANG_OUTIL    ;
  17:   ;
  18:  !Override ;
  19:  CALL OVERRIDE    ;
  20:   ;
  21:  !Choix Uframe/Utool ;
  22:  UFRAME_NUM=0 ;
  23:  UTOOL_NUM=2 ;
  24:   ;
  25:  !Point d'approche ;
  26:J P[1] 100% CNT100    ;
  27:  R[66:Memo INIT]=1    ;
  28:   ;
  29:  !Demande d'arret ;
  30:  CALL DEMANDE_ARRET    ;
  31:   ;
  32:  !Choix Uframe/Utool ;
  33:  UFRAME_NUM=3 ;
  34:  UTOOL_NUM=2 ;
  35:   ;
  36:  !Reset PR99 ;
  37:  CALL RAZ_PR    ;
  38:   ;
  39:  !Calcul de point d'approche pal ;
  40:  CALL CALC01_40    ;
  41:   ;
  42:J PR[99:PR mobil] 100% FINE    ;
  43:  R[66:Memo INIT]=2    ;
  44:   ;
  45:  !Demande d'arret ;
  46:  CALL DEMANDE_ARRET    ;
  47:   ;
  48:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
  49:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
  50:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
  51:   ;
  52:  !Photo et recuperation de donnee! ;
  53:   ;
  54:  CALL CAMERA    ;
  55:   ;
  56:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
  57:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
  58:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
  59:   ;
  60:  !Choix Uframe/Utool ;
  61:  UFRAME_NUM=3 ;
  62:  UTOOL_NUM=2 ;
  63:   ;
  64:J P[3] 25% CNT100    ;
  65:  R[66:Memo INIT]=3    ;
  66:   ;
  67:  !Choix Uframe/Utool ;
  68:  UFRAME_NUM=R[56:Calcul repere st] ;
  69:  UTOOL_NUM=2 ;
  70:   ;
  71:  !Raz PR100 ;
  72:  CALL RAZPR100    ;
  73:   ;
  74:  !Point d'approche prise ;
  75:  PR[100,1:Décallage]=4    ;
  76:  PR[100,2:Décallage]=(-14)    ;
  77:  PR[100,3:Décallage]=(-300)    ;
  78:J PR[51:Point de prise] 25% FINE Tool_Offset,PR[100:Décallage]    ;
  79:  R[66:Memo INIT]=4    ;
  80:   ;
  81:  !Demande d'arret ;
  82:  CALL DEMANDE_ARRET    ;
  83:   ;
  84:  !Raz PR100 ;
  85:  CALL RAZPR100    ;
  86:   ;
  87:  !Point de prise ;
  88:  PR[100,1:Décallage]=4    ;
  89:  PR[100,2:Décallage]=(-14)    ;
  90:L PR[51:Point de prise] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  91:  R[66:Memo INIT]=5    ;
  92:   ;
  93:  !Demande d'arret ;
  94:  CALL DEMANDE_ARRET    ;
  95:   ;
  96:  !Actionnement de l'aspiration ;
  97:  CALL CYCLE_ASPI    ;
  98:   ;
  99:  //!Raz PR100 ;
 100:  //CALL RAZPR100    ;
 101:   ;
 102:  !Point de degagement prise ;
 103:  PR[100,3:Décallage]=(-100)    ;
 104:L PR[51:Point de prise] 50mm/sec FINE ACC25 Tool_Offset,PR[100:Décallage]    ;
 105:  PR[100,3:Décallage]=(-500)    ;
 106:J PR[51:Point de prise] 30% FINE Tool_Offset,PR[100:Décallage]    ;
 107:  R[66:Memo INIT]=6    ;
 108:   ;
 109:  !Raz PR ;
 110:  CALL RAZPR99    ;
 111:   ;
 112:  !Choix Uframe/Utool ;
 113:  UFRAME_NUM=0 ;
 114:  UTOOL_NUM=2 ;
 115:   ;
 116:  !Approche ;
 117:J P[7] 30% FINE    ;
 118:  R[66:Memo INIT]=7    ;
 119:J P[1] 30% FINE    ;
 120:  R[66:Memo INIT]=8    ;
 121:   ;
 122:  !Trajectoir vers station ;
 123:L P[10] 500mm/sec CNT25    ;
 124:  R[66:Memo INIT]=9    ;
 125:J P[2] 30% CNT25    ;
 126:  R[66:Memo INIT]=10    ;
 127:J P[4] 30% CNT25    ;
 128:  R[66:Memo INIT]=11    ;
 129:L P[5] 500mm/sec FINE    ;
 130:  R[66:Memo INIT]=12    ;
 131:   ;
 132:  !Demande d'arret ;
 133:  CALL DEMANDE_ARRET    ;
 134:   ;
 135:  !Demande d'arret ;
 136:  CALL DEMANDE_ARRET    ;
 137:   ;
 138:  !Choix Uframe/Utool ;
 139:  UFRAME_NUM=1 ;
 140:  UTOOL_NUM=2 ;
 141:   ;
 142:  !Point d'approche table de recent ;
 143:J P[13] 100% FINE    ;
 144:  R[66:Memo INIT]=13    ;
 145:L P[14] 500mm/sec FINE    ;
 146:  R[66:Memo INIT]=14    ;
 147:   ;
 148:  !Demande d'arret ;
 149:  CALL DEMANDE_ARRET    ;
 150:   ;
 151:  !Reset PR ;
 152:  CALL RAZPR99    ;
 153:   ;
 154:  !Calcul pose ;
 155:  CALL CALC01_40_POSER    ;
 156:   ;
 157:  !Approche pose ;
 158:  PR[70,3:Offset recentrag]=(-50)    ;
 159:  IF (R[36:Largeur Piece]=493),PR[70,2:Offset recentrag]=(PR[70,2:Offset recentrag]+(-40)) ;
 160:   ;
 161:J PR[99:PR mobil] 30% FINE Tool_Offset,PR[70:Offset recentr]    ;
 162:  R[66:Memo INIT]=15    ;
 163:   ;
 164:  !Demande d'arret ;
 165:  CALL DEMANDE_ARRET    ;
 166:   ;
 167:  !Remise a 0 du Z ;
 168:  PR[70,3:Offset recentrag]=PR[70,3:Offset recentrag]+50    ;
 169:   ;
 170:  !Point de pose ;
 171:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 172:  IF (R[36:Largeur Piece]=493),PR[70,2:Offset recentrag]=(PR[70,2:Offset recentrag]+40) ;
 173:   ;
 174:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[70:Offset recentr]    ;
 175:   ;
 176:  R[66:Memo INIT]=16    ;
 177:  !Coupure de l'aspiration    ;
 178:  CALL TOOL02_ASPIRATION_OFF    ;
 179:   ;
 180:  !Degagement piece ;
 181:  PR[70,3:Offset recentrag]=(-50)    ;
 182:L PR[99:PR mobil] 250mm/sec CNT100 Tool_Offset,PR[70:Offset recentr]    ;
 183:  R[66:Memo INIT]=17    ;
 184:L P[14] 2000mm/sec FINE    ;
 185:  R[66:Memo INIT]=18    ;
 186:L P[13] 2000mm/sec CNT25    ;
 187:  R[66:Memo INIT]=19    ;
 188:J P[5] 100% CNT25    ;
 189:  R[66:Memo INIT]=20    ;
 190:J P[4] 100% CNT100    ;
 191:  R[66:Memo INIT]=21    ;
 192:J P[2] 100% CNT100    ;
 193:  R[66:Memo INIT]=22    ;
 194:  //J P[10] 100% CNT50    ;
 195:   ;
 196:  !Mis en position repos ;
 197:  !Definition du repere ;
 198:  UFRAME_NUM=5 ;
 199:  UTOOL_NUM=5 ;
 200:   ;
 201:J P[8:Repos] 100% FINE    ;
 202:  R[66:Memo INIT]=0    ;
 203:   ;
 204:  !Validation Fin Tache ;
 205:  CALL VALIDATION_FIN_TACHE    ;
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
