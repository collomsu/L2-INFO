-- Jeux de données OK (ça doit marcher)
INSERT INTO Modeles VALUES ('Pirate', 12.5);
INSERT INTO Modeles VALUES ('Classique', 15);

INSERT INTO TypesEmplacements VALUES ('petit', 7, 4000);
INSERT INTO TypesEmplacements VALUES ('moyen', 12, 6000);
INSERT INTO TypesEmplacements VALUES ('grand', 20, 13000);


INSERT INTO Emplacements VALUES (1001, 'petit');
INSERT INTO Emplacements VALUES (1002, 'petit');
INSERT INTO Emplacements VALUES (1003, 'moyen');
INSERT INTO Emplacements VALUES (1004, 'moyen');
INSERT INTO Emplacements VALUES (1005, 'moyen');
INSERT INTO Emplacements VALUES (1006, 'grand');
INSERT INTO Emplacements VALUES (1007, 'grand');
INSERT INTO Emplacements VALUES (1008, 'grand');
   
INSERT INTO Bateaux VALUES (1, '2013-04-13', 'Pirate',1005);
INSERT INTO Bateaux VALUES (2, '2011-04-07', 'Pirate', 1006);
INSERT INTO Bateaux VALUES (3, '2017-04-07', 'Classique',1007);


INSERT INTO Adherents VALUES (10, 'Sparrow', 'Jack', '1983-04-10');
INSERT INTO Adherents VALUES (11, 'Barbossa', 'Hector', '1972-01-03');
INSERT INTO Adherents VALUES (12, 'Salazar', 'Armando', '1935-02-03');

INSERT INTO Proprietaires VALUES (10, 1);
INSERT INTO Proprietaires VALUES (10, 3);
INSERT INTO Proprietaires VALUES (11, 1);