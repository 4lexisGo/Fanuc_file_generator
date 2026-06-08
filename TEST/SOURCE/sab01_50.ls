/PROG  SAB01_50
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise joue";
PROG_SIZE	= 989;
CREATE		= DATE 26-04-02  TIME 08:58:46;
MODIFIED	= DATE 26-05-28  TIME 16:49:22;
FILE_NAME	= SAB40;
VERSION		= 0;
LINE_COUNT	= 27;
MEMORY_SIZE	= 1277;
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
   1:  !Prise joue avec pince ;
   2:  DO[48:Prise joue EC]=ON ;
   3:  !Choix prehenseur ;
   4:  R[31:Dmd outil]=2    ;
   5:  CALL SAB900    ;
   6:   ;
   7:  !Choix Uframe et Utool ;
   8:  UFRAME_NUM=0 ;
   9:  UTOOL_NUM=3 ;
  10:   ;
  11:  !Approche ;
  12:J P[1] R[25:Vitesse general]% CNT100    ;
  13:   ;
  14:  R[20:Num posage]=GI[3:Num posage]    ;
  15:   ;
  16:  SELECT R[20:Num posage]=1,CALL SAB01_51 ;
  17:         =2,CALL SAB01_52 ;
  18:   ;
  19:   ;
  20:  !Choix Uframe et Utool ;
  21:  UFRAME_NUM=0 ;
  22:  UTOOL_NUM=3 ;
  23:   ;
  24:  !Approche ;
  25:J P[2:Approche 2] 100% CNT100    ;
  26:  DO[48:Prise joue EC]=OFF ;
  27:  DO[49:Fin prise joue]=PULSE,0.5sec ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   796.182  mm,	Y =   297.680  mm,	Z =    33.466  mm,
	W =  -179.698 deg,	P =     -.868 deg,	R =  -147.696 deg
};
P[2:"Approche 2"]{
   GP1:
	UF : 0, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =   993.353  mm,	Y =   938.653  mm,	Z =   -58.917  mm,
	W =  -141.932 deg,	P =     1.375 deg,	R =   -32.205 deg
};
/END
