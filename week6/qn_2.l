%{
#include<stdio.h>
#include<string.h>
char a[30];
int line = 1;
%}

%%

"switch"|"print" {}

"expr"[a-zA-Z]* { strcat(a,yytext);}

"break" {}

"value1" {printf("\nif( %s == %s )\n{ ",a,yytext);}

"value"[0-9]+ {printf("\n else if( %s == %s) \n{",a,yytext);}

"default:" { printf("\nelse\n{");}

"statement"[0-9A-Za-z]+; { printf("\n%s }",yytext);}

. {;}


%%

int main()
{
	yyin = fopen("input2.txt","r");
	yylex();
	return 0;
}
