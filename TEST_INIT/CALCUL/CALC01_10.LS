/PROG  CALC01_10
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Choix Dispositio";
PROG_SIZE	= 898;
CREATE		= DATE 25-04-30  TIME 15:59:18;
MODIFIED	= DATE 25-08-27  TIME 22:36:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 28;
MEMORY_SIZE	= 1346;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  !//////////////////////////////// ;
   2:  !/Programme Calcul de point pose/ ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Recuperation des valeurs devrac ;
   6:  CALL TEST01_10_DONNEE    ;
   7:   ;
   8:  !Choix de la disposition ;
   9:  SELECT R[44:Dispostion pal ]=1,CALL CALC01_10_DISPO1 ;
  10:         =2,CALL CALC01_10_DISPO2 ;
  11:         =3,CALL CALC01_10_DISPO3 ;
  12:         =4,CALL CALC01_10_DISPO4 ;
  13:         =5,CALL CALC01_10_DISPO5 ;
  14:         =6,CALL CALC01_10_DISPO6 ;
  15:   ;
  16:  !Calcul hauteur pose ;
  17:   ;
  18:  !Si niveau 1 pas de modif hauteur ;
  19:  IF R[41:Niveau pal]=1,JMP LBL[99] ;
  20:   ;
  21:  !Modification de hauteur du point ;
  22:  PR[99,3:PR mobil]=(PR[99,3:PR mobil]+((R[37:Hauteur Piece]+R[39:Hauteur inter])*R[41:Niveau pal])) ;
  23:   ;
  24:  R[45:Calcul TEMP]=(R[37:Hauteur Piece]+R[39:Hauteur inter]) ;
  25:   ;
  26:  PR[99,3:PR mobil]=(PR[99,3:PR mobil]-R[45:Calcul TEMP]) ;
  27:  !Fin de calcul de point de pose ;
  28:  LBL[99] ;
/POS
/END
