/PROG  INIT_sab01_41.LS
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
   2:  !programme référence sab01_41    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:      ;
  11:  LBL[998]    ;
  12:      ;
  13:  SELECT R[99]=1,JMP LBL[999]    ;
  14:         =2,JMP LBL[1]    ;
  15:         =3,JMP LBL[2]    ;
  16:         =4,JMP LBL[3]    ;
  17:         =5,JMP LBL[999]    ;
  18:      ;
  19:  GO[1]=32    ;
  20:  PAUSE    ;
  21:  GO[1]=0    ;
  22:  JMP LBL[998]    ;
  23:      ;
  24:  !Début des trajectoires    ;
  25:      ;
  26:  LBL[1]    ;
  27:  !Approche posage    ;
  28:  R[99]=0.5    ;
  29:J P[1:App] 10% FINE    ;
  30:  R[99]=1    ;
  31:  JMP LBL[998]    ;
  32:      ;
  33:  LBL[2]    ;
  34:  PR[100,3:Offset]=(-50)    ;
  35:  R[99]=1.5    ;
  36:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  37:  R[99]=2    ;
  38:  JMP LBL[998]    ;
  39:      ;
  40:  LBL[3]    ;
  41:  R[99]=2.5    ;
  42:L P[3:Point prise] 100mm/sec FINE    ;
  43:  R[99]=3    ;
  44:  JMP LBL[998]    ;
  45:      ;
  46:  LBL[4]    ;
  47:  PR[100,3:Offset]=(-200)    ;
  48:  R[99]=3.5    ;
  49:L P[3:Point prise] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  50:  R[99]=4    ;
  51:  JMP LBL[998]    ;
  52:      ;
  53:  LBL[5]    ;
  54:  !Approche posage    ;
  55:  R[99]=4.5    ;
  56:J P[1:App] 10% FINE    ;
  57:  R[99]=5    ;
  58:  JMP LBL[998]    ;
  59:      ;
  60:  !Fin des trajectoires    ;
  61:  LBL[999]    ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2198.716  mm,	Y =  -354.530  mm,	Z =   -54.537  mm,
	W =   178.088 deg,	P =      .708 deg,	R =    63.066 deg
};
P[3:"Point prise"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2324.205  mm,	Y =  -555.233  mm,	Z =  -367.376  mm,
	W =   179.403 deg,	P =     -.515 deg,	R =    63.059 deg
};
/END
