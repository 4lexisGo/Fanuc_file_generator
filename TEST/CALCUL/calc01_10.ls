/PROG  CALC01_10
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 337;
CREATE		= DATE 26-04-02  TIME 09:18:26;
MODIFIED	= DATE 26-05-13  TIME 15:27:08;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 10;
MEMORY_SIZE	= 669;
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
   1:  !Calcul offset pour cloutage ;
   2:  R[29:Consigne cloutag]=GI[6:Nb clous par joue]    ;
   3:   ;
   4:  R[29:Consigne cloutag]=(R[29:Consigne cloutag]/2) ;
   5:   ;
   6:  R[30:Nombre cloutage]=(R[29:Consigne cloutag]) ;
   7:   ;
   8:  R[24:Angle clouage]=(180/R[30:Nombre cloutage]) ;
   9:   ;
  10:  //R[29:Consigne cloutag]=(R[29:Consigne cloutag]-1) ;
/POS
/END
