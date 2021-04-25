DROP TABLE IF EXISTS Proprietaires;
DROP TABLE IF EXISTS Bateaux;
DROP TABLE IF EXISTS Emplacements;
DROP TABLE IF EXISTS Modeles;
DROP TABLE IF EXISTS TypesEmplacements;
DROP TABLE IF EXISTS Adherents;

PRAGMA FOREIGN_KEYS=ON;

--Types SQLite (TEXT = VARCHAR; REAL & INTEGER = NUMBER)
CREATE TABLE Modeles (
   nom_modele TEXT,
   longueur_modele REAL CHECK (longueur_modele > 0),
   CONSTRAINT m1 PRIMARY KEY (nom_modele)
);

CREATE TABLE TypesEmplacements (
   type_emplacement TEXT CHECK (type_emplacement IN ('petit','moyen','grand')),
   longueur_max_type_emplacement INTEGER CHECK ((type_emplacement = 'petit' AND longueur_max_type_emplacement = 7) OR (type_emplacement = 'moyen' AND longueur_max_type_emplacement = 12) OR (type_emplacement = 'grand' AND longueur_max_type_emplacement = 20)),
   prix_type_emplacement REAL,
   CONSTRAINT t1 PRIMARY KEY (type_emplacement)
);

CREATE TABLE Emplacements (
   numero_emplacement INTEGER,
   type_emplacement TEXT NOT NULL,
   CONSTRAINT e1 PRIMARY KEY (numero_emplacement),
   CONSTRAINT e2 FOREIGN KEY (type_emplacement) REFERENCES TypesEmplacements (type_emplacement)
);

CREATE TABLE Bateaux (
   numero_bateau INTEGER, 
   date_construction_bateau DATE,
   nom_modele TEXT NOT NULL,
   numero_emplacement INTEGER NOT NULL,
   CONSTRAINT b1 PRIMARY KEY (numero_bateau, numero_emplacement),
   CONSTRAINT b2 FOREIGN KEY (nom_modele) REFERENCES Modeles (nom_modele),
   CONSTRAINT b3 FOREIGN KEY (numero_emplacement) REFERENCES Emplacements (numero_emplacement),
   CONSTRAINT b4 UNIQUE (numero_bateau),
   CONSTRAINT b5 UNIQUE (numero_emplacement)
);

CREATE TABLE Adherents (
   numero_adherent INTEGER NOT NULL,
   nom_adherent TEXT NOT NULL,
   prenom_adherent TEXT NOT NULL,
   date_naissance_adherent DATE,
   CONSTRAINT a1 PRIMARY KEY (numero_adherent)
);

CREATE TABLE Proprietaires (
   numero_adherent INTEGER,
   numero_bateau INTEGER,
   CONSTRAINT p1 PRIMARY KEY (numero_adherent, numero_bateau),
   CONSTRAINT p2 FOREIGN KEY (numero_adherent) REFERENCES Adherents (numero_adherent),
   CONSTRAINT p3 FOREIGN KEY (numero_bateau) REFERENCES Bateaux (numero_bateau)
);

--Question 3)
UPDATE TypesEmplacements
SET prix_type_emplacement = prix_type_emplacement*1.1
WHERE type_emplacement = 'moyen' OR type_emplacement = 'grand';

--Question 4)
--1er problème : le beatau numéro n°2 n'a pas de proprietaire, or tous les bateaux snont censé en avoir un.
-- Il manque la vérification permettant que chaque bateaux ai bien un propriétaire.

--2ème problème : Le beateau pirate, n°1 est un beateau de 12.5m mais est garé dans une place de seulement 12m.
-- Il manque la véirifaction permettant d'assurer qu'un bateau ne soit pas trop grand pour sa place de port.