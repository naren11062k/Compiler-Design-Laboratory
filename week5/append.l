%{
#include<stdio.h>
%}


%%

[a-z]+ {printf("\nLowercase letters appended = %s",yytext);printf("\n");yymore();}

[A-Z]+ {printf("\nUppercase letters appended = %s",yytext);printf("\n");yymore();}


%%

int main()
{

	yylex();
}
