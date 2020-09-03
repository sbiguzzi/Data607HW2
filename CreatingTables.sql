/*
	Title: Assignment #2 - SQL and R
	Author: Stefano Biguzzi
	Create Date: 9/1/2020
	Last Edit 9/1/2020
	
	Purpose: Below is the code for the creation of relevant database and tables for this assignment
*/

--Create the database to store all tables and data
CREATE DATABASE "MovieRatings"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Creating the table for movie information
CREATE TABLE public."tblMovies"
(
    "MovieID" character(10) COLLATE pg_catalog."default" NOT NULL,
    "MovieTitle" character(30) COLLATE pg_catalog."default",
    "BestPicture" character(1) COLLATE pg_catalog."default",
    "OscarYear" integer,
    "Genre" character(20) COLLATE pg_catalog."default",
    "RtCriticRating" real,
    "ImdbRating" real
)

TABLESPACE pg_default;

ALTER TABLE public."tblMovies"
    OWNER to postgres;

COMMENT ON COLUMN public."tblMovies"."RtCriticRating"
    IS 'Rotten Tomatoes Critic Rating';

--Populating tblMovies from CSV file
COPY public."tblMovies" (MovieID,MovieTitle,BestPicture,OscarYear,Genre,RtCriticRating,ImdbRating)
FROM 'C:\Users\biguz\Desktop\CUNY Data Science\Fall2020\Data 607\Homeworks\HW2\MovieData.csv'
DELIMITER ','
CSV HEADER

--Populate tblMovies with SQL Code
INSERT INTO public."tblMovies"("MovieID", "MovieTitle", "BestPicture", "OscarYear", "Genre", "RtCriticRating", "ImdbRating")
VALUES
("MOV_1","Avengers: Endgame","N",NULL,"Action/Adventure",0.94,8.4),
("MOV_2","Parasite","Y",2020,"Thriller",0.99,8.6),
("MOV_3","The Shape of Water","Y",2018,"Romance",0.92,7.3),
("MOV_4","Star Wars: Rise of Skywalker","N",NULL,"Action/Adventure",0.51,6.6),
("MOV_5","Joker","N",NULL,"Drama",0.68,8.5),
("MOV_6","1917","N",NULL,"Drama",0.89,8.3);

--Creating the table for person information
CREATE TABLE public."tblPersons"
(
    "PersonID" character(8) COLLATE pg_catalog."default",
    "FirstName" character(10) COLLATE pg_catalog."default",
    "Sex" character(10) COLLATE pg_catalog."default",
    "Ethnicity" character(25) COLLATE pg_catalog."default",
    "Relationship" character(15) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public."tblPersons"
    OWNER to postgres;

--Populating tblPersons from CSV file
COPY public."tblPersons" (PersonID,FirstName,Sex,Ethnicity,Relationship)
FROM 'C:\Users\biguz\Desktop\CUNY Data Science\Fall2020\Data 607\Homeworks\HW2\PersonData.csv'
DELIMITER ','
CSV HEADER

--Populate tblPersons with SQL Code
INSERT INTO public."tblPersons"("PersonID", "FirstName", "Sex", "Ethnicity", "Relationship")
VALUES
("PER_1","James","Male","Asian/Pacific Islander","Friend"),
("PER_2","Ashley","Female","Multi-Racial","Girlfriend"),
("PER_3","Anna","Female","White","Mother"),
("PER_4","Alex","Male","White","Friend"),
("PER_5","Samantha","Female","Black","Co-Worker"),
("PER_6","Fabio","Male","White","Brother"),
("PER_7","Daniella","Female","Black","Friend"),
("PER_8","Justin","Male","Asian/Pacific Islander","Friend"),
("PER_9","Dana","Female","White","Friend"),
("PER_10","Brayan","Male","Black","Friend")

--Creating movie rating table with personid, movieid, and movie rating
CREATE TABLE public."tblRatings"
(
    "PersonID" character(10) COLLATE pg_catalog."default" NOT NULL,
    "MovieID" character(10) COLLATE pg_catalog."default" NOT NULL,
    "MovieRating" real
)

TABLESPACE pg_default;

ALTER TABLE public."tblRatings"
    OWNER to postgres;

--Populating tblRatings from CSV file
COPY public."tblRatings" (PersonID,MovieID,MovieRating)
FROM 'C:\Users\biguz\Desktop\CUNY Data Science\Fall2020\Data 607\Homeworks\HW2\MovieRatingData.csv'
DELIMITER ','
CSV HEADER;

--Populate tblRatings with SQL Code
INSERT INTO public."tblRatings"("PersonID", "MovieID", "MovieRating")
VALUES
("PER_1","MOV_1",5),
("PER_1","MOV_2",5),
("PER_1","MOV_3",1),
("PER_1","MOV_4",3),
("PER_1","MOV_5",4),
("PER_1","MOV_6",4),
("PER_2","MOV_1",5),
("PER_2","MOV_2",5),
("PER_2","MOV_3",3),
("PER_2","MOV_4",4),
("PER_2","MOV_5",5),
("PER_2","MOV_6",NULL),
("PER_3","MOV_1",NULL),
("PER_3","MOV_2",4),
("PER_3","MOV_3",5),
("PER_3","MOV_4",NULL),
("PER_3","MOV_5",4),
("PER_3","MOV_6",NULL),
("PER_4","MOV_1",NULL),
("PER_4","MOV_2",NULL),
("PER_4","MOV_3",NULL),
("PER_4","MOV_4",3),
("PER_4","MOV_5",NULL),
("PER_4","MOV_6",NULL),
("PER_5","MOV_1",4),
("PER_5","MOV_2",NULL),
("PER_5","MOV_3",3.5),
("PER_5","MOV_4",2),
("PER_5","MOV_5",4),
("PER_5","MOV_6",NULL),
("PER_6","MOV_1",5),
("PER_6","MOV_2",NULL),
("PER_6","MOV_3",NULL),
("PER_6","MOV_4",1),
("PER_6","MOV_5",1),
("PER_6","MOV_6",NULL),
("PER_7","MOV_1",3.5),
("PER_7","MOV_2",NULL),
("PER_7","MOV_3",NULL),
("PER_7","MOV_4",NULL),
("PER_7","MOV_5",4.5),
("PER_7","MOV_6",NULL),
("PER_8","MOV_1",4),
("PER_8","MOV_2",5),
("PER_8","MOV_3",NULL),
("PER_8","MOV_4",2),
("PER_8","MOV_5",3),
("PER_8","MOV_6",4),
("PER_9","MOV_1",NULL),
("PER_9","MOV_2",5),
("PER_9","MOV_3",NULL),
("PER_9","MOV_4",4),
("PER_9","MOV_5",NULL),
("PER_9","MOV_6",NULL),
("PER_10","MOV_1",4),
("PER_10","MOV_2",4),
("PER_10","MOV_3",5),
("PER_10","MOV_4",3),
("PER_10","MOV_5",5),
("PER_10","MOV_6",3)

