%{

%}
%%
\#.*
\+ {printf("Add\n");}
\- {printf("Sub\n");} 
\% { printf("Reminder\n");}
\/ { printf("Div\n");}
\* { printf("Mul\n");}
\=\= { printf("Equal\n");}
\>\= { printf("Greater or equal\n");}
\> { printf("Greater\n");}
\< { printf("Less\n");}
\<\= { printf("Less or equal\n");}
\!\= { printf("not equal\n");}
\&\& { printf("And\n");}
(\|\|) { printf("Or\n");}
\+\+ { printf("Increment\n");}
\-\- { printf("Decrement\n");}

%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}