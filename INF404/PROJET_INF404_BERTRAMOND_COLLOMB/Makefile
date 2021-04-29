CC=gcc -g -Wall

all: interpreteur

interpreteur: interpreteur.o analyse_syntaxique.o ast_parcours.o ast_construction.o analyse_lexicale.o lecture_caracteres.o table_symbole.o
	$(CC) -o interpreteur interpreteur.o analyse_syntaxique.o ast_parcours.o ast_construction.o analyse_lexicale.o lecture_caracteres.o table_symbole.o

essai_ast: ast_construction.o  ast_parcours.o  essai_ast.o
	$(CC) -o essai_ast ast_construction.o  ast_parcours.o  essai_ast.o

analyse_syntaxique.o: analyse_syntaxique.c
	$(CC) -c analyse_syntaxique.c

analyse_lexicale.o: analyse_lexicale.c
	$(CC) -c analyse_lexicale.c

lecture_caracteres.o: lecture_caracteres.c
	$(CC) -c lecture_caracteres.c

table_symbole.o : table_symbole.c
	$(CC) -c table_symbole.c

ast_construction.o: ast_construction.c type_ast.h
	$(CC) -c ast_construction.c

ast_parcours.o: ast_parcours.c type_ast.h table_symbole.h
	$(CC) -c ast_parcours.c

essai_ast.o: essai_ast.c  ast_construction.h  ast_parcours.h  type_ast.h
	$(CC) -c essai_ast.c

interpreteur.o: interpreteur.c
	$(CC) -c interpreteur.c

clean:
	rm -f interpreteur *.o
