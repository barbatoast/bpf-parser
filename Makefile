scanner: lex.yy.c grammer.tab.c
	gcc -std=c99 -o parser grammer.tab.c

grammer.tab.c: grammer.y
	bison -v grammer.y

lex.yy.c: scanner.l
	flex scanner.l

clean:
	rm -rf grammer.tab.h grammer.tab.c lex.yy.c grammer.output parser
