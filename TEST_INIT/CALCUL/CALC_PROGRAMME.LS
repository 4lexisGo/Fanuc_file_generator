/PROG  CALC_PROGRAMME
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Choix Programe";
PROG_SIZE	= 336;
CREATE		= DATE 25-04-30  TIME 08:54:08;
MODIFIED	= DATE 25-09-23  TIME 15:17:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 7;
MEMORY_SIZE	= 680;
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
   2:  !///////Calcule programme//////// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Attribution numero de programme ;
   6:  R[34:Programme a ex]=(GI[1:0:Numero programme]) ;
   7:  WAIT    .30(sec) ;
/POS
/END
