#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"
#include "lecture_caracteres.h"
#include "analyse_lexicale.h"
#include "ast_construction.h"
#include "ast_parcours.h"

void rec_eag(Ast *A);
int Op1(TypeOperateur *op);
int Op2(TypeOperateur *op);

void rec_aff(Ast *A){
  if(lexeme_courant().nature == IDF){
    avancer();
    if (lexeme_courant() == AFF) {
      rec_eag(A);
      if(lexeme_courant() == SEPAFF){
        avancer();
      } else {
        printf("ERREUR : SEPAFF attendu non trouvé\n");
        exit(0);
      }
    } else {
      printf("ERREUR : AFF attendu non trouvé\n");
      exit(0);
    }
  } else {
    printf("ERREUR : IDF attendu non trouvé\n");
    exit(0);
  }
}

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
      exit(0);
  }
}

int Op1(TypeOperateur *op){
  switch(lexeme_courant().nature){
    case PLUS:
    case MOINS:
      *op = Operateur(lexeme_courant().nature);
      avancer();
      return 1;
    default:
      return 0;
  }
}

int Op2(TypeOperateur *op){
  switch(lexeme_courant().nature){
    case MUL:
      *op = Operateur(lexeme_courant().nature);
      avancer();
      return 1;
    case DIV:
      *op = Operateur(lexeme_courant().nature);
      avancer();
      return 2;
    default:
      return 0;
  }
}

void facteur(Ast *A1){
  switch (lexeme_courant().nature) {
    case IDF:
      avancer();
      break;
    case ENTIER:
      *A1 = creer_valeur(lexeme_courant().valeur);
      avancer();
      break;
    case PARO:
      avancer();
      rec_eag(A1);
      if(lexeme_courant().nature == PARF){
        avancer();
      } else {
        printf("ERREUR : EAG incorrect (PARF manquante)\n");
        exit(0);
      }
      break;
    default:
      printf("ERREUR : Facteur\n");
      exit(0);
  }
}

void suite_seq_facteur(Ast A1, Ast *A2){
  Ast A3, A4;
  TypeOperateur op;
  int res = Op2(&op);
  switch (res) {
    case 1:
      facteur(&A3);
      A4 = creer_operation(op, A1, A3);
      suite_seq_facteur(A4, A2);
      break;
    case 2:
      if(lexeme_courant().valeur == 0){
        printf("ERREUR : Division par 0 impossible\n");
        exit(0);
      }
      facteur(&A3);
      A4 = creer_operation(op, A1, A3);
      suite_seq_facteur(A4, A2);
      break;
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

void suite_seq_terme(Ast A1, Ast *A2){
  Ast A3,A4;
  TypeOperateur op;
  if (Op1(&op)){
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

/* etat initial : indifferent
etat final : une EAEP a ete lue dans le nom_fichier
si elle ne contient pas d'erreur de syntaxe un message est affiche
et la valeur de cette expression est fournie dans le parametre resultat
sinon le pgm termine sur un message d'erreur */

void analyser(char *fichier, Ast *arbre){
  Symbole tableau_symbole[128];
  demarrer(fichier);
  rec_eag(arbre);
  if(lexeme_courant().nature != FIN_SEQUENCE){
    printf("ERREUR : Syntaxe incorrect (fin de sequence non atteint)\n");
  }
}
