#include <string.h>
#include <stdio.h>

#define CBOLD 1
#define CIT 2
#define CUNDER 3
#define CSECTION 4
#define CSUBSECTION 5
#define CPAR 6
#define CENUM 7
#define CITEM 8
#define CITEMI 9
#define CFINAL 10
#define COMENT 11

extern int yylineno;

char* concatenaTokens(char *t1, char *t2, int tipo);

char* retornaValue(char *str);
