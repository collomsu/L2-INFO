CC=gcc -g -Wall

all: essai_ast calculette

calculette: calculette.o analyse_syntaxique.o ast_parcours.o ast_construction.o analyse_lexicale.o lecture_caracteres.o
	$(CC) -o calculette calculette.o analyse_syntaxique.o ast_parcours.o ast_construction.o analyse_lexicale.o lecture_caracteres.o

essai_ast: ast_construction.o  ast_parcours.o  essai_ast.o
	$(CC) -o essai_ast ast_construction.o  ast_parcours.o  essai_ast.o

ast_construction.o: ast_construction.c type_ast.h
	$(CC) -c ast_construction.c

ast_parcours.o: ast_parcours.c type_ast.h
	$(CC) -c ast_parcours.c

essai_ast.o: essai_ast.c  ast_construction.h  ast_parcours.h  type_ast.h
	$(CC) -c essai_ast.c

calculette.o: calculette.c
	$(CC) -c calculette.c

analyse_syntaxique.o: analyse_syntaxique.c analyse_syntaxique.h
	$(CC) -c analyse_syntaxique.c

lecture_caracteres.o: lecture_caracteres.c
	$(CC) -c lecture_caracteres.c

analyse_lexicale.o: analyse_lexicale.c analyse_lexicale.h lecture_caracteres.h
	$(CC) -c analyse_lexicale.c

clean:
	rm *.o essai_ast
