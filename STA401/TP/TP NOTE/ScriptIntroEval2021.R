#Chargement des données et affectation à un data.frame appelénotes
###################################################################
setwd("~/GitHub/L2_INFO/STA401/TP/TP NOTE")
read.table("DonneesEvalTP2021.txt",header=T,sep="\t",dec=",")->notes
head(notes)
summary(notes) 


sd(notes[notes$GTP == 1,"partiel"])

#60 etudiants (1 par ligne) et 12 variables 
#GTD deux modalités 1 ou 2 
#GTP trois modalités 1, 2 ou 3 
#EX1 1 si EX1 du partiel bien fait et 0 sinon (variable numérique discréte)
#colles (sur 20) : à valeur dans [0,20]
#DM1 (sur 20) : à valeurs dans [0,20]
#DM2et3 (sur 20) : idem
#quizz (sur 20)
#partiel (sur 20)
#EvalTP (sur 20) : tous les etudiants ont 10
#CC1 (sur 20) : Notes de CC1 construite avec partiel DM1 et quizz
#CC2 (sur 20) : Notes de CC2 construite avec DM2et3 colles et EvalTP

#Savoir  Extraire un échantillon complet (avec toutes les lignes) ou  un sous-échantillon (sÃ©lection de lignes)
############################################################################################

notes$Sexe #echantillon des sexes pour tous les etudiants du fichier ou
length(notes[,12])
notes$Sexe[notes$Sexe==1] #echantillon des sexes pour les garÃ§ons on peut aussi executer
notes[notes$Sexe==1,12]
length(notes$Sexe[notes$Sexe==1]) #nombre de garÃ§ons parmi les 60 etudiants

#autre exemple : echantillon des notes de CC2 de tous
notes$CC2

#et le sous echantillons des notes de CC2 du GTP3 avec
notes[notes$GTP==3,11]  #ou encore avec 
notes$CC2[notes$GTP==3] #ou encore
notes[notes$GTP == 3,"CC2"]


#pour un problème sur une proba inconnue p par ex celle d'obtenir une note de partiel>10
#on construit l'échantillon de Bernoulli affecté ici à x
notes$partiel>10->x
sum(x) #nombre de succÃ¨s dans l'Ã©chantillon de partiel>10
length(x) #nombre d'essais (= taille de l'échantillon)
sum(x)/length(x) # estimation de p

#Pour selectionner la note de quizz de tout des étudiants des groupes de TP 1 et 3 : 
notes$quizz[notes$GTP == 1 |notes$GTP == 3 ]
#ou 
notes[notes$GTP == 1 |notes$GTP == 3,"quizz"]

