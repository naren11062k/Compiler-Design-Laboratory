%{
#include<stdio.h>
#include<ctype.h>
int i=0;
%}

%token NUM
%left '&''|''x'
%right '!'

%%

S:E '\n' {printf("RESULT = %d",(int)$$);};
E:E'&'E {$$=$1&$3;}
|E'|'E {$$=$1|$3;}
|'!'E {$$=!$2;}
|E'x'E {$$=($1&(!$3))|((!$1)&$3);}
|NUM {$$=$1;};

%%

#include "lex.yy.c"

void main()
{
	printf("enter the logical expression: ");
	yyparse();
}

int yywrap()
{}

int yyerror()
{}
