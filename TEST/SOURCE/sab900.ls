/PROG  SAB900
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Changement outil";
PROG_SIZE	= 3500;
CREATE		= DATE 26-02-12  TIME 10:34:22;
MODIFIED	= DATE 26-05-29  TIME 16:51:40;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 172;
MEMORY_SIZE	= 4012;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
LOCAL_REGISTERS	= 0,0,0;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  !Gestion prehenseur ;
   2:   ;
   3:  !Raz PR100 ;
   4:  CALL RAZ_PR100    ;
   5:   ;
   6:  !Test si prehenseur deja sur le  ;
   7:  !robot ;
   8:  IF (R[31:Dmd outil]=R[32:Outil sur robot]),JMP LBL[99] ;
   9:   ;
  10:  LBL[2] ;
  11:  !Choix Uframe et Utool ;
  12:  UFRAME_NUM=0 ;
  13:  UTOOL_NUM=1 ;
  14:   ;
  15:  !Approche magasin ;
  16:J P[1:App] 100% CNT100    ;
  17:   ;
  18:  !Pose prehenseur ;
  19:  SELECT R[32:Outil sur robot]=1,JMP LBL[10] ;
  20:         =2,JMP LBL[20] ;
  21:         =0,JMP LBL[50] ;
  22:   ;
  23:   ;
  24:  LBL[10] ;
  25:  !Pose clouteuse ;
  26:   ;
  27:  !Choix Uframe et Utool ;
  28:  UFRAME_NUM=6 ;
  29:  UTOOL_NUM=2 ;
  30:   ;
  31:  PR[100,2:Offset]=(-50)    ;
  32:  PR[100,3:Offset]=500    ;
  33:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  34:   ;
  35:  !Test si magasin libre ;
  36:  CALL TEST2    ;
  37:   ;
  38:  PR[100,2:Offset]=(-50)    ;
  39:  PR[100,3:Offset]=200    ;
  40:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  41:   ;
  42:  PR[100,2:Offset]=0    ;
  43:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
  44:   ;
  45:L P[2:Point clouteur] 500mm/sec FINE    ;
  46:   ;
  47:  !Ouverture changeur ;
  48:  CALL OUV_CHANGEUR    ;
  49:  R[32:Outil sur robot]=0    ;
  50:   ;
  51:  PR[100,3:Offset]=(-100)    ;
  52:L P[2:Point clouteur] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  53:   ;
  54:  !Test si outil bien poser ;
  55:  CALL TEST1    ;
  56:   ;
  57:  JMP LBL[50] ;
  58:   ;
  59:  LBL[20] ;
  60:  !Pose pince ;
  61:   ;
  62:  !Choix Uframe et Utool ;
  63:  UFRAME_NUM=6 ;
  64:  UTOOL_NUM=3 ;
  65:   ;
  66:  PR[100,3:Offset]=(-200)    ;
  67:J P[3:Point pince] 66% FINE Tool_Offset,PR[100:Offset]    ;
  68:   ;
  69:  !Test si magasin libre ;
  70:  CALL TEST4    ;
  71:   ;
  72:L P[3:Point pince] 500mm/sec FINE    ;
  73:  !Ouverture changeur ;
  74:  CALL OUV_CHANGEUR    ;
  75:  R[32:Outil sur robot]=0    ;
  76:   ;
  77:  PR[100,3:Offset]=(-100)    ;
  78:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  79:   ;
  80:  !Test si outil bien poser ;
  81:  CALL TEST3    ;
  82:   ;
  83:  PR[100,3:Offset]=(-500)    ;
  84:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
  85:   ;
  86:  JMP LBL[50] ;
  87:   ;
  88:   ;
  89:  LBL[50] ;
  90:  !Prise outil ;
  91:  SELECT R[31:Dmd outil]=1,JMP LBL[60] ;
  92:         =2,JMP LBL[70] ;
  93:         =0,JMP LBL[98] ;
  94:   ;
  95:   ;
  96:  LBL[60] ;
  97:  !Prise clouteuse ;
  98:   ;
  99:  !Choix Uframe et Utool ;
 100:  UFRAME_NUM=6 ;
 101:  UTOOL_NUM=2 ;
 102:   ;
 103:  PR[100,3:Offset]=(-100)    ;
 104:L P[2:Point clouteur] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 105:  DO[30:Monter changeur]=OFF ;
 106:  !Test si presence outil  ;
 107:  CALL TEST1    ;
 108:   ;
 109:   ;
 110:L P[2:Point clouteur] 500mm/sec FINE    ;
 111:   ;
 112:  !Ouverture changeur ;
 113:  CALL FERM_CHANGEUR    ;
 114:  R[32:Outil sur robot]=1    ;
 115:   ;
 116:  PR[100,3:Offset]=100    ;
 117:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
 118:   ;
 119:  !Test si outil bien pris ;
 120:  CALL TEST2    ;
 121:   ;
 122:  PR[100,2:Offset]=(-50)    ;
 123:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
 124:   ;
 125:  PR[100,3:Offset]=500    ;
 126:L P[2:Point clouteur] 2000mm/sec FINE Offset,PR[100:Offset]    ;
 127:   ;
 128:  JMP LBL[98] ;
 129:   ;
 130:  LBL[70] ;
 131:  !Prise pince ;
 132:   ;
 133:  !Choix Uframe et Utool ;
 134:  UFRAME_NUM=6 ;
 135:  UTOOL_NUM=3 ;
 136:   ;
 137:  PR[100,3:Offset]=(-100)    ;
 138:J P[3:Point pince] 66% FINE Tool_Offset,PR[100:Offset]    ;
 139:   ;
 140:  !Test si presence pince ;
 141:  CALL TEST3    ;
 142:   ;
 143:  DO[34:Ouverture changeur]=ON ;
 144:  WAIT    .20(sec) ;
 145:  DO[30:Monter changeur]=OFF ;
 146:   ;
 147:L P[3:Point pince] 500mm/sec FINE    ;
 148:  !Fermeture changeur ;
 149:  CALL FERM_CHANGEUR    ;
 150:  R[32:Outil sur robot]=2    ;
 151:   ;
 152:  PR[100,3:Offset]=(-100)    ;
 153:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 154:   ;
 155:  !Test si outil bien pris  ;
 156:  CALL TEST4    ;
 157:   ;
 158:  PR[100,3:Offset]=(-250)    ;
 159:L P[3:Point pince] 2000mm/sec FINE Tool_Offset,PR[100:Offset]    ;
 160:   ;
 161:  JMP LBL[98] ;
 162:   ;
 163:  LBL[98] ;
 164:  !Choix Uframe et Utool ;
 165:  UFRAME_NUM=0 ;
 166:  UTOOL_NUM=1 ;
 167:   ;
 168:  !Approche magasin ;
 169:J P[4:App] 100% CNT100    ;
 170:   ;
 171:J P[5] 100% FINE    ;
 172:  LBL[99] ;
/POS
P[1:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    42.855  mm,	Y =  1423.563  mm,	Z =   -32.593  mm,
	W =  -179.980 deg,	P =    -1.343 deg,	R =   -88.952 deg
};
P[2:"Point clouteur"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =    47.335  mm,	Y =   745.997  mm,	Z = -1284.511  mm,
	W =  -179.624 deg,	P =   -20.846 deg,	R =   -90.322 deg
};
P[3:"Point pince"]{
   GP1:
	UF : 6, UT : 3,	
	J1=    88.712 deg,	J2=    43.843 deg,	J3=   -81.102 deg,
	J4=     2.142 deg,	J5=    -9.039 deg,	J6=  -181.087 deg
};
P[4:"App"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    42.855  mm,	Y =  1423.563  mm,	Z =   -32.593  mm,
	W =  -179.980 deg,	P =    -1.343 deg,	R =   -88.952 deg
};
P[5]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, -1',
	X =    51.955  mm,	Y =   926.099  mm,	Z =   -20.932  mm,
	W =  -179.864 deg,	P =    -1.337 deg,	R =   -93.883 deg
};
/END
