%{
        #include <stdio.h>
        int relations= 0, upper = 0, lower = 0, sp_char = 0,keywords = 0,strings = 0;
%}

%%
[A-Z] {upper++;}
[a-z] {lower++;}
\n {;}
"int"|"float"|"char"|"while"|"if"|"else"|"do"|"else if"|"void"|"for"|"break"|"continue" {keywords++;}
"<="|">="|"=="|"<"|">"|"!=" {relations++;}
[#!@$%&^.,] {sp_char++;}
["][a-zA-Z0-9 #!@$%&^.,]+["] {strings++;}
. {;}
%%

int main(){
        FILE *fp = fopen("text_file.txt","r");
        if(fp)
                yyin = fp;

        yylex();

        printf("Upper case characters  : %d\n",upper);
        printf("Lower case characters  : %d\n",lower);
        printf("Relational operators   : %d\n",relations);
        printf("Special-characters     : %d\n",sp_char);
        printf("Strings                : %d\n",strings);
}

int yywrap(){
        return 1;
}
