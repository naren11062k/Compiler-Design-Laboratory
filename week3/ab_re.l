%{
#include<stdio.h>

%}

%%

((aa|ab(bb)*ba)*(b|ab(bb)*a)(a(bb)*a)*(b|a(bb)*ba))*(aa|ab(bb)*ba)*(b|ab(bb)*a)(a(bb)*a)*  {printf("hi\n");}
(a|b)											   {;}	

%%

void main()
{
	printf("Enter string:\n");

	yylex();
}

