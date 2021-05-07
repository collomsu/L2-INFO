#!/usr/bin/python3

from utils import db

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

def select_gare_all(conn):
    """
    Affiche la liste de toutes les gares.

    :param conn: Connexion à la base de données
    """
    run_select(conn, "SELECT * FROM Gares")

def select_gares_ligne_donnee(conn,numLigne):
    """
    Affiche la liste de toutes les gares d'une ligne donnée.

    :param conn: Connexion à la base de données
    """
    req = ("""SELECT nom_gare
              FROM Etapes
              WHERE numero_ligne = ?""",[numLigne])
    run_select(conn,req)

def select_lignes_all(conn):
    req = ("""SELECT *
              FROM Lignes""")
    run_select(conn,req)

def select_etapes_all(conn):
    req = ("""SELECT *
              FROM Etapes""")
    run_select(conn, req)

def select_trajets_all(conn):
    req = ("""SELECT *
              FROM Trajets""")
    run_select(conn, req)

def select_billets_all(conn):
    req = ("""SELECT *
              FROM billets""")
    run_select(conn, req)