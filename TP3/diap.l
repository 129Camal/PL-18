%option noyywrap
%option yylineno

%x TIME
%x LIST

%{

#include "y.tab.h"
#include <stdio.h>
#include <string.h>

%}

%%

<*>[pag[1-9][0-9]*] 	{ yylval.nome = strdup(yytext);
			BEGIN TIME;
            return NOME;}

<TIME>\/([0-9]+)\{ 		{ strncpy(yyval.tempo, yytext+1, strlen(yytext+1) -1);
   				return TEMPO;}

<*>TITULO\s.+ 			{ strncpy(yyval.atributo, yytext+7, strlen(yytext+7));
            return TITULO;}

<*>AUDIO\s.+ 			{ strncpy(yyval.atributo, yytext+6, strlen(yytext+6);
            return AUDIO;}

<*>VIDEO\s.+ 			{ strncpy(yyval.atributo, yytext+6, strlen(yytext+6);
            return VIDEO;}

<*>IMAGEM\s.+ 			{strncpy(yyval.atributo, yytext+7, strlen(yytext+7);
            return IMAGEM;}

<*>PAGINICIAL\s.+ 		{strncpy(yyval.atributo, yytext+11, strlen(yytext+11);
            return PAGINICIAL;}

<*>PAGCREDITOS\s.+ 		{strncpy(yyval.atributo, yytext+12, strlen(yytext+12);
            return PAGCREDITOS;}

<*>PAGITENS\s.+ 		{‬strncpy(yyval.atributo, yytext+9, strlen(yytext+9);
            return ITENS;}


%%