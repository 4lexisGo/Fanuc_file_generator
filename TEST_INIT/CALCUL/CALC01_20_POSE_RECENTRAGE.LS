/PROG  CALC01_20_POSE_RECENTRAGE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc pose MACHI";
PROG_SIZE	= 1279;
CREATE		= DATE 25-07-31  TIME 16:30:00;
MODIFIED	= DATE 25-10-07  TIME 23:39:24;
FILE_NAME	= CALC01_3;
VERSION		= 0;
LINE_COUNT	= 33;
MEMORY_SIZE	= 1779;
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
   2:  !///calcule pose recentrage////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:  UFRAME_NUM=1 ;
   8:  UTOOL_NUM=3 ;
   9:   ;
  10:  !////////P Pose/////////////// ;
  11:  !Baser sur la grande prise ;
  12:J P[1:Pose Reference] 100% FINE    ;
  13:  !Note ;
  14:  !Point effectue avec une piece ;
  15:  !Dimension ;
  16:  !Longueur = 958 ;
  17:  !Largeur = 338 ;
  18:  !Epaisseur = 35 ;
  19:   ;
  20:  LBL[1] ;
  21:  !Calcul point de prise ;
  22:  !Attribution du point d'origine ;
  23:  !Au point de calcul ;
  24:  PR[99:PR mobil]=P[1:Pose Reference]    ;
  25:   ;
  26:   ;
  27:  !Calcul Decallage Z ;
  28:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(0) ;
  29:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=((-25)) ;
  30:   ;
  31:  R[26:Calcul]=(R[37:Hauteur Piece]-35) ;
  32:   ;
  33:  PR[100,3:Décallage]=((PR[100,3:Décallage]+R[26:Calcul])) ;
/POS
P[1:"Pose Reference"]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   290.158  mm,	Y =   530.198  mm,	Z =    10.221  mm,
	W =   168.165 deg,	P =     1.278 deg,	R =  -153.685 deg
};
/END
