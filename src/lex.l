%option noyywrap 
%{
    #include "y.tab.h"
%}

alpha [a-zA-Z]
name  {alpha}([0-9]*{alpha}*)+
whitespace [ \t\v\f\r]
line \n

%%

{whitespace}
{line}  ++yylineno;
{name}  { return NAME; }
"{"     { return LEFT_BRACE; }
"}"     { return RIGHT_BRACE; }
"("     { return LEFT_PARENTHESIS; }
")"     { return RIGHT_PARENTHESIS; }

%%

