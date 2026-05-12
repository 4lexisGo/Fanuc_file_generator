/PROG  SAB01_21
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Soufflage op10";
PROG_SIZE	= 2608;
CREATE		= DATE 25-05-12  TIME 11:28:22;
MODIFIED	= DATE 25-10-28  TIME 22:48:08;
FILE_NAME	= SAB01_11;
VERSION		= 0;
LINE_COUNT	= 112;
MEMORY_SIZE	= 3104;
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
   2:  !///////Soufflage OP10:///////// ;
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
  18:L P[2] 2000mm/sec CNT25    ;
  19:  R[66:Memo INIT]=95    ;
  20:   ;
  21:J P[4] 100% CNT25    ;
  22:  R[66:Memo INIT]=96    ;
  23:J P[3] 100% CNT25    ;
  24:  R[66:Memo INIT]=97    ;
  25:   ;
  26:  !Demande d'arret ;
  27:  CALL DEMANDE_ARRET    ;
  28:   ;
  29:  !Test acces ;
  30:  CALL TEST_ACCES_MACHINE    ;
  31:   ;
  32:  !Choix Uframe/Utool ;
  33:  UFRAME_NUM=6 ;
  34:  UTOOL_NUM=1 ;
  35:   ;
  36:  !Point d'approche prise ;
  37:  !Raz PR ;
  38:  CALL RAZPR100    ;
  39:  CALL RAZPR99    ;
  40:   ;
  41:  !Calcul point Soufflage  ;
  42:  CALL CALC01_21    ;
  43:   ;
  44:  PR[100,1:Décallage]=0    ;
  45:  PR[100,2:Décallage]=(((R[36:Largeur Piece]/3)*2)*(-1)) ;
  46:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  47:  R[66:Memo INIT]=100    ;
  48:   ;
  49:  !Actionnement du soufflage ;
  50:  DO[101:OFF:Soufflage]=ON ;
  51:   ;
  52:  PR[100,1:Décallage]=R[35:Longueur Piece]    ;
  53:L PR[99:PR mobil] R[46:Vit soufl 10]mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  54:  R[66:Memo INIT]=99    ;
  55:   ;
  56:  PR[100,2:Décallage]=(((R[36:Largeur Piece]/3)*(-1))) ;
  57:L PR[99:PR mobil] R[46:Vit soufl 10]mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  58:  R[66:Memo INIT]=100    ;
  59:   ;
  60:  PR[100,1:Décallage]=0    ;
  61:L PR[99:PR mobil] R[46:Vit soufl 10]mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  62:  R[66:Memo INIT]=101    ;
  63:   ;
  64:  PR[100,1:Décallage]=R[35:Longueur Piece]    ;
  65:  PR[100,2:Décallage]=(0) ;
  66:L PR[99:PR mobil] R[46:Vit soufl 10]mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  67:  R[66:Memo INIT]=100    ;
  68:  WAIT   2.00(sec) ;
  69:  !Actionnement du soufflage ;
  70:  DO[101:OFF:Soufflage]=ON ;
  71:   ;
  72:  PR[100,1:Décallage]=0    ;
  73:L PR[99:PR mobil] R[46:Vit soufl 10]mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  74:  R[66:Memo INIT]=101    ;
  75:   ;
  76:  !Raz PR ;
  77:  CALL RAZPR100    ;
  78:  CALL RAZPR99    ;
  79:   ;
  80:  !Calcul point Soufflage  ;
  81:  CALL CALC01_21    ;
  82:   ;
  83:  !Point de soufflage droite  ;
  84:L PR[99:PR mobil] 1000mm/sec FINE    ;
  85:  R[66:Memo INIT]=98    ;
  86:  WAIT   2.00(sec) ;
  87:  !Actionnement du soufflage ;
  88:  DO[101:OFF:Soufflage]=OFF ;
  89:   ;
  90:  !Choix Uframe/Utool ;
  91:  UFRAME_NUM=0 ;
  92:  UTOOL_NUM=1 ;
  93:   ;
  94:  !Trajectoir vers station ;
  95:L P[3] 2000mm/sec CNT100    ;
  96:  R[66:Memo INIT]=102    ;
  97:J P[4] 100% CNT100    ;
  98:  R[66:Memo INIT]=103    ;
  99:J P[2] 100% CNT25    ;
 100:  R[66:Memo INIT]=104    ;
 101:   ;
 102:  !Choix Uframe/Utool ;
 103:  UFRAME_NUM=0 ;
 104:  UTOOL_NUM=3 ;
 105:   ;
 106:J P[8:Repos] 100% FINE    ;
 107:  R[66:Memo INIT]=0    ;
 108:   ;
 109:  !Demande d'arret ;
 110:  CALL DEMANDE_ARRET    ;
 111:   ;
 112:  LBL[99] ;
/POS
P[2]{
   GP1:
	UF : 0, UT : 1,	
	J1=    78.441 deg,	J2=    -7.219 deg,	J3=   -17.401 deg,
	J4=      .733 deg,	J5=   -67.500 deg,	J6=   174.309 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,	
	J1=    98.782 deg,	J2=      .455 deg,	J3=   -13.991 deg,
	J4=   -28.870 deg,	J5=   -72.181 deg,	J6=   158.609 deg
};
P[4]{
   GP1:
	UF : 0, UT : 1,	
	J1=    98.775 deg,	J2=    -5.565 deg,	J3=   -17.479 deg,
	J4=     1.904 deg,	J5=   -73.019 deg,	J6=   153.753 deg
};
P[8:"Repos"]{
   GP1:
	UF : 0, UT : 3,	
	J1=     7.261 deg,	J2=   -28.762 deg,	J3=   -23.004 deg,
	J4=    13.218 deg,	J5=   -83.399 deg,	J6=   110.454 deg
};
/END
