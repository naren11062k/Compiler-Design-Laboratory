%{
#include<stdio.h>
#include<ctype.h>
%}

%token NUM

%%

S: S1
 |S2;
S1:E1'\n' {printf("\nRESULT = %d\n", (int)$$);main();}
  E1:E1 E1'+' {$$=$1+$2;}
|E1 E1'-' {$$=$1-$2;}
|E1 E1'*' {$$=$1*$2;}
|E1 E1'/' {$$=$1/$2;}
|NUM {$$=$1;};

S2:E2'\n' {printf("\nRESULT = %d\n", (int)$$);main();}
  E2:'+'E2 E2 {$$=$2+$3;}
|'-'E2 E2 {$$=$2-$3;}
|'*'E2 E2 {$$=$2*$3;}
|'/'E2 E2 {$$=$2/$3;}
|NUM {$$=$1;};

%%

#include "lex.yy.c"

void main()
{
	printf("\nEnter The Expression: ");
	yyparse();
}
