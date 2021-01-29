#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#include "analyse_syntaxique.h"

int main (int argc, char *argv[]) {
   if (argc >= 1) {
   	analyser(argv[1]);
   } else {
     printf("Il faut donner un nom de fichier en argument !") ;
     return 1;
   }
   return 0;
}
