/PROG  CALC01_20_PRISE_MACHINE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc prise MACHI";
PROG_SIZE	= 1603;
CREATE		= DATE 25-07-30  TIME 14:55:50;
MODIFIED	= DATE 25-10-15  TIME 15:51:38;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 52;
MEMORY_SIZE	= 2027;
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
   2:  !///calcule prise machine OP10/// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:  UFRAME_NUM=6 ;
   8:  UTOOL_NUM=3 ;
   9:   ;
  10:  !////////P Prise/////////////// ;
  11:  !Baser sur la grande prise ;
  12:J P[1:Pose Reference] 100% FINE    ;
  13:  !Note ;
  14:  !Point effectue avec une piece ;
  15:  !Dimension ;
  16:  !Longueur = 605 ;
  17:  !Largeur = 493 ;
  18:  !Epaisseur = 35 ;
  19:   ;
  20:  !OFFSET PRISE OP10 ;
  21:  !-216.5 ;
  22:   ;
  23:  LBL[1] ;
  24:  !Calcul point de prise ;
  25:  !Attribution du point d'origine ;
  26:  !Au point de calcul ;
  27:  PR[99:PR mobil]=P[1:Pose Reference]    ;
  28:   ;
  29:  IF (R[36:Largeur Piece]<=550 AND R[36:Largeur Piece]>=260),JMP LBL[10] ;
  30:   ;
  31:  !Alarme ;
  32:  GO[1:0:Alarme]=10 ;
  33:  PAUSE ;
  34:  JMP LBL[1] ;
  35:   ;
  36:  LBL[10] ;
  37:   ;
  38:  !Calcul Offset ;
  39:   ;
  40:  !Calcul position X ;
  41:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]-216.5) ;
  42:   ;
  43:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]+R[29:Offset OP10]) ;
  44:   ;
  45:  !Calcul Decallage Z ;
  46:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  47:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  48:   ;
  49:  R[26:Calcul]=(R[37:Hauteur Piece]-35) ;
  50:   ;
  51:  PR[100,3:Décallage]=((PR[100,3:Décallage]+R[26:Calcul])*(-1)) ;
  52:  LBL[99] ;
/POS
P[1:"Pose Reference"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   184.968  mm,	Y =    59.000  mm,	Z =  -201.673  mm,
	W =  -179.791 deg,	P =    -3.824 deg,	R =   179.192 deg
};
/END
