identifier [a-zA-Z][a-zA-Z0-9]*
%%
#.* {printf(\n %s is a preprocessor",yytext);}
int|char|void|main {printf("\n %s is a keyword",yytext);}
{identifier} {printf("\n %s is a identifier",yytext);}
[0-9]+ {printf("\n %s is a number",yytext);}
= {printf("\n %s is a assignment operator",yytext);}
\+ {printf("\n %s is arithmetic operator ",yytext);
%%
int main(int argc,char **argv)
{
if(argc>1)
{
FILE *f1;
f1=fopen(argv[1],"r");
if(f1)
{yyin=f1;
}
}
yylex();
return 0;
}
int yywrap()
{
return 0;
}
