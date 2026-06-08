/PROG  INIT_sab01_42.LS
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
   2:  !programme référence sab01_42    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:         =6.5,JMP LBL[6]    ;
  11:      ;
  12:  LBL[998]    ;
  13:      ;
  14:  SELECT R[99]=1,JMP LBL[999]    ;
  15:         =2,JMP LBL[1]    ;
  16:         =3,JMP LBL[2]    ;
  17:         =4,JMP LBL[3]    ;
  18:         =5,JMP LBL[4]    ;
  19:         =6,JMP LBL[999]    ;
  20:      ;
  21:  GO[1]=32    ;
  22:  PAUSE    ;
  23:  GO[1]=0    ;
  24:  JMP LBL[998]    ;
  25:      ;
  26:  !Début des trajectoires    ;
  27:      ;
  28:  LBL[1]    ;
  29:  !Approche posage    ;
  30:  R[99]=0.5    ;
  31:J P[1:App] R[28:Vitesse joue + P]% FINE    ;
  32:  R[99]=1    ;
  33:  JMP LBL[998]    ;
  34:      ;
  35:  LBL[2]    ;
  36:  R[99]=1.5    ;
  37:J P[2] R[28:Vitesse joue + P]% FINE    ;
  38:  R[99]=2    ;
  39:  JMP LBL[998]    ;
  40:      ;
  41:  LBL[3]    ;
  42:  PR[100,3:Offset]=(-100)    ;
  43:  R[99]=2.5    ;
  44:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  45:  R[99]=3    ;
  46:  JMP LBL[998]    ;
  47:      ;
  48:  LBL[4]    ;
  49:  R[99]=3.5    ;
  50:L P[3:Point prise] 100mm/sec FINE    ;
  51:  R[99]=4    ;
  52:  JMP LBL[998]    ;
  53:      ;
  54:  LBL[5]    ;
  55:  PR[100,3:Offset]=(-100)    ;
  56:  R[99]=4.5    ;
  57:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  58:  R[99]=5    ;
  59:  JMP LBL[998]    ;
  60:      ;
  61:  LBL[6]    ;
  62:  !Approche posage    ;
  63:  R[99]=5.5    ;
  64:J P[1:App] R[25:Vitesse general]% FINE    ;
  65:  R[99]=6    ;
  66:  JMP LBL[998]    ;
  67:      ;
  68:  !Fin des trajectoires    ;
  69:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   773.505  mm,	Y =   756.200  mm,	Z =   -75.520  mm,
	W =   162.252 deg,	P =    10.676 deg,	R =   153.258 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   908.762  mm,	Y =  1044.087  mm,	Z =  -242.131  mm,
	W =  -179.957 deg,	P =     2.171 deg,	R =   153.675 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 2, UT : 1,	
	J1=    38.021 deg,	J2=    71.314 deg,	J3=   -40.004 deg,
	J4=      .574 deg,	J5=   -50.086 deg,	J6=   145.670 deg
};
/END
