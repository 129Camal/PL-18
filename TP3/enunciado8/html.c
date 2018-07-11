#include "html.h"
#include <stdio.h>
#include <string.h>

char* imprime_inicial(){

	char* result;
	/*
	asprintf(&nome,"<!doctype html>\n");
	asprintf(fichInicial,"<html lang='en'>");
	asprintf(&result,"<head>\n");
	asprintf(&result,"\t<meta charset='utf-8'>\n");
	asprintf(&result,"<meta http-equiv=\"REFRESH\" content=\"%s;URL=%s.html\">\n",tempo, nome);
	asprintf(&result,"\t<title>The HTML5 Herald</title>\n");
	asprintf(&result,"\t<meta name='description' content='The HTML5 Herald'>\n");
	asprintf(&result,"\t<meta name='author' content='SitePoint'>\n");
	asprintf(&result,"</head>\n");
	asprintf(&result,"<body>\n");
	*/
	asprintf(&result,"\t<center><h1>Departamento de Informática</h1></center>\n");
	asprintf(&result,"\t<div style=\"position: absolute; top:535px; left:1150px; width:900px; height:25px\">\n");
	asprintf(&result,"\t\t<img src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/EEUMLOGO.png/200px-EEUMLOGO.png\" align=\"middle\" height=\"90\" width=\"100\"></div>\n");
	asprintf(&result,"\t<div style=\"position:absolute; ; top:200px; left:400px; width:30px; height:40px\">\n");
	asprintf(&result,"\t\t<img src=\"https://www.uminho.pt/PT/siga-a-uminho/Paginas/ShowImage.aspx?Codigo=74551&lang=PT\" align=\"middle\" height=\"200\" width=\"520\">\n\t</div>\n");
	asprintf(&result,"\t<p>O Departamento de Informática da Universidade do Minho (DIUM) tem por missão a divulgação do conhecimento, fundamental e especializado, nas áreas da ciência e das tecnologias da computação, com particular destaque para a Programação associada à Verificação e Segurança, os Sistemas Inteligentes, os Sistemas Distribuídos e confiáveis, os Sistemas de Computação de Alto-desempenho, a Engenharia de Software e as Comunicações e Redes de Computadores.\n\t</p>\n");
 	asprintf(&result,"\t<div style=\"position:absolute; ; top:450px; left:430px; width:500px; height:40px\">\n");
    asprintf(&result,"\t\t<p><b>Diretor</b></p>\n");
    asprintf(&result,"\t\t<p><font size=\"0.5\">Professor Doutor Pedro Henriques</font></p>\n\t</div>");
 	asprintf(&result,"\t<div style=\"position:absolute; ; top:450px; left:710px; width:500px; height:40px\">\n");
   	asprintf(&result,"\t\t<p><b>Diretor Adjunto</b></p>\n");
   	asprintf(&result,"\t\t<p><font size=\"0.5\">Professora Doutora Solange Rito Lima</font></p>\n\t</div>");
	asprintf(&result,"<div style=\"position:absolute; ; top:200px; left:30px; width:300px; height:40px\">\n");
	asprintf(&result,"\t<div style=\"text-align:center;padding:1em 0;\">\n");
	asprintf(&result,"\t\t<h4><a style=\"text-decoration:none;\" href=\"https://www.zeitverschiebung.net/en/city/2643743\">\n");
	asprintf(&result,"\t\t\t<span style=\"color:gray;\">Current local time in</span>\n");
	asprintf(&result,"\t\t\t<br />Braga, Portugal</a></h4>\n");
	asprintf(&result,"\t\t\t<iframe src=\"https://www.zeitverschiebung.net/clock-widget-iframe-v2?language=en&size=small&timezone=Europe%sFLondon\" width=\"100%s\" height=\"90\" frameborder=\"0\" seamless>\n", "%2", "%");
	asprintf(&result,"\t\t\t</iframe>\n\t\t</div>\n</div>");
	
	/*asprintf(&result,"</body>\n");
	asprintf(&result,"</html>\n");
	*/

	return result;
}


char* imprime_cred(){
	
	char* result;

	asprintf(&result,"<center><h1 style=\"color:white;\">Créditos</h1></center>\n");
	asprintf(&result,"<div style=\"position: absolute; top:200px; left:200px; width:900px; height:25px\" class=\"w3-row w3-center\" style=\"color:white;\" >\n");
	asprintf(&result,"<i class=\"w3-row w3-center\" style=\"color:white;\">One machine can do the work of fifty ordinary men.  No machine can do the work of one extraordinary man.\n");
	asprintf(&result,"<i class=\"w3-row w3-center\" style=\"color:white;\"> - Elbert Hubbard</p>\n");
	asprintf(&result,"\t</div>\n</div>");

	return result;
}

void faz_pag(char* informacao, int i){
	char str[150];

	sprintf(str, "html/%d.html", i);

	FILE* fich = fopen(str,"w+");

	fprintf(fich,"<!doctype html>\n");
	fprintf(fich,"<html lang='en'>");
	fprintf(fich,"<head>\n");
	fprintf(fich,"\t<meta charset='utf-8'>\n");
	fprintf(fich,"\t<title>The HTML5 Herald</title>\n");
	fprintf(fich,"\t<meta name='description' content='The HTML5 Herald'>\n");
	fprintf(fich,"\t<meta name='author' content='SitePoint'>\n");
	fprintf(fich,"</head>\n");
	fprintf(fich,"<body style = \"background-color:powderblue;\">\n");
	fprintf(fich, "%s", informacao);
	fprintf(fich,"</body>\n");
	fprintf(fich,"</html>\n");

	fclose(fich);
}









