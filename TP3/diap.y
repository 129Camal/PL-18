%{
#include "html.h"
#include "pag.h"
#include <glib.h>

char *tem;
char *nom;
char *img;
char *vid;
char *tit;
char *audio;
char *itens
char *pagi, *pagc;

FILE *fichInicial, fichCredit;

Gtree* arv = g_tree_new_full((GCompareDataFunc)g_ascii_strcasecmp, NULL, NULL, (GDestroyNotify)freepag);

%}

%union{
    char* nome;
    int tempo;
    char* atributo;
}

%type <nome> NOME
%type <tempo> TEMPO
%type <atributo> IMAGEM VIDEO TITULO AUDIO ITENS PAGINICIAL PAGCREDITOS

%token NOME TEMPO IMAGEM VIDEO TITULO AUDIO ITENS PAGINICIAL PAGCREDITOS

%%
start: pag start {i++;}
     |
     ;

pag: cabecalho informacao {PAG p = create_pag(nom, tem, pagi, pagc, img, vid, tit, audio, itens);
                            g_tree_insert(arv, i, p;)}
    ;

cabecalho: NOME '/' TEMPO {nom = strdup($1); tem = strdup($3);}

informacao: '{' IMAGEM VIDEO TITULO AUDIO pagitens '}' {img = strdup($2);
                                                        vid = strdup($3);
                                                        tit = strdup($4);
                                                        audio = strdup($5);
                                                        }

          | '{' PAGINICIAL '}' {pagi = strdup($2); imprime_inicial(fichInicial, tem, nome);}
          | '{' PAGCREDITOS '}' {pagc = strdup($2); imprime_cred(fichCredit);}
          ;

pagitens: '[' ITENS ']' {itens = strdup($6);}
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

