%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[ \t]       ; /* Skip whitespace */
\n          ; /* Skip newlines */

[0-9]+      {
                yylval = atoi(yytext);
                return NUMBER;
            }

"+"         return PLUS;
"-"         return MINUS;
"*"         return TIMES;
"/"         return DIVIDE;
"("         return LPAREN;
")"         return RPAREN;

.           {
                printf("Error: Unrecognized character '%s'\n", yytext);
                exit(1);
            }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter mathematical expressions (e.g., 2+3*4):\n");
    printf("Press Ctrl+D (Unix) or Ctrl+Z (Windows) to exit.\n\n");
    
    int val;
    while ((val = yylex()) != 0) {
        switch(val) {
            case NUMBER:
                printf("NUMBER: %d\n", yylval);
                break;
            case PLUS:
                printf("PLUS\n");
                break;
            case MINUS:
                printf("MINUS\n");
                break;
            case TIMES:
                printf("TIMES\n");
                break;
            case DIVIDE:
                printf("DIVIDE\n");
                break;
            case LPAREN:
                printf("LEFT PAREN\n");
                break;
            case RPAREN:
                printf("RIGHT PAREN\n");
                break;
            default:
                printf("Unknown token\n");
        }
    }
    
    return 0;
}
