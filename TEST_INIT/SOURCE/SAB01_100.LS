/PROG  SAB01_100
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Recal auto";
PROG_SIZE	= 2272;
CREATE		= DATE 25-04-30  TIME 08:07:36;
MODIFIED	= DATE 25-10-13  TIME 18:45:54;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 87;
MEMORY_SIZE	= 2624;
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
   2:  !////Recalibration automatique/// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Memo programme en cours ;
   6:  R[38:Programme en cr]=10    ;
   7:   ;
   8:  !Validation Tache ;
   9:  CALL VALIDATION_DEBUT_TACHE    ;
  10:   ;
  11:  !Changment de prehenseur ;
  12:  R[91:Choix outils]=3    ;
  13:  CALL CHANG_OUTIL    ;
  14:   ;
  15:  !Override ;
  16:  CALL OVERRIDE    ;
  17:   ;
  18:  !Choix Uframe/Utool ;
  19:  UFRAME_NUM=0 ;
  20:  UTOOL_NUM=3 ;
  21:   ;
  22:  !Trajectoire d'approche ;
  23:J P[1] 100% CNT100    ;
  24:  R[66:Memo INIT]=500    ;
  25:J P[2] 100% CNT10    ;
  26:  R[66:Memo INIT]=501    ;
  27:   ;
  28:  !Demande d'arret ;
  29:  CALL DEMANDE_ARRET    ;
  30:   ;
  31:  !Raz PR ;
  32:  CALL RAZPR100    ;
  33:   ;
  34:  !Point d'approche du controle ;
  35:  PR[100,3:Décallage]=(-100)    ;
  36:  PR[100,1:Décallage]=20    ;
  37:L P[3:Point de control] 2000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  38:  R[66:Memo INIT]=502    ;
  39:   ;
  40:  !Ouverture de pince ;
  41:  CALL TOOL03_OUVERTURE    ;
  42:   ;
  43:  PR[100,3:Décallage]=0    ;
  44:  PR[100,1:Décallage]=5    ;
  45:L P[3:Point de control] 2000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  46:  R[66:Memo INIT]=503    ;
  47:   ;
  48:  !Point de controle ;
  49:L P[3:Point de control] 100mm/sec FINE    ;
  50:  R[66:Memo INIT]=504    ;
  51:   ;
  52:  !Fermeture pince ;
  53:  CALL TOOL03_FERMETURE    ;
  54:   ;
  55:  !Controle de la regle ;
  56:  CALL CONTROLE_REGLE    ;
  57:   ;
  58:  !Ouverture de pince ;
  59:  CALL TOOL03_OUVERTURE    ;
  60:   ;
  61:  !Point d'approche du controle ;
  62:J P[3:Point de control] 100% FINE Tool_Offset,PR[100:Décallage]    ;
  63:  R[66:Memo INIT]=505    ;
  64:   ;
  65:  PR[100,3:Décallage]=(-100)    ;
  66:L P[3:Point de control] 2000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  67:  R[66:Memo INIT]=506    ;
  68:   ;
  69:  !Trajectoire retour ;
  70:L P[2] 2000mm/sec FINE    ;
  71:  R[66:Memo INIT]=507    ;
  72:J P[1] 100% CNT100    ;
  73:  R[66:Memo INIT]=508    ;
  74:   ;
  75:  !Mis en position repos ;
  76:  !Definition du repere ;
  77:  UFRAME_NUM=5 ;
  78:  UTOOL_NUM=5 ;
  79:   ;
  80:J P[5:Repos] 100% FINE    ;
  81:  R[66:Memo INIT]=0    ;
  82:   ;
  83:  !Demande d'arret ;
  84:  CALL DEMANDE_ARRET    ;
  85:   ;
  86:  !Validation Fin Tache ;
  87:  CALL VALIDATION_FIN_TACHE    ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   150.319  mm,	Y =  -917.201  mm,	Z =   -33.536  mm,
	W =  -177.643 deg,	P =    -2.986 deg,	R =  -167.336 deg
};
P[2]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -504.080  mm,	Y = -1088.857  mm,	Z =    53.222  mm,
	W =  -178.777 deg,	P =    -7.308 deg,	R =  -165.301 deg
};
P[3:"Point de control"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -834.008  mm,	Y = -1177.339  mm,	Z =  -531.755  mm,
	W =   179.947 deg,	P =    -3.747 deg,	R =  -166.107 deg
};
P[5:"Repos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   387.508  mm,	Y =   470.250  mm,	Z =  1040.222  mm,
	W =  -159.977 deg,	P =     5.598 deg,	R =   122.130 deg
};
/END
