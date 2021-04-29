#ifndef ANALYSE_SYNTAXIQUE_H
#define ANALYSE_SYNTAXIQUE_H

#include "type_ast.h"

void analyser(char *fichier, Ast *arbre);
/* etat initial : indifferent
etat final : une EAEP a ete lue dans le nom_fichier
si elle ne contient pas d'erreur de syntaxe un message est affiche
et la valeur de cette expression est fournie dans le parametre resultat
sinon le pgm termine sur un message d'erreur */

#endif
