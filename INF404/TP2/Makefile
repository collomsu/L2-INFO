CC=gcc

all: test_lexeme calculette

calculette: calculette.o analyse_syntaxique.o
	$(CC) -g -Wall -o calculette calculette.o analyse_syntaxique.o analyse_lexicale.o lecture_caracteres.o

test_lexeme: analyse_lexicale.o  lecture_caracteres.o  test_lexeme.o
	$(CC) -g -Wall -o test_lexeme analyse_lexicale.o  lecture_caracteres.o  test_lexeme.o

calculette.o: calculette.c
	$(CC) -g -Wall -c calculette.c

analyse_syntaxique.o: analyse_syntaxique.c
	$(CC) -g -Wall -c analyse_syntaxique.c

analyse_lexicale.o: analyse_lexicale.c
	$(CC) -g -Wall -c analyse_lexicale.c

lecture_caracteres.o: lecture_caracteres.c
	$(CC) -g -Wall -c lecture_caracteres.c

test_lexeme.0: analyse_lexicale.h
	$(CC) -g -Wall -c test_lexeme.c

clean:
	rm -f  test_lexeme calculette *.o
