/PROG  CALC01_21
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc prise MACHI";
PROG_SIZE	= 1431;
CREATE		= DATE 25-10-23  TIME 15:26:14;
MODIFIED	= DATE 25-11-04  TIME 16:36:40;
FILE_NAME	= CALC01_2;
VERSION		= 0;
LINE_COUNT	= 45;
MEMORY_SIZE	= 1883;
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
   8:  UTOOL_NUM=1 ;
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
  21:  !-216 ;
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
  41:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]-216) ;
  42:   ;
  43:  PR[99,2:PR mobil]=(PR[99,2:PR mobil]+R[29:Offset OP10]) ;
  44:   ;
  45:  LBL[99] ;
/POS
P[1:"Pose Reference"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    29.348  mm,	Y =   313.965  mm,	Z =  -100.000  mm,
	W =   178.885 deg,	P =    -3.276 deg,	R =     -.150 deg
};
/END
