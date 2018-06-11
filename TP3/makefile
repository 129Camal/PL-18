diap : y.tab.o lex.yy.o
	gcc -o diap `pkg-config --cflags --libs glib-2.0` y.tab.o lex.yy.o -ll -lm

y.tab.o : y.tab.c
	gcc -c y.tab.c `pkg-config --cflags --libs glib-2.0`

lex.yy.o : lex.yy.c
	gcc -c lex.yy.c

y.tab.c y.tab.h : diap.y
		yacc -d --debug --verbose diap.y

lex.yy.c : diap.l y.tab.h
	flex diap.l

clean:
	rm diap lex.yy.o lex.yy.c y.tab.c y.tab.h y.tab.o
