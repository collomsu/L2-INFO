/* /!\ IMPORTANT : Insérer d'abord l'insertion fonctionnel (fichier INSERT [OK].sql) /!\ */

INSERT INTO Gares VALUES ('Gare inconnue', '');
INSERT INTO Gares VALUES ('Gare de Lyon', 'Paris');

INSERT INTO Lignes VALUES (3,'gare inconnue Gare de Lyon','gare inconnue','Gare de Lyon');
INSERT INTO Lignes VALUES (3,'Gare de Lyon Gare de Lyon','Gare de Lyon','Gare de Lyon');
INSERT INTO Lignes VALUES (1, 'Lyon-Perrache Marseille-Saint-Charles','Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles');
INSERT INTO Lignes VALUES (2, '','Gare de Lyon','Gare de Marseille-Saint-Charles');

INSERT INTO GareEtapes VALUES (1,'gare inconnue Gare de Lyon','9:55');
INSERT INTO GareEtapes VALUES (1,'Gare de Aix-en-Provence', '10:11');
INSERT INTO GareEtapes VALUES (3,'Gare de Marseille-Saint-Charles', '10:57');

INSERT INTO Trajets VALUES (3,'gare inconnue Gare de Lyon','gare inconnue','Gare de Lyon');
INSERT INTO Trajets VALUES (3,'','Gare de Marseille-Saint-Charles',444);
INSERT INTO Trajets VALUES (2,'Gare de Lyon','Gare de Marseille-Saint-Charles',863);


INSERT INTO Billets VALUES (3,1,'2021-04-16','8:00','10:57','Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles',-2,66.6);
INSERT INTO Billets VALUES (3,1,'2021-04-16','8:00','10:57','Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles',444,2);
INSERT INTO Billets VALUES (2,2,'2021-04-16','10:00','16:40','Gare de Lyon','Gare de Marseille-Saint-Charles',863,129.45);
INSERT INTO Billets VALUES (3,2,'2021-08-16','10:00','16:40','Gare de Lyon','Gare de Marseille-Saint-Charles',863,129.45);
INSERT INTO Billets VALUES (3,2,'2021-04-16','10:00','16:40','','Gare de Marseille-Saint-Charles',863,129.45);
INSERT INTO Billets VALUES (3,2,'2021-04-16','4:00','22:40','Gare de Lyon','Gare de Marseille-Saint-Charles',863,129.45);