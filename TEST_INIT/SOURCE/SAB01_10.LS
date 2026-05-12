/PROG  SAB01_10
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Dechargement op2";
PROG_SIZE	= 5447;
CREATE		= DATE 25-04-30  TIME 08:07:30;
MODIFIED	= DATE 26-04-15  TIME 20:13:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 225;
MEMORY_SIZE	= 5935;
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
   2:  !///////Dechargement OP20//////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Recuperation Info Piece ;
   6:  CALL INFO_PIECE_ACTU    ;
   7:   ;
   8:  !Memo programme en cours ;
   9:  R[38:Programme en cr]=1    ;
  10:   ;
  11:  !Validation Tache ;
  12:  CALL VALIDATION_DEBUT_TACHE    ;
  13:   ;
  14:  !Soufflage piece OP20 ;
  15:  CALL SAB01_11    ;
  16:   ;
  17:  !Changment de prehenseur ;
  18:  R[91:Choix outils]=3    ;
  19:  CALL CHANG_OUTIL    ;
  20:   ;
  21:  !Override ;
  22:  CALL OVERRIDE    ;
  23:   ;
  24:  !Choix Uframe/Utool ;
  25:  UFRAME_NUM=0 ;
  26:  UTOOL_NUM=3 ;
  27:   ;
  28:  !Point d'approche ;
  29:J P[2:App 1] 100% FINE    ;
  30:  R[66:Memo INIT]=1    ;
  31:   ;
  32:  !Trajectoir d'approche ;
  33:J P[4:App 2] 100% CNT25    ;
  34:  R[66:Memo INIT]=2    ;
  35:J P[3:App 3] 100% FINE    ;
  36:  R[66:Memo INIT]=3    ;
  37:L P[14] 2000mm/sec FINE    ;
  38:  R[66:Memo INIT]=4    ;
  39:   ;
  40:  !Demande d'arret ;
  41:  CALL DEMANDE_ARRET    ;
  42:   ;
  43:  !Choix Uframe/Utool ;
  44:  UFRAME_NUM=6 ;
  45:  UTOOL_NUM=3 ;
  46:   ;
  47:  !Test acces ;
  48:  CALL TEST_ACCES_MACHINE    ;
  49:   ;
  50:  !Calcul point prise ;
  51:  CALL CALC01_10_PRISE_MACHINE    ;
  52:   ;
  53:  !Point d'approche pose ;
  54:  PR[100,3:Décallage]=(-200)    ;
  55:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  56:  R[66:Memo INIT]=5    ;
  57:   ;
  58:  !Ouverture pince ;
  59:  CALL TOOL03_OUVERTURE    ;
  60:   ;
  61:  !Point d'approche prise ;
  62:  PR[100,1:Décallage]=10    ;
  63:  PR[100,3:Décallage]=(-75)    ;
  64:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  65:  R[66:Memo INIT]=6    ;
  66:   ;
  67:  PR[100,3:Décallage]=0    ;
  68:  !//////////////////////////////// ;
  69:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
  70:  !//////////////////////////////// ;
  71:  !Calcul Decallage Z ;
  72:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  73:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  74:  !//////////////////////////////// ;
  75:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  76:  R[66:Memo INIT]=7    ;
  77:   ;
  78:  !Raz PR ;
  79:  CALL RAZPR100    ;
  80:   ;
  81:  !//////////////////////////////// ;
  82:  !\\\\\\\\\\\Decalage Z\\\\\\\\\\\ ;
  83:  !//////////////////////////////// ;
  84:  !Calcul Decallage Z ;
  85:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  86:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  87:  !//////////////////////////////// ;
  88:   ;
  89:  !Point de prise ;
  90:L PR[99:PR mobil] 500mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  91:  R[66:Memo INIT]=8    ;
  92:   ;
  93:  R[66:Memo INIT]=9    ;
  94:  !Actionnement du verin ;
  95:  CALL CYCLE_FERMETURE    ;
  96:   ;
  97:  !Point d'approche pose ;
  98:  PR[100,2:Décallage]=1.5    ;
  99:L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 100:  R[66:Memo INIT]=9    ;
 101:   ;
 102:  !Point d'approche pose ;
 103:  PR[100,3:Décallage]=(-200)    ;
 104:L PR[99:PR mobil] 50mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 105:  R[66:Memo INIT]=10    ;
 106:   ;
 107:  !Activation soufflage ;
 108:  DO[103:OFF:Soufflage Machine]=ON ;
 109:   ;
 110:  !Soufflage piece ;
 111:L P[13:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 112:  R[66:Memo INIT]=11    ;
 113:   ;
 114:L P[17] 100mm/sec FINE    ;
 115:   ;
 116:L P[16] 100mm/sec FINE    ;
 117:  R[66:Memo INIT]=12    ;
 118:L P[18] 100mm/sec FINE    ;
 119:  !Soufflage piece ;
 120:L P[12:Deg avc Soufflag] R[48:Vit souf 10 trj]mm/sec FINE    ;
 121:  R[66:Memo INIT]=11    ;
 122:   ;
 123:   ;
 124:  !Desactivation soufflage ;
 125:  DO[103:OFF:Soufflage Machine]=OFF ;
 126:   ;
 127:  !Choix Uframe/Utool ;
 128:  UFRAME_NUM=0 ;
 129:  UTOOL_NUM=3 ;
 130:   ;
 131:  !Trajectoir vers station 1 2 ;
 132:J P[1:App 4] 30% FINE    ;
 133:  R[66:Memo INIT]=13    ;
 134:   ;
 135:J P[3:App 3] 30% CNT100    ;
 136:  R[66:Memo INIT]=14    ;
 137:   ;
 138:J P[4:App 2] 30% CNT25    ;
 139:  R[66:Memo INIT]=15    ;
 140:   ;
 141:J P[2:App 1] 30% CNT25    ;
 142:  R[66:Memo INIT]=16    ;
 143:   ;
 144:J P[7] 30% FINE    ;
 145:  R[66:Memo INIT]=17    ;
 146:   ;
 147:   ;
 148:  !Demande d'arret ;
 149:  CALL DEMANDE_ARRET    ;
 150:   ;
 151:  !Choix Uframe/Utool ;
 152:  UFRAME_NUM=2 ;
 153:  UTOOL_NUM=3 ;
 154:   ;
 155:  !Point au dessu de la station ;
 156:L P[10] 500mm/sec FINE    ;
 157:  R[66:Memo INIT]=18    ;
 158:   ;
 159:J P[8] 30% FINE    ;
 160:  R[66:Memo INIT]=19    ;
 161:   ;
 162:J P[9] 30% FINE    ;
 163:  R[66:Memo INIT]=20    ;
 164:   ;
 165:  !Demande d'arret ;
 166:  CALL DEMANDE_ARRET    ;
 167:   ;
 168:  !Reset PR ;
 169:  CALL RAZPR99    ;
 170:  CALL RAZPR100    ;
 171:   ;
 172:  !Calcule pose palette ;
 173:  CALL CALC01_10    ;
 174:   ;
 175:  !Approche palette ;
 176:  PR[100,3:Décallage]=(-500)    ;
 177:J PR[99:PR mobil] 30% FINE Tool_Offset,PR[100:Décallage]    ;
 178:  R[66:Memo INIT]=21    ;
 179:  !Approche pose ;
 180:  PR[100,3:Décallage]=(-50)    ;
 181:L PR[99:PR mobil] 500mm/sec CNT100 Tool_Offset,PR[100:Décallage]    ;
 182:  R[66:Memo INIT]=22    ;
 183:   ;
 184:  !Point de pose ;
 185:L PR[99:PR mobil] 250mm/sec FINE    ;
 186:  R[66:Memo INIT]=23    ;
 187:   ;
 188:  !Ouverture verin ;
 189:  CALL TOOL03_OUVERTURE    ;
 190:   ;
 191:  R[66:Memo INIT]=24    ;
 192:  !Degagement piece ;
 193:L PR[99:PR mobil] 500mm/sec CNT100 Tool_Offset,PR[100:Décallage]    ;
 194:  R[66:Memo INIT]=24    ;
 195:   ;
 196:  !Degagement palette ;
 197:  PR[100,3:Décallage]=(-300)    ;
 198:J PR[99:PR mobil] 100% CNT100 Tool_Offset,PR[100:Décallage]    ;
 199:  R[66:Memo INIT]=25    ;
 200:   ;
 201:  !Retour en position repos ;
 202:J P[8] 100% CNT15    ;
 203:  R[66:Memo INIT]=26    ;
 204:J P[5] 100% CNT15    ;
 205:  R[66:Memo INIT]=27    ;
 206:J P[6] 50% CNT15    ;
 207:  R[66:Memo INIT]=28    ;
 208:   ;
 209:  !Mis en position repos ;
 210:  !Definition du repere ;
 211:  UFRAME_NUM=5 ;
 212:  UTOOL_NUM=5 ;
 213:   ;
 214:J P[11:Repos] 100% FINE    ;
 215:  R[66:Memo INIT]=0    ;
 216:   ;
 217:   ;
 218:  !Soufflage du posage OP20 ;
 219:  CALL SAB01_11    ;
 220:   ;
 221:  !Depart cycle  ;
 222:  CALL DCY_MACHINE    ;
 223:   ;
 224:  !Validation Fin Tache ;
 225:  CALL VALIDATION_FIN_TACHE    ;
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
