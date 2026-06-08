/PROG  INIT_sab01_52.LS
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
   2:  !programme référence sab01_52    ;
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
  31:J P[1:App] 10% FINE    ;
  32:  R[99]=1    ;
  33:  JMP LBL[998]    ;
  34:      ;
  35:  LBL[2]    ;
  36:  PR[100,3:Offset]=(-100)    ;
  37:  PR[100,2:Offset]=(-10)    ;
  38:  R[99]=1.5    ;
  39:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  40:  R[99]=2    ;
  41:  JMP LBL[998]    ;
  42:      ;
  43:  LBL[3]    ;
  44:  PR[100,3:Offset]=0    ;
  45:  R[99]=2.5    ;
  46:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  47:  R[99]=3    ;
  48:  JMP LBL[998]    ;
  49:      ;
  50:  LBL[4]    ;
  51:  R[99]=3.5    ;
  52:L P[3:Point prise] 100mm/sec FINE    ;
  53:  R[99]=4    ;
  54:  JMP LBL[998]    ;
  55:      ;
  56:  LBL[5]    ;
  57:  PR[100,2:Offset]=0    ;
  58:  PR[100,3:Offset]=(-150)    ;
  59:  R[99]=4.5    ;
  60:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  61:  R[99]=5    ;
  62:  JMP LBL[998]    ;
  63:      ;
  64:  LBL[6]    ;
  65:  !Approche posage    ;
  66:  R[99]=5.5    ;
  67:J P[1:App] 10% FINE    ;
  68:  R[99]=6    ;
  69:  JMP LBL[998]    ;
  70:      ;
  71:  !Fin des trajectoires    ;
  72:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1940.471  mm,	Y =  1518.564  mm,	Z =  -132.979  mm,
	W =   179.765 deg,	P =     -.588 deg,	R =   -28.056 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 2, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1944.429  mm,	Y =  1526.702  mm,	Z =  -905.745  mm,
	W =   179.740 deg,	P =     -.577 deg,	R =   -25.877 deg
};
/END
