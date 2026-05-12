/PROG  CALC01_10_DISPO2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Disposition 2";
PROG_SIZE	= 1662;
CREATE		= DATE 25-05-05  TIME 08:02:18;
MODIFIED	= DATE 25-11-17  TIME 21:52:22;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 55;
MEMORY_SIZE	= 2074;
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
   6:  !Disposition 2 ;
   7:  !Deux pieces sur la longueur pal ;
   8:   ;
   9:  !////////Palette 1/////////////// ;
  10:   ;
  11:J P[1:Point a gauche] 100% FINE    ;
  12:J P[2:Point a droite] 100% FINE    ;
  13:  !////////Palette 2/////////////// ;
  14:   ;
  15:J P[3:Point a gauche] 100% FINE    ;
  16:J P[4:Point a droite] 100% FINE    ;
  17:   ;
  18:  LBL[1] ;
  19:  !Calcul point de pose ;
  20:  !Choix palette  ;
  21:  SELECT R[43:Palette actu ]=1,JMP LBL[10] ;
  22:         =2,JMP LBL[20] ;
  23:   ;
  24:  !Calcul point pose palette 1 ;
  25:  LBL[10] ;
  26:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[11] ;
  27:         =2,JMP LBL[12] ;
  28:   ;
  29:  !Point de pose a gauche ;
  30:  LBL[11] ;
  31:  PR[99:PR mobil]=P[1:Point a gauche]    ;
  32:  JMP LBL[99] ;
  33:   ;
  34:  !Point de pose a droite ;
  35:  LBL[12] ;
  36:  PR[99:PR mobil]=P[2:Point a droite]    ;
  37:  JMP LBL[99] ;
  38:   ;
  39:  !Calcul point pose palette 2 ;
  40:  LBL[20] ;
  41:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[21] ;
  42:         =2,JMP LBL[22] ;
  43:   ;
  44:  !Point de pose a gauche ;
  45:  LBL[21] ;
  46:  PR[99:PR mobil]=P[3:Point a gauche]    ;
  47:  JMP LBL[99] ;
  48:   ;
  49:  !Point de pose a droite ;
  50:  LBL[22] ;
  51:  PR[99:PR mobil]=P[4:Point a droite]    ;
  52:  JMP LBL[99] ;
  53:   ;
  54:  LBL[99] ;
  55:   ;
/POS
P[1:"Point a gauche"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   980.244  mm,	Y =   292.590  mm,	Z =    65.450  mm,
	W =  -179.765 deg,	P =    -3.947 deg,	R =   -90.383 deg
};
P[2:"Point a droite"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   980.017  mm,	Y =   716.030  mm,	Z =    62.316  mm,
	W =  -179.770 deg,	P =    -3.937 deg,	R =   -90.384 deg
};
P[3:"Point a gauche"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   528.775  mm,	Y =  1925.747  mm,	Z =    55.588  mm,
	W =  -179.814 deg,	P =    -5.085 deg,	R =    89.877 deg
};
P[4:"Point a droite"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   528.827  mm,	Y =  1528.683  mm,	Z =    45.899  mm,
	W =  -179.817 deg,	P =    -5.082 deg,	R =    89.596 deg
};
/END
