/PROG  INT_SAB01_100.LS
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
   2:  !programme référence SAB01_100    ;
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
  17:      ;
  18:  LBL[998]    ;
  19:      ;
  20:  SELECT R[66]=1,JMP LBL[999]    ;
  21:         =2,JMP LBL[1]    ;
  22:         =3,JMP LBL[2]    ;
  23:         =4,JMP LBL[5]    ;
  24:         =5,JMP LBL[6]    ;
  25:         =6,JMP LBL[7]    ;
  26:         =7,JMP LBL[6]    ;
  27:         =8,JMP LBL[9]    ;
  28:         =9,JMP LBL[10]    ;
  29:         =10,JMP LBL[11]    ;
  30:         =11,JMP LBL[12]    ;
  31:         =12,JMP LBL[13]    ;
  32:         =13,JMP LBL[999]    ;
  33:      ;
  34:  GO[1]=99    ;
  35:  PAUSE    ;
  36:  GO[1]=0    ;
  37:  JMP LBL[998]    ;
  38:      ;
  39:  !Début des trajectoires    ;
  40:      ;
  41:  LBL[1]    ;
  42:  !Trajectoire d'approche    ;
  43:  R[66]=0.5    ;
  44:J P[1] 10% FINE    ;
  45:  R[66]=1    ;
  46:  JMP LBL[998]    ;
  47:      ;
  48:  LBL[2]    ;
  49:  R[66]=1.5    ;
  50:J P[2] 10% FINE    ;
  51:  R[66]=2    ;
  52:  JMP LBL[998]    ;
  53:      ;
  54:  LBL[3]    ;
  55:  !Point d'approche du controle    ;
  56:  PR[100,3:Dcallage]=(-100)    ;
  57:  PR[100,1:Dcallage]=20    ;
  58:  R[66]=2.5    ;
  59:L P[3:Point de control] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
  60:  R[66]=3    ;
  61:  JMP LBL[998]    ;
  62:      ;
  63:  LBL[4]    ;
  64:  !Ouverture de pince    ;
  65:  R[66]=3.5    ;
  66:  CALL TOOL03_OUVERTURE    ;
  67:  R[66]=4    ;
  68:  JMP LBL[998]    ;
  69:      ;
  70:  LBL[5]    ;
  71:  PR[100,3:Dcallage]=0    ;
  72:  PR[100,1:Dcallage]=5    ;
  73:  R[66]=4.5    ;
  74:L P[3:Point de control] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
  75:  R[66]=5    ;
  76:  JMP LBL[998]    ;
  77:      ;
  78:  LBL[6]    ;
  79:  !Point de controle    ;
  80:  R[66]=5.5    ;
  81:L P[3:Point de control] 100mm/sec FINE    ;
  82:  R[66]=6    ;
  83:  JMP LBL[998]    ;
  84:      ;
  85:  LBL[7]    ;
  86:  !Fermeture pince    ;
  87:  R[66]=6.5    ;
  88:  CALL TOOL03_FERMETURE    ;
  89:  R[66]=7    ;
  90:  JMP LBL[998]    ;
  91:      ;
  92:  LBL[8]    ;
  93:  !Ouverture de pince    ;
  94:  R[66]=7.5    ;
  95:  CALL TOOL03_OUVERTURE    ;
  96:  R[66]=8    ;
  97:  JMP LBL[998]    ;
  98:      ;
  99:  LBL[9]    ;
 100:  !Point d'approche du controle    ;
 101:  R[66]=8.5    ;
 102:J P[3:Point de control] 10% FINE Tool_Offset,PR[100:Dcallage]    ;
 103:  R[66]=9    ;
 104:  JMP LBL[998]    ;
 105:      ;
 106:  LBL[10]    ;
 107:  PR[100,3:Dcallage]=(-100)    ;
 108:  R[66]=9.5    ;
 109:L P[3:Point de control] 100mm/sec FINE Tool_Offset,PR[100:Dcallage]    ;
 110:  R[66]=10    ;
 111:  JMP LBL[998]    ;
 112:      ;
 113:  LBL[11]    ;
 114:  !Trajectoire retour    ;
 115:  R[66]=10.5    ;
 116:L P[2] 100mm/sec FINE    ;
 117:  R[66]=11    ;
 118:  JMP LBL[998]    ;
 119:      ;
 120:  LBL[12]    ;
 121:  R[66]=11.5    ;
 122:J P[1] 10% FINE    ;
 123:  R[66]=12    ;
 124:  JMP LBL[998]    ;
 125:      ;
 126:  LBL[13]    ;
 127:  R[66]=12.5    ;
 128:J P[5:Repos] 10% FINE    ;
 129:  R[66]=13    ;
 130:  JMP LBL[998]    ;
 131:      ;
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
