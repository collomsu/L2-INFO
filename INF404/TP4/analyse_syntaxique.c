#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"
#include "lecture_caracteres.h"
#include "analyse_lexicale.h"

float evaluer(float valg, float vald, char op){
  switch (op) {
    case '+':
      return (float)(valg+vald);
      break;
    case '-':
      return (float)(valg-vald);
      break;
    case '*':
      return (float)(valg*vald);
      break;
    case '/':
      if(vald == 0){
        printf("ERREUR : Division par 0\n");
        return (float)(0.000001);
      } else {
        return (float)(valg/vald);
      }
      break;
    default:
      printf("ERREUR : Operateur inconnu\n");
      return (float)(0.000001);
  }
}

bool Rec_op(Lexeme *lex, char *op){
  switch (lex->nature) {
    case PLUS:
    case MUL:
    case MOINS:
    case DIV:
      *op = *lex->chaine;
      avancer();
      *lex = lexeme_courant();
      break;
    default:
      printf("ERREUR : operateur incorrect\n");
      return 0;
  }
  return 1;
}

bool Rec_eaep(Lexeme *lex, float *val){
  float *valg = malloc(sizeof(float));
  float *vald = malloc(sizeof(float));
  char *op = malloc(sizeof(char));
  *valg = 0;
  *vald = 0;
  *op = '\0';
  switch (lex->nature) {
    case ENTIER:
      avancer();
      *lex = lexeme_courant();
      *val = lex->valeur;
      break;
    case PARO:
      avancer();
      *lex = lexeme_courant();
      Rec_eaep(lex, valg);
      Rec_op(lex, op);
      Rec_eaep(lex, vald);
      *val = evaluer(*valg,*vald,*op);
      if(*val == (float)(0.000001)){
        return 0;
      }
      if(lex->nature == PARF){
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

void Rec_suite_terme(Lexeme *lex){
  switch (lex->nature) {
    case ENTIER:
      avancer();
      *lex = lexeme_courant();
      break;
    case PARO:
      avancer();
      *lex = lexeme_courant();
      Rec_eag(lex);
        if(lex->nature == PARF){
          avancer();
          *lex = lexeme_courant();
        } else {
          printf("ERREUR : EAG incorrect (PARF manquante)\n");
        }
  }
}

void Rec_seq_terme(Lexeme *lex){
  Rec_terme();
  Rec_suite_terme();
}

void Rec_eag(Lexeme *lex){
  Rec_seq_terme();
}

/* etat initial : indifferent
etat final : une EAEP a ete lue dans le nom_fichier
si elle ne contient pas d'erreur de syntaxe un message est affiche
et la valeur de cette expression est fournie dans le parametre resultat
sinon le pgm termine sur un message d'erreur */

void analyser(char *fichier, float *resultat){
  Lexeme *lex = malloc(sizeof(Lexeme));
  char *op = malloc(sizeof(char));
  float *val = malloc(sizeof(float));
  bool opafaire = false;
  *resultat = 0;
  *val = 0;
  *op = '\0';

  demarrer(fichier);
  *lex = lexeme_courant();
  int i = 0;
  while(! fin_de_sequence()){
    i++;
    if(!Rec_eaep(lex, val)){
      printf("ERREUR : Syntaxe incorrect.\n");
      *resultat = 0.000001;
      break;
    } else {
      if(opafaire){
        *resultat = evaluer(*resultat, *val, *op);
        opafaire = false;
      } else {
        *resultat = *val;
      }
      if(! fin_de_sequence()){
        if(!Rec_op(lex, op)){
          printf("ERREUR : Syntaxe incorrect.\n");
          *resultat = 0.000001;
          break;
        }
        opafaire = true;
      }
    }
  }
}
