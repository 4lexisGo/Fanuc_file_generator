/PROG  SAB01_11
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Soufflage op2";
PROG_SIZE	= 2805;
CREATE		= DATE 25-05-12  TIME 10:09:28;
MODIFIED	= DATE 25-11-17  TIME 19:54:04;
FILE_NAME	= SAB01_10;
VERSION		= 0;
LINE_COUNT	= 116;
MEMORY_SIZE	= 3285;
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
/MN
   1:  !//////////////////////////////// ;
   2:  !////////Soufflage OP20:///////// ;
   3:  !//////////////////////////////// ;
   4:  //JMP LBL[99] ;
   5:   ;
   6:  !Changement de prhenseur ;
   7:  R[91:Choix outils]=1    ;
   8:  CALL CHANG_OUTIL    ;
   9:   ;
  10:  !Override ;
  11:  CALL OVERRIDE    ;
  12:   ;
  13:  !Choix Uframe/Utool ;
  14:  UFRAME_NUM=0 ;
  15:  UTOOL_NUM=1 ;
  16:   ;
  17:  !Point d'approche ;
  18:J P[1] 100% CNT50    ;
  19:  R[66:Memo INIT]=35    ;
  20:   ;
  21:   ;
  22:J P[2] 100% CNT50    ;
  23:  R[66:Memo INIT]=36    ;
  24:J P[3] 100% CNT25    ;
  25:  R[66:Memo INIT]=37    ;
  26:   ;
  27:  !Demande d'arret ;
  28:  CALL DEMANDE_ARRET    ;
  29:   ;
  30:  !Test acces ;
  31:  CALL TEST_ACCES_MACHINE    ;
  32:   ;
  33:  !Choix Uframe/Utool ;
  34:  UFRAME_NUM=6 ;
  35:  UTOOL_NUM=1 ;
  36:   ;
  37:  !Point d'approche prise ;
  38:  !Raz PR ;
  39:  CALL RAZPR100    ;
  40:  CALL RAZPR99    ;
  41:   ;
  42:  !Calcul point Soufflage  ;
  43:  CALL CALC01_11    ;
  44:   ;
  45:  !Raz PR100 ;
  46:  CALL RAZPR100    ;
  47:  PR[100,1:Décallage]=R[35:Longueur Piece]    ;
  48:L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  49:  R[66:Memo INIT]=39    ;
  50:  !Actionnement du soufflage ;
  51:  DO[101:OFF:Soufflage]=ON ;
  52:   ;
  53:  !Point de soufflage droite  ;
  54:L PR[99:PR mobil] R[47:Vit soufl 20]mm/sec FINE    ;
  55:  R[66:Memo INIT]=38    ;
  56:   ;
  57:  WAIT   4.00(sec) ;
  58:  !Actionnement du soufflage ;
  59:  DO[101:OFF:Soufflage]=OFF ;
  60:   ;
  61:  PR[100,2:Décallage]=(((R[36:Largeur Piece]/3))) ;
  62:L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  63:  R[66:Memo INIT]=40    ;
  64:  !Actionnement du soufflage ;
  65:  DO[101:OFF:Soufflage]=ON ;
  66:   ;
  67:  PR[100,1:Décallage]=0    ;
  68:L PR[99:PR mobil] R[47:Vit soufl 20]mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  69:   ;
  70:  !Actionnement du soufflage ;
  71:  DO[101:OFF:Soufflage]=OFF ;
  72:   ;
  73:   ;
  74:  PR[100,1:Décallage]=R[35:Longueur Piece]    ;
  75:  PR[100,2:Décallage]=(((R[36:Largeur Piece]/3)*2)) ;
  76:   ;
  77:L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  78:  R[66:Memo INIT]=40    ;
  79:  !Actionnement du soufflage ;
  80:  DO[101:OFF:Soufflage]=ON ;
  81:   ;
  82:   ;
  83:  PR[100,1:Décallage]=0    ;
  84:L PR[99:PR mobil] R[47:Vit soufl 20]mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  85:  R[66:Memo INIT]=41    ;
  86:  WAIT   4.00(sec) ;
  87:  !Point de soufflage droite  ;
  88:L PR[99:PR mobil] R[47:Vit soufl 20]mm/sec FINE    ;
  89:  WAIT   4.00(sec) ;
  90:  !Actionnement du soufflage ;
  91:  DO[101:OFF:Soufflage]=OFF ;
  92:   ;
  93:  !Choix Uframe/Utool ;
  94:  UFRAME_NUM=0 ;
  95:  UTOOL_NUM=1 ;
  96:   ;
  97:  !Trajectoir vers station ;
  98:L P[8] 2000mm/sec CNT100    ;
  99:  R[66:Memo INIT]=42    ;
 100:J P[9] 100% CNT100    ;
 101:  R[66:Memo INIT]=43    ;
 102:J P[10] 100% CNT100    ;
 103:  R[66:Memo INIT]=44    ;
 104:   ;
 105:  !Demande d'arret ;
 106:  CALL DEMANDE_ARRET    ;
 107:   ;
 108:  !Mis en position repos ;
 109:  !Definition du repere ;
 110:  UFRAME_NUM=5 ;
 111:  UTOOL_NUM=5 ;
 112:   ;
 113:J P[12:Repos] 100% FINE    ;
 114:  R[66:Memo INIT]=0    ;
 115:   ;
 116:  LBL[99] ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,	
	J1=    78.441 deg,	J2=    -7.219 deg,	J3=   -17.401 deg,
	J4=      .733 deg,	J5=   -67.500 deg,	J6=   174.309 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,	
	J1=    98.775 deg,	J2=    -5.565 deg,	J3=   -17.479 deg,
	J4=     1.904 deg,	J5=   -73.019 deg,	J6=   153.753 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,	
	J1=    98.782 deg,	J2=      .455 deg,	J3=   -13.991 deg,
	J4=   -28.870 deg,	J5=   -72.181 deg,	J6=   158.609 deg
};
P[8]{
   GP1:
	UF : 0, UT : 1,	
	J1=    98.782 deg,	J2=      .455 deg,	J3=   -13.991 deg,
	J4=   -28.870 deg,	J5=   -72.181 deg,	J6=   158.609 deg
};
P[9]{
   GP1:
	UF : 0, UT : 1,	
	J1=    98.775 deg,	J2=    -5.565 deg,	J3=   -17.479 deg,
	J4=     1.904 deg,	J5=   -73.019 deg,	J6=   153.753 deg
};
P[10]{
   GP1:
	UF : 0, UT : 1,	
	J1=    78.441 deg,	J2=    -7.219 deg,	J3=   -17.401 deg,
	J4=      .733 deg,	J5=   -67.500 deg,	J6=   174.309 deg
};
P[12:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
/END
