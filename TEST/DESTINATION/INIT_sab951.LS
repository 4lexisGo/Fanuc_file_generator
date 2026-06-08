/PROG  INIT_sab951.LS
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
   2:  !programme référence sab951    ;
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
  27:  PR[100,1:Offset]=(-1000)    ;
  28:  PR[100,2:Offset]=((-10))    ;
  29:  PR[100,3:Offset]=(-70)    ;
  30:  R[99]=0.5    ;
  31:L P[2] 100mm/sec FINE Offset,PR[100:Offset]    ;
  32:  R[99]=1    ;
  33:  JMP LBL[998]    ;
  34:      ;
  35:  LBL[2]    ;
  36:  PR[100,1:Offset]=0    ;
  37:  R[99]=1.5    ;
  38:L P[2] 100mm/sec FINE Offset,PR[100:Offset]    ;
  39:  R[99]=2    ;
  40:  JMP LBL[998]    ;
  41:      ;
  42:  LBL[3]    ;
  43:  PR[100,2:Offset]=0    ;
  44:  R[99]=2.5    ;
  45:L P[2] 100mm/sec FINE Offset,PR[100:Offset]    ;
  46:  R[99]=3    ;
  47:  JMP LBL[998]    ;
  48:      ;
  49:  LBL[4]    ;
  50:  R[99]=3.5    ;
  51:L P[2] 100mm/sec FINE    ;
  52:  R[99]=4    ;
  53:  JMP LBL[998]    ;
  54:      ;
  55:  LBL[5]    ;
  56:  PR[100,3:Offset]=(-150)    ;
  57:  R[99]=4.5    ;
  58:L P[2] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  59:  R[99]=5    ;
  60:  JMP LBL[998]    ;
  61:      ;
  62:  !Fin des trajectoires    ;
  63:  LBL[999]    ;
/POS
P[2]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2642.652  mm,	Y =   351.198  mm,	Z =   597.472  mm,
	W =     -.095 deg,	P =    19.856 deg,	R =     1.268 deg
};
/END
