/PROG  CALC01_10_DISPO5
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Disposition 5";
PROG_SIZE	= 2022;
CREATE		= DATE 25-05-05  TIME 08:04:32;
MODIFIED	= DATE 25-09-15  TIME 15:39:44;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 73;
MEMORY_SIZE	= 2490;
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
   6:  !Disposition 5 ;
   7:  !Quatre pieces sur la largeur ;
   8:   ;
   9:  !////////Palette 1/////////////// ;
  10:   ;
  11:J P[1:Point au fond] 100% FINE    ;
  12:   ;
  13:J P[2:Point au milieu] 100% FINE    ;
  14:J P[3:Point avant] 100% FINE    ;
  15:   ;
  16:  !////////Palette 2/////////////// ;
  17:   ;
  18:J P[4:Point au fond ] 100% FINE    ;
  19:J P[5:Point au milieu] 100% FINE    ;
  20:J P[6:Point avant ] 100% FINE    ;
  21:   ;
  22:  LBL[1] ;
  23:  !Calcul point de pose ;
  24:  !Choix palette  ;
  25:  SELECT R[43:Palette actu ]=1,JMP LBL[10] ;
  26:         =2,JMP LBL[20] ;
  27:   ;
  28:  !Calcule point pose palette 1 ;
  29:  LBL[10] ;
  30:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[11] ;
  31:         =2,JMP LBL[12] ;
  32:         =3,JMP LBL[13] ;
  33:   ;
  34:  !Point de pose au fond ;
  35:  LBL[11] ;
  36:  PR[99:PR mobil]=P[1:Point au fond]    ;
  37:  JMP LBL[99] ;
  38:   ;
  39:  !Point de pose au milieu ;
  40:  LBL[12] ;
  41:  PR[99:PR mobil]=P[2:Point au milieu]    ;
  42:  JMP LBL[99] ;
  43:   ;
  44:  !Point de pose avant ;
  45:  LBL[13] ;
  46:  PR[99:PR mobil]=P[3:Point avant]    ;
  47:  JMP LBL[99] ;
  48:   ;
  49:  !Calcule point pose palette 2 ;
  50:  LBL[20] ;
  51:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[21] ;
  52:         =2,JMP LBL[22] ;
  53:         =3,JMP LBL[23] ;
  54:   ;
  55:  !Point de pose au fond ;
  56:  LBL[21] ;
  57:  PR[99:PR mobil]=P[4:Point au fond ]    ;
  58:  JMP LBL[99] ;
  59:   ;
  60:  !Point de pose au fond2 ;
  61:  LBL[22] ;
  62:  PR[99:PR mobil]=P[5:Point au milieu]    ;
  63:  JMP LBL[99] ;
  64:   ;
  65:  !Point de pose avant ;
  66:  LBL[23] ;
  67:  PR[99:PR mobil]=P[6:Point avant ]    ;
  68:  JMP LBL[99] ;
  69:   ;
  70:   ;
  71:  LBL[99] ;
  72:   ;
  73:   ;
/POS
P[1:"Point au fond"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   272.091  mm,	Y =   582.355  mm,	Z =    39.613  mm,
	W =  -179.814 deg,	P =    -5.084 deg,	R =   179.059 deg
};
P[2:"Point au milieu"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   620.987  mm,	Y =    14.681  mm,	Z =   -69.768  mm,
	W =   177.782 deg,	P =    11.716 deg,	R =   -91.430 deg
};
P[3:"Point avant"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   266.428  mm,	Y =   538.655  mm,	Z =    29.396  mm,
	W =  -179.368 deg,	P =    -4.542 deg,	R =      .318 deg
};
P[4:"Point au fond "]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1178.692  mm,	Y =  1671.291  mm,	Z =    51.749  mm,
	W =  -179.353 deg,	P =    -4.533 deg,	R =      .289 deg
};
P[5:"Point au milieu"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   728.255  mm,	Y =  1671.285  mm,	Z =    51.764  mm,
	W =  -179.356 deg,	P =    -4.535 deg,	R =      .290 deg
};
P[6:"Point avant "]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   291.475  mm,	Y =  1671.286  mm,	Z =    51.764  mm,
	W =  -179.356 deg,	P =    -4.535 deg,	R =      .290 deg
};
/END
