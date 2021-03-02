-- question 1 --
--Select all columns and rows from the movies table--

SELECT * from movies

--question 2--
--Select only the title and id of the first 10 rows--

SELECT title, id FROM movies LIMIT 10;

--question 3--
--Find the movie with the id of 485--

SELECT * from movies WHERE id = 485;

--question 4--
--Find the id (only that column) of the movie Made in America (1993)--

SELECT id from movies WHERE title='Made in America (1993)'

--question 5--
--Find the first 10 sorted alphabetically--

SELECT * 
FROM movies 
ORDER BY title 
ASC 
LIMIT 10;

--question 6--
--Find all movies from 2002--

SELECT * 
FROM movies 
WHERE title 
LIKE '%2002)';

--question 7--
--Find out what year the Godfather came out--

SELECT title
FROM movies
WHERE title LIKE 'Godfather%'

--question 8--
--Without using joins find all the comedies--

SELECT * FROM movies
WHERE genres LIKE 'Comed%';

--question 9--
--Find all comedies in the year 2000--

--question 10--
--Find any movies that are about death and are a comedy--

--question 11--
--Find any movies from either 2001 or 2002 with a title containing super--

--question 12--
--Create a new table called actors-- 
--(We are going to pretend the actor can only play in one movie). --
--The table should include name, character name, foreign key to movies --
--and date of birth at least plus an id field.--

--question 13--
--Pick 3 movies and create insert statements for 10 actors each. --
--You should use the multi value insert statements--

--question 14--
--Create a new column in the movie table to hold the MPAA rating. --
--UPDATE 5 different movies to their correct rating--