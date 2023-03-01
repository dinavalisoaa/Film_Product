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
insert into Configuration(cle,valeur)values('HeureFin','18:00:00');
insert into Configuration(cle,valeur)values('PauseScene','00:5:00');
insert into Configuration(cle,valeur)values('DebutBreak','12:00:00');
insert into Configuration(cle,valeur)values('FinBreak','14:00:00');

insert into Plateau(nom,description)values('Mer','Dans la mer');
insert into Scene(titre,numero,plateauid,filmid)values('Rencontre entre Jack et Rose',1,1,1);
insert into Scene(titre,numero,plateauid,filmid)values('Combat entre Jack et Rose',1,1,1);
insert into Scene(titre,numero,plateauid,filmid)values('Bisous',1,1,1);

insert into Scene(titre,numero,plateauid,filmid)values('Misakafo izahay',1,1,1);
 

insert into Scene(titre,numero,plateauid,filmid)values('Mifamaly izahay',1,1,1);
insert into Personnage(nom,photo)values('Rose','null');
insert into Personnage(nom,photo)values('Jack','null');

insert into Dialogue(contenu,personnageId,sceneId,duree)values('Je veux qu on s_aime',1,2,'00:12:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Je veux qu on s_aime',2,2,'00:13:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Volontier mon tres cher',1,2,'00:3:00');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Merci a vous Jeune Femme',2,2,'00:2:00');


insert into Dialogue(contenu,personnageId,sceneId,duree)values('Je veux qu on s_aime',1,3,'00:2:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Je veux qu on s_aime',2,3,'00:3:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Volontier mon tres cher',1,3,'00:23:00');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Merci a vous Jeune Femme',2,3,'00:8:00');


insert into Dialogue(contenu,personnageId,sceneId,duree)values('Jafiurqwioru',1,3,'00:19:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Je urqwioru qu on s_aime',2,3,'00:9:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('urqwioru mon tres cher',1,3,'00:13:00');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Merci a vous Jeune Femme',2,3,'00:9:00');


insert into Dialogue(contenu,personnageId,sceneId,duree)values('Jafiurqwioru',1,5,'00:19:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Je urqwioru qu on s_aime',2,5,'00:10:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('urqwioru mon tres cher',1,5,'00:15:00');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Merci a vous Jeune Femme',2,5,'00:00:40');


insert into Dialogue(contenu,personnageId,sceneId,duree)values('Jafiurqwioru',1,6,'00:20:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Je urqwioru qu on s_aime',2,6,'03:10:12');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('urqwioru mon tres cher',1,6,'01:25:00');
insert into Dialogue(contenu,personnageId,sceneId,duree)values('Merci a vous Jeune Femme',2,6,'02:00:40');

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

create or replace view v_dureedialogue as select cast(sum(cast(scene.duree as interval))as time)+cast(getConfig('pausescene')as interval) as totalDuree,scene.sceneid from dialogue as scene  group by scene.sceneid order by scene.id;