%{

#include "y.tab.h"
#include <stdio.h>
#include <string.h>

%}

%option noyywrap

%%

pag[1-9][0-9]* { yylval.nome = yytext;
            return NOME;}

\/([0-9]+)\{ {  strncpy(yyval.tempo, yytext+1, strlen(yytext+1) -1);
   				return TEMPO;}




%%