#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"
#include "lecture_caracteres.h"
#include "analyse_lexicale.h"

/* etat initial : indifferent
etat final : une Expression Arithmetique a ete lue dans le fichier
si elle ne contient pas d'erreur de syntaxe un message est affiche
sinon le pgm termine sur un message d'erreur */
void analyser(char *fichier){
  bool caractere = false;
  bool operateur = false;
  bool ok = true;
  Lexeme lex;

  demarrer(fichier);
  while(! fin_de_sequence()){
    lex = lexeme_courant();
    printf("%s\n", lex.chaine);
    switch (lex.nature) {
      case FIN_SEQUENCE:
        if(operateur){
          ok = false;
        }
        break;
      case PLUS:
      case MOINS:
      case MUL:
      case DIV:
        if(operateur || !caractere){
          ok = false;
        } else {
          operateur = true;
          caractere = false;
        }
        break;
      case ENTIER:
        if (caractere) {
          ok = false;
        } else {
          caractere = true;
          operateur = false;
        }
        break;
      default:
        break;
    }
    avancer() ;
    if(!ok){
      printf("ERREUR : Syntaxe inccorect.\n");
      break;
    }
  }
  if (operateur) {
    printf("ERREUR : Syntaxe inccorect.\n");
  }
}
