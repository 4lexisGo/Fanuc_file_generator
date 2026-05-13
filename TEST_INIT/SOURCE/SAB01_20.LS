/PROG  SAB01_20
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise reintro";
PROG_SIZE	= 946;
CREATE		= DATE 26-05-11  TIME 14:41:34;
MODIFIED	= DATE 26-05-12  TIME 11:12:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 37;
MEMORY_SIZE	= 1338;
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
8:  !Attente demande de prise reintro ;
9:  WAIT (DI[107:Dmd prise reintro]=OFF) ;
10:   ;
11:  !Envoie prise reintro encours ;
12:  DO[114:Prise reintro encours]=ON ;
13:   ;
14:  !Changement prehenseur ;
15:  IF (GI[3:Num rference]=1),R[11:Choix outil]=(1) ;
16:   ;
17:  IF (GI[3:Num rference]=2),R[11:Choix outil]=(2) ;
18:   ;
19:  CALL CHGMT_PREHENSEUR ;
20:   ;
21:  !Definition du repere ;
22:  UFRAME_NUM=3 ;
23:   ;
24:  !Calcul point de prise reintro ;
25:  CALL CALC_002 ;
26:   ;
27:  !Remise a zero decallage ;
28:  CALL RAZPR(100) ;
29:   ;
30:  PR[100,3:Offset]=50 ;
31:  R[31]=0.5 ;
32:  J PR[99:Mobil 1] 100% CNT100 Offset,PR[100:Offset] ;
33:  R[31]=1 ;
34:   ;
35:  !Ouverture pince ;
36:  R[31]=1.5 ;
37:  CALL OUV_PINCE ;
38:  R[31]=2 ;
39:   ;
40:  R[31]=2.5 ;
41:  L PR[99:Mobil 1] 2000mm/sec CNT5 Offset,PR[100:Offset] ;
42:  R[31]=3 ;
43:   ;
44:  !Acquitement prise reintro ;
45:  CALL ACQUIT_REINTRO ;
/POS
/END
