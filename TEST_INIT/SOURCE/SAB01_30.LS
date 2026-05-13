/PROG  SAB01_30
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Soufflage piece";
PROG_SIZE	= 792;
CREATE		= DATE 26-05-11  TIME 15:55:16;
MODIFIED	= DATE 26-05-12  TIME 09:11:02;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 30;
MEMORY_SIZE	= 1068;
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
4:  !!!Programme de prise piece sur!! ;
5:  !!!!!!!!la reintroduction!!!!!!!! ;
6:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
7:   ;
8:  !Attente demande prise reintro ;
9:  WAIT (DI[107:Dmd prise reintro]=ON) ;
10:   ;
11:  !Envoie prise reintro encours ;
12:  DO[114:Prise reintro encours]=ON ;
13:   ;
14:  !Definition du repere ;
15:  UFRAME_NUM=4 ;
16:   ;
17:  !Calcul point de soufflage ;
18:  CALL CALC_003 ;
19:   ;
20:  !Remise a zero decallage ;
21:  CALL RAZPR(100) ;
22:   ;
23:  PR[100,3:Offset]=200 ;
24:  R[31]=0.5 ;
25:  J PR[99:Mobil 1] 100% CNT100 Offset,PR[100:Offset] ;
26:  R[31]=1 ;
27:   ;
28:  R[31]=1.5 ;
29:  L PR[99:Mobil 1] 2000mm/sec CNT0 ;
30:  R[31]=2 ;
31:   ;
32:  !Envoie en position de soufflage ;
33:  CALL POS_SOUFFLAGE ;
34:   ;
35:  R[31]=2.5 ;
36:  L PR[99:Mobil 1] 2000mm/sec CNT5 Offset,PR[100:Offset] ;
37:  R[31]=3 ;
38:   ;
/POS
/END
