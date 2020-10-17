%{
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

extern int yylineno;
extern FILE* yyin;

int yylex();
int yywrap();

static void yyerror(const char* p)
{
	printf("ERRO: %s\n", p);
}
%}

%token DST SRC HOST
%token IP TCP UDP
%token ADDR4

%%

prog : IP SRC HOST ADDR4
    | /* empty */
    ;
%%

#include "lex.yy.c"

int main(int argc, char *argv[]) {
    FILE *input_file;

    input_file = fopen("input", "r");
    if (NULL == input_file) {
        printf("ERRO: failed to open input file\n");
        goto error_out_fopen;
    }

    yyin = input_file;
    yyparse();

    return EXIT_SUCCESS;
error_out_fopen:
    return EXIT_FAILURE;
}
