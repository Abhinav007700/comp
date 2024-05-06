%{
#include "y.tab.h"
%}

%%

[ \t]                  /* Skip whitespace */
[0-9]+                 { yylval.num = atoi(yytext); return NUM; }
[a-zA-Z][a-zA-Z0-9_]* { yylval.var_name = strdup(yytext); return VAR; }
"+"                    { return ADD; }
"-"                    { return SUB; }
"*"                    { return MUL; }
"/"                    { return DIV; }
"&&"                   { return AND; }
"||"                   { return OR; }
"!"                    { return NOT; }
"=="                   { return EQ; }
"!="                   { return NE; }
"<"                    { return LT; }
"<="                   { return LE; }
">"                    { return GT; }
">="                   { return GE; }
"("                    { return LP; }
")"                    { return RP; }
";"                    { return SEMICOLON; }
.                      { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
