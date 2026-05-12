/PROG  CALC01_40_POSER
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc pose recent";
PROG_SIZE	= 1353;
CREATE		= DATE 25-05-19  TIME 08:27:20;
MODIFIED	= DATE 25-10-27  TIME 18:58:14;
FILE_NAME	= CALC01_4;
VERSION		= 0;
LINE_COUNT	= 41;
MEMORY_SIZE	= 1821;
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
   2:  !/////calcule pose recentrage//// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:  UFRAME_NUM=1 ;
   8:  UTOOL_NUM=2 ;
   9:   ;
  10:  !////////P Origine/////////////// ;
  11:   ;
  12:J P[1:Pose Reference] 100% FINE    ;
  13:  !Note ;
  14:  !Point effectue avec une piece ;
  15:  !Dimension ;
  16:  R[131:X Reference]=605    ;
  17:  R[132:Y Reference]=493    ;
  18:  R[130:Z Reference]=35    ;
  19:   ;
  20:  LBL[1] ;
  21:  !Calcul point de pose ;
  22:  !Attribution du point d'origine ;
  23:  !Au point de calcul ;
  24:  PR[99:PR mobil]=P[1:Pose Reference]    ;
  25:   ;
  26:  !Calcul Offset ;
  27:  !Calcul X pose ;
  28:  R[134:Decalage tool X]=((R[131:X Reference]/2)-(R[35:Longueur Piece]/2)) ;
  29:   ;
  30:  !Calcul Y pose ;
  31:  R[135:Decalage tool Y]=((R[132:Y Reference]/2)-(R[36:Largeur Piece]/2)) ;
  32:   ;
  33:  !Calcul Z pose ;
  34:  R[136:Decalage tool Z]=(R[130:Z Reference]-R[37:Hauteur Piece]) ;
  35:   ;
  36:  !Calcul offeset ;
  37:  PR[70,1:Offset recentrag]=R[134:Decalage tool X]*(-1)    ;
  38:  PR[70,2:Offset recentrag]=R[135:Decalage tool Y]    ;
  39:  PR[70,3:Offset recentrag]=R[136:Decalage tool Z]    ;
  40:   ;
  41:  LBL[99] ;
/POS
P[1:"Pose Reference"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   422.677  mm,	Y =   562.580  mm,	Z =    45.544  mm,
	W =  -174.691 deg,	P =    12.224 deg,	R =   -62.812 deg
};
/END
