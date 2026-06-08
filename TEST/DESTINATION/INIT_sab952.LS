/PROG  INIT_sab952.LS
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
   2:  !programme référence sab952    ;
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
  13:      ;
  14:  LBL[998]    ;
  15:      ;
  16:  SELECT R[99]=1,JMP LBL[999]    ;
  17:         =2,JMP LBL[1]    ;
  18:         =3,JMP LBL[2]    ;
  19:         =4,JMP LBL[3]    ;
  20:         =5,JMP LBL[4]    ;
  21:         =6,JMP LBL[5]    ;
  22:         =7,JMP LBL[6]    ;
  23:         =8,JMP LBL[999]    ;
  24:      ;
  25:  GO[1]=32    ;
  26:  PAUSE    ;
  27:  GO[1]=0    ;
  28:  JMP LBL[998]    ;
  29:      ;
  30:  !Début des trajectoires    ;
  31:      ;
  32:  LBL[1]    ;
  33:  PR[100,1:Offset]=(-800)    ;
  34:  PR[100,2:Offset]=(-10)    ;
  35:  PR[100,3:Offset]=(-100)    ;
  36:  PR[100,5:Offset]=(-20)    ;
  37:  R[99]=0.5    ;
  38:L P[2:Pose cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  39:  R[99]=1    ;
  40:  JMP LBL[998]    ;
  41:      ;
  42:  LBL[2]    ;
  43:  PR[100,1:Offset]=(-600)    ;
  44:  R[99]=1.5    ;
  45:L P[2:Pose cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  46:  R[99]=2    ;
  47:  JMP LBL[998]    ;
  48:      ;
  49:  LBL[3]    ;
  50:  PR[100,1:Offset]=(-500)    ;
  51:  PR[100,3:Offset]=(-30)    ;
  52:  PR[100,5:Offset]=(-10)    ;
  53:  R[99]=2.5    ;
  54:L P[2:Pose cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  55:  R[99]=3    ;
  56:  JMP LBL[998]    ;
  57:      ;
  58:  LBL[4]    ;
  59:  PR[100,1:Offset]=(-400)    ;
  60:  PR[100,5:Offset]=0    ;
  61:  R[99]=3.5    ;
  62:L P[2:Pose cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  63:  R[99]=4    ;
  64:  JMP LBL[998]    ;
  65:      ;
  66:  LBL[5]    ;
  67:  PR[100,1:Offset]=0    ;
  68:  PR[100,2:Offset]=0    ;
  69:  R[99]=4.5    ;
  70:L P[2:Pose cloueur] 100mm/sec FINE Offset,PR[100:Offset]    ;
  71:  R[99]=5    ;
  72:  JMP LBL[998]    ;
  73:      ;
  74:  LBL[6]    ;
  75:  R[99]=5.5    ;
  76:L P[2:Pose cloueur] 100mm/sec FINE    ;
  77:  R[99]=6    ;
  78:  JMP LBL[998]    ;
  79:      ;
  80:  LBL[7]    ;
  81:  PR[100,3:Offset]=(-100)    ;
  82:  R[99]=6.5    ;
  83:L P[2:Pose cloueur] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  84:  R[99]=7    ;
  85:  JMP LBL[998]    ;
  86:      ;
  87:  LBL[8]    ;
  88:  PR[100,1:Offset]=(-100)    ;
  89:  R[99]=7.5    ;
  90:L P[2:Pose cloueur] 100mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  91:  R[99]=8    ;
  92:  JMP LBL[998]    ;
  93:      ;
  94:  !Fin des trajectoires    ;
  95:  LBL[999]    ;
/POS
P[2:"Pose cloueur"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2726.847  mm,	Y =   352.711  mm,	Z =  1085.330  mm,
	W =     -.117 deg,	P =    40.079 deg,	R =     1.224 deg
};
/END
