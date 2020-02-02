-- For each film, determine the contributing actors and directors (role)


SELECT * FROM
(SELECT  movies.title AS TITLE, movies.year AS YEAR, directors.name AS NAME, 'Director' AS ROLE
FROM    directors, movies2directors, movies
WHERE   directors.directorid=movies2directors.directorid
AND     movies2directors.movieid=movies.movieid

UNION ALL

SELECT  movies.title AS TITLE, movies.year AS YEAR, actors.name AS NAME, 'Actor' AS ROLE
FROM    actors, movies2actors, movies
WHERE   actors.actorid=movies2actors.actorid
AND     movies2actors.movieid=movies.movieid) Contributors
ORDER BY Contributors.title DESC;
