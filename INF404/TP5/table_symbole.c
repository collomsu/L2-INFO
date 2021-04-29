#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#include "table_symbole.h"

/* --------------------------------------------------------------------- */

extern void initTable(){
  NbSymbole = 0;
}
/* --------------------------------------------------------------------- */

extern void afficheTS(){
  int i;
  printf("\n ________________________________________________\n            [AFFICHAGE DES VARIABLES]           \n\n");
  for(i = 0; i < NbSymbole; i++){
    printf(" Position n°%d : Nom = %s, Valeur = %f\n", i, Table_Symbole[i].nom, Table_Symbole[i].valeur);
  }
  printf(" ________________________________________________\n");
}
/* --------------------------------------------------------------------- */

extern int estPresentSymbole(char *idf){
    int i;
    for(i = 0; i < NbSymbole; i++){
      if(!strcmp(idf,Table_Symbole[i].nom)){
        return i;
      }
    }
    return -1;
}

/* --------------------------------------------------------------------- */

extern int estPresentTS(char *idf, double *val){
  int i;
  for(i = 0; i < NbSymbole; i++){
    if(!strcmp(idf,Table_Symbole[i].nom) && Table_Symbole[i].valeur == *val){
      *val = Table_Symbole[i].valeur;
      return i;
    }
  }
  return -1;
}

/* --------------------------------------------------------------------- */

extern void insererTS(char *idf, double val){
  int posSymbole = estPresentSymbole(idf);
  if(posSymbole == -1){
    strcpy(Table_Symbole[NbSymbole].nom, idf);
    Table_Symbole[NbSymbole].valeur = val;
    NbSymbole++;
  } else {
    Table_Symbole[posSymbole].valeur = val;
  }
}

/* --------------------------------------------------------------------- */

extern double getValeur(char *idf){
  if(estPresentSymbole(idf) == -1){
    printf("ERREUR : Impossible de récupérer la valeur, aucune variable ne possède ce nom\\n");
    return 0;
  } else {
    return Table_Symbole[estPresentSymbole(idf)].valeur;
  }
}

/* --------------------------------------------------------------------- */
