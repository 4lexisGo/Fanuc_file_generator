/PROG  INIT_sab954.LS
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
   2:  !programme référence sab954    ;
   3:      ;
   4:  SELECT R[99]=0.5,JMP LBL[999]    ;
   5:         =1.5,JMP LBL[1]    ;
   6:         =2.5,JMP LBL[2]    ;
   7:         =3.5,JMP LBL[3]    ;
   8:         =4.5,JMP LBL[4]    ;
   9:         =5.5,JMP LBL[5]    ;
  10:         =6.5,JMP LBL[6]    ;
  11:         =7.5,JMP LBL[7]    ;
  12:         =8.5,JMP LBL[8]    ;
  13:         =9.5,JMP LBL[9]    ;
  14:      ;
  15:  LBL[998]    ;
  16:      ;
  17:  SELECT R[99]=1,JMP LBL[999]    ;
  18:         =2,JMP LBL[1]    ;
  19:         =3,JMP LBL[2]    ;
  20:         =4,JMP LBL[3]    ;
  21:         =5,JMP LBL[4]    ;
  22:         =6,JMP LBL[5]    ;
  23:         =7,JMP LBL[6]    ;
  24:         =8,JMP LBL[7]    ;
  25:         =9,JMP LBL[999]    ;
  26:      ;
  27:  GO[1]=32    ;
  28:  PAUSE    ;
  29:  GO[1]=0    ;
  30:  JMP LBL[998]    ;
  31:      ;
  32:  !Début des trajectoires    ;
  33:      ;
  34:  LBL[1]    ;
  35:  PR[100,1:Offset]=(-100)    ;
  36:  PR[100,3:Offset]=(-100)    ;
  37:  R[99]=0.5    ;
  38:L P[2:Prise cloueur] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  39:  R[99]=1    ;
  40:  JMP LBL[998]    ;
  41:      ;
  42:  LBL[2]    ;
  43:  PR[100,1:Offset]=0    ;
  44:  R[99]=1.5    ;
  45:L P[2:Prise cloueur] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  46:  R[99]=2    ;
  47:  JMP LBL[998]    ;
  48:      ;
  49:  LBL[3]    ;
  50:  R[99]=2.5    ;
  51:L P[2:Prise cloueur] 100mm/sec FINE    ;
  52:  R[99]=3    ;
  53:  JMP LBL[998]    ;
  54:      ;
  55:  LBL[4]    ;
  56:  PR[100,3:Offset]=(-30)    ;
  57:  R[99]=3.5    ;
  58:L P[2:Prise cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  59:  R[99]=4    ;
  60:  JMP LBL[998]    ;
  61:      ;
  62:  LBL[5]    ;
  63:  PR[100,1:Offset]=(-500)    ;
  64:  PR[100,2:Offset]=(-10)    ;
  65:  R[99]=4.5    ;
  66:L P[2:Prise cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  67:  R[99]=5    ;
  68:  JMP LBL[998]    ;
  69:      ;
  70:  LBL[6]    ;
  71:  PR[100,5:Offset]=(-10)    ;
  72:  R[99]=5.5    ;
  73:L P[2:Prise cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  74:  R[99]=6    ;
  75:  JMP LBL[998]    ;
  76:      ;
  77:  LBL[7]    ;
  78:  PR[100,1:Offset]=(-600)    ;
  79:  PR[100,5:Offset]=(-20)    ;
  80:  R[99]=6.5    ;
  81:L P[2:Prise cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  82:  R[99]=7    ;
  83:  JMP LBL[998]    ;
  84:      ;
  85:  LBL[8]    ;
  86:  PR[100,3:Offset]=(-100)    ;
  87:  R[99]=7.5    ;
  88:L P[2:Prise cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  89:  R[99]=8    ;
  90:  JMP LBL[998]    ;
  91:      ;
  92:  LBL[9]    ;
  93:  PR[100,1:Offset]=(-800)    ;
  94:  R[99]=8.5    ;
  95:L P[2:Prise cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  96:  R[99]=9    ;
  97:  JMP LBL[998]    ;
  98:      ;
  99:  !Fin des trajectoires    ;
 100:  LBL[999]    ;
/POS
P[2:"Prise cloueur"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2726.847  mm,	Y =   352.711  mm,	Z =  1085.330  mm,
	W =     -.117 deg,	P =    40.079 deg,	R =     1.224 deg
};
/END
