------------------------------------------------------------------------
-- paquetage machine_caracteres
--
-- sequence de caracteres
--
-- J-P. Peyrin, G. Serasset (version initiale) : janvier 1999
-- P. Habraken : 12 novembre 2002
------------------------------------------------------------------------
with Ada.Text_IO;

package body lecture_caracteres is

   use Ada.Text_IO;

   CarCour : character ;
   LigneCour, ColonneCour : Natural ;
   File : File_Type ;
   FichierOuvert : boolean ;

   ---------------------------------------------------------------------

   procedure demarrer is
   begin
      demarrer("");
   end demarrer;

   ---------------------------------------------------------------------

   procedure demarrer(nom_fichier : in String) is
   begin
      if nom_fichier'length = 0 then
	 FichierOuvert := False ;
         Set_Input(Standard_Input) ;
      else
	 FichierOuvert := true ;
	 Open(File, In_File, nom_fichier) ;
         Set_Input(File) ;
      end if;
      LigneCour := 1 ; ColonneCour := 0 ;
      avancer ;
   end demarrer;

   ---------------------------------------------------------------------

   procedure avancer is
   begin
      if not End_of_File then 
	if not End_of_Line then
		Get(CarCour) ;
		ColonneCour := ColonneCour + 1 ;
	else 
		CarCour := ASCII.LF ;
		-- Get(CarSuiv) ;
		Skip_Line ;
		ColonneCour := 1 ;
		LigneCour := LigneCour + 1 ;
	end if ;
      else 
	CarCour := ASCII.NUL ;
      end if ;
   end avancer;

   ---------------------------------------------------------------------

   function caractere_courant return Character is
   begin
      return CarCour;
   end caractere_courant;

   ---------------------------------------------------------------------

   function fin_de_sequence return Boolean is
   begin
      return CarCour = ASCII.NUL ;
   end fin_de_sequence;

   ---------------------------------------------------------------------

   function numero_ligne return Positive is
   begin
      return Positive(LigneCour);
   end numero_ligne;

   ---------------------------------------------------------------------

   function numero_colonne return Positive is
   begin
      return Positive(ColonneCour);
   end numero_colonne;

   ---------------------------------------------------------------------

  procedure arreter is 
  begin
     Close(File) ;
  end arreter ;

   ---------------------------------------------------------------------

begin
   put("Analyseur lexical : Machine_Caracteres. ");
   put_line("Copyright UJF - UFR IMAG.");
end lecture_caracteres;
