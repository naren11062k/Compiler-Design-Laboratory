%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[a-zA-z]*(abc)+[a-zA-z]*		{printf("Word Found (abc): %s\n",yytext);}
[a-zA-z]*(ab)+[a-zA-z]*	 		{printf("Word Found (ab concatenated): %s\n",yytext);}
[+-]?[0-9]+				{printf("Word Found (digit with optional prefix of + or -): %s\n",yytext);}
.					{;}

%%

int main()
{
	FILE *fp = fopen("sample.txt","r");
	if(fp)
		yyin = fp;

	yylex();
	
	return 0;
}
