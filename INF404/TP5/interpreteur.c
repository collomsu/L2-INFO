#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"
#include "ast_parcours.h"
#include "table_symbole.h"

int main (int argc, char *argv[]) {
  if (argc == 2) {
    Ast arbre;
    analyser(argv[1], &arbre);
    printf("Ast produit : ");
    afficherAst(arbre);
    printf("\n");
    evaluation(arbre);
    afficheTS();
  } else {
    printf("Il faut donner un seul nom de fichier en argument !\n");
    return 1;
  }
  return 0;
}
