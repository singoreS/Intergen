DROP DATABASE IF EXISTS Intergen;

CREATE DATABASE Intergen;

CREATE TABLE Intergen.etablissement(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    adress_postal VARCHAR(50) NOT NULL
);

CREATE TABLE Intergen.responsable(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telephone VARCHAR(10) NOT NULL,
    etablissement_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(etablissement_id) REFERENCES Intergen.etablissement(id)
);

CREATE TABLE Intergen.association(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    telephone VARCHAR(10) NOT NULL
);

CREATE TABLE Intergen.programme(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    datestart DATE NOT NULL,
    datefinish DATE NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    association_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(association_id) REFERENCES
    Intergen.association(id)
);


CREATE TABLE Intergen.activiter(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    list_activiter VARCHAR(20) NOT NULL
);

CREATE TABLE Intergen.donneur(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL,
    adresse VARCHAR(100) NOT NULL
);

CREATE TABLE Intergen.don(
    id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    date DATETIME NOT NULL,
    donneur_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(donneur_id) REFERENCES
    Intergen.donneur(id)
);

-- créer une table de jointure responsable_etablissement

CREATE TABLE Intergen.etablissement_programme(
    etablissement_id TINYINT UNSIGNED NOT NULL,
    programme_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(etablissement_id) REFERENCES Intergen.etablissement(id),
    PRIMARY KEY(programme_id)
);

-- créer une table de jointure programme_association

CREATE TABLE Intergen.programme_association(
    programme_id TINYINT UNSIGNED NOT NULL,
    association_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(association_id) REFERENCES Intergen.association(id),
    PRIMARY KEY(programme_id)
);

-- créer une table de jointure don_donneur

CREATE TABLE Intergen.don_donneur(
    don_id TINYINT UNSIGNED NOT NULL,
    donneur_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(donneur_id) REFERENCES Intergen.donneur(id),
    PRIMARY KEY(don_id)
);

-- lister les enregistrements


INSERT INTO Intergen.association
VALUE 
(NULL, 'assoc1@gmail.com', 'Intergen', '0123456789' )
;

INSERT INTO Intergen.etablissement
VALUE 
    (NULL, 'EHPAD 1', 'ephad1@gmail.com', '6789012345', '1 rue ephad1 75000 Paris' ),
    (NULL, '0rphelinat 1', 'orphelinat1@gmail.com', '0787012345', '2 rue Orphelinat 75000 Paris' )
;

INSERT INTO Intergen.responsable
VALUE 
    (NULL, 'Mariam', 'traore', 'mariam@intergen.com', '0123456789', 1)
;

INSERT INTO Intergen.programme
VALUE 
    (NULL, '2023-09-04', '2023-09-08', 'Programme Semaine 1', 1),
    (NULL, '2023-09-11', '2023-09-15', 'Programme Semaine 2', 1),
    (NULL, '2023-09-18', '2023-09-22', 'Programme Semaine 3', 1),
    (NULL, '2023-09-25', '2023-09-29', 'Programme Semaine 4', 1),
    (NULL, '2023-10-02', '2023-10-06', 'Programme Semaine 5', 1)
    ;

-- INSERT INTO Intergen.activiter
-- VALUE
--     (NULL, '');

INSERT INTO Intergen.donneur
VALUE 
    (NULL, 'Maimouna', 'Kone', 'maimouna@intergen.com', '1 rue ephad1 75000 Paris'),
    (NULL, 'Mai', 'Ko', 'maimai@intergen.com', '2 rue ephad1 75000 Paris'),
    (NULL, 'Jean', 'Luc', 'jeanluc@intergen.com', '3 rue ephad1 75000 Paris'),
    (NULL, 'Alice', 'Rosée', 'rosée@intergen.com', '4 rue ephad1 75000 Paris')
;

INSERT INTO Intergen.don
VALUES 
    (NULL, 'maimouna@intergen.com', '2023-09-01 12:00:00', 1),
     (NULL, 'maimai@intergen.com', '2023-09-20 00:10:00', 2),
    (NULL, 'jeanluc@intergen.com', '2023-08-30 03:03:00', 3),
    (NULL, 'rosée@intergen.com', '2023-09-10 01:00:00', 4)
    ;
   



-- INSERT INTO Intergen.etablissement_programme
-- VALUE
-- (1,2),
-- (2,1),
-- (1,3),
-- (1,5),
-- (1,4);


-- INSERT INTO Intergen.programme_association
-- VALUE
-- (1,1),
-- (2,1),
-- (3,1),
-- (4,1),
-- (5,1);

-- INSERT INTO Intergen.don_donneur
-- VALUE
-- (1,1),
-- (2,1),
-- (3,1),
-- (4,1);


