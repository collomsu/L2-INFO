#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"

int main (int argc, char *argv[]) {
  float *res = malloc(sizeof(float));
  if (argc >= 1) {
    analyser(argv[1], res);
    if(*res != (float)0.000001){
      printf("Le résultat du calcul est %f\n", *res);
    }
  } else {
    printf("Il faut donner un nom de fichier en argument !") ;
    return 1;
  }
  return 0;
}
