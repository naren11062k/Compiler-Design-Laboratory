%{
#include<stdio.h>
%}
start \/\*
end  \*\/

%%

\/\/(.*) ;
[^"]{start}.*{end}[^"] ;
.|\n {printf("%s",yytext);}

%%

int main()
{

	yyin=fopen("input.txt","r");
	yylex();
	return 0;
}
