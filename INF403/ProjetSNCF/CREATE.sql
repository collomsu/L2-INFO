DROP TABLE IF EXISTS Billets;
DROP TABLE IF EXISTS Trajets;
DROP TABLE IF EXISTS GareEtapes;
DROP TABLE IF EXISTS Lignes;
DROP TABLE IF EXISTS Gares;

PRAGMA FOREIGN_KEYS=ON;

CREATE TABLE Gares (
   nom_gare TEXT NOT NULL,
   ville_gare TEXT NOT NULL,
   CONSTRAINT g1 PRIMARY KEY (nom_gare),
   CONSTRAINT g2 CHECK (nom_gare != '' AND ville_gare != '')
);

CREATE TABLE Lignes (
   numero_ligne INTEGER NOT NULL,
   nom_ligne TEXT NOT NULL,
   gare_depart_ligne TEXT NOT NULL,
   gare_arrivee_ligne TEXT NOT NULL,
   CONSTRAINT l1 PRIMARY KEY (numero_ligne),
   CONSTRAINT l2 FOREIGN KEY (gare_depart_ligne) REFERENCES Gares (nom_gare),
   CONSTRAINT l3 FOREIGN KEY (gare_arrivee_ligne) REFERENCES Gares (nom_gare),
   CONSTRAINT l4 CHECK (gare_depart_ligne != gare_arrivee_ligne)
);

CREATE TABLE GareEtapes (
   numero_ligne INTEGER NOT NULL,
   nom_gare TEXT NOT NULL,
   horaire_passage_gare_etape TIME NOT NULL,
   CONSTRAINT ge1 PRIMARY KEY (numero_ligne, nom_gare),
   CONSTRAINT ge2 FOREIGN KEY (numero_ligne) REFERENCES Lignes (numero_ligne),
   CONSTRAINT ge3 FOREIGN KEY (nom_gare) REFERENCES Gares (nom_gare)
);

CREATE TABLE Trajets (
   numero_ligne INTEGER NOT NULL,
   gare_depart_trajet TEXT NOT NULL,
   gare_arrivee_trajet TEXT NOT NULL,
   distance_trajet INTEGER NOT NULL,
   CONSTRAINT t1 PRIMARY KEY (numero_ligne,gare_depart_trajet,gare_arrivee_trajet),
   CONSTRAINT t2 FOREIGN KEY (numero_ligne) REFERENCES Lignes (numero_ligne),
   CONSTRAINT t3 FOREIGN KEY (gare_depart_trajet) REFERENCES Gares (nom_gare),
   CONSTRAINT t4 FOREIGN KEY (gare_arrivee_trajet) REFERENCES Gares (nom_gare),
   CONSTRAINT t5 CHECK (gare_depart_trajet != '' AND gare_arrivee_trajet != ''),
   CONSTRAINT t6 CHECK (distance_trajet > 0)
);

CREATE TABLE Billets (
   numero_billet INTEGER NOT NULL,
   numero_ligne INTEGER NOT NULL,
   date_depart_billet DATE NOT NULL,
   horaire_depart_billet TIME NOT NULL,
   horaire_arrivee_billet TIME NOT NULL,
   gare_depart_trajet TEXT NOT NULL,
   gare_arrivee_trajet TEXT NOT NULL,
   distance_trajet INTEGER NOT NULL,
   prix_billet INTEGER NOT NULL,
   CONSTRAINT b1 PRIMARY KEY (numero_billet),
   CONSTRAINT b2 FOREIGN KEY (numero_ligne, gare_depart_trajet, gare_arrivee_trajet) REFERENCES Trajets (numero_ligne, gare_depart_trajet, gare_arrivee_trajet),
   CONSTRAINT b6 CHECK (strftime('%H:%M',horaire_depart_billet) < strftime('%H:%M',horaire_arrivee_billet)),
   CONSTRAINT b7 CHECK (strftime('%H:%M',horaire_arrivee_billet) <= strftime('%H:%M','22:00') AND strftime('%H:%M',horaire_depart_billet) >= strftime('%H:%M','6:00')),
   CONSTRAINT b8 CHECK (prix_billet = distance_trajet*0.15),
   CONSTRAINT b9 CHECK (gare_depart_trajet != gare_arrivee_trajet),
   CONSTRAINT b10 CHECK (date_depart_billet <= date('now'))
);
