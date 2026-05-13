/PROG  SAB01_40
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Controle piece";
PROG_SIZE	= 714;
CREATE		= DATE 26-05-12  TIME 09:05:08;
MODIFIED	= DATE 26-05-12  TIME 09:31:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 25;
MEMORY_SIZE	= 1010;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/MN
1:  /MN ;
2:  /MN ;
3:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
4:  !!!!Programme de controle du!!!!! ;
5:  !!!!!datamatrix de la piece!!!!!! ;
6:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
7:   ;
8:  !Attente demande controle piece ;
9:  WAIT (DI[102:Dmd depl camra]=ON) ;
10:   ;
11:  !Envoie controle camera encours ;
12:  DO[104:Pos cam encours]=ON ;
13:   ;
14:  !Definition du repere ;
15:  UFRAME_NUM=5 ;
16:   ;
17:  !Calcul point de controle data ;
18:  CALL CALC_004 ;
19:   ;
20:  !Remise a zero decallage ;
21:  CALL RAZPR(100) ;
22:   ;
23:  R[31]=0.5 ;
24:  J PR[99:Mobil 1] 100% CNT0 ;
25:  R[31]=1 ;
26:   ;
27:  !Envoie en position de controle ;
28:  CALL POS_CONTROLE ;
29:   ;
/POS
/END
