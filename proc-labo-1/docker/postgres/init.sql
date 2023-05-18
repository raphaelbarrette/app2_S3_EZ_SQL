
drop schema if exists app2s3 cascade;
CREATE SCHEMA app2s3;
set search_path = app2s3, pg_catalog;

CREATE TABLE Statut
(
    Nom VARCHAR(64) NOT NULL,
    StatusID VARCHAR(64) NOT NULL,
    PRIMARY KEY (StatusID)
);

CREATE TABLE Campus
(
    CampusID VARCHAR(64) NOT NULL,
    nomCampus VARCHAR(64) NOT NULL,
    PRIMARY KEY (CampusID)
);

CREATE TABLE Fonction
(
    FonctionID VARCHAR(16) NOT NULL,
    nomFonction VARCHAR(128) NOT NULL,
    PRIMARY KEY (FonctionID)
);

CREATE TABLE Caracterisique
(
    caracteristiqueID VARCHAR(16) NOT NULL,
    nomCaracteristique VARCHAR(1024) NOT NULL,
    PRIMARY KEY (caracteristiqueID)
);

CREATE TABLE Statut_privileges
(
    privileges VARCHAR(64) NOT NULL,
    StatusID VARCHAR(64) NOT NULL,
    PRIMARY KEY (privileges, StatusID),
    FOREIGN KEY (StatusID) REFERENCES Statut(StatusID)
);

CREATE TABLE Pavillon
(
    PavillonID VARCHAR(16) NOT NULL,
    nomPavillon VARCHAR(128) NOT NULL,
    CampusID VARCHAR(128) NOT NULL,
    PRIMARY KEY (PavillonID),
    FOREIGN KEY (CampusID) REFERENCES Campus(CampusID)
);

CREATE TABLE Departement
(
    DepartementID VARCHAR(64) NOT NULL,
    DepartementNom VARCHAR(128) NOT NULL,
    PavillonID VARCHAR(16) NOT NULL,
    PRIMARY KEY (DepartementID),
    FOREIGN KEY (PavillonID) REFERENCES Pavillon(PavillonID)
);

CREATE TABLE Membre
(
    Cip VARCHAR(16) NOT NULL,
    Prenom VARCHAR(64) NOT NULL,
    Nom VARCHAR(64) NOT NULL,
    DepartementID VARCHAR(64) NOT NULL,
    PRIMARY KEY (Cip),
    FOREIGN KEY (DepartementID) REFERENCES Departement(DepartementID)
);

CREATE TABLE StatutMembre
(
    StatusID VARCHAR(64) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    PRIMARY KEY (StatusID, Cip),
    FOREIGN KEY (StatusID) REFERENCES Statut(StatusID),
    FOREIGN KEY (Cip) REFERENCES Membre(Cip)
);



CREATE TABLE Local
(
    noCubicule INT NOT NULL,
    NoLocal INT NOT NULL,
    Capacite INT NOT NULL,
    Notes VARCHAR(1024),
    PavillonID VARCHAR(16) NOT NULL,
    FonctionID VARCHAR(16) NOT NULL,
    Compose_noCubicule INT,
    PRIMARY KEY (noCubicule, NoLocal, PavillonID),
    FOREIGN KEY (PavillonID) REFERENCES Pavillon(PavillonID),
    FOREIGN KEY (FonctionID) REFERENCES Fonction(FonctionID),
    FOREIGN KEY (Compose_noCubicule, NoLocal, PavillonID) REFERENCES Local(noCubicule, NoLocal, PavillonID)
);


CREATE TABLE Reservation
(
    date_fin DATE NOT NULL,
    date_debut DATE NOT NULL,
    ReservationID VARCHAR NOT NULL,
    Date DATE NOT NULL,
    Description VARCHAR(1024) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    noCubicule INT NOT NULL,
    NoLocal INT NOT NULL,
    PavillonID VARCHAR(16) NOT NULL,
    PRIMARY KEY (ReservationID),
    FOREIGN KEY (Cip) REFERENCES Membre(Cip),
    FOREIGN KEY (noCubicule, NoLocal, PavillonID) REFERENCES Local(noCubicule, NoLocal, PavillonID)
);

CREATE TABLE log
(
    Idlog VARCHAR(64) NOT NULL,
    Description VARCHAR(1024) NOT NULL,
    date DATE NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    ReservationID VARCHAR NOT NULL,
    PRIMARY KEY (Idlog),
    FOREIGN KEY (Cip) REFERENCES Membre(Cip),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);

CREATE TABLE CaracLocal
(
    caracteristiqueID VARCHAR(16) NOT NULL,
    noCubicule INT NOT NULL,
    NoLocal INT NOT NULL,
    PavillonID VARCHAR(16) NOT NULL,
    PRIMARY KEY (caracteristiqueID, noCubicule, NoLocal, PavillonID),
    FOREIGN KEY (caracteristiqueID) REFERENCES Caracterisique(caracteristiqueID),
    FOREIGN KEY (noCubicule, NoLocal, PavillonID) REFERENCES Local(noCubicule, NoLocal, PavillonID)
);

/* values to add in tables */
INSERT INTO CAMPUS VALUES (1, 'Campus Principal');
INSERT INTO CAMPUS VALUES (2, 'Campus Medecine');
INSERT INTO CAMPUS VALUES (3, 'Campus Longueuil');
INSERT INTO PAVILLON VALUES('C1', 'J Armand Bombardier',1);
INSERT INTO PAVILLON VALUES('C2', 'J.-Armand-Bombardier',1);
INSERT INTO PAVILLON VALUES('D7', 'Centre universitaire de formation en environnement et developpement durable',1);
INSERT INTO Caracterisique VALUES (0, 'Connexion à Internet');
INSERT INTO Caracterisique VALUES (1, 'Tables fixes en U et chaises mobiles');
INSERT INTO Caracterisique VALUES (2, 'Monoplaces');
INSERT INTO Caracterisique VALUES (3, 'Tables fixes et chaises fixes');
INSERT INTO Caracterisique VALUES (6, 'Tables pour 2 ou + et chaises mobiles');
INSERT INTO Caracterisique VALUES (7, 'Tables mobiles et chaises mobiles');
INSERT INTO Caracterisique VALUES (8, 'Tables hautes et chaises hautes');
INSERT INTO Caracterisique VALUES (9, ' Tables fixes et chaises mobiles');
INSERT INTO Caracterisique VALUES (11, ' Écran');
INSERT INTO Caracterisique VALUES (14, 'Rétroprojecteur');
INSERT INTO Caracterisique VALUES (15, 'Gradins');
INSERT INTO Caracterisique VALUES (16, ' Fenêtres');
INSERT INTO Caracterisique VALUES (17, ' 1 piano');
INSERT INTO Caracterisique VALUES (18, ' 2 pianos');
INSERT INTO Caracterisique VALUES (19, ' Autres instruments');
INSERT INTO Caracterisique VALUES (20, ' Système de son');
INSERT INTO Caracterisique VALUES (21, 'Salle réservée (spéciale)');
INSERT INTO Caracterisique VALUES (22, 'Ordinateurs PC');
INSERT INTO Caracterisique VALUES (23, ' Ordinateurs SUN pour génie électrique');
INSERT INTO Caracterisique VALUES (24, ' YOU GET FUCK');
INSERT INTO Caracterisique VALUES (25, ' Ordinateurs (oscillomètre et multimètre)');
INSERT INTO Caracterisique VALUES (26, 'Ordinateurs modélisation des structures');
INSERT INTO Caracterisique VALUES (27, 'Ordinateurs PC');
INSERT INTO Caracterisique VALUES (28, 'Équipement pour microélectronique');
INSERT INTO Caracterisique VALUES (29, ' Équipement pour génie électrique');
INSERT INTO Caracterisique VALUES (30, 'Ordinateurs et équipement pour mécatroni');
INSERT INTO Caracterisique VALUES (31, 'Équipement métrologie');
INSERT INTO Caracterisique VALUES (32, ' Équipement de machinerie');
INSERT INTO Caracterisique VALUES (33, ' Équipement de géologie');
INSERT INTO Caracterisique VALUES (34, 'Équipement pour la caractérisation');
INSERT INTO Caracterisique VALUES (35, 'Équipement pour la thermodynamique');
INSERT INTO Caracterisique VALUES (36, ' Équipement pour génie civil');
INSERT INTO Caracterisique VALUES (37, 'Télévision');
INSERT INTO Caracterisique VALUES (38, 'VHS');
INSERT INTO Caracterisique VALUES (39, ' Hauts parleurs');
INSERT INTO Caracterisique VALUES (40, 'Micro');
INSERT INTO Caracterisique VALUES (41, ' Magnétophone à cassette');
INSERT INTO Caracterisique VALUES (42, 'Amplificateur audio');
INSERT INTO Caracterisique VALUES (43, 'Local barré');
INSERT INTO Caracterisique VALUES (44, 'Prise réseau');

-- INSERT INTO local VALUES('C1', '1007', 21, 'Grand');
-- INSERT INTO local VALUES('C1', '2018', 10, 'Materiaux Composites');
-- INSERT INTO local VALUES('C1', '3041', 50);
-- INSERT INTO local VALUES('C1', '2055', 24);
-- INSERT INTO local VALUES('C1', '3014', 25, 'Laboratoire mecatronique');
-- INSERT INTO local VALUES('C1', '3027', 15, 'Petit laboratoire de elect');
-- INSERT INTO local VALUES('C1', '3016', 50);
-- INSERT INTO local VALUES('C1', '3018', 50);
-- INSERT INTO local VALUES('C1', '3024', 50);
-- INSERT INTO local VALUES('C1', '3035', 50);
-- INSERT INTO local VALUES('C1', '3007', 106, 'Avec console multi-media');
-- INSERT INTO locaux VALUES('C1', '3010', 30, 'Laboratoire de conception VLSI');
-- INSERT INTO locaux VALUES('C1', '4016', 91);
-- INSERT INTO locaux VALUES('C1', '4018', 10, 'Metallurgie');
-- INSERT INTO locaux VALUES('C1', '4019', 8, 'Laboratoire accessoire Atelier');
-- INSERT INTO locaux VALUES('C1', '4021', 28);
-- INSERT INTO locaux VALUES('C1', '4023', 108);
-- INSERT INTO locaux VALUES('C1', '4030', 25, 'Équipement photoelasticité');
-- INSERT INTO locaux VALUES('C1', '4028', 14);
-- INSERT INTO locaux VALUES('C1', '4008', 106);
-- INSERT INTO locaux VALUES('C1', '5012', 35, '8 cubicules');
-- INSERT INTO locaux VALUES('C1', '5026', 38, 'Ordinateurs');
-- INSERT INTO locaux VALUES('C1', '5028', 50, 'Ordinateurs');
-- INSERT INTO locaux VALUES('C1', '5001', 198, 'Avec console multi-media');
-- INSERT INTO locaux VALUES('C1', '5009', 50, 'Avec console multi-media');
-- INSERT INTO locaux VALUES('C1', '5006', 110, 'Avec console multi-media');
-- INSERT INTO locaux VALUES('C2', '0009', 100, 'Grand et equipe');
-- INSERT INTO locaux VALUES('C2', '1004', 30, 'Atelier geologie equipement');
-- INSERT INTO locaux VALUES('C2', '1015', 40, 'Laboratoire dhydraulique');
-- INSERT INTO locaux VALUES('C2', '1042', 21, 'Laboratoire chimie-physique');
-- INSERT INTO locaux VALUES('C2', '2040', 40, 'Laboratoire sans instrument');
-- INSERT INTO locaux VALUES('C2', '2514', 10);
-- INSERT INTO locaux VALUES('D7', '2018', 57);
-- INSERT INTO locaux VALUES('D7', '3001', 35);
-- INSERT INTO locaux VALUES('D7', '3002', 22);
-- INSERT INTO locaux VALUES('D7', '3007', 54);
-- INSERT INTO locaux VALUES('D7', '3009', 45);
-- INSERT INTO locaux VALUES('D7', '3010', 21);
-- INSERT INTO locaux VALUES('D7', '3011', 50);
-- INSERT INTO locaux VALUES('D7', '3012', 54);
-- INSERT INTO locaux VALUES('D7', '3013', 44);
-- INSERT INTO locaux VALUES('D7', '3014', 40);
-- INSERT INTO locaux VALUES('D7', '3015', 48);
-- INSERT INTO locaux VALUES('D7', '3016', 125, 'Avec console multi-media');
-- INSERT INTO locaux VALUES('D7', '3017', 45);
-- INSERT INTO locaux VALUES('D7', '3019', 48);
-- INSERT INTO locaux VALUES('D7', '3020', 35, 'Un mur est en fenetre');
-- INSERT INTO locaux VALUES('C1', '3041-1', 8, null,'C1', '3041');
-- INSERT INTO locaux VALUES('C1', '3041-2', 8, null,'C1', '3041');
-- INSERT INTO locaux VALUES('C1', '3041-3', 8, null,'C1', '3041');
-- INSERT INTO locaux VALUES('C1', '3041-4', 8, null,'C1', '3041');
-- INSERT INTO locaux VALUES('C1', '3041-5', 8, null,'C1', '3041');
-- INSERT INTO locaux VALUES('C1', '3041-6', 8, null,'C1', '3041');