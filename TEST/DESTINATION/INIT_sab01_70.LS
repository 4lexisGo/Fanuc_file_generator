/PROG  INIT_sab01_70.LS
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
   2:  !programme référence sab01_70    ;
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
  13:      ;
  14:  LBL[998]    ;
  15:      ;
  16:  SELECT R[99]=1,JMP LBL[999]    ;
  17:         =2,JMP LBL[1]    ;
  18:         =3,JMP LBL[2]    ;
  19:         =4,JMP LBL[3]    ;
  20:         =5,JMP LBL[4]    ;
  21:         =6,JMP LBL[5]    ;
  22:         =7,JMP LBL[6]    ;
  23:         =8,JMP LBL[999]    ;
  24:      ;
  25:  GO[1]=32    ;
  26:  PAUSE    ;
  27:  GO[1]=0    ;
  28:  JMP LBL[998]    ;
  29:      ;
  30:  !Début des trajectoires    ;
  31:      ;
  32:  LBL[1]    ;
  33:  !Approche    ;
  34:  R[99]=0.5    ;
  35:J P[1:App] 10% FINE    ;
  36:  R[99]=1    ;
  37:  JMP LBL[998]    ;
  38:      ;
  39:  LBL[2]    ;
  40:  R[99]=1.5    ;
  41:J P[3] 10% FINE    ;
  42:  R[99]=2    ;
  43:  JMP LBL[998]    ;
  44:      ;
  45:  LBL[3]    ;
  46:  PR[100,3:Offset]=(-100)    ;
  47:  R[99]=2.5    ;
  48:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  49:  R[99]=3    ;
  50:  JMP LBL[998]    ;
  51:      ;
  52:  LBL[4]    ;
  53:  R[99]=3.5    ;
  54:L PR[99:PR mobil] 100mm/sec FINE    ;
  55:  R[99]=4    ;
  56:  JMP LBL[998]    ;
  57:      ;
  58:  LBL[5]    ;
  59:  PR[100,2:Offset]=(-10)    ;
  60:  PR[100,3:Offset]=0    ;
  61:  R[99]=4.5    ;
  62:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  63:  R[99]=5    ;
  64:  JMP LBL[998]    ;
  65:      ;
  66:  LBL[6]    ;
  67:  PR[100,3:Offset]=(-100)    ;
  68:  R[99]=5.5    ;
  69:L PR[99:PR mobil] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  70:  R[99]=6    ;
  71:  JMP LBL[998]    ;
  72:      ;
  73:  LBL[7]    ;
  74:  !Approche    ;
  75:  R[99]=6.5    ;
  76:J P[3] 10% FINE    ;
  77:  R[99]=7    ;
  78:  JMP LBL[998]    ;
  79:      ;
  80:  LBL[8]    ;
  81:  R[99]=7.5    ;
  82:J P[2] 10% FINE    ;
  83:  R[99]=8    ;
  84:  JMP LBL[998]    ;
  85:      ;
  86:  !Fin des trajectoires    ;
  87:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -642.084  mm,	Y =  1060.018  mm,	Z =   257.197  mm,
	W =  -141.915 deg,	P =    -2.189 deg,	R =    47.868 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1023.078  mm,	Y =   809.668  mm,	Z =   186.000  mm,
	W =   179.825 deg,	P =    -1.082 deg,	R =   -18.432 deg
};
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1669.407  mm,	Y =  1025.064  mm,	Z =   173.193  mm,
	W =   179.826 deg,	P =    -1.080 deg,	R =   -18.431 deg
};
/END
