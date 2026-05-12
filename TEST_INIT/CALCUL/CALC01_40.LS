/PROG  CALC01_40
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Calc appro inter";
PROG_SIZE	= 1192;
CREATE		= DATE 25-04-30  TIME 08:06:42;
MODIFIED	= DATE 25-07-31  TIME 18:37:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 36;
MEMORY_SIZE	= 1680;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  !//////////////////////////////// ;
   2:  !///////calcule palette////////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:  UFRAME_NUM=3 ;
   8:  UTOOL_NUM=2 ;
   9:   ;
  10:  !////////Palette 2/////////////// ;
  11:   ;
  12:J P[1:Palette 2] 100% FINE    ;
  13:   ;
  14:  !////////Palette 1/////////////// ;
  15:   ;
  16:J P[2:Palette 1 ] 100% FINE    ;
  17:   ;
  18:  LBL[1] ;
  19:  !Calcul point de pose ;
  20:  !Choix palette  ;
  21:  SELECT R[43:Palette actu ]=1,JMP LBL[20] ;
  22:         =2,JMP LBL[10] ;
  23:   ;
  24:  !Calcul point pose palette 2 ;
  25:  LBL[10] ;
  26:  PR[99:PR mobil]=P[1:Palette 2]    ;
  27:  R[56:Calcul repere st]=3    ;
  28:  JMP LBL[99] ;
  29:   ;
  30:  !Calcul point pose palette 1 ;
  31:  LBL[20] ;
  32:  PR[99:PR mobil]=P[2:Palette 1 ]    ;
  33:  R[56:Calcul repere st]=7    ;
  34:  JMP LBL[99] ;
  35:   ;
  36:  LBL[99] ;
/POS
P[1:"Palette 2"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.676  mm,	Y =  2210.039  mm,	Z =  2515.769  mm,
	W =  -105.410 deg,	P =    87.405 deg,	R =   -15.323 deg
};
P[2:"Palette 1 "]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.645  mm,	Y =  1207.460  mm,	Z =  2515.648  mm,
	W =  -105.488 deg,	P =    87.406 deg,	R =   -15.399 deg
};
/END
