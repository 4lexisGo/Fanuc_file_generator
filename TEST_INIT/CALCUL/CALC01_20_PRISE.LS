/PROG  CALC01_20_PRISE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc prise Machi";
PROG_SIZE	= 1327;
CREATE		= DATE 25-07-18  TIME 16:51:40;
MODIFIED	= DATE 25-08-01  TIME 14:42:56;
FILE_NAME	= CALC01_3;
VERSION		= 0;
LINE_COUNT	= 39;
MEMORY_SIZE	= 1803;
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
  21:  !Calcul point de pose ;
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
  36:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=((-30)) ;
  37:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  38:   ;
  39:  LBL[99] ;
/POS
P[1:"Prise Reference"]{
   GP1:
	UF : 6, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  -493.397  mm,	Y =   246.874  mm,	Z =   -15.287  mm,
	W =    -5.801 deg,	P =   -87.101 deg,	R =     6.953 deg
};
/END
