
with analyse_lexicale ;
with Ada.Text_IO; 
with ada.command_line ;

procedure test_lexeme is
   use analyse_lexicale ;
   use Ada.Text_IO ;
   use ada.command_line ;

begin
   if (Argument_Count >= 1) then 
   	demarrer (argument(1)) ;
   else 
	demarrer ;
   end if ;
   while not fin_de_sequence loop 
        afficher (lexeme_courant) ;
	new_line ;
	avancer ;
   end loop ;
end ;
