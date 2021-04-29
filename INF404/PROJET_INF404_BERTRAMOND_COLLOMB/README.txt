                  ### COMPILATION ###

Pour compiler le projet lancez simplement la commande :
  $ make

Cette commande requiert le compilateur gcc,
vous pouvez l'installer via un terminal bash avec la commande :
  $ sudo apt-get install gcc



                  ### EXECUTION ###

Le programme requiert un fichier en entree,
ils sont disponibles dans le dossier Fichiers_entrees

Commande pour l'execution :
  $ ./interpreteur Fichiers_entrees/[NOM_DU_FICHIER.txt]

Exemple d'execution avec le fichier d'entrée entree_double.txt :
  $ ./interpreteur Fichiers_entrees/entree_double.txt



                  ### NETTOYAGE ###

Permet de supprimer les fichiers executables et ceux avec comme extension .o,
il faut executer la commande suivante :
  $ make clean
