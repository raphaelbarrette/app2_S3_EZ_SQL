/* values to add in tables */
set search_path = app2s3, pg_catalog;

INSERT INTO CAMPUS VALUES (1, 'Campus Principal');
INSERT INTO CAMPUS VALUES (2, 'Campus Medecine');
INSERT INTO CAMPUS VALUES (3, 'Campus Longueuil');

INSERT INTO PAVILLON VALUES('C1', 'J Armand Bombardier',1);
INSERT INTO PAVILLON VALUES('C2', 'J.-Armand-Bombardier',1);
INSERT INTO PAVILLON VALUES('D7', 'Centre universitaire de formation en environnement et developpement durable',1);

INSERT INTO Caracteristique VALUES (0, 'Connexion à Internet');
INSERT INTO Caracteristique VALUES (1, 'Tables fixes en U et chaises mobiles');
INSERT INTO Caracteristique VALUES (2, 'Monoplaces');
INSERT INTO Caracteristique VALUES (3, 'Tables fixes et chaises fixes');
INSERT INTO Caracteristique VALUES (6, 'Tables pour 2 ou + et chaises mobiles');
INSERT INTO Caracteristique VALUES (7, 'Tables mobiles et chaises mobiles');
INSERT INTO Caracteristique VALUES (8, 'Tables hautes et chaises hautes');
INSERT INTO Caracteristique VALUES (9, ' Tables fixes et chaises mobiles');
INSERT INTO Caracteristique VALUES (11, ' Écran');
INSERT INTO Caracteristique VALUES (14, 'Rétroprojecteur');
INSERT INTO Caracteristique VALUES (15, 'Gradins');
INSERT INTO Caracteristique VALUES (16, ' Fenêtres');
INSERT INTO Caracteristique VALUES (17, ' 1 piano');
INSERT INTO Caracteristique VALUES (18, ' 2 pianos');
INSERT INTO Caracteristique VALUES (19, ' Autres instruments');
INSERT INTO Caracteristique VALUES (20, ' Système de son');
INSERT INTO Caracteristique VALUES (21, 'Salle réservée (spéciale)');
INSERT INTO Caracteristique VALUES (22, 'Ordinateurs PC');
INSERT INTO Caracteristique VALUES (23, ' Ordinateurs SUN pour génie électrique');
INSERT INTO Caracteristique VALUES (24, ' YOU GET FUCK');
INSERT INTO Caracteristique VALUES (25, ' Ordinateurs (oscillomètre et multimètre)');
INSERT INTO Caracteristique VALUES (26, 'Ordinateurs modélisation des structures');
INSERT INTO Caracteristique VALUES (27, 'Ordinateurs PC');
INSERT INTO Caracteristique VALUES (28, 'Équipement pour microélectronique');
INSERT INTO Caracteristique VALUES (29, ' Équipement pour génie électrique');
INSERT INTO Caracteristique VALUES (30, 'Ordinateurs et équipement pour mécatroni');
INSERT INTO Caracteristique VALUES (31, 'Équipement métrologie');
INSERT INTO Caracteristique VALUES (32, ' Équipement de machinerie');
INSERT INTO Caracteristique VALUES (33, ' Équipement de géologie');
INSERT INTO Caracteristique VALUES (34, 'Équipement pour la caractérisation');
INSERT INTO Caracteristique VALUES (35, 'Équipement pour la thermodynamique');
INSERT INTO Caracteristique VALUES (36, ' Équipement pour génie civil');
INSERT INTO Caracteristique VALUES (37, 'Télévision');
INSERT INTO Caracteristique VALUES (38, 'VHS');
INSERT INTO Caracteristique VALUES (39, ' Hauts parleurs');
INSERT INTO Caracteristique VALUES (40, 'Micro');
INSERT INTO Caracteristique VALUES (41, ' Magnétophone à cassette');
INSERT INTO Caracteristique VALUES (42, 'Amplificateur audio');
INSERT INTO Caracteristique VALUES (43, 'Local barré');
INSERT INTO Caracteristique VALUES (44, 'Prise réseau');

INSERT INTO fonction VALUES (0110, 'Salle de classe générale');
INSERT INTO fonction VALUES (0111, 'Salle de classe spécialisée');
INSERT INTO fonction VALUES (0120, 'Salle de séminaire');
INSERT INTO fonction VALUES (0121, 'Cubicules');
INSERT INTO fonction VALUES (0210, 'Laboratoire informatique');
INSERT INTO fonction VALUES (0211, 'Laboratoire denseignement spécialisé');
INSERT INTO fonction VALUES (0212, 'Atelier');
INSERT INTO fonction VALUES (0213, 'Salle à dessin');
INSERT INTO fonction VALUES (0214, 'Atelier (civil)');
INSERT INTO fonction VALUES (0215, ' Salle de musique');
INSERT INTO fonction VALUES (0216, 'Atelier sur 2 étages, conjoint avec autre local');
INSERT INTO fonction VALUES (0217, 'Salle de conférence');
INSERT INTO fonction VALUES (0372, 'Salle de réunion');
INSERT INTO fonction VALUES (0373, 'Salle dentrevue et de tests');
INSERT INTO fonction VALUES (0510, 'Salle de lecture ou de consultation');
INSERT INTO fonction VALUES (0620, 'Auditorium');
INSERT INTO fonction VALUES (0625, 'Salle de concert');
INSERT INTO fonction VALUES (0640, 'Salle daudience');
INSERT INTO fonction VALUES (0930, 'Salon du personnel');
INSERT INTO fonction VALUES (1030, 'Studio denregistrement');
INSERT INTO fonction VALUES (1260, 'Hall dentrée');


INSERT INTO local VALUES('C1', '1007', 21, 0110, 'Grand');
INSERT INTO local VALUES('C1', '2018', 10, 0111, 'Materiaux Composites');
INSERT INTO local VALUES('C1', '3041', 50, 0120);
INSERT INTO local VALUES('C1', '3014', 25, 0210, 'Laboratoire mecatronique');
INSERT INTO local VALUES('C1', '3027', 15, 0211, 'Petit laboratoire de elect');
INSERT INTO local VALUES('C1', '3016', 50, 0212);
INSERT INTO local VALUES('C1', '3018', 50, 0213);
INSERT INTO local VALUES('C1', '3024', 50, 0214);
INSERT INTO local VALUES('C1', '3035', 50, 0215);
INSERT INTO local VALUES('C1', '3007', 106, 0216, 'Avec console multi-media');
INSERT INTO local VALUES('C1', '3010', 30, 0217, 'Laboratoire de conception VLSI');
INSERT INTO local VALUES('C1', '4016', 91, 0372);
INSERT INTO local VALUES('C1', '4018', 10, 0373, 'Metallurgie');
INSERT INTO local VALUES('C1', '4019', 8, 0510, 'Laboratoire accessoire Atelier');
INSERT INTO local VALUES('C1', '4021', 28, 0620);
INSERT INTO local VALUES('C1', '4023', 108, 0625);
INSERT INTO local VALUES('C1', '4030', 25, 0640, 'Équipement photoelasticité');
INSERT INTO local VALUES('C1', '4028', 14, 0930);
INSERT INTO local VALUES('C1', '4008', 106, 1030);
INSERT INTO local VALUES('C1', '5012', 35, 0121, '8 cubicules');
INSERT INTO local VALUES('C1', '5026', 38, 0110, 'Ordinateurs');
INSERT INTO local VALUES('C1', '5028', 50, 0111, 'Ordinateurs');
INSERT INTO local VALUES('C1', '5001', 198, 0120, 'Avec console multi-media');
INSERT INTO local VALUES('C1', '5009', 50, 0121, 'Avec console multi-media');
INSERT INTO local VALUES('C1', '5006', 110, 0210, 'Avec console multi-media');
INSERT INTO local VALUES('C2', '0009', 100, 0211, 'Grand et equipe');
INSERT INTO local VALUES('C2', '1004', 30, 0212, 'Atelier geologie equipement');
INSERT INTO local VALUES('C2', '1015', 40, 0213, 'Laboratoire dhydraulique');

INSERT INTO cubicule VALUES (1,'5012', 'C1' );
INSERT INTO cubicule VALUES (2,'5012', 'C1' );
INSERT INTO cubicule VALUES (3,'5012', 'C1' );
INSERT INTO cubicule VALUES (4,'5012', 'C1' );
INSERT INTO cubicule VALUES (5,'5012', 'C1' );
INSERT INTO cubicule VALUES (6,'5012', 'C1' );
INSERT INTO cubicule VALUES (7,'5012', 'C1' );
INSERT INTO cubicule VALUES (8,'5012', 'C1' );
INSERT INTO cubicule VALUES (1,'5009', 'C1' );
INSERT INTO cubicule VALUES (2,'5009', 'C1' );
INSERT INTO cubicule VALUES (3,'5009', 'C1' );
INSERT INTO cubicule VALUES (4,'5009', 'C1' );
INSERT INTO cubicule VALUES (5,'5009', 'C1' );
INSERT INTO cubicule VALUES (6,'5009', 'C1' );



INSERT INTO departement VALUES(1, 'GEGI', 'C1');
INSERT INTO departement VALUES(2, 'GChim', 'C2');
INSERT INTO departement VALUES(3, 'GM', 'C1');
INSERT INTO departement VALUES(4, 'GCiv', 'C1');

INSERT INTO MEMBRE VALUES ('ronk2602', 'Kevin', 'Rondeau', 1);
INSERT INTO MEMBRE VALUES ('ronj2302', 'John', 'Ronson', 2);
INSERT INTO MEMBRE VALUES ('smij2105', 'Jane', 'Smith', 3);
INSERT INTO MEMBRE VALUES ('lewj1803', 'James', 'Lewis', 4);
INSERT INTO MEMBRE VALUES ('robk1304', 'Kate', 'Robinson', 1);
INSERT INTO MEMBRE VALUES ('marj0406', 'Julia', 'Marshall', 2);
INSERT INTO MEMBRE VALUES ('patd2108', 'David', 'Paterson', 3);
INSERT INTO MEMBRE VALUES ('hilr0109', 'Robert', 'Hill', 4);
INSERT INTO MEMBRE VALUES ('morj2811', 'John', 'Morris', 1);
INSERT INTO MEMBRE VALUES ('bonj1001', 'Jennifer', 'Bond', 2);
INSERT INTO MEMBRE VALUES ('talr1202', 'Richard', 'Talbot', 3);
INSERT INTO MEMBRE VALUES ('lewj1403', 'Julia', 'Lewis', 4);
INSERT INTO MEMBRE VALUES ('robk1605', 'Michael', 'Roberts', 1);
INSERT INTO MEMBRE VALUES ('marj1906', 'Sarah', 'Marshall', 2);
INSERT INTO MEMBRE VALUES ('hilr2409', 'Laura', 'Hill', 4);
INSERT INTO MEMBRE VALUES ('morj2611', 'Mark', 'Morris', 1);
INSERT INTO MEMBRE VALUES ('bonj1301', 'Emily', 'Bond', 2);
INSERT INTO MEMBRE VALUES ('talr1502', 'Christopher', 'Talbot', 3);
INSERT INTO MEMBRE VALUES ('lewj1703', 'Jessica', 'Lewis', 4);
INSERT INTO MEMBRE VALUES ('robk2005', 'Matthew', 'Roberts', 1);
INSERT INTO MEMBRE VALUES ('marj2306', 'Rachel', 'Marshall', 2);
INSERT INTO MEMBRE VALUES ('patd2508', 'Andrew', 'Paterson', 3);
INSERT INTO MEMBRE VALUES ('hilr2809', 'Karen', 'Hill', 4);
INSERT INTO MEMBRE VALUES ('morj3011', 'Steven', 'Morris', 1);
INSERT INTO MEMBRE VALUES ('bonj1601', 'Stephanie', 'Bond', 2);
INSERT INTO MEMBRE VALUES ('talr1802', 'Thomas', 'Talbot', 3);
INSERT INTO MEMBRE VALUES ('lewj2003', 'Nicole', 'Lewis', 4);
INSERT INTO MEMBRE VALUES ('robk2305', 'David', 'Roberts', 1);


INSERT INTO caraclocal VALUES(30, '3014', 'C1');
INSERT INTO caraclocal VALUES(22, '3035', 'C1');
INSERT INTO caraclocal VALUES(11, '3041', 'C1');
INSERT INTO caraclocal VALUES(22, '3041', 'C1');
INSERT INTO caraclocal VALUES(11, '3007', 'C1');
INSERT INTO caraclocal VALUES(14, '3007', 'C1');
INSERT INTO caraclocal VALUES(24, '3007', 'C1');
INSERT INTO caraclocal VALUES(38, '3007', 'C1');
INSERT INTO caraclocal VALUES(40, '3007', 'C1');
INSERT INTO caraclocal VALUES(11, '4016', 'C1');
INSERT INTO caraclocal VALUES(14, '4016', 'C1');
INSERT INTO caraclocal VALUES(40, '4016', 'C1');
INSERT INTO caraclocal VALUES(24, '4016', 'C1');
INSERT INTO caraclocal VALUES(22, '4021', 'C1');
INSERT INTO caraclocal VALUES(11, '4023', 'C1');
INSERT INTO caraclocal VALUES(14, '4023', 'C1');
INSERT INTO caraclocal VALUES(24, '4023', 'C1');
INSERT INTO caraclocal VALUES(38, '4023', 'C1');
INSERT INTO caraclocal VALUES(40, '4023', 'C1');
INSERT INTO caraclocal VALUES(22, '4028', 'C1');
INSERT INTO caraclocal VALUES(11, '4008', 'C1');
INSERT INTO caraclocal VALUES(14, '4008', 'C1');
INSERT INTO caraclocal VALUES(24, '4008', 'C1');
INSERT INTO caraclocal VALUES(38, '4008', 'C1');
INSERT INTO caraclocal VALUES(40, '4008', 'C1');
INSERT INTO caraclocal VALUES(11, '5026', 'C1');
INSERT INTO caraclocal VALUES(14, '5026', 'C1');
INSERT INTO caraclocal VALUES(22, '5026', 'C1');
INSERT INTO caraclocal VALUES(11, '5028', 'C1');
INSERT INTO caraclocal VALUES(14, '5028', 'C1');
INSERT INTO caraclocal VALUES(22, '5028', 'C1');
INSERT INTO caraclocal VALUES(11, '5001', 'C1');
INSERT INTO caraclocal VALUES(14, '5001', 'C1');
INSERT INTO caraclocal VALUES(24, '5001', 'C1');
INSERT INTO caraclocal VALUES(38, '5001', 'C1');
INSERT INTO caraclocal VALUES(40, '5001', 'C1');
INSERT INTO caraclocal VALUES(11, '5009', 'C1');
INSERT INTO caraclocal VALUES(14, '5009', 'C1');
INSERT INTO caraclocal VALUES(24, '5009', 'C1');
INSERT INTO caraclocal VALUES(38, '5009', 'C1');
INSERT INTO caraclocal VALUES(40, '5009', 'C1');
INSERT INTO caraclocal VALUES(11, '5006', 'C1');
INSERT INTO caraclocal VALUES(14, '5006', 'C1');
INSERT INTO caraclocal VALUES(24, '5006', 'C1');
INSERT INTO caraclocal VALUES(38, '5006', 'C1');
INSERT INTO caraclocal VALUES(40, '5006', 'C1');
INSERT INTO caraclocal VALUES(33, '1004', 'C2');



INSERT INTO statut VALUES (0,'Administrateur');
INSERT INTO statut VALUES (1,'Etudiant');
INSERT INTO statut VALUES (2,'Professeur');
INSERT INTO statut VALUES (3,'Personel de soutien');



INSERT INTO statutmembre VALUES (1,'ronk2602');
INSERT INTO statutmembre VALUES (2,'ronj2302');
INSERT INTO statutmembre VALUES (3,'smij2105');
INSERT INTO statutmembre VALUES (0,'lewj1803');
INSERT INTO statutmembre VALUES (1,'robk1304');
INSERT INTO statutmembre VALUES (2,'marj0406');
INSERT INTO statutmembre VALUES (3,'patd2108');
INSERT INTO statutmembre VALUES (0,'hilr0109');
INSERT INTO statutmembre VALUES (1,'morj2811');
INSERT INTO statutmembre VALUES (2,'bonj1001');
INSERT INTO statutmembre VALUES (3,'talr1202');
INSERT INTO statutmembre VALUES (1,'lewj1403');
INSERT INTO statutmembre VALUES (2,'robk1605');
INSERT INTO statutmembre VALUES (3,'marj1906');
INSERT INTO statutmembre VALUES (1,'hilr2409');
INSERT INTO statutmembre VALUES (2,'morj2611');
INSERT INTO statutmembre VALUES (3,'bonj1301');
INSERT INTO statutmembre VALUES (1,'talr1502');
INSERT INTO statutmembre VALUES (2,'lewj1703');
INSERT INTO statutmembre VALUES (3,'robk2005');
INSERT INTO statutmembre VALUES (1,'marj2306');
INSERT INTO statutmembre VALUES (2,'patd2508');
INSERT INTO statutmembre VALUES (3,'hilr2809');
INSERT INTO statutmembre VALUES (1,'morj3011');
INSERT INTO statutmembre VALUES (2,'bonj1601');
INSERT INTO statutmembre VALUES (3,'talr1802');
INSERT INTO statutmembre VALUES (1,'lewj2003');
INSERT INTO statutmembre VALUES (2,'robk2305');


INSERT INTO RESERVATION VALUES ('1970-01-01 08:00:00','1970-01-01 08:30:00', 1, 'Premiere reserv', 'ronk2602','3014', 'C1');
INSERT INTO RESERVATION VALUES ('2021-09-28 08:00:00','2021-09-28 10:00:00', 2,'Faire des sql injections', 'robk1304','1007', 'C1');
INSERT INTO RESERVATION VALUES ('2021-09-28 08:30:00','2021-09-28 10:00:00', 3,'Travailler sur app3 s5', 'talr1202','2018', 'C1');
--INSERT INTO RESERVATION VALUES ('2021-09-28 09:00:00','2021-09-28 10:00:00', 4,'Rencontre de projet', 'lewj1403','5012', 'C1');
INSERT INTO reservation values ('2021-09-28 09:00:00','2021-09-28 10:00:00', 5, 'toute app cubicule 5','ronk2602', '5012', 'C1');
UPDATE reservation SET is_deleted = TRUE WHERE reservationid = '2';