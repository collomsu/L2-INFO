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

bool Rec_eaep(Lexeme lex){
  switch (lex.nature) {
    case ENTIER:
      avancer();
      break;
    case PARO:
      avancer()
      Rec_eaep(lex);
      Rec_op(lex);
      Rec_eaep(lex);
      if(lex.nature == PARF){
        avancer();
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

bool Rec_op(Lexeme lex){
  switch (lex.nature) {
    case PLUS:
    case MUL:
    case MOINS:
    case DIV:
      avancer();
    default:
      printf("ERREUR : operateur incorrect\n");
      return 0;
  }
  return 1;
}

void analyser(char *fichier, float *resultat){
  bool caractere = false;
  int operateur = 0;
  bool ok = true;
  Lexeme lex;

  *resultat = 0;

  demarrer(fichier);
  while(! fin_de_sequence()){
    lex = lexeme_courant();
    printf("%s\n", lex.chaine);
    switch (lex.nature) {
      case FIN_SEQUENCE:
        if(operateur != 0){
          ok = false;
        }
        break;
      case PLUS:
      case MOINS:
      case MUL:
      case DIV:
        if(operateur != 0 || !caractere){
          ok = false;
        } else {
          caractere = false;
          switch (lex.nature) {
            case PLUS:
              operateur = 1;
              break;
            case MOINS:
              operateur = 2;
              break;
            case MUL:
              operateur = 3;
              break;
            case DIV:
              operateur = 4;
              break;
            default:
              break;
          }
        }
        break;
      case ENTIER:
        if (caractere) {
          ok = false;
        } else {
          caractere = true;
          switch (operateur) {
            case 1:
              *resultat += lex.valeur;
              break;
            case 2:
              *resultat -= lex.valeur;
              break;
            case 3:
              *resultat = *resultat * lex.valeur;
              break;
            case 4:
              *resultat = *resultat / lex.valeur;
              break;
            default:
              *resultat = lex.valeur;
              break;
          }
          operateur = 0;
        }
        break;
      default:
        break;
    }
    avancer() ;
    if(!ok){
      printf("ERREUR : Syntaxe incorrect.\n");
      *resultat = 0.000001;
      break;
    }
  }
  if (operateur != 0) {
    printf("ERREUR : Syntaxe incorrect.\n");
    *resultat = 0.000001;
  }
}
