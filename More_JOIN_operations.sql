-- Question 1

SELECT id, title
 FROM movie
 WHERE yr=1962

-- Question 2

SELECT yr FROM movie WHERE title = 'Citizen Kane'

-- Question 3

SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr;

-- Question 4

SELECT id FROM actor WHERE name = 'Glenn Close'

-- Question 5

SELECT id FROM movie WHERE title = 'Casablanca'

-- Question 6

SELECT actor.name FROM actor JOIN casting ON actorid = actor.id WHERE movieid = 11768

-- Question 7

SELECT actor.name FROM actor JOIN casting ON actorid = actor.id WHERE movieid = (SELECT movie.id FROM movie WHERE title = 'Alien');

-- Question 8

SELECT title FROM movie JOIN casting ON movieid = movie.id WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford')

-- Question 9

SELECT title FROM movie JOIN casting ON movieid = movie.id WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord <> 1

-- Question 10

SELECT title, name FROM movie JOIN casting ON movieid=movie.id JOIN actor ON actorid = actor.id WHERE yr = 1962 AND ord = 1

-- Question 11

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1
ORDER BY COUNT(title) DESC
LIMIT 2

-- Question 12

SELECT DISTINCT title, name FROM movie JOIN casting ON (movie.id = movieid) JOIN actor ON actorid= actor.id WHERE movieid IN(SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')) AND ord=1

-- Question 13

SELECT name FROM casting JOIN actor ON actorid = actor.id WHERE ord = 1 GROUP BY actorid, name HAVING COUNT(*) >= 15 ORDER BY name

-- Question 14

SELECT title, COUNT(*) AS actor_numb FROM movie JOIN casting ON movieid = movie.id WHERE yr = 1978 GROUP BY movieid, title ORDER BY actor_numb DESC, title

-- Question 15

SELECT name FROM actor JOIN casting ON actor.id = actorid WHERE movieid IN (SELECT movieid FROM casting WHERE actorid = (SELECT id FROM actor WHERE name = 'Art Garfunkel')) and name <> 'Art Garfunkel'
