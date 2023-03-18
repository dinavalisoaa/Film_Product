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
    description VARCHAR(255),
    longitude double precision,
    latitude double precision,
    etat int --disponibilite
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

CREATE TABLE Emotion (
    id SERIAL NOT NULL PRIMARY KEY,
    type varchar(50)
);

CREATE TABLE Dialogue (
    id SERIAL NOT NULL PRIMARY KEY,
    contenu TEXT,
    personnageId int,   
    sceneId int,
    duree time,
    emotionId int,
    action TEXT,
    FOREIGN KEY (personnageId) REFERENCES Personnage(id),
    FOREIGN KEY (sceneId) REFERENCES Scene(id),
    FOREIGN KEY (emotionId) REFERENCES Emotion(id)
);
alter table Dialogue add column numero int;

CREATE TABLE Configuration (
    id SERIAL NOT NULL PRIMARY KEY,
    cle VARCHAR(255),
    valeur time
);

INSERT INTO Emotion(type)
VALUES
    ('Aucun'),
    ('Content'),
    ('En colere'),
    ('Triste');



create or replace function getConfig(ins varchar)
returns time
language plpgsql
as
$$
  declare
    note time;
    begin
            note=(select valeur from configuration where lower(cle)=lower(ins));
    return note;
    end;
$$;

create or replace view v_dureedialogue as select cast(sum(cast(scene.duree as interval))as time)+cast(getConfig('pausescene')as interval) as totalDuree,scene.sceneid from dialogue as scene  group by scene.sceneid order by sceneid;

INSERT INTO Film(titre)
VALUES
    ('Titanic'),
    ('After'),
    ('Kissing Booth'),
    ('MayDay'),
    ('Man Vs Bee'),
    ('Avalonia');

 longitude double precision,
    latitude double precision,
    etat int --disponibilite

ALTER TABLE Plateau
ADD COLUMN longitude DOUBLE PRECISION,
ADD COLUMN latitude DOUBLE PRECISION,
ADD COLUMN etat INT;


INSERT INTO Personnage VALUES(DEFAULT,'Tolotra','.png');

INSERT INTO Scene VALUES(DEFAULT,'scene1',1,1,1,null,1,null);
INSERT INTO Scene VALUES(DEFAULT,'scene2',2,1,1,null,1,null);
INSERT INTO Scene VALUES(DEFAULT,'scene3',3,1,1,null,1,null);
INSERT INTO Scene VALUES(DEFAULT,'scene4',4,2,1,null,1,null);
INSERT INTO Scene VALUES(DEFAULT,'scene5',5,2,1,null,1,null);
INSERT INTO Scene VALUES(DEFAULT,'scene6',6,3,1,null,1,null);

INSERT INTO Dialogue VALUES(DEFAULT,'contenu1',1,1,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu2',1,1,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu3',1,1,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu4',1,1,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu5',1,1,'00:25:00',2,'action');

INSERT INTO Dialogue VALUES(DEFAULT,'contenu1',1,2,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu2',1,2,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu3',1,3,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu4',1,3,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu5',1,4,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu5',1,5,'00:25:00',2,'action');
INSERT INTO Dialogue VALUES(DEFAULT,'contenu5',1,6,'00:25:00',2,'action');

INSERT INTO Personnagescene VALUES(DEFAULT,1,1);
INSERT INTO Personnagescene VALUES(DEFAULT,1,2);
INSERT INTO Personnagescene VALUES(DEFAULT,1,3);
INSERT INTO Personnagescene VALUES(DEFAULT,1,4);
INSERT INTO Personnagescene VALUES(DEFAULT,1,5);
INSERT INTO Personnagescene VALUES(DEFAULT,1,6);


