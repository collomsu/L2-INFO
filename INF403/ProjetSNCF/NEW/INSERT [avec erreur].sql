/* /!\ IMPORTANT : Insérer d'abord l'insertion fonctionnel (fichier INSERT [OK].sql) /!\ */

INSERT INTO Gares VALUES ('Gare inconnue', '');
INSERT INTO Gares VALUES ('Gare de Lyon', 'Paris');

INSERT INTO Lignes VALUES (3,'gare inconnue Gare de Lyon','gare inconnue','Gare de Lyon');
INSERT INTO Lignes VALUES (3,'Gare de Lyon Gare de Lyon','Gare de Lyon','Gare de Lyon');
INSERT INTO Lignes VALUES (1, 'Lyon-Perrache Marseille-Saint-Charles','Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles');
INSERT INTO Lignes VALUES (2, '','Gare de Lyon','Gare de Marseille-Saint-Charles');

INSERT INTO Etapes VALUES (1,'gare inconnue Gare de Lyon','9:55');
INSERT INTO Etapes VALUES (1,'Gare de Aix-en-Provence', '10:11');
INSERT INTO Etapes VALUES (3,'Gare de Marseille-Saint-Charles', '10:57');

INSERT INTO Trajets VALUES ('gare inconnue Gare de Lyon','gare inconnue','Gare de Lyon');
INSERT INTO Trajets VALUES ('','Gare de Marseille-Saint-Charles',444);
INSERT INTO Trajets VALUES ('Gare de Lyon','Gare de Marseille-Saint-Charles',863);


INSERT INTO Billets VALUES (1,3,'Gare de Lyon-Perrache','Gare de Lyon-Perrache');
INSERT INTO Billets VALUES (3,3,'Gare de Lyon','Gare de Marseille-Saint-Charles');