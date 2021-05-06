DROP TABLE IF EXISTS Billets;
DROP TABLE IF EXISTS Etapes;
DROP TABLE IF EXISTS Trajets;
DROP TABLE IF EXISTS Lignes;
DROP TABLE IF EXISTS Gares;


PRAGMA FOREIGN_KEYS=ON;

CREATE TABLE Gares (
   nom_gare TEXT NOT NULL,
   ville_gare TEXT NOT NULL,
   CONSTRAINT PK_g1 PRIMARY KEY (nom_gare),
   CONSTRAINT CR_g2 CHECK (nom_gare != '' AND ville_gare != '')
);

CREATE TABLE Lignes (
   numero_ligne INTEGER NOT NULL,
   nom_ligne TEXT NOT NULL,
   gare_depart_ligne TEXT NOT NULL,
   gare_arrivee_ligne TEXT NOT NULL,
   CONSTRAINT PK_l1 PRIMARY KEY (numero_ligne),
   CONSTRAINT FK_l2 FOREIGN KEY (gare_depart_ligne) REFERENCES Gares (nom_gare),
   CONSTRAINT FK_l3 FOREIGN KEY (gare_arrivee_ligne) REFERENCES Gares (nom_gare),
   CONSTRAINT CR_l4 CHECK (gare_depart_ligne != gare_arrivee_ligne)
);

CREATE TABLE Etapes (
   numero_ligne INTEGER NOT NULL,
   nom_gare TEXT NOT NULL,
   horaire_passage_etape TIME NOT NULL,
   CONSTRAINT PK_e1 PRIMARY KEY (numero_ligne,nom_gare),
   CONSTRAINT FK_e2 FOREIGN KEY (numero_ligne) REFERENCES Lignes (numero_ligne),
   CONSTRAINT FK_e3 FOREIGN KEY (nom_gare) REFERENCES Gares (nom_gare)
);

CREATE TABLE Trajets (
   gare_depart_trajet TEXT NOT NULL,
   gare_arrivee_trajet TEXT NOT NULL,
   distance INTEGER NOT NULL,
   CONSTRAINT PK_t1 PRIMARY KEY (gare_depart_trajet,gare_arrivee_trajet),
   CONSTRAINT FK_t2 FOREIGN KEY (gare_depart_trajet) REFERENCES Gares (nom_gare),
   CONSTRAINT FK_t3 FOREIGN KEY (gare_arrivee_trajet) REFERENCES Gares (nom_gare),
   CONSTRAINT CR_t4 CHECK (gare_depart_trajet != gare_arrivee_trajet)
);

CREATE TABLE Billets (
   numero_billet INTEGER NOT NULL,
   numero_ligne INTEGER NOT NULL,
   gare_depart_trajet TEXT NOT NULL,
   gare_arrivee_trajet TEXT NOT NULL,
   CONSTRAINT PK_b1 PRIMARY KEY (numero_billet),
   CONSTRAINT FK_b3 FOREIGN KEY (numero_ligne,gare_depart_trajet) REFERENCES Etapes (numero_ligne,nom_gare),
   CONSTRAINT FK_b4 FOREIGN KEY (numero_ligne,gare_arrivee_trajet) REFERENCES Etapes (numero_ligne,nom_gare),
   CONSTRAINT CR_b5 CHECK (gare_depart_trajet != gare_arrivee_trajet)
);