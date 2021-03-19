#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"
#include "lecture_caracteres.h"
#include "analyse_lexicale.h"
#include "type_ast.h"
#include "ast_construction.h"
#include "ast_parcours.h"

TypeOperateur Operateur(Nature_Lexeme n){
  switch (n) {
    case PLUS:
      return N_PLUS;
    case MOINS:
      return N_MOINS;
    case MUL:
      return N_MUL;
    case DIV:
      return N_DIV;
    default:
      printf("ERREUR : Operateur incorrect\n");
  }
}

int op(TypeOperateur *op){
  switch (lexeme_courant().nature) {
    case PLUS:
    case MOINS:
      *op = Operateur(lexeme_courant().nature);
      avancer();
      return 1;
    case MUL:
      *op = Operateur(lexeme_courant().nature);
      avancer();
      return 2;
    case DIV:
      *op = Operateur(lexeme_courant().nature);
      avancer();
      return 3;
    default:
      return 0;
  }
}

void facteur(Ast *A1){
  switch (lexeme_courant().nature) {
    case ENTIER:
      *A1 = creer_valeur(lexeme_courant().valeur);
      avancer();
      break;
    case PARO:
      avancer()
      rec_eag(A1);
      if(lexeme_courant().nature == PARF){
        avancer();
      } else {
        printf("ERREUR : EAG incorrect (PARF manquante)\n");
      }
      break;
    default:
      printf("ERREUR : Facteur\n");
  }
}

void suite_seq_facteur(Ast A1, Ast *A2){
  Ast A3, A4;
  TypeOperateur op;
  int res = op(&op);
  switch (res) {
    case 2:
    facteur(&A3);
    A4 = creer_operation(op, A1, A3);
    suite_seq_facteur(A4, A2);
    case 3:
      if(lexeme_courant().valeur == 0){
        printf("ERREUR : Division par 0 impossible\n");
        break;
      }
      facteur(&A3);
      A4 = creer_operation(op, A1, A3);
      suite_seq_facteur(A4, A2);
    default:
      *A2 = A1;
  }
}

void seq_facteur(Ast *A1){
  Ast A2;
  facteur(&A2);
  suite_seq_facteur(A2,A1);
}

void terme(Ast *A){
  seq_facteur(A);
}

void suite_seq_terme(Ast A1, Ast &A2){
  Ast A3,A4;
  TypeOperateur op;
  if (op1(&op)){
    terme(&A3);
    A4 = creer_operation(op, A1, A3);
    suite_seq_terme(A4, A2);
  } else {
    *A2 = A1;
  }
}

void seq_terme(Ast *A1){
  Ast A2;
  terme(&A2);
  suite_seq_terme(A2,A1);
}

void rec_eag(Ast *A){
  seq_terme(A);
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
