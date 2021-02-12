#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"
#include "lecture_caracteres.h"
#include "analyse_lexicale.h"

/* etat initial : indifferent
etat final : une EAEP a ete lue dans le nom_fichier
si elle ne contient pas d'erreur de syntaxe un message est affiche
sinon le pgm termine sur un message d'erreur */

bool Rec_op(Lexeme *lex){
  printf("%s\n",lex->chaine);
  switch (lex->nature) {
    case PLUS:
    case MUL:
    case MOINS:
    case DIV:
      avancer();
      *lex = lexeme_courant();
      break;
    default:
      printf("ERREUR : operateur incorrect\n");
      return 0;
  }
  return 1;
}

bool Rec_eaep(Lexeme *lex){
  printf("%s\n",lex->chaine);
  switch (lex->nature) {
    case ENTIER:
      avancer();
      *lex = lexeme_courant();
      break;
    case PARO:
      avancer();
      *lex = lexeme_courant();
      Rec_eaep(lex);
      Rec_op(lex);
      Rec_eaep(lex);
      if(lex->nature == PARF){
        printf("%s\n",lex->chaine);
        avancer();
        *lex = lexeme_courant();
      } else {
        printf("ERREUR : EAEP incorrect (PARF manquante)\n");
        return 0;
      }
      break;
    default:
      printf("ERREUR : EAEP incorrect\n");
      return 0;
  }
  return 1;
}

void analyser(char *fichier, float *resultat){
  Lexeme *lex = malloc(sizeof(Lexeme));

  *resultat = 0;

  demarrer(fichier);
  *lex = lexeme_courant();
  while(! fin_de_sequence()){
    if(!Rec_eaep(lex)){
      printf("ERREUR : Syntaxe incorrect.\n");
      *resultat = 0.000001;
      break;
    } else {
      if(! fin_de_sequence()){
        if(!Rec_op(lex)){
          printf("ERREUR : Syntaxe incorrect.\n");
          *resultat = 0.000001;
          break;
        }
      }
    }
  }
}
