
#include "pag.h"
#include <string.h>

struct pag {
     char* nome;
     char* tempo; 
     char* paginicial;
     char* titulo;
     char* img;
     char* video;
     char* audio;
     char* pagcreditos;
     char* pagitens;
};

PAG create_pag(char* nome, char* tempo, char* pagi, char* pagc, char* tit, char* img, char* vid, char* audio, char* it){
	PAG p = malloc(sizeof(struct pag));

	p->nome = nome;
	p->tempo = tempo;
	p->paginicial = pagi;
	p->pagcreditos = pagc;
	p->img = img;
	p->titulo = tit;
	p->video = vid;
	p->audio = audio;
	p->pagitens = it;

	return p;
}

char* getNome(PAG a){
	return strdup(a->nome);
}

char* getPagInicial(PAG a){
	return strdup(a->paginicial);
}

char* getTitulo(PAG a){
	return strdup(a->titulo);
}

char* getVideo(PAG a){
	return strdup(a->video);
}

char* getPagCreditos(PAG a){
	return strdup(a->pagcreditos);
}

char* getAudio(PAG a){
	return strdup(a->audio);
}

char* getImagem(PAG a){
	return strdup(a->img);
}

char* getPagItens(PAG a){
	return strdup(a->pagitens);
}

char* getTempo(PAG a){
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

void setTempo(PAG a, char* tempo){
	a->tempo = tempo;
}

void freepag(PAG a){
	free(a);
}