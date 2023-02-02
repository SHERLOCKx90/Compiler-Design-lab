%{
int COMMENT=0;
%}
delim [ \t\n]
ws {delim}+
digit [0-9]
number {digit}+(\.{digit}+)?
identifier [a-zA-Z][a-zA-Z0-9_]*
%%
{ws}
#.* {printf("\n %s is a preprocessor directive", yytext);}
int|float|main|if|else|printf|scanf|for|char|getch|while|void {printf("\n %s is a keyword", yytext);}
\<.*\.h> {printf("\n %s is a headerfile", yytext);}
"/*" {COMMENT=1;}
"*/" {COMMENT=0;}
{identifier}(\[[0-9]*\])? {if(!COMMENT) printf("\n %s is an identifier", yytext);}
\{ {if(!COMMENT) printf("\n%s Block begins", yytext);}
\} {if(!COMMENT) printf("\n%s Block ends", yytext);}
\".*\" {if(!COMMENT) printf("\n %s is a string", yytext);}
{number} {if(!COMMENT) printf("\n %s is a number", yytext);}
= {if(!COMMENT) printf("\n %s is an assignment operator", yytext);}
\+|\-|\*|\/|\% {if(!COMMENT) printf("\n %s is an arithmetic operator", yytext);}
\<=|\>=|\>|\<|\!=|== {if(!COMMENT) printf("\n %s is a relational operator", yytext);}
\+\+ {if(!COMMENT) printf("\n %s is increment operator", yytext);}
\%{identifier} {if(!COMMENT) printf("\n %s is reference to identifier", yytext);}
%%
int main(int argc, char **argv)
{
if(argc>1)
{
FILE *f1;
f1=fopen(argv[1],"r");
if(f1)
{
yyin=f1;
}
}
yylex();
return 0;
}
int yywrap()
{
return 0;
}
