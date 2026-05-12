/PROG  CALC01_50_POSE_MACHINE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc pose MACHI";
PROG_SIZE	= 1681;
CREATE		= DATE 25-07-30  TIME 15:09:12;
MODIFIED	= DATE 25-12-08  TIME 18:40:48;
FILE_NAME	= CALC01_3;
VERSION		= 0;
LINE_COUNT	= 56;
MEMORY_SIZE	= 2089;
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
   2:  !///calcule pose machine OP10/// ;
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
  20:  !OFFSET OP10 ;
  21:  !-216 ;
  22:  !Reglage prise ;
  23:  !18 ;
  24:   ;
  25:  LBL[1] ;
  26:  !Calcul point de prise ;
  27:  !Attribution du point d'origine ;
  28:  !Au point de calcul ;
  29:  PR[99:PR mobil]=P[1:Pose Reference]    ;
  30:   ;
  31:  IF (R[36:Largeur Piece]<=550 AND R[36:Largeur Piece]>=260),JMP LBL[10] ;
  32:   ;
  33:  !Alarme ;
  34:  GO[1:0:Alarme]=10 ;
  35:  PAUSE ;
  36:  JMP LBL[1] ;
  37:   ;
  38:  LBL[10] ;
  39:   ;
  40:  !Calcul Offset ;
  41:   ;
  42:  !Calcul position X ;
  43:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]-216) ;
  44:   ;
  45:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]+R[29:Offset OP10]) ;
  46:   ;
  47:  IF ((R[29:Offset OP10]=216)),PR[99,2:PR mobil]=(PR[99,2:PR mobil]-.5) ;
  48:   ;
  49:  !Calcul Decallage Z ;
  50:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  51:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  52:   ;
  53:  R[26:Calcul]=(R[37:Hauteur Piece]-35) ;
  54:   ;
  55:  PR[100,3:Décallage]=((PR[100,3:Décallage]+R[26:Calcul])*(-1)) ;
  56:  LBL[99] ;
/POS
P[1:"Pose Reference"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   187.766  mm,	Y =    58.900  mm,	Z =  -194.643  mm,
	W =  -179.353 deg,	P =    -3.956 deg,	R =   179.156 deg
};
/END
