/PROG  CALC01_60_POSE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc pos inter";
PROG_SIZE	= 1515;
CREATE		= DATE 25-05-19  TIME 08:24:14;
MODIFIED	= DATE 25-11-17  TIME 22:36:40;
FILE_NAME	= CALC01_4;
VERSION		= 0;
LINE_COUNT	= 50;
MEMORY_SIZE	= 1947;
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

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
   1:  !//////////////////////////////// ;
   2:  !///////calcule palette////////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:  UFRAME_NUM=2 ;
   8:  UTOOL_NUM=2 ;
   9:   ;
  10:  !////////Palette 1/////////////// ;
  11:   ;
  12:J P[1:Palette 1] 100% FINE    ;
  13:   ;
  14:  !////////Palette 2/////////////// ;
  15:   ;
  16:J P[2:Palette 2 ] 100% FINE    ;
  17:   ;
  18:  LBL[1] ;
  19:  !Calcul point de pose ;
  20:  !Choix palette  ;
  21:  SELECT R[43:Palette actu ]=1,JMP LBL[10] ;
  22:         =2,JMP LBL[20] ;
  23:   ;
  24:  !Calcul point pose palette 1 ;
  25:  LBL[10] ;
  26:  PR[99:PR mobil]=P[1:Palette 1]    ;
  27:  JMP LBL[99] ;
  28:   ;
  29:  !Calcul point pose palette 2 ;
  30:  LBL[20] ;
  31:  PR[99:PR mobil]=P[2:Palette 2 ]    ;
  32:  JMP LBL[99] ;
  33:   ;
  34:  LBL[99] ;
  35:  IF GI[5:0:Niveau palette]=0,JMP LBL[999] ;
  36:   ;
  37:  !Calcul Hauteur ;
  38:  R[63:Resultat hauteur]=((R[37:Hauteur Piece]+R[62:Epaisseur thermo])*R[41:Niveau pal]) ;
  39:   ;
  40:  !Decalage hauteur de pose ;
  41:  !Recuperation point calculer ;
  42:  !Ajout hauteur calculer ;
  43:  PR[99,3:PR mobil]=(PR[99,3:PR mobil]+R[63:Resultat hauteur]) ;
  44:  LBL[999] ;
  45:   ;
  46:   ;
  47:   ;
  48:   ;
  49:   ;
  50:   ;
/POS
P[1:"Palette 1"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   825.000  mm,	Y =   562.477  mm,	Z =    46.790  mm,
	W =  -179.894 deg,	P =      .257 deg,	R =   178.444 deg
};
P[2:"Palette 2 "]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   799.480  mm,	Y =  1709.552  mm,	Z =    53.837  mm,
	W =   177.791 deg,	P =      .409 deg,	R =   178.666 deg
};
/END
