#!/usr/bin/python3

from utils import db
import hashlib

def encrypt_string(hash_string):
    sha_signature = \
        hashlib.sha256(hash_string.encode()).hexdigest()
    return sha_signature

def clear():
    print("\n"*100)

def interface_admin(conn,mdp):
    """
    Affiche la liste de toutes les gares.

    :param conn: Connexion à la base de données
    """

    if encrypt_string(mdp) == "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918":
        print("Connection interface ADMIN réussi.")

        menu_main_admin(conn)

    else:
        print("Mot de passe incorrect.\nRetour au menu principal")

def menu_main_admin(conn):
    clear()
    while True:
        print("""
Menu ADMIN:
1) Recréer la base de données par défaut
2) Recréer la base de données à partir de fichiers
3) Executer un fichier SQL
4) Executer une requête SQL
q) Retour au menu principal
        """)

        choice = input("Votre choix : ")

        if choice == "q":
            clear()
            break
        elif choice == "1":
            try:
                db.mise_a_jour_bd(conn, "data/sncf_create.sql")
                db.mise_a_jour_bd(conn, "data/sncf_insert_ok.sql")
            except Exception:
                print("/!\ ERREUR : Reconstruction impossible")
        elif choice == "2":
                nameCreate = input("\nNom du fichier de création des tables SQL (avec extension) : ")

                db.mise_a_jour_bd(conn,"data/"+nameCreate)

                nameInsert = input("\nNom du fichier d'insertion des données SQL (avec extension) : ")
                db.mise_a_jour_bd(conn,"data/"+nameInsert)
        elif choice == "3":
            nameFile = input("Nom du fichier SQL (avec extension) : ")
            db.mise_a_jour_bd(conn,"data/"+nameFile)
        elif choice == "4":
            try:
                req = input("\nRequête SQL : ")
                print("Résultat de la requête : ")
                run_select(conn,req)
            except Exception:
                print("\n/!\ ERREUR : Requête incorrect")


def run_select(conn,req):
    cur = conn.cursor()
    cur.execute(req)

    rows = cur.fetchall()

    for row in rows:
        print(row)

def select_toutes_les_gares(conn):
    """
    Affiche la liste de toutes les gares.

    :param conn: Connexion à la base de données
    """
    cur = conn.cursor()
    cur.execute("SELECT * FROM Gares")

    rows = cur.fetchall()

    for row in rows:
        print(row)

def select_gares_ligne_donnee(conn,numLigne):
    """
    Affiche la liste de toutes les gares d'une ligne donnée.

    :param conn: Connexion à la base de données
    """
    cur = conn.cursor()
    cur.execute("""SELECT nom_gare
                   FROM Etapes
                   WHERE numero_ligne = ?""",[numLigne])

    rows = cur.fetchall()

    for row in rows:
        print(row)

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
            select_toutes_les_gares(conn)
        elif choice == "2":
            num = int(input("\nNuméro de la ligne : "))
            select_gares_ligne_donnee(conn,num)

if __name__ == "__main__":
    main()
