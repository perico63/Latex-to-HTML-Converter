%option noyywrap nodefault yylineno

%{
	#include "newLatex.h"
	#include "newbisonlatex.tab.h"
	#include <stdio.h>
%}

SPACE [ \t ]
LETRA[a-zA-Z]
DIGITO[0-9]
texto ({LETRA}|{DIGITO}|{SPACE})
%%

"\\begin{document}" { return BEGINDOCUMENT; }
"\\end{document}"  { return ENDDOCUMENT; }

"\\begin{itemize}" { return BEGINITEMIZE; }
"\\end{itemize}" { return ENDITEMIZE; }

"\\begin{enumerate}" { return BEGINENUMERATE; }
"\\end{enumerate}" { return ENDENUMERATE; }

"\\item" { return ITEM; }

"\\title" { return TITLE; } 
"\\section" { return SECTION; } 
"\\subsection" { return SUBSECTION; } 
"\\paragraph" { return PARAGRAPH; } 

"\\bf" { return BOLD; } 
"\\it" { return ITALIC; } 
"\\underline" { return UNDERLINE; } 

"\#" { return COMENTARIO; }

"{" { return ABRECHAVE; }
"}" { return FECHACHAVE; }

{SPACE}* /*IGNORA ESPACO EM BRANCO*/
{texto}+ { yylval.literal = strdup(yytext); return TEXTO; }
[\n] 
.
%%
int main(void)
{
 yyparse();
 return 0;
}

int yyerror(char *s) 
{
  printf("Error");
  exit(1);
}