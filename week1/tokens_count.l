%{  
#include<stdio.h>
int tokens = 0, operators = 0, identifiers = 0, numbers = 0, white_spaces = 0, assignment_symbol = 0, keywords = 0;   
%}  
number	[0-9]+

%%

int|float|char|double|struct|auto|break|else|long|switch|case|enum|typedef|register|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|short	{tokens++; keywords++; printf("keywords: %s", yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {tokens++; identifiers++; printf("\tidentifiers: %s", yytext);}  
{number}	{tokens++; numbers++; printf("\tnumbers: %s", yytext);}
" "|\t|\n	{tokens++; white_spaces++; printf("\twhite_spaces: %s", yytext);}
=	{tokens++; assignment_symbol++; printf("\tassignment: %s", yytext);}
"+"|"-"|"*"|"/"|"%"|"<="|">="|"++"|"--"|"=="		{tokens++; operators++; printf("\toperators: %s", yytext);}
.	{;}

%%
int main() 
{
	yylex();
	
	printf("\n total no. of tokens = %d\n", tokens);
	printf("\n total no. of keywords = %d\n", keywords);
	printf("\n total no. of identifiers = %d\n", identifiers);
	printf("\n total no. of numbers = %d\n", numbers);
	printf("\n total no. of white_spaces = %d\n", white_spaces);
	printf("\n total no. of assignment_symol = %d\n", assignment_symbol);
	printf("\n total no. of operators = %d\n", operators);
	
}	
