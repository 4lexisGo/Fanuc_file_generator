/PROG  CALC01_10_PRISE_MACHINE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc prise MACHI";
PROG_SIZE	= 1593;
CREATE		= DATE 25-07-30  TIME 14:24:38;
MODIFIED	= DATE 25-10-28  TIME 22:04:20;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 53;
MEMORY_SIZE	= 2013;
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
   2:  !///calcule prise machine OP20/// ;
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
  13:   ;
  14:  !Note ;
  15:  !Point effectue avec une piece ;
  16:  !Dimension ;
  17:  !Longueur = 605 ;
  18:  !Largeur = 493 ;
  19:  !Epaisseur = 35 ;
  20:   ;
  21:  !OFFSET PRISE OP20 ;
  22:  !-248 ;
  23:   ;
  24:  LBL[1] ;
  25:  !Calcul point de prise ;
  26:  !Attribution du point d'origine ;
  27:  !Au point de calcul ;
  28:  PR[99:PR mobil]=P[1:Prise Reference]    ;
  29:   ;
  30:  IF (R[36:Largeur Piece]<=550 AND R[36:Largeur Piece]>=260),JMP LBL[10] ;
  31:   ;
  32:  !Alarme ;
  33:  GO[1:0:Alarme]=10 ;
  34:  PAUSE ;
  35:  JMP LBL[1] ;
  36:   ;
  37:  LBL[10] ;
  38:   ;
  39:  !Calcul Offset ;
  40:   ;
  41:  !Calcul position X ;
  42:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]-248.5) ;
  43:   ;
  44:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]+R[30:Offset OP20]) ;
  45:   ;
  46:  !Calcul Decallage Z ;
  47:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(30) ;
  48:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  49:   ;
  50:  R[26:Calcul]=(R[37:Hauteur Piece]-35) ;
  51:   ;
  52:  PR[100,3:Décallage]=((PR[100,3:Décallage]+R[26:Calcul])*(-1)) ;
  53:  LBL[99] ;
/POS
P[1:"Prise Reference"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   274.518  mm,	Y =   262.000  mm,	Z =   -47.463  mm,
	W =   179.908 deg,	P =    -4.093 deg,	R =    89.075 deg
};
/END
