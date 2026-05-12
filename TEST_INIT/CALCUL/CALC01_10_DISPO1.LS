/PROG  CALC01_10_DISPO1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Disposition 1";
PROG_SIZE	= 1088;
CREATE		= DATE 25-05-05  TIME 08:02:06;
MODIFIED	= DATE 25-09-01  TIME 17:08:04;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 32;
MEMORY_SIZE	= 1592;
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
   1:  !Saut des points enregistrer ;
   2:  JMP LBL[1] ;
   3:  UFRAME_NUM=2 ;
   4:  UTOOL_NUM=3 ;
   5:   ;
   6:  !Disposition 1 ;
   7:  !Une piece au centre ;
   8:   ;
   9:  !////////Palette 1/////////////// ;
  10:   ;
  11:J P[1:Point au centre] 100% FINE    ;
  12:  !////////Palette 2/////////////// ;
  13:   ;
  14:J P[2:Point au centre] 100% FINE    ;
  15:   ;
  16:  JMP LBL[1] ;
  17:  !Calcul point de pose ;
  18:  !Choix palette  ;
  19:  SELECT R[43:Palette actu ]=1,JMP LBL[10] ;
  20:         =2,JMP LBL[20] ;
  21:   ;
  22:  !Calcul point pose palette 1 ;
  23:  LBL[10] ;
  24:  PR[99:PR mobil]=P[1:Point au centre]    ;
  25:  JMP LBL[99] ;
  26:   ;
  27:  !Calcul point pose palette 2 ;
  28:  LBL[20] ;
  29:  PR[99:PR mobil]=P[2:Point au centre]    ;
  30:  JMP LBL[99] ;
  31:   ;
  32:  LBL[99] ;
/POS
P[1:"Point au centre"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   955.780  mm,	Y =   449.920  mm,	Z =    42.382  mm,
	W =  -179.790 deg,	P =    -3.651 deg,	R =   -88.838 deg
};
P[2:"Point au centre"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   539.031  mm,	Y =  1842.134  mm,	Z =    41.112  mm,
	W =  -179.818 deg,	P =    -5.086 deg,	R =    90.611 deg
};
/END
