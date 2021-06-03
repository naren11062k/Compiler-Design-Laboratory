%{
#include<stdio.h>
int count0=0,count1=0,count2=0,count3=0,count4=0,ch=1,comp=0,count=0;
int count5=0,count6=0,count7=0,count8=0,count9=0;
%}

%%

"0"		{count0++;REJECT;}
"1"		{count1++;REJECT;}
"2" 		{count2++;REJECT;}
"3" 		{count3++;REJECT;}
"4" 		{count4++;REJECT;}
"5"		{count5++;REJECT;}
"6" 		{count6++;REJECT;}
"7" 		{count7++;REJECT;}
"8" 		{count8++;REJECT;}
"9" 		{count9++;REJECT;}
[a-zA-z]	{ch=0;REJECT;}
"\n" {
if(count0>1)
count++;
if(count1>1)
count++;
if(count2>1)
count++;
if(count3>1)
count++;
if(count4>1)
count++;
if(count5>1)
count++;
if(count6>1)
count++;
if(count7>1)
count++;
if(count8>1)
count++;
if(count9>1)
count++;
if(count>1 || ch==0 )
          printf("\nThe input doesnt follow the rules\n");
else if( count<=1 )
        printf("\nThe input follows the rules\n");

ch=1;
count0=0;
count1=0;
count2=0;
count3=0;
count4=0;
count5=0;
count6=0;
count7=0;
count8=0;
count9=0;
count=0;

}

"@" return -1;

%%

int main()
{
int input=yylex();
return 0;
}
