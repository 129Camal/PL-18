%option noyywrap
%option yylineno

%x TIME
%x CH
%x BARRA

%{

#include "y.tab.h"
#include <stdio.h>
#include <string.h>

%}

%%

<*>[pag[1-9][0-9]*] 	{ yylval.nome = strdup(yytext);
						  printf("%s", yylval.nome);
						  BEGIN BARRA;
            			  return NOME;}

<BARRA>^\/ {  yylval.barra = yytext[0];
			  BEGIN TIME;
			  return BAR;}

<TIME>tempo[1-9][0-9]*	{ strncpy(yylval.tempo, yytext+6, strlen(yytext+6));
							printf("%s", yylval.tempo);
							BEGIN CH;
   							return TEMPO;}

<CH>^\{ { yylval.chaveta = yytext[0];
			return CHA;};


<*>TITULO\s.+ 			{ strncpy(yylval.atributo, yytext+7, strlen(yytext+7));
            				printf("%s", yylval.atributo);
            				return TITULO; };

<*>AUDIO\s.+ 			{ strncpy(yylval.atributo, yytext+6, strlen(yytext+6));
            				printf("%s", yylval.atributo);
            				return AUDIO; };

<*>VIDEO\s.+ 			{ strncpy(yylval.atributo, yytext+6, strlen(yytext+6));
            				printf("%s", yylval.atributo);
            				return VIDEO; };

<*>IMAGEM\s.+ 			{ strncpy(yylval.atributo, yytext+7, strlen(yytext+7));
            				printf("%s", yylval.atributo);
            				return IMAGEM; };

<*>PAGINICIAL\s.+ 		{ strncpy(yylval.atributo, yytext+11, strlen(yytext+11));
            				printf("%s", yylval.atributo);
            				return PAGINICIAL; };

<*>PAGCREDITOS\s.+ 		{ strncpy(yylval.atributo, yytext+12, strlen(yytext+12)); 
							printf("%s", yylval.atributo); 
							return PAGCREDITOS; };

<*>PAGITENS\s.+ 		{ strncpy(yylval.atributo, yytext+9, strlen(yytext+9)); 
							printf("%s", yylval.atributo);
							return ITENS; };

<*>^\} {  yylval.chaveta = yytext[0];
			return CHA;
		};


%%

