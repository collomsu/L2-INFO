/* INSERT Gares */
INSERT INTO Gares VALUES ('Gare de Lyon-Perrache', 'Lyon');
INSERT INTO Gares VALUES ('Gare de Grenoble', 'Grenoble');
INSERT INTO Gares VALUES ('Gare de Veynes', 'Beynes');
INSERT INTO Gares VALUES ('Gare de Sisteron', 'Sisteron');
INSERT INTO Gares VALUES ('Gare de Manosque', 'Manosque');
INSERT INTO Gares VALUES ('Gare de Pertuis', 'Pertuis');
INSERT INTO Gares VALUES ('Gare de Aix-en-Provence', 'Aix-en-Provence');
INSERT INTO Gares VALUES ('Gare de Marseille-Saint-Charles', 'Marseille');

INSERT INTO Gares VALUES ('Gare de Lyon', 'Paris');
INSERT INTO Gares VALUES ('Gare de Dijon', 'Dijon');
INSERT INTO Gares VALUES ('Gare de Chalon-sur-Saône', 'Chalon-sur-Saône');
INSERT INTO Gares VALUES ('Gare de Mâcon', 'Mâcon');
INSERT INTO Gares VALUES ('Gare de Villefranche-sur-Saône', 'Villefranche-sur-Saône');
INSERT INTO Gares VALUES ('Gare de Lyon Part-Dieu', 'Lyon');
INSERT INTO Gares VALUES ('Gare de Vienne', 'Vienne');
INSERT INTO Gares VALUES ('Gare de Valence Ville', 'Valence');
INSERT INTO Gares VALUES ('Gare de Montélimar', 'Montélimar');
INSERT INTO Gares VALUES ('Gare de Orange', 'Orange');
INSERT INTO Gares VALUES ('Gare de Avignon', 'Avignon');
INSERT INTO Gares VALUES ('Gare de Arles', 'Arles');
INSERT INTO Gares VALUES ('Gare de Miramas', 'Miramas');

/* INSERT Lignes */
INSERT INTO Lignes VALUES (1, 'Lyon-Perrache Marseille-Saint-Charles','Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles');
INSERT INTO Lignes VALUES (2, 'Paris-Lyon Marseille-Saint-Charles','Gare de Lyon','Gare de Marseille-Saint-Charles');


/* INSERT GareEtapes */
INSERT INTO GareEtapes VALUES (1,'Gare de Lyon-Perrache', '8:00');
INSERT INTO GareEtapes VALUES (1,'Gare de Grenoble', '8:42');
INSERT INTO GareEtapes VALUES (1,'Gare de Veynes', '8:56');
INSERT INTO GareEtapes VALUES (1,'Gare de Sisteron', '9:18');
INSERT INTO GareEtapes VALUES (1,'Gare de Manosque', '9:37');
INSERT INTO GareEtapes VALUES (1,'Gare de Pertuis', '9:58');
INSERT INTO GareEtapes VALUES (1,'Gare de Aix-en-Provence', '10:11');
INSERT INTO GareEtapes VALUES (1,'Gare de Marseille-Saint-Charles', '10:57');

INSERT INTO GareEtapes VALUES (2,'Gare de Lyon', '10:00');
INSERT INTO GareEtapes VALUES (2,'Gare de Dijon', '10:22');
INSERT INTO GareEtapes VALUES (2,'Gare de Chalon-sur-Saône', '10:45');
INSERT INTO GareEtapes VALUES (2,'Gare de Mâcon', '11:02');
INSERT INTO GareEtapes VALUES (2,'Gare de Villefranche-sur-Saône', '11:36');
INSERT INTO GareEtapes VALUES (2,'Gare de Lyon Part-Dieu', '11:59');
INSERT INTO GareEtapes VALUES (2,'Gare de Vienne', '12:20');
INSERT INTO GareEtapes VALUES (2,'Gare de Valence Ville', '13:14');
INSERT INTO GareEtapes VALUES (2,'Gare de Montélimar', '13:45');
INSERT INTO GareEtapes VALUES (2,'Gare de Orange', '14:26');
INSERT INTO GareEtapes VALUES (2,'Gare de Avignon', '15:03');
INSERT INTO GareEtapes VALUES (2,'Gare de Arles', '15:25');
INSERT INTO GareEtapes VALUES (2,'Gare de Miramas', '15:56');
INSERT INTO GareEtapes VALUES (2,'Gare de Marseille-Saint-Charles', '16:40');

/* INSERT Trajets */
INSERT INTO Trajets VALUES (1,'Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles',444);
INSERT INTO Trajets VALUES (2,'Gare de Lyon','Gare de Marseille-Saint-Charles',863);


/* INSERT Billets (prix au km = 0.15) */
INSERT INTO Billets VALUES (1,1,'2021-04-16','8:00','10:57','Gare de Lyon-Perrache','Gare de Marseille-Saint-Charles',444,66.6);
INSERT INTO Billets VALUES (2,2,'2021-04-16','10:00','16:40','Gare de Lyon','Gare de Marseille-Saint-Charles',863,129.45);