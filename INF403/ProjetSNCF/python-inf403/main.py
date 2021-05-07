#!/usr/bin/python3

from utils import db, interface

def main():
    # Nom de la BD à créer
    db_file = "data/sncf.db"

    # Créer une connexion a la BD
    conn = db.creer_connexion(db_file)

    # Remplir la BD
    # print("1. On crée la bd et on l'initialise avec des premières valeurs.")
    # db.mise_a_jour_bd(conn, "data/sncf_create.sql")
    # db.mise_a_jour_bd(conn, "data/sncf_insert_ok.sql")

    # Lire la BD
    # print("2. Liste de toutes les gares")
    # select_toutes_les_gares(conn)

    # Menu intéractif
    while True:
        print("""\nMenu principal :
1) Menu des requêtes de selection-projection
2) Menu des requêtes d'operateurs ensemblistes
3) Menu des requêtes de jointure-aggrégation
a) Mode ADMIN
q) Quitter""")

        choice = input("Votre choix : ")

        if choice == "q":
            break
        elif choice == "a":
            mdp = input("\nMot de passe ADMIN : ")
            interface.interface_admin(conn,mdp)
        elif choice == "1":
            interface.interface_selection(conn)
        elif choice == "2":
            interface.interface_operateur_ensembliste(conn)
        elif choice == "3":
            interface.interface_jointure(conn)

if __name__ == "__main__":
    main()
