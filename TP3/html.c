#include "html.h"


void imprime_inicial(FILE *fichInicial, char* tempo, char *nome){

	fprintf(fichInicial,"<!doctype html>\n");
	fprintf(fichInicial,"<html lang='en'>");
	fprintf(fichInicial,"<head>\n");
	fprintf(fichInicial,"\t<meta charset='utf-8'>\n");
	fprintf(fichInicial,"<meta http-equiv=\"REFRESH\" content=\"%s;URL=%s.html\">\n",time, nome);
	fprintf(fichInicial,"\t<title>The HTML5 Herald</title>\n");
	fprintf(fichInicial,"\t<meta name='description' content='The HTML5 Herald'>\n");
	fprintf(fichInicial,"\t<meta name='author' content='SitePoint'>\n");
	fprintf(fichInicial,"</head>\n");
	fprintf(fichInicial,"<body>\n");
	fprintf(fichInicial,"\t<center><h1>Departamento de Informática</h1></center>\n");
	fprintf(fichInicial,"\t<div style=\"position: absolute; top:535px; left:1150px; width:900px; height:25px\">\n");
	fprintf(stderr,"\t\t<img src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/EEUMLOGO.png/200px-EEUMLOGO.png\" align=\"middle\" height=\"90\" width=\"100\"></div>\n");
	fprintf(fichInicial,"\t<div style=\"position:absolute; ; top:200px; left:400px; width:30px; height:40px\">\n");
	fprintf(fichInicial,"\t\t<img src=\"https://www.uminho.pt/PT/siga-a-uminho/Paginas/ShowImage.aspx?Codigo=74551&lang=PT\" align=\"middle\" height=\"200\" width=\"520\">\n\t</div>\n");
	fprintf(fichInicial,"\t<p>O Departamento de Informática da Universidade do Minho (DIUM) tem por missão a divulgação do conhecimento, fundamental e especializado, nas áreas da ciência e das tecnologias da computação, com particular destaque para a Programação associada à Verificação e Segurança, os Sistemas Inteligentes, os Sistemas Distribuídos e confiáveis, os Sistemas de Computação de Alto-desempenho, a Engenharia de Software e as Comunicações e Redes de Computadores.\n\t</p>\n");
 	fprintf(fichInicial,"\t<div style=\"position:absolute; ; top:450px; left:430px; width:500px; height:40px\">\n");
    fprintf(fichInicial,"\t\t<p><b>Diretor</b></p>\n");
    fprintf(fichInicial,"\t\t<p><font size="0.5">Professor Doutor Pedro Henriques</font></p>\n\t</div>");
 	fprintf(fichInicial,"\t<div style=\"position:absolute; ; top:450px; left:710px; width:500px; height:40px\">\n");
   	fprintf(fichInicial,"\t\t<p><b>Diretor Adjunto</b></p>\n");
   	fprintf(fichInicial,"\t\t<p><font size=\"0.5\">Professora Doutora Solange Rito Lima</font></p>\n\t</div>");
	fprintf(fichInicial,"<div style=\"position:absolute; ; top:200px; left:30px; width:300px; height:40px\">\n");
	fprintf(fichInicial,"\t<div style=\"text-align:center;padding:1em 0;\">\n");
	fprintf(fichInicial,"\t\t<h4><a style=\"text-decoration:none;\" href=\"https://www.zeitverschiebung.net/en/city/2643743\">\n");
	fprintf(fichInicial,"\t\t\t<span style=\"color:gray;\">Current local time in</span>\n");
	fprintf(fichInicial,"\t\t\t<br />Braga, Portugal</a></h4>\n");
	fprintf(fichInicial,"\t\t\t<iframe src=\"https://www.zeitverschiebung.net/clock-widget-iframe-v2?language=en&size=small&timezone=Europe%2FLondon\" width=\"100%\" height=\"90\" frameborder=\"0\" seamless>\n");
	fprintf(fichInicial,"\t\t\t</iframe>\n\t\t</div>\n</div>");
	fprintf(fichInicial,"</body>\n");
	fprintf(fichInicial,"</html>\n");
}


void imprime_cred(FILE *fichCredit){
	fprintf(fichCredit,"<!doctype html>\n");
	fprintf(fichCredit,"<html lang='en'>");
	fprintf(fichCredit,"<head>\n");
	fprintf(fichCredit,"\t<meta charset='utf-8'>\n");
	fprintf(fichCredit,"\t<title>The HTML5 Herald</title>\n");
	fprintf(fichCredit,"\t<meta name='description' content='The HTML5 Herald'>\n");
	fprintf(fichCredit,"\t<meta name='author' content='SitePoint'>\n");
	fprintf(fichCredit,"<body>\n");
	fprintf(fichCredit,"<center><h1 style="color:white;">Créditos</h1></center>\n");
	fprintf(fichCredit,"<div style="position: absolute; top:200px; left:200px; width:900px; height:25px" class="w3-row w3-center" style="color:white;" >\n");
	fprintf(fichCredit,"<i class="w3-row w3-center" style="color:white;">One machine can do the work of fifty ordinary men.  No machine can do the work of one extraordinary man.\n");
	fprintf(fichCredit,"<i class="w3-row w3-center" style="color:white;"> - Elbert Hubbard</p>\n");
	fprintf(fichCredit,"\t</div>\n</div>");
	fprintf(fichCredit,"</body>\n");
	fprintf(fichCredit,"</html>\n");
}

void imprime_pag(FILE *fich, )









