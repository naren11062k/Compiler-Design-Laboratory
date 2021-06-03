alphabet [A-Za-z]
digit [0-9]

%%

[\t \n]
for          return FOR;
while        return WHILE;
{digit}+     return NUM;
{alphabet}({alphabet}|{digit})* return ID;
"<="         return LTEQ;
">="         return GTEQ;
"=="         return EQ;
"!="         return NTEQ;
"||"         return OR;
"&&"         return AND;
.            return yytext[0];

%%
