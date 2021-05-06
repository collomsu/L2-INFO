DROP TABLE IF EXISTS Proprietaires;
DROP TABLE IF EXISTS Bateaux;
DROP TABLE IF EXISTS Emplacements;
DROP TABLE IF EXISTS Modeles;
DROP TABLE IF EXISTS TypesEmplacements;
DROP TABLE IF EXISTS Adherents;


CREATE TABLE Modeles (
   nom_modele TEXT PRIMARY KEY,
   longueur_modele DATE NOT NULL,
   CONSTRAINT CK_Bat_c0 CHECK (longueur_modele > 0)
);

CREATE TABLE TypesEmplacements (
   type_emplacement TEXT PRIMARY KEY,
   longueur_max_type_emplacement INTEGER NOT NULL,
   prix_type_emplacement REAL NOT NULL,
   CONSTRAINT CK_TEmp_c0 CHECK (longueur_max_type_emplacement > 0),
   CONSTRAINT CK_TEmp_c1 CHECK (prix_type_emplacement > 0),
   CONSTRAINT CK_TEmp_c3 CHECK (type_emplacement = 'petit' AND 
	longueur_max_type_emplacement =7 OR
	type_emplacement = 'moyen' AND 
	longueur_max_type_emplacement =12 OR
	type_emplacement = 'grand' AND 
	longueur_max_type_emplacement =20)
);

CREATE TABLE Emplacements (
   numero_emplacement INTEGER PRIMARY KEY,
   type_emplacement TEXT,
   CONSTRAINT FK_Emp_c0 FOREIGN KEY (type_emplacement) 
	REFERENCES TypesEmplacements(type_emplacement),
   CONSTRAINT CK_Emp_c1 CHECK (numero_emplacement > 0)
);


CREATE TABLE Bateaux (
   numero_bateau INTEGER PRIMARY KEY, 
   date_construction_bateau DATE,
   nom_modele TEXT NOT NULL,
   numero_emplacement INTEGER UNIQUE NOT NULL,
   CONSTRAINT FK_Bat_c0 FOREIGN KEY (nom_modele) 
	REFERENCES Modeles(nom_modele),
   CONSTRAINT FK_Emp_c1 FOREIGN KEY (numero_emplacement) 
	REFERENCES Emplacements(numero_emplacement),
   CONSTRAINT CK_Bat_c2 CHECK (numero_bateau > 0)
);

CREATE TABLE Adherents (
   numero_adherent INTEGER PRIMARY KEY,
   nom_adherent TEXT NOT NULL,
   prenom_adherent TEXT NOT NULL,
   date_naissance_adherent DATE,
   CONSTRAINT CK_Adh_c0 CHECK (numero_adherent > 0)
);

CREATE TABLE Proprietaires (
   numero_adherent INTEGER,
   numero_bateau INTEGER, 
   CONSTRAINT PK_Prop_c0 PRIMARY KEY (numero_adherent, numero_bateau), 
   CONSTRAINT FK_Prop_c1 FOREIGN KEY (numero_adherent) 
	REFERENCES Adherents(numero_adherent), 
   CONSTRAINT FK_Prop_c2 FOREIGN KEY (numero_bateau) 
	REFERENCES Bateaux(numero_bateau)
);

