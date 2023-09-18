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
    DATETIME VARCHAR(8) NOT NULL,
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
    (NULL, 'EHPAD 1', 'ephad1@gmail.com', '6789012345', '1 rue ephad1 75000 Paris' )
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
--     (NULL, '')


INSERT INTO Intergen.donneur
VALUE 
    (NULL, 'Maimouna', 'Kone', 'maimouna@intergen.com', '1 rue ephad1 75000 Paris')
;