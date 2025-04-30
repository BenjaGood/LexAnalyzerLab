%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}

%option noyywrap

DIGIT   [0-9]
LETTER  [A-Za-z]
ID      {LETTER}({LETTER}|{DIGIT})*
INUM    {DIGIT}+
FNUM    {DIGIT}"."{DIGIT}+

%%

"//".*                                  { printf("COMMENT\n"); }
^[ \t]f[ \t]+{ID}[ \t]$               { printf("float_decl identifier\n"); }
^[ \t]i[ \t]+{ID}[ \t]$               { printf("int_decl identifier\n"); }
^[ \t]{ID}[ \t]=[ \t]{INUM}[ \t]$   { printf("id_assign_int\n"); }
^[ \t]{ID}[ \t]=[ \t]{ID}[ \t]+[ \t]{FNUM}[ \t]$    { printf("id_assign_id_plus_float\n"); }
^[ \t]p[ \t]+{ID}[ \t]$               { printf("print identifier\n"); }
[ \t\r\n]+                              { /* skip whitespace / }
.                                         { / skip any other */ }

%%

int main(int argc, char **argv) {
if (argc != 2) {
fprintf(stderr, "Usage: %s <source.ac>\n", argv[0]);
return 1;
}
yyin = fopen(argv[1], "r");
if (!yyin) {
perror("fopen");
return 1;
}
yylex();
fclose(yyin);
return 0;
}