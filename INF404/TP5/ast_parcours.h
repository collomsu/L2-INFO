#ifndef __AST_PARCOURS__
#define __AST_PARCOURS__

#include "type_ast.h"

void afficherAst(Ast expr) ;
// affiche l'arbre abstrait de l'expression arithmetique expr

double evaluation(Ast expr) ;
// calcule la valeur de l'expression arithmetique expr
// FONCTION A COMPLETER !

#endif
