%{
        #include<stdio.h>
        char buffer[1000];
%}
%option noyywrap 
id [a-zA-Z_][a-zA-Z0-9_]*
keywords while|for
op <|"<="|>|">="|"=="|"!="
%%
{id}[ \t]*"="[ \t]*[0-9]+[ \t]*";" {
        strcat(buffer,yytext);
}
{keywords}"(" ;
{id}{op}[[0-9]+ {
        strcat(buffer,yytext);
        strcat(buffer,";)");
        }
"{" {
        int len = strlen(buffer);
        buffer[len]='{';
        char d = input();
        while(d!='}') { buffer[++len]=d; d=input(); }
        strcat(buffer,"}");
    }
.|[ \n\t] ; 
%%
int main()
{
        extern FILE * yyin;
        strcpy(buffer,"for(");
        yyin = fopen("input1.txt","r");
        yylex();
        printf("\nWHILE TO FOR LOOP: \n\n%s\n",buffer);
}
