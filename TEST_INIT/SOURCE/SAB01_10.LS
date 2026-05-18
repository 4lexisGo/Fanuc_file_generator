/PROG  SAB01_10
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise table ech";
PROG_SIZE	= 1343;
CREATE		= DATE 26-05-11  TIME 09:41:02;
MODIFIED	= DATE 26-05-11  TIME 15:06:30;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 42;
MEMORY_SIZE	= 1723;
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
   1:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   2:  !Programme de prise piece de la!! ;
   3:  !!!!!!!!!!table d'echange!!!!!!!! ;
   4:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   5:   ;
   6:  !Attente demande de prise echange ;
   7:  WAIT (DI[100:Dmd prise table ech]=ON)    ;
   8:  !Changement prehenseur ;
   9:  IF (GI[3:Num réference]=1),R[11:Choix outil]=(1) ;
  10:   ;
  11:  IF (GI[3:Num réference]=2),R[11:Choix outil]=(2) ;
  12:   ;
  13:  CALL CHGMT_PREHENSEUR    ;
  14:   ;
  15:  !Envoie prise table encours ;
  16:  DO[100:Prise table encours]=ON ;
  17:   ;
  18:  !Definition du repere ;
  19:  UFRAME_NUM=1 ;
  20:   ;
  21:  !Test ou prendre la piece  ;
  22:  CALL TEST_005    ;
  23:   ;
  24:  !Calcul point de prise ;
  25:  CALL CALC_001    ;
  26:   ;
  27:  !Remise a zero decallage ;
  28:  CALL RAZPR(100) ;
  29:   ;
  30:  PR[100,3:Offset]=100    ;
  31:J PR[99:Mobil 1] 100% CNT100 Offset,PR[100:Offset]    ;
  32:   ;
  33:L PR[99:Mobil 1] 2000mm/sec CNT0    ;
  34:  !Ouverture pince ;
  35:  CALL OUV_PINCE    ;
  36:   ;
  37:L PR[99:Mobil 1] 2000mm/sec CNT5 Offset,PR[100:Offset]    ;
  38:   ;
  39:J P[1] 100% CNT100    ;
  40:   ;
  41:  !Acquitement prise table d'echang ;
  42:  CALL ACQUIT_PRISE_ECH    ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1137.601  mm,	Y =   -69.123  mm,	Z =   940.000  mm,
	W =   180.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
