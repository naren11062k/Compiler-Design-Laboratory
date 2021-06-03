%{
#include<stdio.h>
%}

%%

"while"|"if"|"else"|"int"|"float"|"def"|"return"|"print" {printf("\t KEYWORD : %s\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {printf("\t IDENTIFIER : %s\n",yytext);}
">="|"<="|"=="|"="|"++"|"-"|"*"|"+" {printf("\t OPERATOR : %s\n",yytext);}
[(){}|,;:] {printf("\t SEPERATOR : %s\n",yytext);}
[0-9]+ {printf("\t INTEGER : %s\n",yytext);}
. ;

%%

int main()
{
	yyin = fopen("ques2_input.txt","r");
        yylex();
        return 0;

}
