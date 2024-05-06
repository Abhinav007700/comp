%{
%}
%%
int|float|char|bool|printf|scanf|if|else|void|while|for|do {printf("\nKeywords: %s\n", yytext);}
[a-zA-Z][_a-zA-Z0-9]* {
    if (strlen(yytext) <=32){
        printf("\nVariable: %s\n",yytext);
    }
    else{
        printf("\nVariable is more than 32 cars in length. %s\n",yytext);
    }
}

[0-9]+(\.[0-9]+)? {printf("\nNumeric: %s\n",yytext);}

\".*\" {printf("\nIdentifier: %s\n",yytext);}

\#.* {printf("\nHeader: %s\n",yytext);}
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}