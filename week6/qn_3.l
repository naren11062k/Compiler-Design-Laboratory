%option noyywrap
%{
#include<stdio.h>
int x=0,l=0;
char s1[50],s2[50],s3[50];
char s4[50][50];
int p=-1;
%}

%%

for[(][a-z A-Z0-9=,]*;[a-z A-Z0-9<>!=|&()]*;[a-z A-Z0-9=+-,]*[)][{] {
        strcpy(s1,"");
        strcpy(s2,"");
        strcpy(s3,"");
        for(x=0;yytext[x]!='(';x++);
        x++;
        l=0;
        for(;yytext[x]!=';';x++,l++)
                s1[l]=yytext[x];
        s1[l]=';';
        l++;
        s1[l]='\0';
        printf("%s\n",s1);
      
	printf("do{");
        x++;
        l=0;
        for(;yytext[x]!=';';x++,l++)
                s2[l]=yytext[x];
        s2[l]='\0';
       
        l=0;
        x++;
        for (;yytext[x]!=')';x++,l++)
        s3[l]=yytext[x];
        s3[l]=';';
        l++;
        s3[l]='\0';
        strcpy(s4[++p],s3);
        }
[}] {printf("\n%s\n}",s4[p--]);
	printf("while(");
	printf("%s)",s2);
	printf(";");
	printf("\n");}
%%

void main()
{
	yyin=fopen("input3.txt","r");
	yylex();
	fclose(yyin);
}

