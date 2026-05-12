/PROG  CALC01_11
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc prise MACHI";
PROG_SIZE	= 1447;
CREATE		= DATE 25-10-23  TIME 15:23:46;
MODIFIED	= DATE 25-11-04  TIME 16:17:54;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 47;
MEMORY_SIZE	= 1891;
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
   8:  UTOOL_NUM=1 ;
   9:   ;
  10:  !////////P Prise/////////////// ;
  11:  !Baser sur la grande prise ;
  12:J P[1:Soufflage refe] 100% FINE    ;
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
  28:  PR[99:PR mobil]=P[1:Soufflage refe]    ;
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
  46:   ;
  47:  LBL[99] ;
/POS
P[1:"Soufflage refe"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   -29.482  mm,	Y =   333.595  mm,	Z =    32.000  mm,
	W =   178.286 deg,	P =    -1.508 deg,	R =     -.341 deg
};
/END
