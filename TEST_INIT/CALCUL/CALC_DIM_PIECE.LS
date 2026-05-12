/PROG  CALC_DIM_PIECE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 358;
CREATE		= DATE 25-04-30  TIME 09:31:28;
MODIFIED	= DATE 25-07-02  TIME 08:48:52;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 8;
MEMORY_SIZE	= 698;
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
   2:  !////Calcule dimenssion piece//// ;
   3:  !//////////////////////////////// ;
   4:   ;
   5:  !Attribution dimenssion piece ;
   6:  R[35:Longueur Piece]=(GI[2:0:Longueur piece]) ;
   7:  R[36:Largeur Piece]=(GI[3:0:Largeur piece]) ;
   8:  R[37:Hauteur Piece]=(GI[4:0:Hauteur piece]) ;
/POS
/END
