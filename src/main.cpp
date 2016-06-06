#include <iostream>

extern int yyparse(); 
extern void yyerror(const char*);
extern int yylex();

int main() {
    int result = yyparse();
    
    if (result == 0) {
        std::cout << "Passed" << std::endl;
    } else { 
        std::cout << "Syntax error" << std::endl;
    }
            
    return result;
}