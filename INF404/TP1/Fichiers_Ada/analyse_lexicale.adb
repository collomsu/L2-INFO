------------------------------------------------------------------------
-- paquetage analyse_lexicale
--
-- analyse lexicale d'une expression arithmetique
--
-- J-P. Peyrin, G. Serasset (version initiale) : janvier 1999
-- P.Habraken - 18/01/2010
--
-- 10 juin 2006 - PH :
-- remplacement record a champs variants par record "plat"
-- remplacement traitement iteratif par automate
------------------------------------------------------------------------
with lecture_caracteres;
with Ada.Text_IO, Ada.Integer_Text_IO;

package body analyse_lexicale is

   ---------------------------------------------------------------------

   lexeme_en_cours : Lexeme;

   function est_separateur(c : Character) return Boolean;
   function est_chiffre(c : Character) return Boolean;
   function est_symbole(c : Character) return Boolean;
   function est_fin_ligne(c : Character) return Boolean;
   procedure reconnaitre_lexeme;

   ---------------------------------------------------------------------

   procedure demarrer is
   begin
      demarrer("");
   end demarrer;

   ---------------------------------------------------------------------

   procedure demarrer(nom_fichier : String) is
   begin
      lecture_caracteres.demarrer(nom_fichier);
      avancer;
   end demarrer;

   ---------------------------------------------------------------------

   procedure avancer is
   begin
      reconnaitre_lexeme;
   end avancer;

   ---------------------------------------------------------------------

   function lexeme_courant return Lexeme is
   begin
      return lexeme_en_cours;
   end lexeme_courant;

   ---------------------------------------------------------------------

   function fin_de_sequence return Boolean is
   begin
      return lexeme_en_cours.nature = FIN_SEQUENCE;
   end fin_de_sequence;

   ---------------------------------------------------------------------

   procedure arreter is
   begin
      lecture_caracteres.arreter;
   end arreter;

   ---------------------------------------------------------------------

   procedure reconnaitre_lexeme is 
      type Etat_Automate is ( INIT, ENTIER, FIN);
      etat : Etat_Automate := INIT;
      function pos(c : Character) return Natural is
      begin
         return Character'pos(c);
      end;
      use lecture_caracteres;
   begin
	loop 
	    case etat is 
		when INIT =>
		if lecture_caracteres.fin_de_sequence then
                  lexeme_en_cours.nature := FIN_SEQUENCE;
                  etat := FIN;
		else if  est_chiffre(caractere_courant) then
		     lexeme_en_cours.nature := ENTIER;
                     lexeme_en_cours.ligne := numero_ligne;
                     lexeme_en_cours.colonne := numero_colonne;
                     lexeme_en_cours.chaine :=
                        new String'("" & caractere_courant);
                     lexeme_en_cours.valeur :=
                        pos(caractere_courant) - pos('0');
                     etat := ENTIER;
	     else if  est_symbole(caractere_courant) then
		     lexeme_en_cours.ligne := numero_ligne;
                     lexeme_en_cours.colonne := numero_colonne;
                     lexeme_en_cours.chaine :=
                        new String'("" & caractere_courant);
                     case caractere_courant is
                        when '+' =>
                           lexeme_en_cours.nature := PLUS;
                           etat := FIN;
                        when '-' =>
                           lexeme_en_cours.nature := MOINS;
                           etat := FIN;
                        when '*' =>
                           lexeme_en_cours.nature := MUL;
                           etat := FIN;
		        when others => 
				 raise Erreur_Lexicale ;

		      end case ;
             elsif est_fin_ligne(caractere_courant) then
                     lexeme_en_cours.nature := FIN_LIGNE;
                     lexeme_en_cours.ligne := numero_ligne;
                     lexeme_en_cours.colonne := numero_colonne;
                     etat := FIN;
		     else 
			raise Erreur_Lexicale ;
		     end if ;
	         end if ;
		      lecture_caracteres.avancer ;
	      end if ;

		when ENTIER =>
                  if est_chiffre(caractere_courant) then
                     lexeme_en_cours.chaine :=
                     new String'(lexeme_en_cours.chaine.all & caractere_courant);
                  lexeme_en_cours.valeur := lexeme_en_cours.valeur * 10 + 
			pos(caractere_courant) - pos('0');
                  etat := ENTIER;
                  lecture_caracteres.avancer;
               else
                  etat := FIN;
               end if;

	      when FIN =>
		null ;
	    end case ;

	exit when etat = FIN ;
        end loop ;
   end ;

   ---------------------------------------------------------------------

   function est_separateur(c : Character) return Boolean is
   begin
      return c = ' ' or c = Ascii.HT;
   end;

   ---------------------------------------------------------------------

   function est_chiffre(c : Character) return Boolean is
   begin
      return c in '0' .. '9';
   end;

   ---------------------------------------------------------------------

   function est_symbole(c : Character) return Boolean is
   begin
      case c is
         when '+' | '-' | '*' =>
            return TRUE;

         when others =>
            return FALSE;
      end case;
   end;

   ---------------------------------------------------------------------

   function est_fin_ligne(c : Character) return Boolean is
   begin
      return c = Ascii.LF or c = Ascii.CR;
   end;

   ---------------------------------------------------------------------

   procedure afficher(l : Lexeme) is
   use Ada.Text_IO, Ada.Integer_Text_IO;
      TAB_NATURE : constant Count := col;
      TAB_LIGNE_COLONNE : constant Count := TAB_NATURE + 17;
      TAB_CHAINE : constant Count := TAB_LIGNE_COLONNE + 10;
      TAB_DESCRIPTION : constant Count := TAB_CHAINE + 10;
   begin
      put(Nature_Lexeme'image(l.nature));
      case l.nature is
         when FIN_SEQUENCE =>
            null;
         when others =>
            if col < TAB_LIGNE_COLONNE then
               set_col(TAB_LIGNE_COLONNE);
            else
               set_col(col + 1);
            end if;
            put(l.ligne, 1);
            put(':');
            put(l.colonne, 1);
            case l.nature is
               when FIN_LIGNE =>
                  null;
               when others =>
                  if col < TAB_CHAINE then
                     set_col(TAB_CHAINE);
                  else
                     set_col(col + 1);
                  end if;
                  put(l.chaine.all);
                  if col < TAB_DESCRIPTION then
                     set_col(TAB_DESCRIPTION);
                  else
                     set_col(col + 1);
                  end if;
                  case l.nature is
                     when ENTIER =>
                        put(l.valeur);
                     when others =>
                        null;
                  end case;
            end case;
      end case;
   end afficher;

   ---------------------------------------------------------------------

   use Ada.Text_IO;
begin
   put("Expressions arithmetiques : Machine_Lexemes. ");
   put_line("Copyright UJF - UFR IMAG.");
end analyse_lexicale;
