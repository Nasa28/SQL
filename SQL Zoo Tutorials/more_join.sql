-- 1. List the films where the yr is 1962 

SELECT id, title
 FROM movie
 WHERE yr=1962;

--2. Give year of 'Citizen Kane'.

SELECT yr
FROM movie
WHERE title LIKE 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr

SELECT id, title,yr
FROM movie
WHERE title LIKE '%Star Trek%' ORDER BY yr;

--4. What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name LIKE 'Glenn Close' ;

--5. What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title LIKE 'Casablanca';

--Obtain the cast list for 'Casablanca'.

SELECT name
FROM actor
JOIN casting 
ON (id = actorid)
WHERE movieid =11768;

--Obtain the cast list for the film 'Alien'

SELECT name
FROM actor
JOIN casting 
ON (id = actorid)
WHERE movieid =(SELECT id
FROM movie
WHERE title LIKE 'Alien');

--8. List the films in which 'Harrison Ford' has appeared

SELECT DISTINCT title
FROM movie
JOIN casting
ON id = movieid
WHERE id IN(SELECT movieid FROM casting
      JOIN actor ON (actorid = id)
    WHERE
      name = 'Harrison Ford'
  );

  --9. Harrison Ford as a supporting actor

  SELECT DISTINCT title
FROM movie
JOIN casting 
ON (id = movieid)
WHERE id IN(
    SELECT
      movieid
    FROM
      casting
      JOIN actor ON (actorid = id)
    WHERE
      name = 'Harrison Ford'
      AND ord != 1
  );

--10. List the films together with the leading star for all 1962 films.

SELECT title, name
FROM movie
  JOIN casting ON (id = movieid)
  JOIN actor ON actorid = actor.id
WHERE yr = 1962
  AND ord = 1;

  --11. Busy years for Rock Hudson

SELECT yr,COUNT(title) 
FROM movie 
JOIN casting 
ON movie.id=movieid 
JOIN actor   
ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

--12. Lead actor in Julie Andrews movies

SELECT title, name 
 FROM movie JOIN casting ON (movieid = movie.id
                            AND ord = 1)
            JOIN actor ON (actorid = actor.id)
WHERE movie.id IN (SELECT movieid FROM casting 
                   WHERE actorid IN (
  SELECT id FROM actor
  WHERE name LIKE 'Julie Andrews'));

  