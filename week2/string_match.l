%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[+-]?[0-9]+				{printf("digits with optional prefix of + or -\n");}
[a-zA-z]+				{printf("Invalid\n");}
.					{;}

%%

int main()
{
	yylex();
	
	return 0;
}
