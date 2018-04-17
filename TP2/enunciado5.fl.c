%option noyywrap
%{

#include <string.h>
#include <stdio.h>
#include <glib.h>	

void insere(char* s, GHashTable* hashLat, GHashTable* hashLon);
void placemark(FILE* kml);
void begin(FILE* kml);

FILE* kml;
int i = 1;
GHashTable* hashLon = g_hash_table_new(g_direct_hash, g_direct_equal);
GHashTable* hashLat = g_hash_table_new(g_direct_hash, g_direct_equal);
%}

%%

<trkpt.+> {ECHO; insere(yytext, hashLat, hashLon);}

%%

int main(int argc, char** argv){
	kml = fopen("result.kml","w");

	yylex();

	begin(kml);
	placemark(kml);
	g_hash_table_destroy(hashLon);
	g_hash_table_destroy(hashLat);
	return 0;
}

void begin(FILE* kml){
	fprintf(kml, "<?xml version="1.0" encoding="UTF-8"?>");
	fprintf(kml, "<kml xmlns =\"www.opengis.net/kml/2.2>\"");
	fprintf(kml, "	<Document>");
	fprintf(kml, "		<Style id=\"redline\"");
	fprintf(kml, "			<LineStyle>");
	fprintf(kml, "				<color>ff0000ff</color>");
	fprintf(kml, "				<width>4</width>");
	fprintf(kml, "			<LineStyle>");
	fprintf(kml, "			<PolyStyle>");
	fprintf(kml, "				<color>ff0000ff</color>");
	fprintf(kml, "				</PolyStyle>");
	fprintf(kml, "		</Style>"); 

}

void placemark(FILE* kml){
	GHashTableIter iter1;
    gpointer key, value;

	fprintf(kml, "		<Placemark>");
	fprintf(kml, "			<name>Rota</name>");
	fprintf(kml, "			<LineString>");
	fprintf(kml, "				<extrude>1</extrude>");
	fprintf(kml, "				<tessellate>1</tessellate>");
	fprintf(kml, "				<coordinates>");

	g_hash_table_iter_init(&iter, hashLat);
    while(g_hash_table_iter_next(&iter, &key, &value)){
    	int p = (int)key;
    	char* lat = (char*)value;

    	char* lon = g_hash_table_lookup(hashLon, GINT_TO_POINTER(p));
    	
    	fprintf(kml, "					%s,%s", lat, lon);

    }
	fprintf(kml, "				</coordinates>");
	fprintf(kml, "			</LineString>");
	fprintf(kml, "		</Placemark>");
	fprintf(kml, "	</Document>");
	fprintf(kml, "</kml>");
}

void insere(char* s, GHashTable* hashLat, GHashTable* hashLon){
	char* lon;
	char* lat;

	if (*yytext+12 = '-'){
		if(*yytext+37 = '-'){
			*yytext+53 = '\0';
			lon = yytext+37;
		} else {
			*yytext+52 = '\0';
			lon = yytext+37;
		}
		*yytext+28 = '\0';
		lat = yytext+12;
	} else {
		if(*yytext+36 = '-'){
			*yytext+52 = '\0';
			lon = yytext+36;
		} else {
			*yytext+51 = '\0';
			lon = yytext+37;
		}
		*yytext+27 = '\0';
		lat = yytext+12;
	}
	g_hash_table_insert(hashLat, GINT_TO_POINTER(i),lat);
	g_hash_table_insert(hashLon, GINT_TO_POINTER(i),lon);
	i++;

}
