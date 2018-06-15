%{
#include "html.c"
#include "pag.c"
#include <glib.h>
#include <stdio.h>
void yyerror (char const *s);
int yylex();
int yywrap();
int yyparse();
gboolean pag12(gpointer key, gpointer value, GTree* arv);


char *tem;
char *nom;
char *img;
char *vid;
char *tit;
char *audio;
char *itens;
char *pagi, *pagc;
GTree* arv;

FILE *fichInicial, *fichCredit;

int i;

%}

%union{
    char* nome;
    char* tempo;
    char* atributo;
}

%type <nome> NOME
%type <tempo> TEMPO
%type <atributo> IMAGEM VIDEO TITULO AUDIO ITENS PAGINICIAL PAGCREDITOS

%token NOME TEMPO IMAGEM VIDEO TITULO AUDIO ITENS PAGINICIAL PAGCREDITOS 

%%
start: start pag {i++;}
     |  {}
     ;

pag: cabecalho '{' conteudo '}' {PAG p = create_pag(nom, tem, pagi, pagc, tit, img, vid, audio, itens);
                            g_tree_insert(arv, GINT_TO_POINTER(i), p);
                            printf("Guardei %d", i);}
    ;

cabecalho: NOME '/' TEMPO {nom = strdup($1); tem = strdup($3);}
         ;


conteudo:  conteudo IMAGEM {img = strdup($2);}
          | conteudo VIDEO {vid = strdup($2);}
          | conteudo TITULO {tit = strdup($2);}
          | conteudo AUDIO {audio = strdup($2);}
          | conteudo pagitens {} 
          | conteudo PAGINICIAL {pagi = strdup($2); printf("Guardei  pagI: %s\n",pagi); imprime_inicial(fichInicial, tem, nom);}
          | conteudo PAGCREDITOS {pagc = strdup($2); printf("Guardei  pagC: %s\n",pagc);imprime_cred(fichCredit);}
          |          {}
          ;

pagitens: ITENS {$$ = $1; itens = strdup($1);}
        ;
%%

gboolean pag12(gpointer key, gpointer value, GTree* arv){
    int i = (int) key;
    PAG p = (PAG) value;
    int j;

    if(strcmp(getPagInicial(p), NULL) !=0 ){
      imprime_inicial(fichInicial, getNome(p), getTempo(p));
      return FALSE;
    }


    if(strcmp(getPagCreditos(p), NULL) !=0 ){
      imprime_cred(fichCredit);
      return FALSE;
    }

    PAG new = g_tree_lookup(arv, GINT_TO_POINTER(key+1));

    if(new){
      char *nome_novo = getNome(new);

      for(j=0; j < i-1; j++){
        char *aux = getNome(p);
        char *n = strcat("html/", aux);
        char *n2 = strcat(n,".html");

      FILE * f = fopen(n2,"w+");
 
      faz_pag(f, getTempo(p), nome_novo, getPagInicial(p), getPagCreditos(p), getVideo(p), getAudio(p), getTitulo(p), getImagem(p));
      
      }
    }

    return FALSE;
}

int main(int argc, char** argv){

  arv = g_tree_new((GCompareFunc)g_ascii_strcasecmp);
  fichInicial = fopen("html/pagInicial.html","w+"); 
  fichCredit = fopen("html/pagCredit.html","w+");

  printf("Cheguei 1");
  i = 0;
  yyparse();

  printf("Cheguei 2");
  g_tree_foreach(arv, (GTraverseFunc) pag12, arv);
  yyparse();

  printf("Cheguei 3");
}

int yywrap(){
   return 1;
}

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
}








