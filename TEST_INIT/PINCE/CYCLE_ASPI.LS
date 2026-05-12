/PROG  CYCLE_ASPI	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Cycle aspiration";
PROG_SIZE	= 1487;
CREATE		= DATE 25-02-24  TIME 11:48:46;
MODIFIED	= DATE 25-11-12  TIME 22:20:42;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 72;
MEMORY_SIZE	= 1975;
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

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
   1:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   2:  !Programme du cycle d'aspiration! ;
   3:  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ;
   4:   ;
   5:  !Remise  0 boucle aspiration ;
   6:  R[87:Boucle prise]=0    ;
   7:   ;
   8:  LBL[1] ;
   9:  !RAZ Defaut aspiration ;
  10:  DO[83:OFF:Defaut aspiratio]=OFF ;
  11:   ;
  12:  !Activation aspiration ;
  13:  CALL TOOL02_ASPIRATION_ON    ;
  14:   ;
  15:  !Test si probleme aspiration ;
  16:  IF (R[81:Probleme d'aspi]=0),JMP LBL[99] ;
  17:  !Coupure aspiration ;
  18:  DO[81:OFF:Dmd STOP Aspiration]=ON ;
  19:   ;
  20:  !Recuperation position robot ;
  21:  PR[99:PR mobil]=LPOS    ;
  22:   ;
  23:  !Remise a zero OFFSET ;
  24:  CALL RAZPR100    ;
  25:   ;
  26:  PR[100,3:Décallage]=100    ;
  27:L PR[99:PR mobil] 50mm/sec CNT10 Offset,PR[100:Décallage]    ;
  28:   ;
  29:  !Boucle aspiration + 1 ;
  30:  R[86:Boucle aspiratio]=R[86:Boucle aspiratio]+1    ;
  31:   ;
  32:  !Boucle aspiration ;
  33:  IF (R[86:Boucle aspiratio]>=3),JMP LBL[2] ;
  34:   ;
  35:  !Retour ;
  36:  LBL[3] ;
  37:   ;
  38:  !Activation soufflage ;
  39:  DO[82:OFF:Soufflage aspira]=ON ;
  40:   ;
  41:  WAIT   1.00(sec) ;
  42:   ;
  43:  DO[82:OFF:Soufflage aspira]=OFF ;
  44:   ;
  45:L PR[99:PR mobil] 250mm/sec FINE    ;
  46:   ;
  47:  !Arret du soufflage ;
  48:  DO[82:OFF:Soufflage aspira]=OFF ;
  49:   ;
  50:  JMP LBL[1] ;
  51:   ;
  52:  LBL[2] ;
  53:  !Alarme: probleme aspiration ;
  54:  DO[83:OFF:Defaut aspiratio]=ON ;
  55:  GO[1:0:Alarme]=25 ;
  56:   ;
  57:  R[86:Boucle aspiratio]=0    ;
  58:   ;
  59:  JMP LBL[3] ;
  60:   ;
  61:  LBL[99] ;
  62:  !Auto acquitement alarme ;
  63:  IF (GO[1:0:Alarme]=25),GO[1:0:Alarme]=(0) ;
  64:   ;
  65:  !MAJ piece sur ventouse ;
  66:  R[52:Piece embarque]=1    ;
  67:   ;
  68:  !RAZ Defaut aspiration ;
  69:  DO[83:OFF:Defaut aspiratio]=OFF ;
  70:   ;
  71:  !Mise tool a jour ajout pd piece ;
  72:  PAYLOAD[5] ;
/POS
/END
