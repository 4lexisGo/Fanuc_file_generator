/PROG  CALC01_30_POSE_MACHINE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc pose MACHI";
PROG_SIZE	= 1989;
CREATE		= DATE 25-07-30  TIME 14:58:08;
MODIFIED	= DATE 26-04-16  TIME 16:34:40;
FILE_NAME	= CALC01_2;
VERSION		= 0;
LINE_COUNT	= 73;
MEMORY_SIZE	= 2457;
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
   1:  !//////////////////////////////// ;
   2:  !///calcule pose machine OP20/// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:  UFRAME_NUM=6 ;
   8:  UTOOL_NUM=3 ;
   9:   ;
  10:  !////////P Pose/////////////// ;
  11:  !Baser sur la grande prise ;
  12:L P[1:Pose Reference] 2000mm/sec FINE    ;
  13:  !Note ;
  14:  !Point effectue avec une piece ;
  15:  !Dimension ;
  16:  !Longueur = 605 ;
  17:  !Largeur = 493 ;
  18:  !Epaisseur = 35 ;
  19:   ;
  20:  !OFFSET PRISE OP20 ;
  21:  !Y -248 ;
  22:   ;
  23:  !Offset Hauteur ;
  24:  !X 600 ;
  25:   ;
  26:  !Offset Largeur ;
  27:  !Y 493  ;
  28:   ;
  29:  LBL[1] ;
  30:  !Calcul point de prise ;
  31:  !Attribution du point d'origine ;
  32:  !Au point de calcul ;
  33:  PR[99:PR mobil]=P[1:Pose Reference]    ;
  34:   ;
  35:  IF (R[36:Largeur Piece]<=550 AND R[36:Largeur Piece]>=260),JMP LBL[10] ;
  36:   ;
  37:  !Alarme ;
  38:  GO[1:0:Alarme]=10 ;
  39:  PAUSE ;
  40:  JMP LBL[1] ;
  41:   ;
  42:  LBL[10] ;
  43:   ;
  44:  !Calcul Offset ;
  45:   ;
  46:  !Calcul position X ;
  47:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]-248) ;
  48:   ;
  49:  !Calcul position Hauteur ;
  50:  PR[99,1:PR mobil]=(PR[99,1:PR mobil]-600) ;
  51:   ;
  52:  !Calcul position Largeur ;
  53:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]+493) ;
  54:   ;
  55:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]+R[30:Offset OP20]) ;
  56:   ;
  57:  PR[99,1:PR mobil]=(PR[99,1:PR mobil]+R[33:Longueur Usinee]) ;
  58:   ;
  59:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]-R[36:Largeur Piece]) ;
  60:   ;
  61:  //IF ((R[30:Offset OP20]=248)),PR[99,2:PR mobil]=(PR[99,2:PR mobil]-1.9) ;
  62:   ;
  63:   ;
  64:   ;
  65:  !Calcul Decallage Z ;
  66:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  67:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  68:   ;
  69:  R[26:Calcul]=(R[37:Hauteur Piece]-35) ;
  70:   ;
  71:  PR[100,3:Décallage]=((PR[100,3:Décallage]+R[26:Calcul])) ;
  72:   ;
  73:  LBL[99] ;
/POS
P[1:"Pose Reference"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   265.171  mm,	Y =    51.800  mm,	Z =   -44.406  mm,
	W =  -178.986 deg,	P =    -3.999 deg,	R =   -90.784 deg
};
/END
