/PROG  CALC01_10_DISPO6
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Disposition 6";
PROG_SIZE	= 2334;
CREATE		= DATE 25-05-05  TIME 08:04:40;
MODIFIED	= DATE 25-09-15  TIME 15:48:58;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 83;
MEMORY_SIZE	= 2762;
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
   6:  !Disposition 6 ;
   7:  !Quatre pieces sur la largeur ;
   8:   ;
   9:  !////////Palette 1/////////////// ;
  10:J P[1:Point au fond] 100% FINE    ;
  11:J P[2:Point au fond 2] 100% FINE    ;
  12:J P[3:Point avant] 100% FINE    ;
  13:J P[4:Point avant 2] 100% FINE    ;
  14:   ;
  15:  !////////Palette 2/////////////// ;
  16:J P[5:Point au fond ] 100% FINE    ;
  17:J P[6:Point au fond2] 100% FINE    ;
  18:J P[7:Point avant ] 100% FINE    ;
  19:J P[8:Point avant2] 100% FINE    ;
  20:   ;
  21:  LBL[1] ;
  22:  !Calcul point de pose ;
  23:  !Choix palette  ;
  24:  SELECT R[43:Palette actu ]=1,JMP LBL[10] ;
  25:         =2,JMP LBL[20] ;
  26:   ;
  27:  !Calcule point pose palette 1 ;
  28:  LBL[10] ;
  29:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[11] ;
  30:         =2,JMP LBL[12] ;
  31:         =3,JMP LBL[13] ;
  32:         =4,JMP LBL[14] ;
  33:   ;
  34:  !Point de pose au fond ;
  35:  LBL[11] ;
  36:  PR[99:PR mobil]=P[1:Point au fond]    ;
  37:  JMP LBL[99] ;
  38:   ;
  39:  !Point de pose au fond2 ;
  40:  LBL[12] ;
  41:  PR[99:PR mobil]=P[2:Point au fond 2]    ;
  42:  JMP LBL[99] ;
  43:   ;
  44:  !Point de pose avant ;
  45:  LBL[13] ;
  46:  PR[99:PR mobil]=P[3:Point avant]    ;
  47:  JMP LBL[99] ;
  48:   ;
  49:  !Point de pose fond avant2  ;
  50:  LBL[14] ;
  51:  PR[99:PR mobil]=P[4:Point avant 2]    ;
  52:  JMP LBL[99] ;
  53:   ;
  54:  !Calcule point pose palette 2 ;
  55:  LBL[20] ;
  56:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[21] ;
  57:         =2,JMP LBL[22] ;
  58:         =3,JMP LBL[23] ;
  59:         =4,JMP LBL[24] ;
  60:   ;
  61:  !Point de pose au fond ;
  62:  LBL[21] ;
  63:  PR[99:PR mobil]=P[5:Point au fond ]    ;
  64:  JMP LBL[99] ;
  65:   ;
  66:  !Point de pose au fond2 ;
  67:  LBL[22] ;
  68:  PR[99:PR mobil]=P[6:Point au fond2]    ;
  69:  JMP LBL[99] ;
  70:   ;
  71:  !Point de pose avant ;
  72:  LBL[23] ;
  73:  PR[99:PR mobil]=P[7:Point avant ]    ;
  74:  JMP LBL[99] ;
  75:   ;
  76:  !Point de pose avant2 ;
  77:  LBL[24] ;
  78:  PR[99:PR mobil]=P[8:Point avant2]    ;
  79:  JMP LBL[99] ;
  80:   ;
  81:  LBL[99] ;
  82:   ;
  83:   ;
/POS
P[1:"Point au fond"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1194.208  mm,	Y =   544.718  mm,	Z =    35.319  mm,
	W =  -179.360 deg,	P =    -3.705 deg,	R =      .325 deg
};
P[2:"Point au fond 2"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   834.553  mm,	Y =   542.463  mm,	Z =    33.392  mm,
	W =  -179.360 deg,	P =    -3.705 deg,	R =      .325 deg
};
P[3:"Point avant"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   518.121  mm,	Y =   540.373  mm,	Z =    37.858  mm,
	W =  -179.360 deg,	P =    -3.704 deg,	R =      .325 deg
};
P[4:"Point avant 2"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   198.950  mm,	Y =   538.320  mm,	Z =    29.064  mm,
	W =  -179.364 deg,	P =    -4.543 deg,	R =      .319 deg
};
P[5:"Point au fond "]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1183.392  mm,	Y =  1671.290  mm,	Z =    51.750  mm,
	W =  -179.353 deg,	P =    -4.533 deg,	R =      .289 deg
};
P[6:"Point au fond2"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   864.442  mm,	Y =  1671.291  mm,	Z =    51.749  mm,
	W =  -179.353 deg,	P =    -4.533 deg,	R =      .289 deg
};
P[7:"Point avant "]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   554.463  mm,	Y =  1671.290  mm,	Z =    51.750  mm,
	W =  -179.353 deg,	P =    -4.533 deg,	R =      .289 deg
};
P[8:"Point avant2"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   240.855  mm,	Y =  1671.289  mm,	Z =    51.749  mm,
	W =  -179.353 deg,	P =    -4.533 deg,	R =      .289 deg
};
/END
