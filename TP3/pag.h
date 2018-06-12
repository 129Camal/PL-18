#ifndef __PAG__
#define __PAG__

#include <stdio.h>
#include <stdlib.h>

typedef struct pag *PAG;

PAG create_pag();

void freepag(PAG a);

char* getNome(PAG a);

char* getPagInicial(PAG a);

char* getTitulo(PAG a);

char* getVideo(PAG a);

char* getPagCreditos(PAG a);

char* getAudio(PAG a);

char* getPagItens(PAG a);

char* getTempo(PAG a);

void setNome(PAG a, char* nome);

void setPagInicial(PAG a, char* paginicial);

void setTitulo(PAG a, char* titulo);

void setVideo(PAG a, char* video);

void setPagCreditos(PAG a, char* pagcreditos);

void setAudio(PAG a, char* audio);

void setPagItens(PAG a, char* pagitens);

void setTempo(PAG a, char* tempo);

#endif

