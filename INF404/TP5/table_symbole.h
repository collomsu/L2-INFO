#ifndef TABLE_SYMBOLE_H
#define TABLE_SYMBOLE_H

#define LIDF 20   // nombre maximum de caractéres pour un IDF
#define NBMAXSYMB 100   // nombre maximum d'IDF

typedef struct {
  char nom[LIDF]; // nom de la variable
  double valeur;  // valeur de la variable
} Symbole;

Symbole Table_Symbole[NBMAXSYMB]; // la variable Table des Symboles
int NbSymbole;  // le nombre courant de couples dans la table

extern void initTable();  // intialise la TS en effectant 0 à NbSymb

extern void afficheTS();  // affiche le contenu complet de la TS

extern int estPresentSymbole(char *idf);
// si un idf est present dans la table alors
//    estPresentSymbole renvoie la position du symbole dans le tableau
// sinon
//    estPresentSymbole renvoie -1

extern int estPresentTS(char *idf, double *val);
// si un couple (idf, val') est present dans la table alors
//    affecte val' à *val
//    estPresentTS renvoie la position du couple dans le tableau
// sinon
//    estPresentTS renvoie -1

extern void insererTS(char *idf, double val);
// si un couple (idf,val') est present dans la table alors
//      remplace la valeur v' par v
// sinon
//      ajoute le couple (idf,val) dans la TS

extern double getSymbole(char *idf);

#endif
