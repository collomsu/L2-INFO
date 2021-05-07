#!/usr/bin/python3

from utils import db
from utils import interface
import hashlib

def encrypt_string(hash_string):
    return hashlib.sha256(hash_string.encode()).hexdigest()

def clear():
    print("\n"*100)

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
        print("""Menu principal :
1) Affiche toutes les gares
2) Affiche toutes les gares d'une ligne donnée
a) Mode ADMIN
q) Quitter""")

        choice = input("Votre choix : ")

        if choice == "q":
            break
        elif choice == "a":
            mdp = input("\nMot de passe ADMIN : ")
            interface_admin(conn,mdp)
        elif choice == "1":
            select_gare_all(conn)
        elif choice == "2":
            num = int(input("\nNuméro de la ligne : "))
            select_gares_ligne_donnee(conn,num)

if __name__ == "__main__":
    main()
