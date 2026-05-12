/PROG  CALC01_50_PRISE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc prise recen";
PROG_SIZE	= 1331;
CREATE		= DATE 25-07-17  TIME 16:48:52;
MODIFIED	= DATE 25-10-15  TIME 16:54:04;
FILE_NAME	= CALC01_4;
VERSION		= 0;
LINE_COUNT	= 39;
MEMORY_SIZE	= 1807;
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
   8:  UTOOL_NUM=3 ;
   9:   ;
  10:  !////////P Prise/////////////// ;
  11:  !Baser sur la grande prise ;
  12:J P[1:Prise Reference] 100% FINE    ;
  13:  !Note ;
  14:  !Point effectue avec une piece ;
  15:  !Dimension ;
  16:  !Longueur = 605 ;
  17:  !Largeur = 493 ;
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
  36:  IF (R[36:Largeur Piece]<=410),PR[100,3:Décallage]=(25) ;
  37:  IF (R[36:Largeur Piece]>410),PR[100,3:Décallage]=(0) ;
  38:   ;
  39:  LBL[99] ;
/POS
P[1:"Prise Reference"]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 1',
	X =   289.334  mm,	Y =   524.631  mm,	Z =    35.528  mm,
	W =   168.645 deg,	P =      .387 deg,	R =  -152.727 deg
};
/END
