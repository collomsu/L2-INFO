------------------------------------------------------------------------
-- paquetage machine_caracteres
--
-- sequence de caracteres
--
-- J-P. Peyrin, G. Serasset (version initiale) : janvier 1999
-- P. Habraken : 12 novembre 2002
------------------------------------------------------------------------
package lecture_caracteres is

   procedure demarrer;
   -- e.i. : indifferent
   -- e.f. : la sequence de caracteres est lue au clavier
   --        fin_de_sequence vaut vrai ou alors caractere_courant est le
   --        premier caractere de la sequence

   procedure demarrer(nom_fichier : String);
   -- e.i. : indifferent
   -- e.f. : la sequence de caracteres est lue dans le fichier designe
   --        par nom_fichier
   --        fin_de_sequence vaut vrai ou alors caractere_courant est le
   --        premier caractere de la sequence

   procedure avancer;
   -- pre-condition : la machine sequentielle est demarree
   -- e.i. : fin_de_sequence = faux ;
   --        on pose i = rang du caractere courant
   -- e.f. : fin_de_sequence vaut vrai ou alors caractere_courant est le
   --        caractere de rang i+1 dans la sequence

   function caractere_courant return Character;
   -- caractere_courant est le caractere de rang i
   -- pre-condition : la machine sequentielle est demarree et
   -- fin_de_sequence = faux

   function fin_de_sequence return Boolean;
   -- fin_de_sequence vaut vrai <=> tous les caracteres de la sequence
   -- ont ete lus
   -- pre-condition : la machine sequentielle est demarree

   function numero_ligne return Positive;
   -- numero de la ligne ou se trouve le caractere courant
   -- pre-condition : la machine sequentielle est demarree et
   -- fin_de_sequence = faux

   function numero_colonne return Positive;
   -- numero de la colonne ou se trouve le caractere courant
   -- pre-condition : la machine sequentielle est demarree et
   -- fin_de_sequence = faux

  procedure arreter;

end lecture_caracteres;
