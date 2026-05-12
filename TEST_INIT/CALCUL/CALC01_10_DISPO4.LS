/PROG  CALC01_10_DISPO4
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Disposition 4";
PROG_SIZE	= 1936;
CREATE		= DATE 25-05-05  TIME 08:04:14;
MODIFIED	= DATE 25-11-05  TIME 18:50:18;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 73;
MEMORY_SIZE	= 2404;
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
   6:  !Disposition 4  ;
   7:  !Deux pieces sur la largeur pal ;
   8:   ;
   9:  !////////Palette 1/////////////// ;
  10:   ;
  11:J P[1:Point au fond] 100% FINE    ;
  12:   ;
  13:J P[2:Point avant] 100% FINE    ;
  14:   ;
  15:  !////////Palette 2/////////////// ;
  16:   ;
  17:J P[3:Point au fond] 100% FINE    ;
  18:   ;
  19:J P[4:Point avant] 100% FINE    ;
  20:   ;
  21:  LBL[1] ;
  22:  !Calcul point de pose ;
  23:  !Choix palette  ;
  24:  SELECT R[43:Palette actu ]=1,JMP LBL[10] ;
  25:         =2,JMP LBL[20] ;
  26:   ;
  27:  !Calcul point pose palette 1 ;
  28:  LBL[10] ;
  29:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[11] ;
  30:         =2,JMP LBL[12] ;
  31:   ;
  32:  !Point de pose au fond ;
  33:  LBL[11] ;
  34:  PR[99:PR mobil]=P[1:Point au fond]    ;
  35:  JMP LBL[99] ;
  36:   ;
  37:  !Point de pose a l'avant ;
  38:  LBL[12] ;
  39:  PR[99:PR mobil]=P[2:Point avant]    ;
  40:  JMP LBL[99] ;
  41:   ;
  42:  !Calcul point pose palette 2 ;
  43:  LBL[20] ;
  44:  SELECT R[42:Pos actu sur pal]=1,JMP LBL[21] ;
  45:         =2,JMP LBL[22] ;
  46:   ;
  47:  !Point de pose au fond ;
  48:  LBL[21] ;
  49:  PR[99:PR mobil]=P[3:Point au fond]    ;
  50:  JMP LBL[99] ;
  51:   ;
  52:  !Point de pose a l'avant ;
  53:  LBL[22] ;
  54:  PR[99:PR mobil]=P[4:Point avant]    ;
  55:  JMP LBL[99] ;
  56:   ;
  57:  LBL[99] ;
  58:  //R[45:Calcul TEMP]=(R[35:Longueur Piece]-605) ;
  59:  //    ;
  60:  //R[45:Calcul TEMP]=(R[45:Calcul TEMP]/2) ;
  61:  //    ;
  62:  //R[45:Calcul TEMP]=(R[45:Calcul TEMP]*(-1)) ;
  63:  //    ;
  64:  //PR[99,2:PR mobil]=(PR[99,2:PR mobil]+R[45:Calcul TEMP]) ;
  65:  //    ;
  66:  //    ;
  67:  //    ;
  68:  //R[45:Calcul TEMP]=(R[37:Hauteur Piece]-35) ;
  69:  //    ;
  70:  //R[45:Calcul TEMP]=(R[45:Calcul TEMP]*(-1)) ;
  71:  //    ;
  72:  //PR[99,3:PR mobil]=(PR[99,3:PR mobil]+R[45:Calcul TEMP]) ;
  73:  //    ;
/POS
P[1:"Point au fond"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1125.242  mm,	Y =   610.203  mm,	Z =    73.935  mm,
	W =  -179.337 deg,	P =    -4.537 deg,	R =      .010 deg
};
P[2:"Point avant"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   533.514  mm,	Y =   603.949  mm,	Z =    68.121  mm,
	W =  -179.338 deg,	P =    -4.538 deg,	R =      .010 deg
};
P[3:"Point au fond"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1153.916  mm,	Y =  1788.575  mm,	Z =    65.108  mm,
	W =  -178.689 deg,	P =    -4.320 deg,	R =     -.769 deg
};
P[4:"Point avant"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   536.869  mm,	Y =  1779.816  mm,	Z =    64.205  mm,
	W =  -178.685 deg,	P =    -4.318 deg,	R =     -.759 deg
};
/END
