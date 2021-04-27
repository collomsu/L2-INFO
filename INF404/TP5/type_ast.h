
#ifndef __TYPE_AST__
#define __TYPE_AST__

typedef enum {OPERATION, VALEUR, VARIABLE_IDF} TypeAst ;
typedef enum {N_PLUS, N_MUL, N_MOINS, N_DIV, N_AFF} TypeOperateur ;

typedef struct noeud {
	TypeAst nature ;
	TypeOperateur operateur ;
	char *nom_idf;
	struct noeud *gauche, *droite ;
      	int valeur ;
} NoeudAst ;

typedef NoeudAst *Ast ;

#endif
