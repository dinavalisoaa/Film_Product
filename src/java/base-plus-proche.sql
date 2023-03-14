 
/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  i.m.a
 * Created: Jan 28, 2023
 */

-- CREATE EXTENSION postgis; 

CREATE OR REPLACE FUNCTION haversine_distance(lat1 FLOAT, lon1 FLOAT, lat2 FLOAT, lon2 FLOAT) 
RETURNS FLOAT AS $$
    SELECT
        2 * 6371 * ASIN(
            SQRT(
                POWER(SIN(RADIANS((lat2 - lat1) / 2)), 2) +
                COS(RADIANS(lat1)) * COS(RADIANS(lat2)) *
                POWER(SIN(RADIANS((lon2 - lon1) / 2)), 2)
            )
        )
    $$ LANGUAGE SQL;


CREATE TABLE plateau(
    id serial primary key,
    nom varchar(150),
    latitude float8,
    longitude float8
);

INSERT INTO plateau (nom, latitude, longitude) VALUES ('Plateu Akorindrano', -18.419416, 38.7749);
INSERT INTO plateau (nom, latitude, longitude) VALUES ('Plateu Ivato', -18.7992, 47.4786);
INSERT INTO plateau (nom, latitude, longitude) VALUES ('Plateu Anosy', -18.419416, 38.7749);
INSERT INTO plateau (nom, latitude, longitude) VALUES ('Plateu Analakely', -18.9102, 48.5213);
SELECT * FROM plateau;

-- CREATE OR REPLACE VIEW 
SELECT *, haversine_distance(-18.419416, 3.7749, latitude, longitude) as dist 
FROM plateau 
ORDER BY dist;
