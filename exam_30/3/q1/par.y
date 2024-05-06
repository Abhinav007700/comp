%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char*);

int sym[26];

%}

%union {
    int num;
    char* var_name;
}

%token <num> NUM
%token <var_name> VAR
%token ADD SUB MUL DIV
%token AND OR NOT
%token EQ NE LT LE GT GE
%token LP RP
%token SEMICOLON

%left '+' '-'
%left '*' '/'
%left AND
%left OR
%right NOT
%left EQ NE
%left '<' '>' LE GE LT GT

%type <num> expr
%type <num> term
%type <num> factor
%type <num> relational
%type <num> boolean
%type <num> assignment

%%

input: /* empty */
    | input line
    ;

line: expr SEMICOLON   { printf("Result: %d\n", $1); }
    | assignment SEMICOLON { printf("Assigned value.\n"); }
    | relational SEMICOLON {printf("Result: %d\n", $1);}
    | boolean SEMICOLON {printf("Result: %d\n", $1);}
    ;

assignment: VAR '=' expr   { sym[$1[0] - 'a'] = $3; $$ = $3; }
    ;

expr: expr ADD term      { $$ = $1 + $3; }
    | expr SUB term      { $$ = $1 - $3; }
    | term               { $$ = $1; }
    ;

term: term MUL factor    { $$ = $1 * $3; }
    | term DIV factor    { $$ = $1 / $3; }
    | factor             { $$ = $1; }
    ;

factor: NUM              { $$ = $1; }
    | VAR                { $$ = sym[$1[0] - 'a']; }
    | LP expr RP         { $$ = $2; }
    ;

relational: expr EQ expr    { $$ = $1 == $3; }
    | expr NE expr      { $$ = $1 != $3; }
    | expr LT expr      { $$ = $1 < $3; }
    | expr LE expr      { $$ = $1 <= $3; }
    | expr GT expr      { $$ = $1 > $3; }
    | expr GE expr      { $$ = $1 >= $3; }
    ;

boolean: boolean AND boolean  { $$ = $1 && $3; }
    | boolean OR boolean   { $$ = $1 || $3; }
    | NOT boolean      { $$ = !$2; }
    | LP relational RP   { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
