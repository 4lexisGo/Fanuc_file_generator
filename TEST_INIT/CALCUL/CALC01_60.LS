/PROG  CALC01_60
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Prise inter";
PROG_SIZE	= 1425;
CREATE		= DATE 25-05-16  TIME 11:29:34;
MODIFIED	= DATE 25-11-05  TIME 18:28:20;
FILE_NAME	= CALC01_1;
VERSION		= 0;
LINE_COUNT	= 49;
MEMORY_SIZE	= 1861;
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
   1:  !//////////////////////////////// ;
   2:  !//Programme Calcul prise inter// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Saut des points enregistrer ;
   6:  JMP LBL[1] ;
   7:   ;
   8:  !Definition repere et outils ;
   9:  UFRAME_NUM=4 ;
  10:  UTOOL_NUM=2 ;
  11:   ;
  12:  !////////Point de prise////////// ;
  13:   ;
  14:J P[1:Point au centre] 100% FINE    ;
  15:  LBL[1] ;
  16:  !Recuperation des valeurs teleM ;
  17:  R[84:Telemetre]=GI[9:0:Telemetre]    ;
  18:   ;
  19:  !Verification hauter inter ;
  20:  IF (R[84:Telemetre]>2065),JMP LBL[10] ;
  21:   ;
  22:  IF (R[84:Telemetre]<1800 AND R[10:Init en cours]=0),JMP LBL[11] ;
  23:   ;
  24:  JMP LBL[2] ;
  25:   ;
  26:  !Alarme ;
  27:  LBL[10] ;
  28:  GO[1:0:Alarme]=11 ;
  29:  PAUSE ;
  30:  GO[1:0:Alarme]=0 ;
  31:  JMP LBL[1] ;
  32:  !Alarme ;
  33:   ;
  34:  LBL[11] ;
  35:  GO[1:0:Alarme]=31 ;
  36:  PAUSE ;
  37:  GO[1:0:Alarme]=0 ;
  38:  JMP LBL[1] ;
  39:   ;
  40:  LBL[2] ;
  41:  R[84:Telemetre]=(R[84:Telemetre]-620) ;
  42:  !Calcul hauteur prise ;
  43:  PR[100,3:Décallage]=R[84:Telemetre]    ;
  44:   ;
  45:  !Modification de hauteur du point ;
  46:  PR[99:PR mobil]=P[1:Point au centre]    ;
  47:   ;
  48:  !Fin de calcul de point de pose ;
  49:  LBL[99] ;
/POS
P[1:"Point au centre"]{
   GP1:
	UF : 4, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   636.617  mm,	Y =   428.966  mm,	Z =  1317.223  mm,
	W =   179.807 deg,	P =      .916 deg,	R =   178.218 deg
};
/END
