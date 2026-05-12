/PROG  CALC01_10_PRISE	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc prise recen";
PROG_SIZE	= 1393;
CREATE		= DATE 25-07-23  TIME 14:51:34;
MODIFIED	= DATE 25-08-01  TIME 14:43:26;
FILE_NAME	= CALC01_2;
VERSION		= 0;
LINE_COUNT	= 42;
MEMORY_SIZE	= 1857;
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
   2:  !/////calcule prise machine/// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:  UFRAME_NUM=6 ;
   8:  UTOOL_NUM=3 ;
   9:   ;
  10:  !////////P Prise/////////////// ;
  11:  !Baser sur la grande prise ;
  12:J P[1:Prise Reference] 100% FINE    ;
  13:  !Note ;
  14:  !Point effectue avec une piece ;
  15:  !Dimension ;
  16:  !Longueur = 605 ;
  17:  !Largeur = 495 ;
  18:  !Epaisseur = 35 ;
  19:   ;
  20:  LBL[1] ;
  21:  !Calcul point de prise ;
  22:  !Attribution du point d'origine ;
  23:  !Au point de calcul ;
  24:  PR[99:PR mobil]=P[1:Prise Reference]    ;
  25:   ;
  26:  IF (R[36:Largeur Piece]<=550 AND R[36:Largeur Piece]>=260),JMP LBL[10] ;
  27:   ;
  28:  !Alarme ;
  29:  GO[1:0:Alarme]=10 ;
  30:  PAUSE ;
  31:  JMP LBL[1] ;
  32:   ;
  33:  LBL[10] ;
  34:   ;
  35:  !Calcul Offset ;
  36:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(30) ;
  37:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  38:   ;
  39:  R[26:Calcul]=(R[37:Hauteur Piece]-35) ;
  40:   ;
  41:  PR[100,3:Décallage]=((PR[100,3:Décallage]+R[26:Calcul])*(-1)) ;
  42:  LBL[99] ;
/POS
P[1:"Prise Reference"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =  -489.799  mm,	Y =   449.939  mm,	Z =  -200.324  mm,
	W =   -89.610 deg,	P =     -.256 deg,	R =    86.469 deg
};
/END
