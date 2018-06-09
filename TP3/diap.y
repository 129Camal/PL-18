%{
#include "html.h"
%}

%union{
    FILE *fichInicial, fichCredit;
    char* nome;
    int tempo;
    char* atributo;
}

%type <nome> NOME
%type <tempo> TEMPO
%type <atributo> IMAGEM VIDEO TITULO AUDIO ITEM PAGINICIAL PAGCREDITOS

%token NOME TEMPO IMAGEM VIDEO TITULO AUDIO ITEM PAGINICIAL PAGCREDITOS

%%
START: PAG START {printf("%s",$1);}
     |
     ;

PAG: CABECALHO INFORMACAO
    ;

CABECALHO: NOME '/' TEMPO

INFORMACAO: '{' IMAGEM VIDEO TITULO AUDIO PAGITENS '}'
          | '{' PAGINICIAL '}' {imprime_start(ficheiro);}
          | '{' PAGCREDITOS '}' {imprime_cred(ficheiro);}
          ;

PAGITENS: '[' ITENS ']'
    ;

ITENS: ITEM ',' ITENS
    | ITEM
    ;

%%
int main(int argc, char** argv){
  fichInicial = fopen("pagInicial.html","w+"); /* ver a cena do w+ */
  fichCredit = fopen("pagCredit.html","w+");
  yyparse();

}

int yywrap(){
   return 1;
}

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
}

