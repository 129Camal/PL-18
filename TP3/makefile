diap : y.tab.o lex.yy.o
	gcc -o diap y.tab.o lex.yy.o -ll -lm

y.tab.o : y.tab.c
	gcc -c y.tab.c

lex.yy.o : lex.yy.c
	gcc -c lex.yy.c

y.tab.c y.tab.h : diap.y
		yacc -d diap.y

lex.yy.c : diap.l y.tab.h
	flex diap.l

clean:
	rm diap lex.yy.o lex.yy.c y.tab.c y.tab.h y.tab.o
