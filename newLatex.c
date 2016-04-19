#include "newLatex.h"
#include <stdlib.h>

 char* concatenaTokens(char *t1, char *t2, int tipo){ 	
	char *ini, *fim;
	char *result = (char*) malloc(sizeof(char) * (strlen(t1) + strlen(t2) + 30));
	result[0] = '\0';
	switch (tipo){
		case CBOLD:
			ini = "<b>";
			fim = "</b>";
			break;
		case CIT:
			ini = "<i>";
			fim = "</i>";
			break;
		case CUNDER:
			ini = "<u>";
			fim = "</u>";
			break;
		case CITEM:
			ini = "<li>";
			fim = "</li>";
			break;
		case CITEMI:
			ini = "<ul>";
			fim = "</ul>";
			break;
		case CENUM:
			ini = "<ol>";
			fim = "</ol>";
			break;
		case CPAR:
			ini = "<p>";
			fim = "</p><BR>";
			break;
		case CSECTION:
			ini = "<h2>";
			fim = "</h2><BR><BR>";
			break;
		case CSUBSECTION:
			ini = "<h4>";
			fim = "</h4><BR><BR>";
			break;
		case CFINAL:						
			strcat(result,"<hmtl><head><title>");
			strcat(result,t1);
			strcat(result,"</title></head><body>");
			strcat(result,t2);
			strcat(result,"</body></html>");
			printf("%s", result);
			return "";			
		default:
			ini = " ";
			fim = " ";
			break;
	}	
	strcat(result,ini);
	strcat(result,t1);
	strcat(result,fim);
	strcat(result,t2);

	return result;
}

char* retornaValue(char *str){
	printf("  >>%s<<   ", str);
	strcat(str,"\0");
	return str;
}