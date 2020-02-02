-- Which directors have played at least once in one of their own films?

SELECT distinct directors.name as director_name
FROM directors, actors, movies2actors, movies2directors
WHERE directors.directorid=movies2directors.directorid
AND   movies2directors.movieid=movies2actors.movieid
AND   movies2actors.actorid = actors.actorid
AND   directors.name = actors.name;