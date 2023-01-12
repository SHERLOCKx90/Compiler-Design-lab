identifier [a-zA-Z][a-zA-Z0-9]*
%%
#.* {printf(\n %s is a preprocessor",yytext);}
int|char|void|main {printf("\n %s is a keyword",yytext);}
{identifier} {printf("\n %s is a identifier",yytext);}
[0-9]+ {printf("\n %s is a number",yytext);}
= {printf("\n %s is a assignment operator",yytext);}
\+ {printf("\n %s is arithmetic operator ",yytext);

