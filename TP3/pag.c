
#include "pag.h"

struct pag {
     char* nome;
     int tempo; 
     char* paginicial;
     char* titulo;
     char* video;
     char* audio;
     char* pagcreditos;
     char* pagitens;
};

PAG create_pag(){
	PAG p = malloc(sizeof(struct pag));

	p->nome = "NULL";
	p->tempo = 0;
	p->paginicial = "NULL";
	p->titulo = "NULL";
	p->video = "NULL";
	p->audio = "NULL";
	p->pagcreditos = "NULL";
	p->pagitens = "NULL";

	return p;
}

char* getNome(PAG a){
	return strudup(a->nome);
}

char* getPagInicial(PAG a){
	return strudup(a->paginicial);
}

char* getTitulo(PAG a){
	return strudup(a->titulo);
}

char* getVideo(PAG a){
	return strudup(a->video);
}

char* getPagCreditos(PAG a){
	return strudup(a->pagcreditos);
}

char* getAudio(PAG a){
	return strudup(a->audio);
}

char* getPagItens(PAG a){
	return strudup(a->pagitens);
}

int getTempo(PAG a){
	return a->tempo;
}

void setNome(PAG a, char* nome){
	a->nome = nome;
}

void setPagInicial(PAG a, char* paginicial){
	a->paginicial = paginicial;
}

void setTitulo(PAG a, char* titulo){
	a->titulo = titulo;
}

void setVideo(PAG a, char* video){
	a->video = video;
}

void setPagCreditos(PAG a, char* pagcreditos){
	a->pagcreditos = pagcreditos;
}

void setAudio(PAG a, char* audio){
	a->audio = audio;
}

void setPagItens(PAG a, char* pagitens){
	a->pagitens = pagitens;
}

void setTempo(PAG a, int tempo){
	a->tempo = tempo;
}

void freepag(PAG a){
	free(a);
}