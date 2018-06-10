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
%type <atributo> IMAGEM VIDEO TITULO AUDIO ITENS PAGINICIAL PAGCREDITOS

%token NOME TEMPO IMAGEM VIDEO TITULO AUDIO ITENS PAGINICIAL PAGCREDITOS

%%
start: pag start {printf("%s",$1);}
     |
     ;

pag: cabecalho informacao
    ;

cabecalho: NOME '/' TEMPO

informacao: '{' IMAGEM VIDEO TITULO AUDIO pagitens '}'
          | '{' PAGINICIAL '}' {imprime_start(ficheiro);}
          | '{' PAGCREDITOS '}' {imprime_cred(ficheiro);}
          ;

pagitens: '[' ITENS ']'
    ;


%%
int main(int argc, char** argv){
  fichInicial = fopen("html/pagInicial.html","w+"); 
  fichCredit = fopen("html/pagCredit.html","w+");
  yyparse();

}

int yywrap(){
   return 1;
}

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
}

