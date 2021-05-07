/* INSERT Gares */
INSERT INTO Gares VALUES ('Gare de Lyon Part-Dieu', 'Lyon');

INSERT INTO Gares VALUES ('Gare de Lyon-Perrache', 'Lyon');
INSERT INTO Gares VALUES ('Gare de Grenoble', 'Grenoble');
INSERT INTO Gares VALUES ('Gare de Aix-en-Provence', 'Aix-en-Provence');
INSERT INTO Gares VALUES ('Gare de Marseille-Saint-Charles', 'Marseille');

INSERT INTO Gares VALUES ('Gare de Lyon', 'Paris');
INSERT INTO Gares VALUES ('Gare de Montélimar', 'Montélimar');

/* INSERT Lignes */
INSERT INTO Lignes VALUES (1, 'Lyon-Perrache Marseille-Saint-Charles','Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles');
INSERT INTO Lignes VALUES (2, 'Paris-Lyon Marseille-Saint-Charles','Gare de Lyon','Gare de Marseille-Saint-Charles');


/* INSERT Etapes */
INSERT INTO Etapes VALUES (1,'Gare de Lyon-Perrache', '8:00');
INSERT INTO Etapes VALUES (1,'Gare de Grenoble', '8:42');
INSERT INTO Etapes VALUES (1,'Gare de Aix-en-Provence', '10:11');
INSERT INTO Etapes VALUES (1,'Gare de Marseille-Saint-Charles', '10:57');

INSERT INTO Etapes VALUES (2,'Gare de Lyon', '10:00');
INSERT INTO Etapes VALUES (2,'Gare de Montélimar', '13:45');
INSERT INTO Etapes VALUES (2,'Gare de Marseille-Saint-Charles', '16:40');

/* INSERT Trajets */
INSERT INTO Trajets VALUES ('Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles',444);
INSERT INTO Trajets VALUES ('Gare de Lyon-Perrache','Gare de Grenoble',120);
INSERT INTO Trajets VALUES ('Gare de Lyon-Perrache','Gare de Aix-en-Provence',280);
INSERT INTO Trajets VALUES ('Gare de Grenoble','Gare de Aix-en-Provence',160);
INSERT INTO Trajets VALUES ('Gare de Grenoble','Gare de Marseille-Saint-Charles',324);
INSERT INTO Trajets VALUES ('Gare de Aix-en-Provence','Gare de Marseille-Saint-Charles',164);

INSERT INTO Trajets VALUES ('Gare de Lyon','Gare de Marseille-Saint-Charles',863);
INSERT INTO Trajets VALUES ('Gare de Lyon','Gare de Montélimar',463);
INSERT INTO Trajets VALUES ('Gare de Montélimar','Gare de Marseille-Saint-Charles',400);


/* INSERT Billets */
INSERT INTO Billets VALUES (1,1,'Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles');
INSERT INTO Billets VALUES (2,2,'Gare de Lyon','Gare de Marseille-Saint-Charles');

/* Creation de la vue */
CREATE VIEW vue_billets (
   numero_billet,
   prix
)
AS
   SELECT numero_billet, distance*0.15
   FROM Billets JOIN Trajets USING(gare_depart_trajet,gare_arrivee_trajet)
   GROUP BY numero_billet;
   
CREATE VIEW vue_lignes (
    numero_ligne,
    distanceTotal
)
AS
    SELECT numero_ligne, distance
    FROM Lignes JOIN Trajets ON(gare_depart_ligne = gare_depart_trajet AND gare_arrivee_ligne = gare_arrivee_trajet)
    GROUP BY numero_ligne;