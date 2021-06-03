%{
#include<stdio.h>
int line = 1;
%}

consonants 	[bcdfghjklmnpqrstvwxyz]
valid 		({consonants}*a({consonants}|a)*e({consonants}|e)*i({consonants}|i)*o({consonants}|o)*u({consonants}|u)*)

%%

\n		{line++;}
{valid}		{printf("5 vowels in order in line %d: %s\n",line,yytext);}
.		{;}

%%

void main()
{
	FILE *fp = fopen("sample2.txt","r");
	
	if(fp)
		yyin = fp;

	yylex();
}

