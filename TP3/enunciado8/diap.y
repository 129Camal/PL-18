%{
#include "html.c"
#include <stdlib.h>
#include <stdio.h>

void yyerror (char const *s);
int yylex();
int yywrap();
int yyparse();


int i;

%}

%union{
    char* nome;
    char* tempo;
    char* atributo;
}

%type <nome> NOME
%type <tempo> TEMPO
%type <atributo> IMAGEM VIDEO TITULO AUDIO PAGINICIAL PAGCREDITOS pags pag conteudo cabecalho

%token NOME TEMPO IMAGEM VIDEO TITULO AUDIO PAGINICIAL PAGCREDITOS 

%%
pags : pags pag                  { faz_pag($2, i);
                                    i++; 
                                 }
     | pag                       { faz_pag($1, i); 
                                    i++;
                                 }
     ;

pag: cabecalho '{' conteudo '}'  { asprintf(&$$, "%s%s", $1, $3);}
    ;

cabecalho: NOME '/' TEMPO        { asprintf(&$$, "<meta http-equiv=\"REFRESH\" content=\"%s; URL=%d.html\">\n", $3, i+1); }
         ;


conteudo:  conteudo IMAGEM       { asprintf(&$$, "%s<img src=%s align=\"middle\" height=\"200\" width=\"520\">\n",$1, $2); }
          | conteudo VIDEO       { asprintf(&$$, "%s<iframe width=\"420\" height=\"345\" src=\"%s\">\n</iframe>\n",$1, $2); }
          | conteudo TITULO      { asprintf(&$$, "%s<center><h1>%s</h1></center>\n", $1, $2); }
          | conteudo AUDIO       { asprintf(&$$, "%s<embed height=\"60\" type=\"audio/midi\" width=\"144\" src=%s volume=\"60\" loop=\"false\" autostart=\"true\"/>\n", $1, $2); }
          | conteudo PAGINICIAL  { asprintf(&$$, "%s%s", $1, imprime_inicial()); }
          | conteudo PAGCREDITOS { asprintf(&$$, "%s%s", $1, imprime_cred());}
          |                      { $$ = "";}
          ;

%%

int main(int argc, char** argv){

  i = 0;

  yyparse();

  return 0;

}

int yywrap(){
   return 1;
}

void yyerror (char const *s) {
   fprintf (stderr, "%s\n",s);
}








