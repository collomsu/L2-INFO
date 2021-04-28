#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"
#include "ast_parcours.h"

int main (int argc, char *argv[]) {
  if (argc == 2) {
    Ast arbre;
    analyser(argv[1], &arbre);
    printf("Ast produit : ");
    afficherAst(arbre);
    printf("\n");
    //double res = evaluation(arbre);
    //printf("\nLe resultat du calcul est = %f\n", res);
  } else {
    printf("Il faut donner un nom de fichier en argument !\n");
    return 1;
  }
  return 0;
}
