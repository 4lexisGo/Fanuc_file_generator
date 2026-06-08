/PROG  INIT_sab01_51.LS
/ATTR
OWNER	   = ;
COMMENT  = "Génération auto";
CREATE   = DATE 26-06-05  TIME 10:06:19;
MODIFIED = DATE 26-06-05  TIME 10:06:19;
PROTECT  = READ_WRITE;
TCD:   STACK_SIZE	    = 0,
       TASK_PRIORITY	= 50,
       TIME_SLICE     = 0,
       BUSY_LAMP_OFF	= 0,
       ABORT_REQUEST	= 0,
       PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
/APPL

AUTO_SINGULARITY_HEADER;    ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  !Init généré automatiquement    ;
   2:  !programme référence sab01_51    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:         =6.5,JMP LBL[6]    ;
  11:         =7.5,JMP LBL[7]    ;
  12:      ;
  13:  LBL[998]    ;
  14:      ;
  15:  SELECT R[99]=1,JMP LBL[999]    ;
  16:         =2,JMP LBL[1]    ;
  17:         =3,JMP LBL[2]    ;
  18:         =4,JMP LBL[3]    ;
  19:         =5,JMP LBL[4]    ;
  20:         =6,JMP LBL[5]    ;
  21:         =7,JMP LBL[999]    ;
  22:      ;
  23:  GO[1]=32    ;
  24:  PAUSE    ;
  25:  GO[1]=0    ;
  26:  JMP LBL[998]    ;
  27:      ;
  28:  !Début des trajectoires    ;
  29:      ;
  30:  LBL[1]    ;
  31:  !Approche posage    ;
  32:  R[99]=0.5    ;
  33:J P[1:App] R[25:Vitesse general]% FINE    ;
  34:  R[99]=1    ;
  35:  JMP LBL[998]    ;
  36:      ;
  37:  LBL[2]    ;
  38:  PR[100,2:Offset]=(-10)    ;
  39:  PR[100,3:Offset]=(-100)    ;
  40:  R[99]=1.5    ;
  41:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  42:  R[99]=2    ;
  43:  JMP LBL[998]    ;
  44:      ;
  45:  LBL[3]    ;
  46:  PR[100,3:Offset]=0    ;
  47:  R[99]=2.5    ;
  48:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  49:  R[99]=3    ;
  50:  JMP LBL[998]    ;
  51:      ;
  52:  LBL[4]    ;
  53:  R[99]=3.5    ;
  54:L P[3:Point prise] 100mm/sec FINE    ;
  55:  R[99]=4    ;
  56:  JMP LBL[998]    ;
  57:      ;
  58:  LBL[5]    ;
  59:  PR[100,2:Offset]=0    ;
  60:  PR[100,3:Offset]=(-200)    ;
  61:  R[99]=4.5    ;
  62:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  63:  R[99]=5    ;
  64:  JMP LBL[998]    ;
  65:      ;
  66:  LBL[6]    ;
  67:  !Approche posage    ;
  68:  R[99]=5.5    ;
  69:J P[1:App] 10% FINE    ;
  70:  R[99]=6    ;
  71:  JMP LBL[998]    ;
  72:      ;
  73:  LBL[7]    ;
  74:  R[99]=6.5    ;
  75:J P[2] 10% FINE    ;
  76:  R[99]=7    ;
  77:  JMP LBL[998]    ;
  78:      ;
  79:  !Fin des trajectoires    ;
  80:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  2351.959  mm,	Y =  -547.248  mm,	Z =   -23.870  mm,
	W =  -179.576 deg,	P =     -.438 deg,	R =   -91.277 deg
};
P[2]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1481.987  mm,	Y =  -449.737  mm,	Z =   -58.917  mm,
	W =  -141.932 deg,	P =     1.375 deg,	R =   -91.313 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  2345.067  mm,	Y =  -550.002  mm,	Z =  -392.395  mm,
	W =  -179.554 deg,	P =     -.443 deg,	R =   -91.277 deg
};
/END
