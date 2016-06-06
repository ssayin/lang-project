%{
    #include <math.h>
    #include <stdio.h>
    #include <stdlib.h>
    
    int yylex(void);
    void yyerror(char const*);
%}

%define api.value.type {int}

%token NAME LEFT_BRACE RIGHT_BRACE LEFT_PARENTHESIS RIGHT_PARENTHESIS

%start main

%%

main: 
    NAME LEFT_PARENTHESIS RIGHT_PARENTHESIS LEFT_BRACE RIGHT_BRACE

%%

void yyerror(char const* err) {
    printf("Error %s\n", err);
    exit(1);
}