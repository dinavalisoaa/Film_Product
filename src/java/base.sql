/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  P14_A_111_Dina
 * Created: 28 janv. 2023
 */
CREATE TABLE Personnage (
    id SERIAL NOT NULL PRIMARY KEY,
    nom VARCHAR(255),
    photo TEXT
);

CREATE TABLE Plateau (
    id SERIAL NOT NULL PRIMARY KEY,
    nom VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE Film (
    id SERIAL NOT NULL PRIMARY KEY,
    titre VARCHAR(255)
);

CREATE TABLE Scene (
    id SERIAL NOT NULL PRIMARY KEY,
    titre VARCHAR(255),
    numero int,
    plateauId int,
    filmId int,
    date date,
    FOREIGN KEY (plateauId) REFERENCES Plateau(id),
    FOREIGN KEY (filmId) REFERENCES Film(id)
);

CREATE TABLE PersonnageScene (
    id SERIAL NOT NULL PRIMARY KEY,
    personnageId int,
    sceneId int,
    FOREIGN KEY (personnageId) REFERENCES Personnage(id),
    FOREIGN KEY (sceneId) REFERENCES Scene(id)
);

CREATE TABLE Dialogue (
    id SERIAL NOT NULL PRIMARY KEY,
    contenu TEXT,
    personnageId int,   
    sceneId int,
    duree time,
    FOREIGN KEY (personnageId) REFERENCES Personnage(id),
    FOREIGN KEY (sceneId) REFERENCES Scene(id)
);

CREATE TABLE Configuration (
    id SERIAL NOT NULL PRIMARY KEY,
    cle VARCHAR(255),
    valeur time
);
CREATE TABLE Tournage (
    id SERIAL NOT NULL PRIMARY KEY,
    filmId int,
    dateDebut date default current_date
    );
insert into Configuration(cle,valeur)values('HeureDebut','8:00:00');
insert into Configuration(cle,valeur)values('FinDebut','18:00:00');
insert into Configuration(cle,valeur)values('PauseScene','00:5:00');
insert into Configuration(cle,valeur)values('DebutPause','12:00:00');
insert into Configuration(cle,valeur)values('DebutPause','14:00:00');





