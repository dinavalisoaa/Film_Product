create table plateauIndisponible(
    id serial primary key,
    plateauId int,
    foreign key(plateauId) references plateau(id),
    date1 date,
    date2 date
);
create table plateauIndisponible(
    id serial primary key,
    plateauId int,
    foreign key(plateauId) references plateau(id),
    date1 date,
    date2 date
);
create table jourferie(
    id serial,
    jour int,
    mois int
);
insert into jourferie values (default,1,5);
insert into jourferie values (default,25,12);
alter table scene add column etat int default 0;
create table Plannification(
    id serial primary key,
    "date" date,
    sceneId int,
    plateauId int,
    foreign key (sceneId) references scene(id) ,
    foreign key (plateauId) references plateau(id) 
);

alter table scene add column heure_ideal time;


insert into configuration(cle,valeur)VALUES('pausescene','00:05:00');
insert into configuration(cle,valeur)VALUES('heuredebut','08:00:00');

