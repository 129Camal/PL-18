V=enunciado5


$V: $V.fl
	flex $V.fl
	gcc lex.yy.c `pkg-config --cflags --libs glib-2.0` -o $V -ll 

clean:
	rm result.kml
	rm $V
	rm lex.yy.c