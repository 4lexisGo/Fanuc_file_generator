/PROG  CALC01_10_DISPO3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Disposition 3";
PROG_SIZE	= 3630;
CREATE		= DATE 25-05-05  TIME 08:03:42;
MODIFIED	= DATE 26-04-20  TIME 09:42:12;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 129;
MEMORY_SIZE	= 4130;
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
   1:  !Saut des points enregistrer ;
   2:  JMP LBL[1] ;
   3:  UFRAME_NUM=2 ;
   4:  UTOOL_NUM=3 ;
   5:   ;
   6:  !Disposition 3 ;
   7:  !Quatre pieces au 4 coins ;
   8:   ;
   9:  !////////Palette 1/////////////// ;
  10:  !Tour -1 (normal) ;
  11:J P[1:Point fond gauch] 100% FINE    ;
  12:J P[2:Point fond droit] 100% FINE    ;
  13:J P[3:Point av  gauche] 100% FINE    ;
  14:J P[4:Point av  droite] 100% FINE    ;
  15:   ;
  16:  !Tour 0 ;
  17:J P[5:Point fond gauch] 100% FINE    ;
  18:J P[6:Point fond droit] 100% FINE    ;
  19:J P[7:Point av  gauche] 100% FINE    ;
  20:J P[8:Point av  droite] 100% FINE    ;
  21:   ;
  22:  !////////Palette 2/////////////// ;
  23:   ;
  24:  !Tour 0 (normal) ;
  25:J P[9:Point fond gauch] 100% FINE    ;
  26:J P[10:Point fond droit] 100% FINE    ;
  27:J P[11:Point av gauche] 100% FINE    ;
  28:J P[12:Point av droite] 100% FINE    ;
  29:   ;
  30:  !Tour 0 (A modifier au besoin) ;
  31:J P[13:Point fond gauch] 100% FINE    ;
  32:J P[14:Point fond droit] 100% FINE    ;
  33:J P[15:Point av gauche] 100% FINE    ;
  34:J P[16:Point av droite] 100% FINE    ;
  35:   ;
  36:  LBL[1] ;
  37:  !Calcul point de pose ;
  38:  !Choix palette  ;
  39:  SELECT R[43:Palette actu ]=1,JMP LBL[10] ;
  40:         =2,JMP LBL[20] ;
  41:   ;
  42:  !Calcul point pose palette 1 ;
  43:  LBL[10] ;
  44:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[11] ;
  45:         =2,JMP LBL[12] ;
  46:         =3,JMP LBL[13] ;
  47:         =4,JMP LBL[14] ;
  48:   ;
  49:  !Point de pose fond  a gauche ;
  50:  LBL[11] ;
  51:  IF (R[41:Niveau pal]<4) THEN ;
  52:  PR[99:PR mobil]=P[1:Point fond gauch]    ;
  53:  ELSE ;
  54:  PR[99:PR mobil]=P[5:Point fond gauch]    ;
  55:  ENDIF ;
  56:  JMP LBL[99] ;
  57:   ;
  58:  !Point de pose fond  a droite ;
  59:  LBL[12] ;
  60:  IF (R[41:Niveau pal]<4) THEN ;
  61:  PR[99:PR mobil]=P[22]    ;
  62:  ELSE ;
  63:  PR[99:PR mobil]=P[6:Point fond droit]    ;
  64:  ENDIF ;
  65:  JMP LBL[99] ;
  66:   ;
  67:  !Point de pose avant gauche ;
  68:  LBL[13] ;
  69:  IF (R[41:Niveau pal]<4) THEN ;
  70:  PR[99:PR mobil]=P[3:Point av  gauche]    ;
  71:  ELSE ;
  72:  PR[99:PR mobil]=P[7:Point av  gauche]    ;
  73:  ENDIF ;
  74:  JMP LBL[99] ;
  75:   ;
  76:  !Point de pose fond avant droite ;
  77:  LBL[14] ;
  78:  IF (R[41:Niveau pal]<4) THEN ;
  79:  PR[99:PR mobil]=P[4:Point av  droite]    ;
  80:  ELSE ;
  81:  PR[99:PR mobil]=P[8:Point av  droite]    ;
  82:  ENDIF ;
  83:  JMP LBL[99] ;
  84:   ;
  85:  !Calcul point pose palette 2 ;
  86:  LBL[20] ;
  87:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[21] ;
  88:         =2,JMP LBL[22] ;
  89:         =3,JMP LBL[23] ;
  90:         =4,JMP LBL[24] ;
  91:   ;
  92:  !Point de pose fond  a gauche ;
  93:  LBL[21] ;
  94:  IF (R[41:Niveau pal]<4) THEN ;
  95:  PR[99:PR mobil]=P[9:Point fond gauch]    ;
  96:  ELSE ;
  97:  PR[99:PR mobil]=P[13:Point fond gauch]    ;
  98:  ENDIF ;
  99:  JMP LBL[99] ;
 100:   ;
 101:  !Point de pose fond a droite ;
 102:  LBL[22] ;
 103:  IF (R[41:Niveau pal]<4) THEN ;
 104:  PR[99:PR mobil]=P[10:Point fond droit]    ;
 105:  ELSE ;
 106:  PR[99:PR mobil]=P[14:Point fond droit]    ;
 107:  ENDIF ;
 108:  JMP LBL[99] ;
 109:   ;
 110:  !Point de pose avant gauche ;
 111:  LBL[23] ;
 112:  IF (R[41:Niveau pal]<4) THEN ;
 113:  PR[99:PR mobil]=P[11:Point av gauche]    ;
 114:  ELSE ;
 115:  PR[99:PR mobil]=P[15:Point av gauche]    ;
 116:  ENDIF ;
 117:  JMP LBL[99] ;
 118:   ;
 119:  !Point de pose avant droite ;
 120:  LBL[24] ;
 121:  IF (R[41:Niveau pal]<4) THEN ;
 122:  PR[99:PR mobil]=P[12:Point av droite]    ;
 123:  ELSE ;
 124:  PR[99:PR mobil]=P[16:Point av droite]    ;
 125:  ENDIF ;
 126:  JMP LBL[99] ;
 127:   ;
 128:  LBL[99] ;
 129:   ;
/POS
P[1:"Point fond gauch"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   955.306  mm,	Y =   329.437  mm,	Z =    50.654  mm,
	W =  -179.662 deg,	P =    -3.670 deg,	R =   -90.131 deg
};
P[2:"Point fond droit"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   954.776  mm,	Y =   750.597  mm,	Z =    50.523  mm,
	W =  -179.681 deg,	P =    -3.560 deg,	R =   -90.553 deg
};
P[3:"Point av  gauche"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   404.299  mm,	Y =   324.253  mm,	Z =    49.281  mm,
	W =  -179.639 deg,	P =    -3.555 deg,	R =   -91.218 deg
};
P[4:"Point av  droite"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   403.789  mm,	Y =   752.045  mm,	Z =    50.769  mm,
	W =  -179.619 deg,	P =    -3.553 deg,	R =   -91.535 deg
};
P[5:"Point fond gauch"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   955.306  mm,	Y =   329.437  mm,	Z =    50.654  mm,
	W =  -179.662 deg,	P =    -3.670 deg,	R =   -90.131 deg
};
P[6:"Point fond droit"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   954.776  mm,	Y =   750.597  mm,	Z =    50.523  mm,
	W =  -179.681 deg,	P =    -3.560 deg,	R =   -90.553 deg
};
P[7:"Point av  gauche"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   404.299  mm,	Y =   324.253  mm,	Z =    49.281  mm,
	W =  -179.639 deg,	P =    -3.555 deg,	R =   -91.218 deg
};
P[8:"Point av  droite"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   403.789  mm,	Y =   752.045  mm,	Z =    50.769  mm,
	W =  -179.619 deg,	P =    -3.553 deg,	R =   -91.535 deg
};
P[9:"Point fond gauch"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1032.715  mm,	Y =  1929.948  mm,	Z =    47.756  mm,
	W =  -179.673 deg,	P =    -5.076 deg,	R =    89.035 deg
};
P[10:"Point fond droit"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1039.912  mm,	Y =  1545.624  mm,	Z =    51.351  mm,
	W =  -179.677 deg,	P =    -5.076 deg,	R =    89.083 deg
};
P[11:"Point av gauche"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   486.184  mm,	Y =  1911.700  mm,	Z =    46.361  mm,
	W =  -179.727 deg,	P =    -5.081 deg,	R =    89.615 deg
};
P[12:"Point av droite"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   480.556  mm,	Y =  1538.660  mm,	Z =    51.187  mm,
	W =  -179.815 deg,	P =    -5.085 deg,	R =    90.609 deg
};
P[13:"Point fond gauch"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1032.715  mm,	Y =  1929.948  mm,	Z =    47.756  mm,
	W =  -179.673 deg,	P =    -5.076 deg,	R =    89.035 deg
};
P[14:"Point fond droit"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1039.912  mm,	Y =  1545.624  mm,	Z =    51.351  mm,
	W =  -179.677 deg,	P =    -5.076 deg,	R =    89.083 deg
};
P[15:"Point av gauche"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   486.184  mm,	Y =  1911.700  mm,	Z =    46.361  mm,
	W =  -179.727 deg,	P =    -5.081 deg,	R =    89.615 deg
};
P[16:"Point av droite"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   480.556  mm,	Y =  1538.660  mm,	Z =    51.187  mm,
	W =  -179.815 deg,	P =    -5.085 deg,	R =    90.609 deg
};
/END
