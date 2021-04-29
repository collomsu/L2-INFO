#include <stdio.h>
#include <stdlib.h>
#include "ast_parcours.h"
#include "table_symbole.h"

int test = 0;

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
		case N_AFF:
			printf("=");
			break;
		case N_ROWS:
			printf("\n");
			break;
	}
}

void afficherAst(Ast expr) {
	test++;
	printf("\nnb tour : %d\n", test);
	printf("nature : %d\n", expr->nature);

	if(expr->nom_idf != NULL){
		printf("nom : %s\n", expr->nom_idf);
	}
	printf("\n");
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
		case VARIABLE_IDF:
			printf("%s", expr->nom_idf);
			break;

	}
}

double evaluation(Ast expr) {
	double res;
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
				case N_AFF:
					res = (double)(evaluation(expr->droite));
					insererTS(expr->gauche->nom_idf, res);
					return res;
				case N_ROWS:
					evaluation(expr->gauche);
					evaluation(expr->droite);
					return -2;
			}
		default:
			exit(0);
	}
}
