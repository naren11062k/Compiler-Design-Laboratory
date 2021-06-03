%{
#include<stdio.h>
%}

%%

[+]?[^-][0-9]+(.[0-9]+)?((E|e)[+-]?[0-9]+)? {printf("Valid number\n");}
[a-zA-Z]+|[-][0-9]+(.[0-9]+)?((E|e)[+-]?[0-9]+)? {printf("Not a valid number\n");}

%%

int main(){
        
	yylex();
}
