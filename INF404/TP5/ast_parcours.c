#include <stdio.h>
#include <stdlib.h>
#include "type_ast.h"
#include "ast_parcours.h"

void aff_operateur(TypeOperateur op){
	switch (op) {
		case N_PLUS:
			printf("+");
			break;
		case N_MOINS:
			printf("-");
			break;
		case N_MUL:
			printf("*");
			break;
		case N_DIV:
			printf("/");
			break;
	}
}

void afficherAst(Ast expr) {
	switch (expr->nature) {
               case OPERATION:
                        printf("(");
                        afficherAst(expr->gauche);
                        aff_operateur(expr->operateur) ;
                        afficherAst(expr->droite);
                        printf(")");
			break ;
               case VALEUR:
                  	printf("%d", expr->valeur);
			break ;
	}
}

int evaluation(Ast expr) {
	switch (expr->nature) {
		case VALEUR:
			return expr->valeur;
		case OPERATION:
			switch (expr->operateur) {
				case N_PLUS:
					return (double)(evaluation(expr->gauche)+evaluation(expr->droite));
				case N_MOINS:
					return (double)(evaluation(expr->gauche)-evaluation(expr->droite));
				case N_MUL:
					return (double)(evaluation(expr->gauche)*evaluation(expr->droite));
				case N_DIV:
					return (double)(evaluation(expr->gauche)/evaluation(expr->droite));
			}
		default:
			exit(0);
	}
}
