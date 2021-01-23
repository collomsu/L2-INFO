------------------------------------------------------------------------
-- paquetage machine_lexemes
--
-- analyse lexicale d'une expression arithmetique
--
-- P.Habraken - 18/01/2010
--
-- 2 aout 2006 - PH :
-- remplacement record a champs variants par record "plat"
------------------------------------------------------------------------
package analyse_lexicale is

    Erreur_Lexicale : exception ; -- pour une version "arret sur erreur"

   type Nature_Lexeme is (
      ENTIER,           -- sequence de chiffres
      PLUS,             -- +
      MOINS,            -- -
      MUL,              -- *
      FIN_LIGNE,        -- retour à la ligne
      FIN_SEQUENCE,     -- pseudo lexeme ajoute en fin de sequence
      ERREUR            -- lexeme inconnu
   );

   type Pointeur_Chaine is access String;

   type Lexeme is record
      nature : Nature_Lexeme;    -- nature du lexeme
      ligne : Natural;           -- numero de ligne
      colonne : Natural;         -- numero de colonne
      chaine : Pointeur_Chaine;  -- chaine de caracteres
      valeur : Natural;          -- valeur d'un entier
   end record;

   procedure afficher(l : Lexeme);

   procedure demarrer;
   -- e.i. : indifferent
   -- e.f. : la sequence de lexemes est lue au clavier
   --        fin_de_sequence <=> lexeme_courant.nature = FIN_SEQUENCE
   --        (non fin_de_sequence) => lexeme courant est le premier
   --        lexeme de la sequence

   procedure demarrer(nom_fichier : String);
   -- e.i. : indifferent
   -- e.f. : la sequence de lexemes est lue dans le fichier designe par
   --        nom_fichier
   --        fin_de_sequence <=> lexeme_courant.nature = FIN_SEQUENCE
   --        (non fin_de_sequence) => lexeme courant est le premier
   --        lexeme de la sequence
   --        l'exception Erreur_Lexicale est levee en cas d'erreur

   procedure avancer;
   -- pre-condition : la machine sequentielle est demarree
   -- e.i. : on pose i = rang du lexeme_courant :
   --        (non fin_de_sequence)
   --        et (non lexeme_courant.nature = FIN_SEQUENCE)
   -- e.f. : fin_de_sequence <=> lexeme_courant.nature = FIN_SEQUENCE
   --        (non fin_de_sequence) => lexeme_courant est le lexeme i+1
   --        l'exception Erreur_Lexicale est levee en cas d'erreur

   function lexeme_courant return Lexeme;
   -- pre-condition : la machine sequentielle est demarree
   -- lexeme_courant est :
   -- . le pseudo lexeme FIN_SEQUENCE si fin_de_sequence
   -- . le pseudo lexeme ERREUR si une erreur a ete detectee
   -- . le lexeme de rang i sinon

   function fin_de_sequence return Boolean;
   -- pre-condition : la machine sequentielle est demarree
   -- fin_de_sequence vaut :
   -- . vrai si tous les lexemes de la sequence ont ete reconnus
   -- . faux sinon

   procedure arreter;
   -- e.i. : la machine sequentielle est demarree
   -- e.f. : la machine sequentielle est arretee

end analyse_lexicale;
