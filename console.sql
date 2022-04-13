
CREATE DATABASE postgress;

CREATE TABLE FILM
(
    ID      SERIAL primary key,
    NAME    VARCHAR(55),
    COUNTRY VARCHAR(60),
    Genre   VARCHAR(44) NOT NULL,
    TIME    TIME(23)    NOT NULL,
    YEAR    DATE        NOT NULL
);

INSERT INTO FILM(NAME, COUNTRY, Genre, TIME, YEAR)
VALUES ('КТО Я', 'Германия', 'Триллер', '01:46:12', '24-09-2014'),
       ('КиберСталкер', 'Франция', 'Триллер', '00:25:25', '14-06-2019'),
       ('Социальный сеть', 'Франция', 'Триллер', '01:25:25', '14-06-2016');

select *
from FILM;
select *
from FILM
WHERE NAME = 'КиберСталкер';
select *
from FILM
WHERE ID = 2;
SELECT *
FROM FILM
WHERE COUNTRY = 'Франция';

ALTER TABLE FILM
ADD COLUMN FILM_ID  INT references actor(ID);

CREATE TABLE actor
(
    ID     INT PRIMARY KEY,
    NAME   VARCHAR(14)  NOT NULL,
    MOVIES VARCHAR(456) NOT NULL
);
ALTER TABLE actor
add column film_actor INT REFERENCES Koskodier(ID);

CREATE TABLE Koskodier
(
    ID    INT PRIMARY KEY
);

ALTER TABLE FILM
ADD COLUMN  Film_directby INT REFERENCES  directorby(ID);

CREATE TABLE directorby
(
    ID        INT PRIMARY KEY,
    NAME      VARCHAR(12) NOT NULL ,
    LAST_NAME VARCHAR(12) NOT NULL
);
ALTER TABLE directorby
ADD COLUMN admin_name VARCHAR references admin(NAME);
ALTER TABLE FILM
ADD COLUMN Film_producer INT REFERENCES  producer(ID);

CREATE TABLE producer
(
    ID        INT PRIMARY KEY,
    NAME      VARCHAR(24) ,
    LAST_NAME VARCHAR(32)
);
ALTER TABLE FILM
ADD COLUMN  Film_admin INT REFERENCES admin(ID);


CREATE TABLE admin
(
    ID   INT PRIMARY KEY   ,
    NAME VARCHAR not null
);

ALTER TABLE FILM
ADD COLUMN Film_editor INT REFERENCES  editor(ID);

CREATE TABLE editor
(
    ID        INT PRIMARY KEY,
    NAME      VARCHAR(12) NOT NULL,
    LAST_NAME VARCHAR(12) NOT NULL
);

ALTER TABLE editor
ADD COLUMN  editor_ass INT  REFERENCES editor_assistant(ID);

CREATE TABLE editor_assistant
(
    ID   INT PRIMARY KEY ,
    NAME VARCHAR(16) NOT NULL
);

ALTER TABLE FILM
ADD COLUMN  Film_animator INT REFERENCES animator(ID);

CREATE TABLE animator
(
    ID   INTEGER PRIMARY KEY ,
    NAME VARCHAR(12) NOT NULL
);

ALTER TABLE FILM
ADD COLUMN Film_operator INT REFERENCES operator(ID);

CREATE TABLE operator
(
    ID   INTEGER PRIMARY KEY ,
    NAME VARCHAR(12) NOT NULL
);
ALTER TABLE FILM
ADD COLUMN  Film_makeup_artist INT REFERENCES makeup_artist(ID);

CREATE TABLE makeup_artist
(
    ID        INT PRIMARY KEY,
    NAME      VARCHAR(12) NOT NULL,
    LAST_NAME VARCHAR(12) NOT NULL
);
ALTER TABLE  makeup_artist
ADD COLUMN makeupartist INT REFERENCES hair_artist(ID);

CREATE TABLE hair_artist
(
    ID   INT PRIMARY KEY,
    NAME VARCHAR(34) NOT NULL
);
ALTER TABLE makeup_artist
ADD COLUMN makeup_makeup INT REFERENCES makeup(ID);

    CREATE TABLE makeup
(
    ID   INT PRIMARY KEY,
    NAME VARCHAR(12) NOT NULL
);
ALTER TABLE FILM
ADD COLUMN  Film_cook INT REFERENCES cook(ID) ;


CREATE TABLE cook
(
    ID   INT PRIMARY KEY ,
    NAME VARCHAR(23) NOT NULL

);
alter table cook
add column MENU_ID int references MENU(ID);

CREATE TABLE MENU
(
    ID         INT PRIMARY KEY ,
    NAME_COOKs VARCHAR(600)
);

ALTER TABLE cook
ADD COLUMN  cook_assistants INT REFERENCES assistants(ID);

CREATE TABLE assistants
(
    ID    INT PRIMARY KEY ,
    NAMES VARCHAR(550)
);
ALTER TABLE producer
ADD COLUMN driver_for_procuder INT REFERENCES driver(ID);


CREATE TABLE driver
(
    ID   INT PRIMARY KEY ,
    NAME VARCHAR(12)
);

ALTER TABLE editor
ADD COLUMN editor_technologist INT REFERENCES technologist (ID);

ALTER TABLE  animator
ADD COLUMN animaltor_technologist INT REFERENCES technologist(ID);


CREATE TABLE technologist
(
    ID   INT PRIMARY KEY ,
    NAME VARCHAR(12) NOT NULL
);