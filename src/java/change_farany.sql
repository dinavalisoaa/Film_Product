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

create table PersonnageIndisponible(
    id serial primary key,
    personnageId int,
    foreign key(personnageId) references personnage(Id),
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

        select  coalesce(datedebut,current_timestamp),datefin,titre,nom,filmId,sc.id as sceneid,
        case when
            datedebut is null and datefin is null 
            then 0 else 1 end etat    
     from plannification plan 
        right join scene sc on sc.id=plan.sceneid 
         join plateau pla on pla.id=sc.plateauid
     
 select  * from plannification plan 
    right join scene sc on sc.id=plan.sceneid 
     join plateau pla on pla.id=sc.plateauid
     

create or replace view recherche as 

    Select coalesce(plan.id ,0)as Id,  coalesce(datedebut,'2000-01-01 00:00:00.00') as datedebut,
    coalesce(datefin,'2000-01-01 00:00:00.00') as datefin,
    sc.titre as sceneTitre,coalesce(plan.debut,'2000-01-01') as debutPlan,coalesce(plan.fin,'2000-01-01') finPlan,
    film.titre as FilmTitre ,nom,filmId,sc.id as sceneid,pla.id as plateauId
            ,case when
                datedebut is null and datefin is null 
                then 0 else 1 end etat   
         from plannification plan 
            right join scene sc on sc.id=plan.sceneid 
            left  join plateau pla on pla.id=sc.plateauid
             join film on film.id=sc.filmId;


create or replace view recherche as 

    Select coalesce(plan.id,nextval('i'))as Id,  coalesce(datedebut,'2000-01-01 00:00:00.00') as datedebut,
    coalesce(datefin,'2000-01-01 00:00:00.00') as datefin,
    sc.titre as sceneTitre,coalesce(plan.debut,'2000-01-01') as debutPlan,coalesce(plan.fin,'2000-01-01') finPlan,
    film.titre as FilmTitre ,nom,filmId,sc.id as sceneid,pla.id as plateauId
            ,case when
                datedebut is null and datefin is null 
                then 0 else 1 end etat   
         from plannification plan 
            right join scene sc on sc.id=plan.sceneid 
            left  join plateau pla on pla.id=sc.plateauid
             join film on film.id=sc.filmId;


drop view v_plannification_personnage;
create view  v_plannification_personnage AS
select v.*,
pers.nom as personnageNom,pers.id as personnageId
from v_plannification v
 join dialogue diag on
 diag.sceneid=v.sceneid join personnage pers on pers.id=diag.personnageId;

select *from v_plannification_personnage v left join personnageIndisponible PI
on PI.personnageId=v.personnageId

create view v_stat_mois_1
as select count(*) as nbre,extract(month from datedebut)as mois from plannification group by extract(month from datedebut);

create view V_StatMois_1 
as select count(*) as nbre,extract(month from datedebut)as mois from plannification group by extract(month from datedebut);

create view v_indispo as select count(*) as nbre,extract(month from date1)as mois from personnageindisponible group by extract(month from date1)

create view v_indispo_plateau as select count(*) as nbre,extract(month from date1)as mois from plateauindisponible group by extract(month from date1)


create view v_statmois as select v1.mois,v1.nbre as planning,coalesce(v2.nbre,0)as personnage,coalesce(v3.nbre,0) as plateau from v_indispo v2 right join v_statmois_1 v1 on v1.mois=v2.mois right join v_indispo_plateau v3 on v3.mois=v1.mois;

create view v_stat_jour
as select count(*) as nbre,extract(day from datedebut)as mois from plannification group by extract(day from datedebut);