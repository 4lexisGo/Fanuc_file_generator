/PROG  INIT_sab01_30.LS
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
   2:  !programme référence sab01_30    ;
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
  15:      ;
  16:  LBL[998]    ;
  17:      ;
  18:  SELECT R[99]=1,JMP LBL[999]    ;
  19:         =2,JMP LBL[1]    ;
  20:         =3,JMP LBL[2]    ;
  21:         =4,JMP LBL[3]    ;
  22:         =5,JMP LBL[4]    ;
  23:         =6,JMP LBL[5]    ;
  24:         =7,JMP LBL[6]    ;
  25:         =8,JMP LBL[7]    ;
  26:         =9,JMP LBL[8]    ;
  27:         =10,JMP LBL[999]    ;
  28:      ;
  29:  GO[1]=32    ;
  30:  PAUSE    ;
  31:  GO[1]=0    ;
  32:  JMP LBL[998]    ;
  33:      ;
  34:  !Début des trajectoires    ;
  35:      ;
  36:  LBL[1]    ;
  37:  !Approche scie    ;
  38:  R[99]=0.5    ;
  39:J P[2:App 1] R[28:Vitesse joue + P]% FINE    ;
  40:  R[99]=1    ;
  41:  JMP LBL[998]    ;
  42:      ;
  43:  LBL[2]    ;
  44:  !Approche    ;
  45:  PR[100,1:Offset]=(-800)    ;
  46:  R[99]=1.5    ;
  47:L PR[99:PR mobil] 100mm/sec FINE Offset,PR[100:Offset]    ;
  48:  R[99]=2    ;
  49:  JMP LBL[998]    ;
  50:      ;
  51:  LBL[3]    ;
  52:  !Entame    ;
  53:  PR[100,1:Offset]=(0)    ;
  54:  R[99]=2.5    ;
  55:L PR[99:PR mobil] R[26:Vitesse entame]mm/sec FINE Offset,PR[100:Offset]    ;
  56:  R[99]=3    ;
  57:  JMP LBL[998]    ;
  58:      ;
  59:  LBL[4]    ;
  60:  !Rotation    ;
  61:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+120)    ;
  62:  R[99]=3.5    ;
  63:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec FINE Offset,PR[100:Offset] ACC30    ;
  64:  R[99]=4    ;
  65:  JMP LBL[998]    ;
  66:      ;
  67:  LBL[5]    ;
  68:  !Rotation    ;
  69:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+120)    ;
  70:  R[99]=4.5    ;
  71:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec FINE Offset,PR[100:Offset]    ;
  72:  R[99]=5    ;
  73:  JMP LBL[998]    ;
  74:      ;
  75:  LBL[6]    ;
  76:  !Rotation    ;
  77:  PR[99,6:PR mobil]=(PR[99,6:PR mobil]+130)    ;
  78:  R[99]=5.5    ;
  79:L PR[99:PR mobil] R[27:Vitesse detourag]deg/sec FINE Offset,PR[100:Offset]    ;
  80:  R[99]=6    ;
  81:  JMP LBL[998]    ;
  82:      ;
  83:  LBL[7]    ;
  84:  PR[100,2:Offset]=(PR[100,2:Offset]+100)    ;
  85:  R[99]=6.5    ;
  86:L PR[99:PR mobil] R[26:Vitesse entame]mm/sec FINE Offset,PR[100:Offset]    ;
  87:  R[99]=7    ;
  88:  JMP LBL[998]    ;
  89:      ;
  90:  LBL[8]    ;
  91:  PR[100,1:Offset]=(-800)    ;
  92:  R[99]=7.5    ;
  93:L PR[99:PR mobil] 100mm/sec FINE Offset,PR[100:Offset]    ;
  94:  R[99]=8    ;
  95:  JMP LBL[998]    ;
  96:      ;
  97:  LBL[9]    ;
  98:  !Approche scie    ;
  99:  R[99]=8.5    ;
 100:J P[2:App 1] R[28:Vitesse joue + P]% FINE    ;
 101:  R[99]=9    ;
 102:  JMP LBL[998]    ;
 103:      ;
 104:  LBL[10]    ;
 105:  R[99]=9.5    ;
 106:J P[3] R[28:Vitesse joue + P]% FINE    ;
 107:  R[99]=10    ;
 108:  JMP LBL[998]    ;
 109:      ;
 110:  !Fin des trajectoires    ;
 111:  LBL[999]    ;
/POS
P[2:"App 1"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1438.636  mm,	Y =  -679.878  mm,	Z =  -167.792  mm,
	W =   179.691 deg,	P =     -.160 deg,	R =    10.332 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -830.607  mm,	Y =  -690.699  mm,	Z =   -81.690  mm,
	W =   175.962 deg,	P =    19.885 deg,	R =    16.177 deg
};
/END
