%{
#include<stdio.h>
%}

%%

["][A-Z0-9!@#$%^&*(),.:; ]+["] {printf("String found:%s\n",yytext);}
.|\n {;}

%%

int main()
{
	FILE *fp = fopen("test.txt","r");
	if(fp)
        	yyin = fp;
	
	yylex();
	
	return 0;
}
