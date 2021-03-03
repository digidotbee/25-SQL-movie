-- question 1 --
--Select all columns and rows from the movies table--

SELECT * FROM movies;

--question 2--
--Select only the title and id of the first 10 rows--

SELECT title, id FROM movies LIMIT 10;

--question 3--
--Find the movie with the id of 485--

SELECT * FROM movies WHERE id = 485;

--question 4--
--Find the id (only that column) of the movie Made in America (1993)--

SELECT id FROM movies WHERE title='Made in America (1993)';

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
WHERE title LIKE '%Godfather, The%'

--question 8--
--Without using joins find all the comedies--

SELECT * FROM movies
WHERE genres LIKE 'Comed%';

--question 9--
--Find all comedies in the year 2000--
SELECT title FROM movies
WHERE genres= 'Comedy'
AND title LIKE '%(2000)%';


--question 10--
--Find any movies that are about death and are a comedy--

SELECT title FROM movies
WHERE genres LIKE '%Comedy%' 
AND title LIKE '%Death%';

--question 11--
--Find any movies from either 2001 or 2002 with a title containing super--
SELECT * FROM movies
WHERE title LIKE "%super%"
AND title LIKE '%(2001)%' OR '%(2002)%';


--### With Joins--


--question 1--
--Find all the ratings for the movie Godfather, show just the title and the rating--
SELECT ratings.rating, movies.title 
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id 
WHERE movies.title LIKE "%Godfather, The%";

--question 2--
-- Order the previous objective by newest to oldest--
SELECT ratings.rating, ratings.timestamp, movies.title 
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id 
WHERE movies.title LIKE "%Godfather, The%"
ORDER BY ratings.timestamp ASC;

--question 3--
 --Find the comedies from 2005 and get the title and imdbid from the links table--
SELECT links.imdb_id, movies.title 
FROM links
INNER JOIN movies ON links.imdb_id=movies.id
WHERE movies.title LIKE "%2005%" AND movies.genres LIKE "%comedy%";

--question 4--
--Find all movies that have no ratings--
SELECT ratings.rating, movies.title 
FROM ratings
INNER JOIN movies ON ratings.movie_id=movies.id
WHERE ratings.rating IS NULL;

### Complete the following aggregation objectives:

--question 1--
-- Get the average rating for a movie--
SELECT AVG(rating)
FROM ratings WHERE movie_id='454';

--question 2--
-- Get the total ratings for a movie--
SELECT COUNT(rating)
FROM ratings WHERE movie_id='454';

--question 3--
-- Get the total movies for a genre--
SELECT COUNT(genres)
FROM movies WHERE genres='Comedy'

--question 4--
--Get the average rating for a user--
SELECT AVG(rating)
FROM ratings WHERE user_id='10';

--question 5--
--Find the user with the most ratings--
SELECT ratings.user_id, COUNT(rating) AS total
FROM ratings
GROUP BY user_id
ORDER BY total DESC LIMIT 1;

--question 6--
--Find the user with the highest average rating--
SELECT ratings.user_id, AVG(rating) AS average
FROM ratings
GROUP BY user_id
ORDER BY average DESC LIMIT 1;

--question 7--
--Find the user with the highest average rating with more than 50 reviews--
SELECT ratings.user_id, AVG(rating), COUNT(rating)
FROM ratings
GROUP BY user_id
HAVING COUNT(rating)>50
ORDER BY AVG(rating) DESC LIMIT 1;

--question 8--
--Find the movies with an average rating over 4--
SELECT  AVG(rating), ratings.movie_id
FROM ratings
GROUP BY movie_id
HAVING AVG(rating)>4
ORDER BY movie_id;

