
drop schema if exists app2s3 cascade;
CREATE SCHEMA app2s3;
set search_path = app2s3, pg_catalog;
CREATE TABLE statut
(
    StatusID VARCHAR(32) NOT NULL,
    Nom VARCHAR(64) NOT NULL,
    PRIMARY KEY (StatusID)
);

CREATE TABLE Campus
(
    CampusID VARCHAR(128) NOT NULL,
    nomCampus VARCHAR(128) NOT NULL,
    PRIMARY KEY (CampusID)
);

CREATE TABLE Fonction
(
    FonctionID INT NOT NULL,
    nomFonction VARCHAR(512) NOT NULL,
    PRIMARY KEY (FonctionID)
);


CREATE TABLE Caracteristique
(
    caracteristiqueID VARCHAR(64) NOT NULL,
    nomCaracteristique VARCHAR(128) NOT NULL,
    PRIMARY KEY (caracteristiqueID)
);

CREATE TABLE statut_privileges
(
    privileges VARCHAR(1024) NOT NULL,
    StatusID VARCHAR(32) NOT NULL,
    PRIMARY KEY (privileges, StatusID),
    FOREIGN KEY (StatusID) REFERENCES statut(StatusID)
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
    Nom VARCHAR(128) NOT NULL,
    DepartementID VARCHAR(64) NOT NULL,
    PRIMARY KEY (Cip),
    FOREIGN KEY (DepartementID) REFERENCES Departement(DepartementID)
);

CREATE TABLE Local
(
    PavillonID VARCHAR(16) NOT NULL,
    IdLocal VARCHAR(64) NOT NULL,
    Capacite INT NOT NULL,
    FonctionID INT NOT NULL,
    Notes VARCHAR(1024),
    PRIMARY KEY (IdLocal, PavillonID),
    FOREIGN KEY (PavillonID) REFERENCES Pavillon(PavillonID),
    FOREIGN KEY (FonctionID) REFERENCES Fonction(FonctionID)
);

CREATE TABLE Cubicule
(
    numCubicule VARCHAR(64) NOT NULL,
    IdLocal VARCHAR(64) NOT NULL,
    PavillonID VARCHAR(16) NOT NULL,
    PRIMARY KEY (numCubicule, IdLocal, PavillonID),
    FOREIGN KEY (IdLocal, PavillonID) REFERENCES Local(IdLocal, PavillonID)
);

CREATE TABLE statutmembre
(
    StatusID VARCHAR(32) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    PRIMARY KEY (StatusID, Cip),
    FOREIGN KEY (StatusID) REFERENCES statut(StatusID),
    FOREIGN KEY (Cip) REFERENCES Membre(Cip)
);

CREATE TABLE CaracLocal
(
    caracteristiqueID VARCHAR(64) NOT NULL,
    IdLocal VARCHAR(64) NOT NULL,
    PavillonID VARCHAR(16) NOT NULL,
    PRIMARY KEY (caracteristiqueID, IdLocal, PavillonID),
    FOREIGN KEY (caracteristiqueID) REFERENCES Caracteristique(caracteristiqueID),
    FOREIGN KEY (IdLocal, PavillonID) REFERENCES Local(IdLocal, PavillonID)
);

CREATE TABLE Reservation
(
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP NOT NULL,
    ReservationID VARCHAR(64) NOT NULL,
    Description VARCHAR(1024) NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    IdLocal VARCHAR(64) NOT NULL,
    PavillonID VARCHAR(16) NOT NULL,
    NumCubicule VARCHAR(16),
    PRIMARY KEY (ReservationID),
    FOREIGN KEY (Cip) REFERENCES Membre(Cip),
    FOREIGN KEY (IdLocal, PavillonID) REFERENCES Local(IdLocal, PavillonID),
    FOREIGN KEY (NumCubicule, IdLocal, PavillonID) REFERENCES Cubicule(NumCubicule, IdLocal, PavillonID)
);

ALTER TABLE Reservation ADD COLUMN is_deleted BOOLEAN NOT NULL DEFAULT FALSE;

CREATE TABLE log
(
    idlog SERIAL,
    Description VARCHAR(1024) NOT NULL,
    date timestamp NOT NULL,
    Cip VARCHAR(16) NOT NULL,
    ReservationID VARCHAR(64) NOT NULL,
    PRIMARY KEY (Idlog),
    FOREIGN KEY (Cip) REFERENCES Membre(Cip),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID) ON DELETE NO ACTION
);

ALTER TABLE log
    DROP CONSTRAINT log_reservationid_fkey,
    ADD CONSTRAINT log_reservationid_fkey
        FOREIGN KEY (ReservationID)
            REFERENCES reservation (ReservationID)
            ON DELETE CASCADE;




-- INSERT INTO RESERVATION VALUES (1,'2021-09-28 08:00:00','2021-09-28 10:00:00','1007','C1','pros9469','Net Neutrality');
-- INSERT INTO RESERVATION VALUES (2,'2021-09-28 08:30:00','2021-09-28 10:00:00','2018','C1','cons1563','Big Data');
-- INSERT INTO RESERVATION VALUES (3,'2021-09-28 09:00:00','2021-09-28 10:00:00','2055','C1','rode1234','Data Mining');
-- INSERT INTO RESERVATION VALUES (4,'2021-09-28 10:00:00','2021-09-28 12:00:00','3014','C1','unda0521','Actionable Analytics');
-- INSERT INTO RESERVATION VALUES (5,'2021-09-28 11:00:00','2021-09-28 15:00:00','4019','C1','clil9802','Artificial Intelligence');
-- INSERT INTO RESERVATION VALUES (6,'2021-09-28 10:30:00','2021-09-28 16:00:00','4023','C1','donl3626','Machine Learning');
-- INSERT INTO RESERVATION VALUES (7,'2021-09-28 12:00:00','2021-09-28 18:45:00','3035','C1','howa4260','Personalization');
-- INSERT INTO RESERVATION VALUES (8,'2021-09-28 15:45:00','2021-09-28 16:00:00','0009','C2','vegm1056','Voice Recognition');
-- INSERT INTO RESERVATION VALUES (9,'2021-09-28 09:15:00','2021-09-28 12:00:00','2040','C2','core6000','Chatbots');
-- INSERT INTO RESERVATION VALUES (10,'2021-09-28 06:30:00','2021-09-28 09:00:00','1042','C2','easl963','Augmented Reality');
-- INSERT INTO RESERVATION VALUES (11,'2021-09-28 07:00:00','2021-09-28 10:00:00','1015','C2','welg7895','Virtual Reality');
-- INSERT INTO RESERVATION VALUES (12,'2021-09-28 11:00:00','2021-09-28 13:00:00','1015','C2','cork7410','Smart Industry 4.0');
-- INSERT INTO RESERVATION VALUES (13,'2021-09-28 08:45:00','2021-09-28 10:00:00','3010','D7','payk7562','Quantum Computing');
-- INSERT INTO RESERVATION VALUES (30,'2021-09-28 08:00:00','2021-09-28 10:00:00','3041-1','C1','rahk9841','Study 1');
-- INSERT INTO RESERVATION VALUES (31,'2021-09-28 08:00:00','2021-09-28 10:00:00','3041-2','C1','spai6969','Study 2');


