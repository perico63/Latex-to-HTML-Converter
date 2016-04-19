%{
	#include "newLatex.h"
	#include <stdio.h>
%}

%union 
{
   char *literal;
}

%token ABRECHAVE FECHACHAVE BEGINDOCUMENT ENDDOCUMENT 
%token BEGINITEMIZE ENDITEMIZE BEGINENUMERATE ENDENUMERATE 
%token TITLE SECTION SUBSECTION PARAGRAPH BOLD ITALIC 
%token UNDERLINE COMENTARIO DIGITO LETRA ITEM 
%token TEXTO OFL

%type <literal> listitem stmt TEXTO inicio listinicial listsection titulo

%start inicio  

%%

inicio: BEGINDOCUMENT titulo listinicial ENDDOCUMENT { concatenaTokens($2,$3,CFINAL); }
	|  { $$ = " "; }
	;

titulo: TITLE ABRECHAVE stmt FECHACHAVE { $$ = $3; }
	| { $$ = " "; }
	;

listinicial: SECTION ABRECHAVE stmt FECHACHAVE listsection { $$ = concatenaTokens($3,$5,CSECTION); } 
	| PARAGRAPH ABRECHAVE stmt FECHACHAVE listinicial { $$ = concatenaTokens($3,$5,CPAR); } 
	| { $$ = " "; }
	;

listsection: BEGINITEMIZE listitem ENDITEMIZE listsection { $$ = concatenaTokens($2,$4,CITEMI); }
	| BEGINENUMERATE listitem ENDENUMERATE listsection {$$ = concatenaTokens($2,$4,CENUM); }	
	| PARAGRAPH ABRECHAVE stmt FECHACHAVE listsection { $$ = concatenaTokens($3,$5,CPAR); } 
	| SUBSECTION ABRECHAVE stmt FECHACHAVE  listsection  { $$ = concatenaTokens($3,$5,CSUBSECTION); } 
	| SECTION ABRECHAVE stmt FECHACHAVE listsection { $$ = concatenaTokens($3,$5,CSECTION); } 
	| { $$ = " "; }
	;

listitem: ITEM stmt listitem  { $$ = concatenaTokens($2,$3,CITEM); }
	| { $$ = " "; }
	;

stmt: UNDERLINE ABRECHAVE TEXTO FECHACHAVE stmt { $$ = concatenaTokens($3,$5,CUNDER); };
	| ABRECHAVE BOLD TEXTO FECHACHAVE stmt { $$ = concatenaTokens($3,$5,CBOLD); }; 	
	| ABRECHAVE ITALIC TEXTO FECHACHAVE stmt { $$ = concatenaTokens($3,$5,CIT); };
	| TEXTO stmt{ $$ = concatenaTokens($1,$2,0); }
	| { $$ = " "; }
	;
