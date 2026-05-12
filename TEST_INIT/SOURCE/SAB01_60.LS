/PROG  SAB01_60
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise/Pose inter";
PROG_SIZE	= 3438;
CREATE		= DATE 25-04-30  TIME 08:06:54;
MODIFIED	= DATE 26-01-26  TIME 19:18:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 137;
MEMORY_SIZE	= 3862;
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
   2:  !////Prise/Pose intercalaire///// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Recuperation Info Piece ;
   6:  CALL INFO_PIECE_ACTU    ;
   7:   ;
   8:  !Memo programme en cours ;
   9:  R[38:Programme en cr]=6    ;
  10:   ;
  11:  !Validation Tache ;
  12:  CALL VALIDATION_DEBUT_TACHE    ;
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
  25:  !Raz PR ;
  26:  CALL RAZPR99    ;
  27:   ;
  28:  !//////////////////////////////// ;
  29:  !//////////////////////////////// ;
  30:  !//////////////////////////////// ;
  31:   ;
  32:  !Activation telemetre ;
  33:  DO[129:OFF:Activation Telemetre]=ON ;
  34:   ;
  35:  !Point d'approche ;
  36:J P[1] 100% CNT25    ;
  37:  R[66:Memo INIT]=50    ;
  38:  !Point mesure ;
  39:L P[2] 2000mm/sec FINE    ;
  40:  R[66:Memo INIT]=51    ;
  41:  WAIT    .20(sec) ;
  42:  !Definition repere et outils ;
  43:  UFRAME_NUM=4 ;
  44:  UTOOL_NUM=2 ;
  45:   ;
  46:  !Reset PR ;
  47:  CALL RAZPR99    ;
  48:  CALL RAZPR100    ;
  49:   ;
  50:  !Calcule de point de prise ;
  51:  CALL CALC01_60    ;
  52:   ;
  53:  !Desactivation telemetre ;
  54:  DO[129:OFF:Activation Telemetre]=OFF ;
  55:   ;
  56:L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
  57:  !Aspiration intercalaire ;
  58:  CALL CYCLE_ASPI    ;
  59:  WAIT    .50(sec) ;
  60:  R[66:Memo INIT]=52    ;
  61:   ;
  62:L P[4] 50mm/sec FINE    ;
  63:   ;
  64:L P[9] 50mm/sec FINE    ;
  65:L P[10] 50mm/sec FINE    ;
  66:   ;
  67:   ;
  68:L P[5] 50mm/sec CNT50    ;
  69:L P[6] 50mm/sec FINE    ;
  70:  WAIT   1.50(sec) ;
  71:L P[7] 50mm/sec FINE    ;
  72:  WAIT   1.50(sec) ;
  73:L P[8] 50mm/sec FINE    ;
  74:L P[11] 50mm/sec FINE    ;
  75:L P[12] 50mm/sec FINE    ;
  76:L P[13] 50mm/sec FINE    ;
  77:   ;
  78:   ;
  79:  !Raz PR100 ;
  80:  CALL RAZPR100    ;
  81:   ;
  82:  !Point de degagement ;
  83:  PR[100,1:Décallage]=(-100)    ;
  84:  PR[100,3:Décallage]=(-100)    ;
  85:  PR[100,2:Décallage]=(-100)    ;
  86:L PR[99:PR mobil] 250mm/sec FINE Tool_Offset,PR[100:Décallage] ACC5    ;
  87:  R[66:Memo INIT]=53    ;
  88:   ;
  89:  !Definition repere et outils ;
  90:  UFRAME_NUM=2 ;
  91:  UTOOL_NUM=2 ;
  92:   ;
  93:  !Raz PR ;
  94:  CALL RAZPR99    ;
  95:  CALL RAZPR100    ;
  96:   ;
  97:  !Choix palette ;
  98:  CALL CALC01_60_POSE    ;
  99:   ;
 100:  PR[100,3:Décallage]=(-800)    ;
 101:J PR[99:PR mobil] 50% FINE Tool_Offset,PR[100:Décallage]    ;
 102:  R[66:Memo INIT]=54    ;
 103:   ;
 104:  PR[100,3:Décallage]=(-100)    ;
 105:L PR[99:PR mobil] 1000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 106:  R[66:Memo INIT]=55    ;
 107:   ;
 108:L PR[99:PR mobil] 500mm/sec FINE    ;
 109:   ;
 110:  !Pose intercallaire ;
 111:  CALL TOOL02_ASPIRATION_OFF    ;
 112:  R[66:Memo INIT]=56    ;
 113:   ;
 114:  !Raz PR ;
 115:  CALL RAZPR100    ;
 116:   ;
 117:  PR[100,3:Décallage]=(-100)    ;
 118:L PR[99:PR mobil] 2000mm/sec FINE Tool_Offset,PR[100:Décallage]    ;
 119:  R[66:Memo INIT]=57    ;
 120:   ;
 121:  PR[100,3:Décallage]=(-800)    ;
 122:J PR[99:PR mobil] 100% FINE Tool_Offset,PR[100:Décallage]    ;
 123:  R[66:Memo INIT]=58    ;
 124:   ;
 125:J P[1] 100% FINE    ;
 126:  R[66:Memo INIT]=59    ;
 127:   ;
 128:  !Mis en position repos ;
 129:  !Definition du repere ;
 130:  UFRAME_NUM=5 ;
 131:  UTOOL_NUM=5 ;
 132:   ;
 133:J P[3:Repos] 100% FINE    ;
 134:  R[66:Memo INIT]=0    ;
 135:   ;
 136:  !Validation Fin Tache ;
 137:  CALL VALIDATION_FIN_TACHE    ;
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
