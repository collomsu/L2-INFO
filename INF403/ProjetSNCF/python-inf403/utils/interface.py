#!/usr/bin/python3

from utils import db
import hashlib

def encrypt_string(hash_string):
    return hashlib.sha256(hash_string.encode()).hexdigest()

def clear():
    print("\n"*100)

def interface_selection(conn):
    clear()
    while True:
        print("""\nMenu principal :
    1) Afficher toutes les gares
    2) Afficher toutes les lignes
    3) Afficher toutes les étapes
    4) Afficher tous les trajets
    5) Afficher tous les billets
    6) Afficher les prix des billets
    7) Afficher la ligne d'une gare donnée
    8) Afficher les trajets d'une gare de départ donnée
    9) Afficher les billets d'un ligne donnée
    10) Afficher les gares d'une ligne donnée
    q) Revenir au menu principal""")

        choice = input("Votre choix : ")

        if choice == "q":
            clear()
            break
        elif choice == "1":
            select_gares_all(conn)
        elif choice == "2":
            select_lignes_all(conn)
        elif choice == "3":
            select_etapes_all(conn)
        elif choice == "4":
            select_trajets_all(conn)
        elif choice == "5":
            select_billets_all(conn)
        elif choice == "6":
            select_vueBillets_all(conn)
        elif choice == "7":
            nomGare = input("\nNom de la gare : ")
            select_lignes_dune_gare_donnee(conn, nomGare)
        elif choice == "8":
            nomGare = input("\nNom de la gare : ")
            select_trajet_dune_gare_donnee(conn, nomGare)
        elif choice == "9":
            numLigne = input("\nNom de la ligne : ")
            select_billets_dune_ligne_doneee(conn, numLigne)
        elif choice == "10":
            numLigne = input("\nNom de la ligne : ")
            select_gares_ligne_donnee(conn, numLigne)

def interface_operateur_ensembliste(conn):
    clear()
    while True:
        print("""\nMenu principal :
    1) Afficher les villes qui possèdent plusieurs gares
    q) Revenir au menu principal""")

        choice = input("Votre choix : ")

        if choice == "q":
            clear()
            break
        elif choice == "1":
            select_ville_avec_gare_mutiple(conn)

def interface_jointure(conn):
    clear()
    while True:
        print("""\nMenu principal :
1) Affiche la distance maximale d'un trajet d'une gare donnée
2) Affiche la distance minimale d'un trajet d'une gare donnée
3) Affiche le prix moyen des billets d'une ligne donnée
4) Affiche la distance moyenne d'un trajet sur une ligne donnée
q) Revenir au menu principal""")

        choice = input("Votre choix : ")

        if choice == "q":
            clear()
            break
        elif choice == "1":
            nomGare = input("\nNom de la gare : ")
            select_distance_max_de_trajet(conn, nomGare)
        elif choice == "2":
            nomGare = input("\nNom de la gare : ")
            select_distance_min_de_trajet(conn, nomGare)
        elif choice == "3":
            numLigne = input("\nNom de la ligne : ")
            select_prix_moyen_billet_dune_ligne(conn, numLigne)
        elif choice == "4":
            numLigne = input("\nNom de la ligne : ")
            select_distance_moyen_trajet_sur_une_ligne(conn, numLigne)


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
3) Executer une requête SQL
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
            try:
                nameCreate = input("\nNom du fichier de création des tables SQL (avec extension) : ")

                db.mise_a_jour_bd(conn,"data/"+nameCreate)

                nameInsert = input("\nNom du fichier d'insertion des données SQL (avec extension) : ")
                db.mise_a_jour_bd(conn,"data/"+nameInsert)
            except:
                print("\n/!\ ERREUR : Noms de fichiers incorrect")
        elif choice == "3":
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

def select_gares_all(conn):
    run_select(conn, "SELECT * FROM Gares")

def select_gares_ligne_donnee(conn,numLigne):
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

def select_lignes_dune_gare_donnee(conn,nomGare):
    req = ("""SELECT numero_ligne,nom_ligne FROM Lignes JOIN Etapes USING(numero_ligne) WHERE nom_gare = ?""",(nomGare,))
    print(req)
    run_select(conn, req)

def select_trajet_dune_gare_donnee(conn,nomGare):
    req = ("""SELECT gare_arrivee_trajet,distance
              FROM Trajets
              WHERE gare_depart_trajet = ?""", [nomGare])
    run_select(conn, req)

def select_billets_dune_ligne_doneee(conn,numLigne):
    req = ("""SELECT *
              FROM Billets
              WHERE numero_ligne = ?""", [numLigne])
    run_select(conn, req)

def select_vueBillets_all(conn):
    req = ("""SELECT *
              FROM vue_billets""")
    run_select(conn, req)

# Requêtes opérateur ensemblistes
def select_ville_avec_gare_mutiple(conn):
    req = ("""SELECT *
              FROM Gares
              EXCEPT
              SELECT *
              FROM Gares
              GROUP BY ville_gare
              HAVING COUNT(nom_gare) = 1""")
    run_select(conn, req)


# Requêtes jointure-aggrégation
def select_distance_max_de_trajet(conn,nomGare):
    req = ("""SELECT gare_depart_trajet,gare_arrivee_trajet,MAX(distance) 
              FROM Trajets
              GROUP BY gare_depart_trajet""",[nomGare])
    run_select(conn, req)

def select_distance_min_de_trajet(conn,nomGare):
    req = ("""SELECT gare_depart_trajet,gare_arrivee_trajet,MIN(distance) 
              FROM Trajets
              GROUP BY gare_depart_trajet""",[nomGare])
    run_select(conn, req)

def select_prix_moyen_billet_dune_ligne(conn,numLigne):
    req = ("""SELECT AVG(prix)
              FROM vue_billets JOIN Billets USING(numero_billet)
              WHERE numero_ligne = ?""",[numLigne])
    run_select(conn, req)

def select_distance_moyen_trajet_sur_une_ligne(conn,numLigne):
    req = ("""SELECT AVG(distance)
              FROM Trajets JOIN Etapes ON(nom_gare=gare_depart_trajet)
              WHERE numero_ligne =  ?""",[numLigne])
    run_select(conn, req)