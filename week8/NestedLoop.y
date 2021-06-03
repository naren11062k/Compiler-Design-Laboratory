%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int  yyerror(char *);
%}

%token WHILE FOR LTEQ GTEQ EQ NTEQ OR AND ID NUM
%right '='
%left OR AND
%left '>' '<' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%left '!'

%%

S         : TYPE {printf("VALID NESTED LOOP EXPRESSION.\n"); exit(0);}

TYPE      : FOR '(' EXP1 ';' EXP2 ';' EXP1 ')' DEF  {printf("FOR( EXP1 ; EXP2 ; EXP1 ) DEF\n"); }
           ;
TYPE       : WHILE '(' EXP2 ')' DEF { printf("ST -> WHILE( EXP2 ) DEF\n"); }
           ;
DEF    : '{' LOOP '}' { printf("DEF ->{ LOOP }\n"); }
           | EXP1 ';'     { printf("DEF -> EXP;\n"); }
           | TYPE     { printf("DEF -> TYPE\n"); }
           |
           ;
LOOP    : LOOP LOOP     {printf("LOOP -> LOOP LOOP\n"); }
           | EXP1 ';'     {printf("LOOP -> EXP1\n"); }
           | TYPE         { printf("LOOP -> TYPE\n"); }
           |
           ;
EXP1      : ID '=' EXP1     {printf("EXP1 -> ID = EXP1\n"); }
          | EXP1 '+' EXP1     {printf("EXP1 -> EXP1 + EXP1\n"); }
          | EXP1 '-' EXP1     {printf("EXP1 -> EXP1 - EXP1\n"); }
          | EXP1 '*' EXP1     {printf("EXP1 -> EXP1 * EXP1\n"); }
          | EXP1 '/' EXP1     {printf("EXP1 -> EXP1 / EXP1\n"); }
          | EXP1 '<' EXP1     {printf("EXP1 -> EXP1 < EXP1\n"); }
          | EXP1 '>' EXP1     {printf("EXP1 -> EXP1 > EXP1\n"); }
          | EXP1 LTEQ EXP1      {printf("EXP1 -> EXP1 LTEQ EXP1\n"); }
          | EXP1 GTEQ EXP1      {printf("EXP1 -> EXP1 GTEQ EXP1\n"); }
          | EXP1 EQ EXP1      {printf("EXP1 -> EXP1 EQ EXP1\n"); }
          | EXP1 NTEQ EXP1      {printf("EXP1 -> EXP1 NTEQ EXP1\n"); }
          | EXP1 OR EXP1      {printf("EXP1 -> EXP1 OR EXP1\n"); }
          | EXP1 AND EXP1     {printf("EXP1 -> EXP1 AND EXP1\n"); }
          | EXP1 '+' '+'   {printf("EXP1 -> ++\n"); }
          | EXP1 '-' '-'   {printf("EXP1 -> --\n"); }
          | ID          {printf("EXP1 -> ID\n"); }
          | NUM         {printf("EXP1 -> NUM\n"); }
          ;
EXP2     : EXP1'<'EXP1          {printf("EXP2 -> EXP1 < EXP1\n"); }
         | EXP1'>'EXP1        {printf("EXP2 -> EXP1 > EXP1\n"); }
         | EXP1 LTEQ EXP1       {printf("EXP2 -> EXP1 LTEQ EXP1\n"); }
         | EXP1 GTEQ EXP1       {printf("EXP2 -> EXP1 GTEQ EXP1\n"); }
         | EXP1 EQ EXP1       {printf("EXP2 -> EXP1 EQ EXP1\n"); }
         | EXP1 NTEQ EXP1     {printf("EXP2 -> EXP1 NTEQ EXP1\n"); }
         | EXP1 OR EXP1       {printf("EXP2 -> EXP1 OR EXP1\n"); }
         | EXP1 AND EXP1      {printf("EXP2 -> EXP1 AND EXP1\n"); }
         ;

%%

#include "lex.yy.c"

int main()
{
    printf("ENTER THE EXPRESSION: \n");
    yyparse();
    return 0;
}
int yyerror(char* s)
{
        printf("\nNOT A VAILD NESTED LOOP EXPRESSION.\n");
}
